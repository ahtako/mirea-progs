mutable struct Robot
    x::Int
    y::Int
    direction::Int
    grid::Array{Bool, 2}
end

function Robot()
    grid = falses(10, 10)
    return Robot(1, 1, 0, grid)
end

function move!(robot::Robot)
    if robot.direction == 0
        robot.y += 1
    elseif robot.direction == 1
        robot.x += 1
    elseif robot.direction == 2
        robot.y -= 1
    elseif robot.direction == 3
        robot.x -= 1
    end
end

function turn!(robot::Robot, side::String)
    if side == "right"
        robot.direction = (robot.direction + 1) % 4
    elseif side == "left"
        robot.direction = (robot.direction - 1 + 4) % 4
    end
end

function isborder(robot::Robot, side::String)
    if side == "front"
        if robot.direction == 0 && robot.y == size(robot.grid, 2)
            return true
        elseif robot.direction == 1 && robot.x == size(robot.grid, 1)
            return true
        elseif robot.direction == 2 && robot.y == 1
            return true
        elseif robot.direction == 3 && robot.x == 1
            return true
        else
            return false
        end
    elseif side == "left"
        new_direction = (robot.direction - 1 + 4) % 4
        return isborder(Robot(robot.x, robot.y, new_direction, robot.grid), "front")
    elseif side == "right"
        new_direction = (robot.direction + 1) % 4
        return isborder(Robot(robot.x, robot.y, new_direction, robot.grid), "front")
    elseif side == "back"
        new_direction = (robot.direction + 2) % 4
        return isborder(Robot(robot.x, robot.y, new_direction, robot.grid), "front")
    end
end

function putmarker!(robot::Robot)
    if !robot.grid[robot.x, robot.y]
        robot.grid[robot.x, robot.y] = true
    end
end

function ismarker(robot::Robot)
    return robot.grid[robot.x, robot.y]
end

function temperature(robot::Robot)
    # Вернуть температуру текущей клетки (в данной задаче не используется)
end

function show!(robot::Robot)
    for j in size(robot.grid, 2):-1:1
        for i in 1:size(robot.grid, 1)
            if robot.grid[i, j]
                print("x ")
            else
                print(". ")
            end
        end
        println()
    end
end





robot = Robot()
move!(robot)
turn!(robot, "right")
isborder(robot, "front")
putmarker!(robot)
ismarker(robot)
temperature(robot)
show!(robot)
