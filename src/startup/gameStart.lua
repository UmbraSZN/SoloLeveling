function startGame()
    love.math.setRandomSeed(os.time())
    
    wf = require("libraries/windfield")
    world = wf.newWorld(0, 0, false) --create world

    require("src/startup/colliders")
    createCollisionClasses()

    require("src/startup/resources")
    require("src/startup/require")
    requireAll()

    --start game in menu
    
end

function loadWorld() --spawn appropriate map and colliders in
    
end