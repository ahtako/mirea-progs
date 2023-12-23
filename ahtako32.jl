mutable struct Robot
    x::Int
    y::Int
    grid::Array{Bool, 2}
    markers::Int
end

function Robot()
    grid = falses(10, 10)
    return Robot(1, 1, grid, 0)
end

function move!(robot::Robot, side::String)
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

function isborder(robot::Robot, side::String)
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
    if !robot.grid[robot.x, robot.y]
        robot.grid[robot.x, robot.y] = true
        robot.markers += 1
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

function dfs(robot::Robot)
    if isborder(robot, "right")
        while !isborder(robot, "right") && !robot.grid[robot.x + 1, robot.y]
            move!(robot, "right")
        end
    else
        while !isborder(robot, "left") && !robot.grid[robot.x - 1, robot.y]
            move!(robot, "left")
        end
    end
    
    putmarker!(robot)
    
    if !ismarker(robot)
        dfs(robot)
    end
    
    if ismarker(robot)
        while robot.x != 1
            move!(robot, "left")
        end
        while robot.y != 1
            move!(robot, "down")
        end
    end
end

function solve(robot::Robot)
    dfs(robot)
end

# Пример использования
robot = Robot()
solve(robot)
num_markers = robot.markers
show!(robot)
return num_markers
