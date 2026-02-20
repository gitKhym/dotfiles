import { Clock } from "./Clock"
import { Weather } from "./weather/Weather"

export function TodayStats() {
  return (
    <box class="today-stats">
      <Clock />
      <Weather />
    </box>
  )
}
