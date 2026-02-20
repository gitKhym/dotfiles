import { createPoll } from "ags/time"

export default function IncrementalIcon() {
  const icons = ["▖", "▘", "▝", "▗", "▚", "▞", "▟", "█"]

  // helper to create a poll that picks a random icon each tick
  const createRandomPoll = () =>
    createPoll(
      icons[Math.floor(Math.random() * icons.length)],
      75,
      () => icons[Math.floor(Math.random() * icons.length)],
    )

  const icon1 = createRandomPoll()
  const icon2 = createRandomPoll()
  const icon3 = createRandomPoll()

  return (
    <box>
      <label label={icon1} />
      <label label={icon2} />
      <label label={icon3} />
    </box>
  )
}
