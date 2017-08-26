from i3pystatus import Status

status = Status()

status.register("clock",
    format="\u23F0 %a %-d %b %T",)

status.register('battery',
    interval=5,
    format='\u26A1 {status}{percentage_design:.2f}% {remaining:%E%hh:%Mm}',
    alert=True,
    alert_percentage=15,
    status={
        "DIS": "\u2193",
        "CHR":"\u2191",
        "FULL": "\u2705",
    }
)

status.register("network",
    interface="wlp2s0",
    format_up="\u21C5 W:{essid} {quality:.0f}%",)

status.register("mem",
        format='MEM: {percent_used_mem:.0f}%',
        interval=10,
        color="#FFFFFF",
        divisor=1024**3)

status.register("cpu_usage",
        format='CPU: {usage}%',
        interval=10
        )

status.register("disk",
        path="/",
        format='\u26C1 / {avail}GB',
        interval=30
        )

status.register("disk",
        path="/home",
        format='\u26C1 /home {avail}GB',
        interval=30
        )

status.register("alsa",
        format="\u266B {volume}%",
        format_muted="\u266B \u26D2"
        )

status.register("spotify",
        format='{status} {title} - {artist}',
        interval=1
        )

status.run()
