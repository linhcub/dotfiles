hl.on("hyprland.start", function () 
    -- 1. Start the keyring daemon
    -- We include 'ssh' in the components in case you want it to manage SSH keys later
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets,ssh")
    
    -- 2. Update the D-Bus environment
    -- This step is crucial on Wayland/Hyprland.
    -- It helps applications find the keyring daemon started above.
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    
    -- 3. Ensure a Polkit agent is running (if not present)
    -- Without this, the system cannot show a password prompt when the keyring is locked
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &")
end)
