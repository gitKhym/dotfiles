import { createPoll } from "ags/time"

export function BudsBattery() {
  const budsPercentage = createPoll(
    "",
    300000,
    `bash -c "upower -i /org/freedesktop/UPower/devices/headset_dev_54_10_4F_71_A5_FE | awk '/percentage/ {print $2}'"`,
  )((r) => {
    if (!r) return "0%"
    return r
  })

  return (
    <box spacing={5}>
      <image iconName="custom-battery" />
      <label label={budsPercentage} class="system-value" />
    </box>
  )
}
