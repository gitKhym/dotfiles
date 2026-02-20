import AstalHyprland from "gi://AstalHyprland"
import { createBinding } from "gnim"
import { Separator } from "../../components/Separator"
import Pango from "gi://Pango"
import { Gtk } from "ags/gtk4"

export default function FocusedWindow() {
  const hyprland = AstalHyprland.get_default()
  const currClient = createBinding(hyprland, "focusedClient")

  return (
    <box class="focused-window" widthRequest={50}>
      <box spacing={5} valign={Gtk.Align.CENTER} class={"window-class"}>
        <image iconName="custom-window" />
        <label label={currClient((c) => c.class)} />
      </box>
      <Separator />
      <label
        class={"window-title"}
        label={currClient((c) => c.title)}
        ellipsize={Pango.EllipsizeMode.END}
        maxWidthChars={20}
      />
    </box>
  )
}
