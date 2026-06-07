//// Dev-only generator for gg_icons_lucide. Run from this `gen/` project:
////
////     cd gen && gleam run
////
//// Reads the pinned upstream SVGs under `vendor/lucide/`, bakes them through the
//// shared `gg_icon_gen` engine, and writes the sharded modules + `internal.gleam`
//// into `../src/gg_icons_lucide`, plus `../icons.json`. Never shipped.

import gg_icon_gen.{type Config, Config, Variant}
import gleam/io
import gleam/string

pub fn main() {
  case gg_icon_gen.generate(config()) {
    Ok(_) -> io.println("✓ generated gg_icons_lucide")
    Error(e) -> io.println("✗ " <> string.inspect(e))
  }
}

fn config() -> Config {
  Config(
    set: "lucide",
    module_prefix: "gg_icons_lucide",
    out_src: "../src/gg_icons_lucide",
    out_manifest: "../icons.json",
    // Lucide is single-variant: 24×24, 2px stroke, round caps.
    variants: [
      Variant(
        name: "lucide",
        is_default: True,
        view_box: "0 0 24 24",
        defaults: [
          #("fill", "none"),
          #("stroke", "currentColor"),
          #("stroke-width", "2"),
          #("stroke-linecap", "round"),
          #("stroke-linejoin", "round"),
        ],
        source_dir: "vendor/lucide",
      ),
    ],
    // Lucide's inner elements are already clean (geometry only).
    clean: fn(nodes) { nodes },
  )
}
