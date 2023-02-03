player = world:newCircleCollider(50, 50, 20)
player.speed = 80
--animations

function player:update(dt)

    --moving player (w, a, s, d)
    local vx, vy = 0, 0
    if love.keyboard.isDown("a") then
        vx = player.speed * -1
    end

    if love.keyboard.isDown("d") then
        vx = player.speed
    end

    if love.keyboard.isDown("s") then
        vy = player.speed
    end

    if love.keyboard.isDown("w") then
        vy = player.speed * -1
    end


    if vx ~= 0 and vy ~= 0 then
        vx = vx/math.sqrt(2)
        vy = vy/math.sqrt(2)
    end

    player:setLinearVelocity(vx, vy)


    --player state

end

function player:draw()

end