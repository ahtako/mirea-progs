function dfs(robot::Robot)
    # Проверяем, есть ли перегородка на текущей позиции
    if isborder(robot, est)
        # Двигаемся вправо до тех пор, пока не будет найдена свободная клетка или достигнута граница поля
        while !isborder(robot, est) && !robot.grid[robot.x + 1, robot.y]
            move!(robot, est)
        end
    else
        # Двигаемся влево до тех пор, пока не будет найдена свободная клетка или достигнута граница поля
        while !isborder(robot, Ost) && !robot.grid[robot.x - 1, robot.y]
            move!(robot, Ost)
        end
    end
    
    # Помечаем текущую клетку
    putmarker!(robot)
    
    # Если все клетки помечены, возвращаемся к исходной позиции
    if ismarker(robot)
        while robot.x != 1
            move!(robot, Ost)
        end
        while robot.y != 1
            move!(robot, Sud)
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
