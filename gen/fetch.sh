#!/usr/bin/env bash
set -euo pipefail

# Fetch the PINNED upstream lucide icon SVGs into gen/vendor/lucide/.
#
# Vendored upstream is fetched, never committed (see .gitignore) — only the
# generated .gleam shards + icons.json are committed. Re-run after bumping the
# pinned version below, then `cd gen && gleam run` to regenerate.

# ── Pinned upstream version ────────────────────────────────────────────────
LUCIDE_VERSION="1.17.0"
TARBALL_URL="https://registry.npmjs.org/lucide-static/-/lucide-static-${LUCIDE_VERSION}.tgz"

# Resolve paths relative to this script so it works from any cwd.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENDOR_DIR="${SCRIPT_DIR}/vendor/lucide"

echo "Fetching lucide-static v${LUCIDE_VERSION}"
echo "  ${TARBALL_URL}"

# Idempotent: wipe the vendor dir so a re-run gives a clean snapshot.
rm -rf "${VENDOR_DIR}"
mkdir -p "${VENDOR_DIR}"

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

TARBALL="${TMP_DIR}/lucide-static.tgz"
curl -fsSL "${TARBALL_URL}" -o "${TARBALL}"

# Extract ONLY package/icons/*.svg, flattened (strip the package/icons/ prefix).
# The tarball also ships fonts/sprites we don't want. The trailing path pattern
# selects only matching members; --strip-components=2 drops `package/icons/`.
# Works on both GNU tar and bsdtar/libarchive (macOS).
tar -xzf "${TARBALL}" -C "${VENDOR_DIR}" \
  --strip-components=2 \
  'package/icons/*.svg'

COUNT="$(find "${VENDOR_DIR}" -name '*.svg' | wc -l | tr -d ' ')"
echo "Extracted ${COUNT} SVGs into ${VENDOR_DIR}"
