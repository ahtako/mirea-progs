struct Robot
    x::Int
    y::Int
    marker::Bool
end

function Robot()
    return Robot(0, 0, false)
end

function move!(robot::Robot, side::Symbol)
    if side == Nord
        robot.y += 1
    elseif side == Sud
        robot.y -= 1
    elseif side == ost
        robot.x -= 1
    elseif side == est
        robot.x += 1
    end
end

function isborder(robot::Robot, side::Symbol)
    if side == Nord && robot.y == 0
        return true
    elseif side == Sud && robot.y == -1
        return true
    elseif side == ost && robot.x == -1
        return true
    elseif side == est && robot.x == 0
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
    # Здесь можно добавить логику для измерения температуры в текущей клетке робота
    return 0.0
end

function show!(robot::Robot)
    # Здесь можно добавить логику для отображения текущего состояния робота и поля
    println("Robot position: ($robot.x, $robot.y)")
end

robot = Robot()

move!(robot, est)
move!(robot, Nord)
putmarker!(robot)

show!(robot)
println("Is marker present? ", ismarker(robot))
println("Is border on the right side? ", isborder(robot, :right))
println("Temperature in the current cell: ", temperature(robot))

Robot position: (1, 1)
Is marker present? true
Is border on the right side? false
Temperature in the current cell: 0.0
