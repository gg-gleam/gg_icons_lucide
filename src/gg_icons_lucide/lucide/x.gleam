//// Lucide · shard "x" — icons whose snake_case name starts with `x`.
//// GENERATED. Upstream: lucide-icons/lucide (ISC). Do not hand-edit.

import gg_icon/icon
import gg_icons_lucide/internal
import lustre/attribute.{type Attribute}
import lustre/element.{type Element}
import lustre/element/svg

/// `x` — the close glyph. Two crossing strokes (proves multi-path baking).
pub fn x(attrs: List(Attribute(msg))) -> Element(msg) {
  icon.svg(
    view_box: internal.view_box,
    defaults: internal.defaults,
    attrs: attrs,
    children: [
      svg.path([attribute.attribute("d", "M18 6 6 18")]),
      svg.path([attribute.attribute("d", "m6 6 12 12")]),
    ],
  )
}
