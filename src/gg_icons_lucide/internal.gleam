//// Internal — shared per-variant constants for the generated Lucide shards.
//// Lucide is single-variant (24×24 stroke). Not part of the public surface.

/// Lucide's canvas. All icons are 24×24.
pub const view_box = "0 0 24 24"

/// Baked onto every Lucide `<svg>`: an outline glyph painted with the current
/// text colour. `attrs` (appended after these by `icon.svg`) override per call.
pub const defaults = [
  #("fill", "none"),
  #("stroke", "currentColor"),
  #("stroke-width", "2"),
  #("stroke-linecap", "round"),
  #("stroke-linejoin", "round"),
]
