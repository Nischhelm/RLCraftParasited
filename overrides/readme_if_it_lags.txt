Lag can be FPS (client), TPS (server) or network lag.
the diagnosis and possible solutions depend which kind of lag you got.

FPS: the image itself is stuttering/hanging.
    your gpu cant take it, theres way too many draw calls.
    maybe using the wrong GPU? (integrated vs dedicated)
    try reducing particles and other video settings
    betterfoliage and fancyblockparticles can be disabled to reduce FPS lag
    extreme render distances can cause stuttering too

    Try Meldexuns Fast Entity Render
        Get it from github releases (is not on curseforge)
        https://github.com/Meldexun/FastEntityRender/releases
        !!! Incompat with Essential Mod and shaders (but not optifine in general) !!!

TPS: the game is slow to respond. you might be moving around, but you cant interact with the world
or it is slow to react.
    the cpu of the (integrated if singleplayer) server cant take it. smth is lagging the game.
    maybe too many mobs/item entities?
    reducing the render distance is always a good idea here.
    if you havent already, consider pregenerating your world using Chunk Pregenerator v2.5.1
        https://www.curseforge.com/minecraft/mc-mods/chunkpregenerator/files/3490718 <-- this specific file
        only need to put on server if its multiplayer

        Start pregenning with
        /pregen utils setPriority pregenerator
        /pregen timepertick 250
        /pregen gen startradius square 0 0 b10000

        Only pregen if theres 0 ppl online:
        /pregen utils setPlayerLimit 1
    Spark can help uncovering lag sources.
        while it lags, execute "/spark profiler start --timeout 30"
    Meldexuns LagSpikeProfiler might help you but i won't help you decipher the result (theres a neat website for it)
        https://github.com/Meldexun/LagSpikeProfiler/releases/tag/v1.12.2-1.1.3

Network: on multiplayer servers. looks similar to TPS lag as the world is slow to respond
but its more stuttery and different to TPS lag things actually happen on the server while you cant react
so with network lag a zombie might kill you and you dont even notice until its too late.
With TPS lag the zombie would be slowed down instead.
    no clear solution. sometimes connections can be stuttery from VPNs
    Meldexuns NetworkProfiler might help you investigate, but i won't help decipher the result (theres a neat website for it)
        Get it on github: https://github.com/Meldexun/NetworkProfiler/releases/tag/v1.12.2-1.0.0
