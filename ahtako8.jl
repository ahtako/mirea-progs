mutable struct Robot
    marker::Bool
    position::Tuple{Int, Int}
end

function Robot()
    marker = false
    position = (0, 0)
    return Robot(marker, position)
end

function move!(robot::Robot, side::Symbol)
    x, y = robot.position
    if side == :up
        y += 1
    elseif side == :down
        y -= 1
    elseif side == :left
        x -= 1
    elseif side == :right
        x += 1
    end
    robot.position = (x, y)
end

function isborder(robot::Robot, side::Symbol)
    x, y = robot.position
    if side == :up && y == Inf
        return true
    elseif side == :down && y == -Inf
        return true
    elseif side == :left && x == -Inf
        return true
    elseif side == :right && x == Inf
        return true
    end
    return false
end

function putmarker!(robot::Robot)
    robot.marker = true
end

function ismarker(robot::Robot)
    return robot.marker
end

function temperature(robot::Robot)
    # Возвращает температуру в текущей клетке поля (здесь можно добавить свою логику)
end

function show!(robot::Robot)
    println("Position: ", robot.position)
    println("Marker: ", robot.marker)
end




robot = Robot()
move!(robot, :down)
show!(robot)
