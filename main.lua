function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest") --pixel scaling
    love.graphics.setBackgroundColor(22/255, 22/255, 22/255)
    love.window.setMode(1920, 1080, {fullscreen = false, resizable=true, vsync=false, minwidth=960, minheight=540})
    require("src/startup/gameStart")
    startGame()


end

function love.update(dt)
    player:update(dt)
    enemies:update(dt)
    world:update(dt)
end

function love.draw()
    world:draw()
end

function love.keypressed(key)

    if key == "o" then
        --spawn test mob
        enemies:spawn(250, 300, "test")
    
    elseif key == "p" then
        --prints x and y of player to console
        print("\nX: ", player:getX())
        print("Y: ", player:getY())

    end
end