import { createPoll } from "ags/time"

export default function VisualiserIcon() {
  // const icons = ["🌘", "🌗", "🌖", "🌕", "🌔", "🌓", "🌒"]
  const icons = ["◉", "◎", "◌", "◍", "◉", "◎", "◌", "◍"]
  let current = 0

  const icon = createPoll(icons[0], 250, (prev) => {
    current = (current + 1) % icons.length
    return icons[current]
  })

  return <label label={icon((i) => i.toString())} class="custom-icon" />
}
