import Gtk from "gi://Gtk"
import { Accessor } from "gnim"

export function ProgressBar({
  currProgress,
}: {
  currProgress: Accessor<number>
}) {
  return (
    <box
      class="progress-bar"
      $={(self) => {
        const bar = new Gtk.DrawingArea({
          hexpand: true,
          heightRequest: 3,
        })
        bar.set_draw_func((area, cr, width, height) => {
          const progress = currProgress()
          cr.setSourceRGB(0.965, 0.627, 0.792)
          cr.rectangle(0, 0, width * progress, height)
          cr.fill()
        })

        // position bar at bottom
        bar.set_valign(Gtk.Align.END)

        self.append(bar)

        currProgress.subscribe(() => bar.queue_draw())
      }}
    />
  )
}
