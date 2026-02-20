import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { Workspaces } from "./Workspaces"
import { TodayStats } from "./TodayStats"
import { CenterIsland } from "./CenterIsland"
import FocusedWindow from "./focused/focusedWindow"
import { Audio } from "./audio"
import { Tray } from "./tray"
import { System } from "./system"
import { createBinding } from "gnim"
import { LeftIsland } from "./islands/LeftIsland"
import { RightIsland } from "./islands/RightIsland"

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT, BOTTOM } = Astal.WindowAnchor

  return (
    <>
      <window
        visible
        name="bar"
        class="Bar"
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | LEFT | RIGHT}
        application={app}
      >
        <centerbox cssName="bar">
          <box $type="start">
            <LeftIsland />
            <box
              class="side"
              heightRequest={20}
              valign={Gtk.Align.CENTER}
              spacing={5}
            >
              {/* <Workspaces /> */}
              <System />
              <FocusedWindow />
            </box>
          </box>
          <box $type="center" class="center">
            <CenterIsland />
          </box>
          <box
            $type="end"
            class="side"
            heightRequest={20}
            valign={Gtk.Align.CENTER}
          >
            <box
              class="side"
              heightRequest={20}
              valign={Gtk.Align.CENTER}
              spacing={5}
            >
              <Tray />
              <Audio />
            </box>

            <RightIsland />
          </box>
        </centerbox>
      </window>
      <window
        visible
        name="bar"
        class="left-bar"
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={LEFT | TOP | BOTTOM}
        application={app}
      >
        <box
          heightRequest={20}
          valign={Gtk.Align.START}
          orientation={Gtk.Orientation.VERTICAL}
        >
          <Workspaces orientation={Gtk.Orientation.VERTICAL} />

          <Gtk.DrawingArea
            widthRequest={15}
            heightRequest={35}
            $={(self) =>
              self.set_draw_func((area, cr, width, height) => {
                const circleRadius = 37
                const notchCenterX = 35
                const notchCenterY = 35
                cr.setFillRule(1) // Cairo.FillRule.EVEN_ODD
                cr.rectangle(0, 0, width, height)
                cr.arc(notchCenterX, notchCenterY, circleRadius, 0, Math.PI * 2)
                cr.setSourceRGB(0.10980392156, 0.11764705882, 0.16470588235)
                cr.fill()
              })
            }
          />
        </box>
      </window>
    </>
  )
}
