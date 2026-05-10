How to server pack of **RLCraft Parasited**

---

Install client via curseforge app → import → from zip.
Get a server pack/install of any RLCraft server and remove folders

    /config /mods /paintings
    /resources /scripts /structures
Replace them with the same folders from your RLCraft Parasited client instance.

**Note**: Use the files of the installed **_Client_**, don't use the installer zip!

Necessary modifications on the **_Server_** :

    - Remove Optifine from /mods if you downloaded it already
    - Remove Controllable from /mods (otherwise crash saying ClassNotFound IToast)
    - In /config/fermiummixins.cfg set "quark" -> "Chest Search Bar Y Offset (Quark)" to false
    - In /config/voicechat/voicechat-server.properties set "port" to -1 and "bind_address" to *