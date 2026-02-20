import { createPoll } from "ags/time"
export function Weather() {
  // TODO: fuck it we ball
  const raw = createPoll(
    `{"latitude":-37.75,"longitude":145.0,"generationtime_ms":0.0762939453125,"utc_offset_seconds":0,"timezone":"GMT","timezone_abbreviation":"GMT","elevation":19.0,"current_weather_units":{"time":"iso8601","interval":"seconds","temperature":"°C","windspeed":"km/h","winddirection":"°","is_day":"","weathercode":"wmo code"},"current_weather":{"time":"2026-02-19T01:00","interval":900,"temperature":0,"windspeed":9.2,"winddirection":219,"is_day":1,"weathercode":2}}`,
    600000,
    `curl -s "https://api.open-meteo.com/v1/forecast?latitude=1&longitude=1&current_weather=true"`,
  )

  return (
    <box class="weather" spacing={5}>
      <image
        iconName={raw((r) => {
          const parsed = JSON.parse(r.toString())
          const code = parsed.current_weather.weathercode
          if ([0, 1].includes(code)) return "custom-weather-sun"

          if ([2, 3].includes(code)) return "custom-weather-cloud"

          if ([51, 53, 55, 56, 57, 61, 63, 65, 67].includes(code))
            return "custom-weather-rain"

          return "custom-weather-sun"
        })}
      />
      <label
        class="temperature-text"
        label={raw(
          (r) => JSON.parse(r.toString()).current_weather.temperature + "°",
        )}
      />
    </box>
  )
}
