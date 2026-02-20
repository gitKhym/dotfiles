import { Gtk } from "ags/gtk4"
import Hyprland from "gi://AstalHyprland"
import { createBinding, For } from "gnim"

// export function Workspaces(props: JSX.IntrinsicElements["box"]) {
//   const hyprland = Hyprland.get_default()
//
//   const focused = createBinding(hyprland, "focusedWorkspace").as((ws) => ws.id)
//
//   return (
//     <box class="workspaces" spacing={10} {...props}>
//       <For
//         each={createBinding(hyprland, "workspaces").as((wsList) =>
//           wsList.filter((ws) => ws.id > 0).toSorted((a, b) => a.id - b.id),
//         )}
//       >
//         {(workspace: Hyprland.Workspace) => (
//           <box
//             class={focused.as((f) =>
//               f === workspace.id ? "workspace focused" : "workspace unfocused",
//             )}
//             widthRequest={focused.as((f) => (f === workspace.id ? 50 : 12))}
//             heightRequest={5}
//           />
//         )}
//       </For>
//     </box>
//   )
// }
//

export function Workspaces(props: JSX.IntrinsicElements["box"]) {
  const hyprland = Hyprland.get_default()

  const focused = createBinding(hyprland, "focusedWorkspace").as((ws) => ws.id)

  return (
    <box class="workspaces" spacing={10} {...props}>
      <For
        each={createBinding(hyprland, "workspaces").as((wsList) =>
          wsList.filter((ws) => ws.id > 0).toSorted((b, a) => a.id - b.id),
        )}
      >
        {(workspace: Hyprland.Workspace) => (
          <box
            class={focused.as((f) =>
              f === workspace.id ? "workspace focused" : "workspace unfocused",
            )}
            heightRequest={focused.as((f) => (f === workspace.id ? 50 : 12))}
            widthRequest={10}
          />
        )}
      </For>
    </box>
  )
}
