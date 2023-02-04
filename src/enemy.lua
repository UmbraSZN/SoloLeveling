enemies = {}

function enemies:spawn(x, y, type) --spawning new enemies

    local enemy
    if type == "test" then
        enemy = world:newCircleCollider(x, y, 20)
        enemy.health = 100
        enemy.speed = 50
        enemy.range = 300
        --set other attributes

    elseif type == "" then
        enemy = {} --collider
        --set other attributes


    --add more enemy types
    end

    function enemy:wander() --random movement when out of combat
        --return to spawn point if away
        --add wandering logic
        self:setLinearVelocity(0, 0)
    end
    
    function enemy:search() --searching for player
        local distance = math.sqrt((player:getX() - self:getX())^2 + (player:getY() - self:getY())^2)
        
        if distance < 300 then --add check for colliders in the way too?
            return true
        end
    
    end
    
    function enemy:pathfinding() --following player
        local playerX, playerY = player:getPosition()
        local enemyX, enemyY = self:getPosition()

        --local angle = math.atan2((enemyY - playerY), (enemyX - playerX)) + math.pi
        local dx, dy = playerX - enemyX, playerY - enemyY
        local l = math.sqrt(dx^2 + dy^2)
        return dx/l, dy/l

        
    end
    
    function enemy:combat() --combat ai
    
    end

    table.insert(enemies, enemy)
end



function enemies:update(dt)
    
    for _, e in ipairs(enemies) do

        if e:search() then
            local vx, vy = e:pathfinding()
            e:setLinearVelocity(vx * e.speed, vy * e.speed)
        else
            e:wander()
        end

    end

    

end

function enemies:draw()

end