import { createPoll } from "ags/time"
import Gtk from "gi://Gtk"
import { Separator } from "../../components/Separator"

export function System() {
  let prevTotal = 0
  let prevIdle = 0

  const cpu = createPoll(
    "",
    5000,
    `bash -c "grep '^cpu ' /proc/stat"`,
  )((r) => {
    if (!r.startsWith("cpu")) return "0%"

    const parts = r.trim().split(/\s+/)

    const idle = Number(parts[4])
    const total = parts.slice(1).reduce((a, b) => a + Number(b), 0)

    const deltaTotal = total - prevTotal
    const deltaIdle = idle - prevIdle

    prevTotal = total
    prevIdle = idle

    if (deltaTotal <= 0) return "0%"

    const usage = Math.round((1 - deltaIdle / deltaTotal) * 100)
    return `${usage}%`
  })

  const cpuTemp = createPoll(
    "",
    5000,
    `bash -c "sensors -u | awk ' /k10temp-pci-00c3/ {f=1} f && /Tccd1:/ {getline; print $2; exit}'"`,
  )((r) => {
    const temp = Number(r)
    return isNaN(temp) ? "0°C" : `${Math.round(temp)}°C`
  })

  const ram = createPoll(
    "",
    10000,
    `bash -c "free -m | awk '/Mem:/ {print $3,$2}'"`,
  )((r) => {
    if (!r) return "0%"

    const [used, total] = r.trim().split(" ").map(Number)
    if (!total) return "0%"

    return `${Math.round((used / total) * 100)}%`
  })

  const disk = createPoll(
    "",
    300000,
    `bash -c "df -h /home | awk 'NR==2 {print $5}'"`,
  )((r) => r.trim() || "0%")

  return (
    <box class="side" heightRequest={20} spacing={5} valign={Gtk.Align.CENTER}>
      <box class="system-box" spacing={5}>
        <image iconName="custom-cpu" />
        <label label={cpu} class="system-value" />
        <Separator />
        <label label={cpuTemp} class="system-value" />
      </box>
      <box class="system-box" spacing={5}>
        <image iconName="custom-ram" />
        <label label={ram} class="system-value" />
      </box>
      <box class="system-box" spacing={5}>
        <image iconName="custom-drive" />
        <label label={disk} class="system-value" />
      </box>
    </box>
  )
}
