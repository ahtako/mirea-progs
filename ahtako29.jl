struct Robot
    x::Int
    y::Int
    marker::Bool
    grid::Array{Bool, 2}
end

function Robot()
    grid = falses(10, 10) # размер поля 10x10, можно изменить по необходимости
    x = rand(1:size(grid, 1))
    y = rand(1:size(grid, 2))
    marker = false
    return Robot(x, y, marker, grid)
end

function move!(robot::Robot, side)
    if side == "up"
        robot.y += 1
    elseif side == "down"
        robot.y -= 1
    elseif side == "left"
        robot.x -= 1
    elseif side == "right"
        robot.x += 1
    end
end

function isborder(robot::Robot, side)
    if side == "up"
        return robot.y == size(robot.grid, 2)
    elseif side == "down"
        return robot.y == 1
    elseif side == "left"
        return robot.x == 1
    elseif side == "right"
        return robot.x == size(robot.grid, 1)
    end
end

function putmarker!(robot::Robot)
    robot.marker = true
end

function ismarker(robot::Robot)
    return robot.marker
end

function temperature(robot::Robot)
    # реализовать необходимую логику для определения температуры в текущей клетке поля
end

function show!(robot::Robot)
    # отображение поля с помощью Plots.jl
    heatmap(robot.grid, aspect_ratio=:equal, color=:gray, xlims=(0.5, size(robot.grid, 1) + 0.5), ylims=(0.5, size(robot.grid, 2) + 0.5))
    scatter!([robot.x], [robot.y], color=:red)
end




robot = Robot()
show!(robot)


Для начала необходимо установить и импортировать библиотеку Plots.jl:

using Plots