import { Gtk } from "ags/gtk4"
import AstalWp from "gi://AstalWp?version=0.1"
import { createEffect, createState, createBinding, For, With } from "gnim"
import { Separator } from "../../components/Separator"
import { BudsBattery } from "./budsBattery"
import Pango from "gi://Pango?version=1.0"

export function Audio() {
  const wp = AstalWp.get_default()

  const speaker = createBinding(wp, "defaultSpeaker")
  // const microphone = createBinding(wp, "defaultMicrophone")

  const volume = createBinding(wp, "defaultSpeaker", "volume")
  const name = createBinding(wp, "defaultSpeaker", "description")

  function onScroll(
    controller: Gtk.EventControllerScroll,
    dx: number,
    dy: number,
  ) {
    if (!speaker) return

    // Adjust volume in 0-1 range
    let newVolume = speaker().volume - dy * 0.02
    newVolume = Math.max(0, Math.min(1, newVolume)) // clamp 0–1

    speaker().set_volume(newVolume)
  }

  const scrollController = new Gtk.EventControllerScroll({
    flags: Gtk.EventControllerScrollFlags.BOTH_AXES,
  })

  scrollController.connect("scroll", onScroll)

  return (
    <menubutton
      hexpand={false}
      class="menubutton"
      widthRequest={80}
      $={(self) => self.add_controller(scrollController)}
    >
      <box halign={Gtk.Align.CENTER}>
        <box spacing={5}>
          <image iconName="custom-volume-med" valign={Gtk.Align.CENTER} />
          <label
            label={volume.as((v) => (v * 100).toFixed(0))}
            valign={Gtk.Align.CENTER}
            halign={Gtk.Align.END}
            hexpand
            widthRequest={20}
          />
        </box>
        <Separator />
        <label
          label={name((n) => n || "Audio")}
          ellipsize={Pango.EllipsizeMode.END}
          maxWidthChars={20}
        />

        <With value={name}>
          {(name) =>
            name === "Galaxy Buds FE" && (
              <box>
                <Separator />
                <BudsBattery />
              </box>
            )
          }
        </With>
      </box>

      <popover class="popover" hasArrow={false}>
        <box class="popover-box" spacing={10}>
          <box hexpand vexpand class="popover-content">
            <slider
              orientation={Gtk.Orientation.VERTICAL}
              heightRequest={200}
              onChangeValue={({ value }) => speaker().set_volume(value)}
              value={volume}
              inverted
              $={(self) => {
                self.get_style_context().add_class("astal-slider")
              }}
            />
          </box>
          <box hexpand vexpand class="popover-content">
            <slider
              orientation={Gtk.Orientation.HORIZONTAL}
              widthRequest={200}
              onChangeValue={({ value }) => speaker().set_volume(value)}
              value={volume}
              $={(self) => {
                self.get_style_context().add_class("astal-slider")
              }}
            />
          </box>
        </box>
      </popover>
    </menubutton>
  )
}
