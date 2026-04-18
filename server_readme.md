How to server pack of **RLCraft Parasited**

---

Install client via curseforge app → import → from zip.
Get a server pack/install of any RLCraft server and remove folders

    /config /mods /paintings
    /resources /scripts /structures
Replace them with the same folders from your RLCraft Parasited client instance.

Necessary modifications on the server:

    - Remove Optifine if you downloaded it already
    - Remove Controllable (otherwise crash saying ClassNotFound IToast)
    - Disable in config/fermiummixins.cfg at quark: "Chest Search Bar Y Offset (Quark)"
    - In config/voicechat/voicechat-server.properties set "port" to -1 and "bind_address" to *