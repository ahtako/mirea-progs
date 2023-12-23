mutable struct Robot
    x::Int
    y::Int
    direction::Int
end

function Robot()
    return Robot(0, 0, 0)
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
        if robot.direction == 0 && robot.y == 0
            return true
        elseif robot.direction == 1 && robot.x == 0
            return true
        elseif robot.direction == 2 && robot.y == -1
            return true
        elseif robot.direction == 3 && robot.x == -1
            return true
        else
            return false
        end
    elseif side == "left"
        new_direction = (robot.direction - 1 + 4) % 4
        return isborder(Robot(robot.x, robot.y, new_direction), "front")
    elseif side == "right"
        new_direction = (robot.direction + 1) % 4
        return isborder(Robot(robot.x, robot.y, new_direction), "front")
    elseif side == "back"
        new_direction = (robot.direction + 2) % 4
        return isborder(Robot(robot.x, robot.y, new_direction), "front")
    end
end

function putmarker!()
    # Пометить текущую клетку (в данной задаче не используется)
end

function ismarker()
    # Проверить наличие маркера в текущей клетке (в данной задаче не используется)
end

function temperature()
    # Вернуть температуру текущей клетки (в данной задаче не используется)
end

function show!(robot::Robot)
    println("Current coordinates: ", robot.x, ", ", robot.y)
end



robot = Robot()
move!(robot)
turn!(robot, "right")
isborder(robot, "front")
show!(robot)
