import GLib from "gi://GLib"
import Gtk from "gi://Gtk"

export function BongoCat() {
  return (
    <image
      halign={Gtk.Align.CENTER}
      valign={Gtk.Align.CENTER}
      hexpand={false}
      vexpand={false}
      pixelSize={40}
      $={(self) => {
        const up = "/home/khayam/Pictures/bongo_cat_up.png"
        const down = "/home/khayam/Pictures/bongo_cat_down.png"

        let state = false

        self.file = up

        GLib.timeout_add(GLib.PRIORITY_DEFAULT, 250, () => {
          state = !state
          self.file = state ? down : up
          return GLib.SOURCE_CONTINUE
        })
      }}
    />
  )
}
