function dfs(robot::Robot)
    # Проверяем, есть ли перегородка на текущей позиции
    if isborder(robot, "right")
        # Двигаемся вправо до тех пор, пока не будет найдена свободная клетка или достигнута граница поля
        while !isborder(robot, "right") && !robot.grid[robot.x + 1, robot.y]
            move!(robot, "right")
        end
    else
        # Двигаемся влево до тех пор, пока не будет найдена свободная клетка или достигнута граница поля
        while !isborder(robot, "left") && !robot.grid[robot.x - 1, robot.y]
            move!(robot, "left")
        end
    end
    
    # Помечаем текущую клетку
    putmarker!(robot)
    
    # Если все клетки помечены, возвращаемся к исходной позиции
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
    while !ismarker(robot)
        dfs(robot)
    end
end

# Пример использования
robot = Robot()
solve(robot)
show!(robot)
