//// Lucide · shard "c" — icons whose snake_case name starts with `c`.
//// GENERATED. Upstream: lucide-icons/lucide (ISC). Do not hand-edit.

import gg_icon/icon
import gg_icons_lucide/internal
import lustre/attribute.{type Attribute}
import lustre/element.{type Element}
import lustre/element/svg

/// `chevron-down`
pub fn chevron_down(attrs: List(Attribute(msg))) -> Element(msg) {
  icon.svg(
    view_box: internal.view_box,
    defaults: internal.defaults,
    attrs: attrs,
    children: [svg.path([attribute.attribute("d", "m6 9 6 6 6-6")])],
  )
}

/// `check`
pub fn check(attrs: List(Attribute(msg))) -> Element(msg) {
  icon.svg(
    view_box: internal.view_box,
    defaults: internal.defaults,
    attrs: attrs,
    children: [svg.path([attribute.attribute("d", "M20 6 9 17l-5-5")])],
  )
}
