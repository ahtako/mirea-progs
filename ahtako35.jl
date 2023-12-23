mutable struct Robot
    x::Int
    y::Int
    direction::Int
    shape::Array{Tuple{Int, Int}}
end

function Robot(shape::Array{Tuple{Int, Int}})
    return Robot(0, 0, 0, shape)
end

function move!(robot::Robot, side::String)
    if side == "front"
        new_x = robot.x
        new_y = robot.y + 1
    elseif side == "left"
        new_x = robot.x - 1
        new_y = robot.y
    elseif side == "right"
        new_x = robot.x + 1
        new_y = robot.y
    elseif side == "back"
        new_x = robot.x
        new_y = robot.y - 1
    end
    
    if (new_x, new_y) in robot.shape
        robot.x = new_x
        robot.y = new_y
    end
end

function isborder(robot::Robot, side::String)
    if side == "front"
        new_x = robot.x
        new_y = robot.y + 1
    elseif side == "left"
        new_x = robot.x - 1
        new_y = robot.y
    elseif side == "right"
        new_x = robot.x + 1
        new_y = robot.y
    elseif side == "back"
        new_x = robot.x
        new_y = robot.y - 1
    end
    
    if (new_x, new_y) in robot.shape
        return true
    else
        return false
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





shape = [(0, 0), (0, 1), (1, 1), (1, 0)]  # Прямоугольник размером 2x2
robot = Robot(shape)
move!(robot, "front")
isborder(robot, "front")
show!(robot)
