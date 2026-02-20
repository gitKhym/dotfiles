import AstalTray from "gi://AstalTray"
import Gtk from "gi://Gtk"
import { createBinding, For } from "gnim"

export function Tray() {
  const tray = AstalTray.get_default()
  const items = createBinding(tray, "items")

  const init = (btn: Gtk.MenuButton, item: AstalTray.TrayItem) => {
    btn.menuModel = item.menuModel
    btn.insert_action_group("dbusmenu", item.actionGroup)
    item.connect("notify::action-group", () => {
      btn.insert_action_group("dbusmenu", item.actionGroup)
    })
  }

  return (
    <box spacing={5}>
      <For each={items}>
        {(item) => (
          <menubutton $={(self) => init(self, item)} alwaysShowArrow={false}>
            <image gicon={createBinding(item, "gicon")} />
          </menubutton>
        )}
      </For>
    </box>
  )
}
