import { createPoll } from "ags/time"
import GLib from "gi://GLib"
import { Separator } from "../components/Separator"
import Gtk from "gi://Gtk"
import { CenterIsland } from "./CenterIsland"

export function Clock({ dateFormat = "%a %b %e", timeFormat = "%-I:%M %p" }) {
  const time = createPoll("", 1000, () => {
    return GLib.DateTime.new_now_local().format(timeFormat)!
  })

  const date = createPoll("", 1000, () => {
    return GLib.DateTime.new_now_local().format(dateFormat)!
  })

  return (
    <box class="clock" orientation={Gtk.Orientation.VERTICAL}>
      <label label={date} class="date" halign={Gtk.Align.END} />
      <label label={time} class="time" halign={Gtk.Align.END} />
    </box>
  )
}
