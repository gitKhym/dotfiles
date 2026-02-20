import { Gtk } from "ags/gtk4"
import { TodayStats } from "../TodayStats"
export function RightIsland() {
  // BRO
  return (
    <box class="island right-island">
      <Gtk.DrawingArea
        widthRequest={60}
        heightRequest={60}
        $={(self) =>
          self.set_draw_func((area, cr, width, height) => {
            const circleRadius = 60
            const notchCenterX = 4
            const notchCenterY = 60
            cr.setFillRule(1) // Cairo.FillRule.EVEN_ODD
            cr.rectangle(0, 0, width, height)
            cr.arc(notchCenterX, notchCenterY, circleRadius, 0, Math.PI * 2)
            cr.setSourceRGB(0.10980392156, 0.11764705882, 0.16470588235)
            cr.fill()
          })
        }
      />

      <box class="content">
        <TodayStats />
      </box>
    </box>
  )
}
