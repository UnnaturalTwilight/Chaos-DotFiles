# Audio
## deflisten
music track \
playing \
cava?

## defpoll
Audio devices 
- volume, mute
- selcted device
- conncted, battery (bluetooth)
- icon

## implement

```json
AUDIO_DEVICES {
    "devices": [
        "Speakers",
        "Headphones"
    ],
    "active": <String>,
    <device_name> : {
        "name": "<Display Name>",
        "type": "<headset/speakers/other>",
        "id": "<pactl name>", 
        "volume": <float>,
        "mute": <bool>,
        "icon": {
            "device": "󰋋",
            "mute": " ",
            "low": " ",
            "high": " "
        },
        "data" {

        }
    }
}
```
```json
AUDIO_PLAYBACK {
    "track": <String>,
    "playing": <Bool>,
    "art": <Path>
}
```
# Power

`EWW_BATTERY`

EXTRA_BATTERY
```
[acpi battery time, acpi ac adapter status]
```

# notifications 

dunsthist (current implmentation)

do not disturb

# workspaces 

current implementaion

# Network 
`EWW_NET` \
curent network \
bluetooth connections?