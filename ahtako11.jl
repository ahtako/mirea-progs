struct Robot
    x::Int
    y::Int
    marker1::Bool
    marker2::Bool
end

function Robot()
    robot = Robot(0, 0, false, false)
    return robot
end

function move!(robot::Robot, side::Symbol)
    if side == Nord
        robot.y += 1
    elseif side == Sud
        robot.y -= 1
    elseif side == Ost
        robot.x -= 1
    elseif side == est
        robot.x += 1
    end
end

function isborder(robot::Robot, side::Symbol)
    if side == :up && robot.y == 0
        return true
    elseif side == :down && robot.y == -1
        return true
    elseif side == :left && robot.x == -1
        return true
    elseif side == :right && robot.x == 0
        return true
    else
        return false
    end
end

function putmarker!(robot::Robot)
    if !robot.marker1
        robot.marker1 = true
    elseif !robot.marker2
        robot.marker2 = true
    end
end

function ismarker(robot::Robot)
    if robot.marker1 || robot.marker2
        return true
    else
        return false
    end
end

function temperature(robot::Robot)
    # Возвращает температуру в текущей клетке робота (можно реализовать логику получения температуры)
end

function show!(robot::Robot)
    println("Робот находится в клетке ($robot.x, $robot.y)")
    if robot.marker1
        println("Маркер 1 находится в приграничной клетке")
    end
    if robot.marker2
        println("Маркер 2 находится в приграничной клетке")
    end
end



robot = Robot()
move!(robot, :right)
putmarker!(robot)
move!(robot, :up)
putmarker!(robot)
show!(robot)





Робот находится в клетке (1, 1)
Маркер 1 находится в приграничной клетке
Маркер 2 находится в приграничной клетке
