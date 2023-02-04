enemies = {}

function enemies:spawn(x, y, type) --spawning new enemies

    local enemy
    if type == "test" then
        enemy = world:newCircleCollider(x, y, 20)
        enemy.health = 100
        enemy.speed = 50
        enemy.range = 300
        enemy.spawnX = x 
        enemy.spawnY = y
        --set other attributes

    elseif type == "" then
        enemy = {} --collider
        --set other attributes


    --add more enemy types
    end

    function enemy:wander() --random movement when out of combat
        --return to spawn point if away
        local dx, dy = self.spawnX - self:getX(), self.spawnY - self:getY()
        local length = math.sqrt(dx^2 + dy^2)
        
        if length > 100 then --length from spawn
            --return to spawn point
            local vx, vy = dx/length, dy/length
            self:setLinearVelocity(vx * self.speed, vy * self.speed)

        else
            --wander
            self:setLinearVelocity(0, 0)

        end

    
    end
    
    function enemy:search() --searching for player
        local length = math.sqrt((player:getX() - self:getX())^2 + (player:getY() - self:getY())^2)
        
        if length < 300 then --add check for colliders in the way too?
            return true
        end
    
    end
    
    function enemy:pathfinding() --following player
        local playerX, playerY = player:getPosition()
        local enemyX, enemyY = self:getPosition()

        --local angle = math.atan2((enemyY - playerY), (enemyX - playerX)) + math.pi
        local dx, dy = playerX - enemyX, playerY - enemyY
        local length = math.sqrt(dx^2 + dy^2)
        return dx/length, dy/length

        
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