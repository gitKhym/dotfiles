import { createPoll } from "ags/time"
import GLib from "gi://GLib"
import Gtk from "gi://Gtk"
import { Separator } from "../../components/Separator"

export function Clock({ dateFormat = "%a, %b %e", timeFormat = "%-I:%M %p" }) {
  const time = createPoll("", 1000, () => {
    return GLib.DateTime.new_now_local().format(timeFormat)!
  })

  const date = createPoll("", 1000, () => {
    return GLib.DateTime.new_now_local().format(dateFormat)!
  })
  return (
    <box class="clock">
      <label label={date} class="date" />
      <Separator />
      <label label={time} class="time" />
    </box>
  )
}
