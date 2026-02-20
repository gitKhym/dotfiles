import AstalMpris from "gi://AstalMpris"
import { createBinding, For, createState } from "ags"
import { Gtk } from "ags/gtk4"
import { BongoCat } from "../BongoCat"
import { ProgressBar } from "./progressBar"

export default function Mpris() {
  const mpris = AstalMpris.get_default()

  const players = createBinding(mpris, "players")

  return (
    <box class="mpris" hexpand={false}>
      <For each={players}>
        {(player) => {
          const position = createBinding(player, "position")
          return player.busName === "org.mpris.MediaPlayer2.spotify" ? (
            <box orientation={Gtk.Orientation.VERTICAL}>
              <box spacing={15}>
                <BongoCat />
                <box
                  orientation={Gtk.Orientation.VERTICAL}
                  halign={Gtk.Align.START}
                  vexpand
                >
                  <label
                    class="song-artist"
                    label={createBinding(player, "artist")}
                    halign={Gtk.Align.START}
                  />

                  <label
                    class="song-title"
                    label={createBinding(player, "title")}
                    halign={Gtk.Align.START}
                  />
                  <ProgressBar
                    currProgress={position((p) =>
                      player.length > 0 ? p / player.length : 0,
                    )}
                  />
                </box>

                <box>
                  <button onClicked={() => player.previous()}>
                    <image icon_name="custom-previous" />
                  </button>
                  <button
                    onClicked={() => player.play_pause()}
                    visible={createBinding(player, "canControl")}
                  >
                    <box>
                      <image
                        iconName="custom-pause-symbolic"
                        visible={createBinding(
                          player,
                          "playbackStatus",
                        )((s) => s === AstalMpris.PlaybackStatus.PLAYING)}
                      />
                      <image
                        iconName="custom-play-symbolic"
                        visible={createBinding(
                          player,
                          "playbackStatus",
                        )((s) => s !== AstalMpris.PlaybackStatus.PLAYING)}
                      />
                    </box>
                  </button>

                  <button onClicked={() => player.next()}>
                    <image icon_name="custom-next" />
                  </button>
                </box>
              </box>
            </box>
          ) : (
            <box />
          )
        }}
      </For>
    </box>
  )
}
