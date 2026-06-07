import gg_icon/icon
import gg_icons_lucide/lucide/c
import gg_icons_lucide/lucide/x
import gleam/string
import gleeunit
import gleeunit/should
import lustre/element

pub fn main() {
  gleeunit.main()
}

pub fn chevron_down_renders_through_the_interface_test() {
  let html = element.to_string(c.chevron_down([]))

  should.be_true(string.contains(html, "<svg"))
  should.be_true(string.contains(html, "viewBox=\"0 0 24 24\""))
  should.be_true(string.contains(html, "class=\"cn-icon\""))
  should.be_true(string.contains(html, "stroke=\"currentColor\""))
  should.be_true(string.contains(html, "m6 9 6 6 6-6"))
}

pub fn caller_size_reaches_the_class_list_test() {
  let html = element.to_string(c.check([icon.size(icon.Sm)]))

  should.be_true(string.contains(html, "cn-icon"))
  should.be_true(string.contains(html, "cn-icon-size-sm"))
}

pub fn multi_path_icon_bakes_every_path_test() {
  let html = element.to_string(x.x([]))

  should.be_true(string.contains(html, "M18 6 6 18"))
  should.be_true(string.contains(html, "m6 6 12 12"))
}
