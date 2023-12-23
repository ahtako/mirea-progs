# Определение класса Robot
struct Robot
    x::Int  # Координата x робота
    y::Int  # Координата y робота
    field::Array{Bool, 2}  # Поле с промаркированными клетками и перегородками
end

# Конструктор класса Robot
function Robot()
    robot = new(1, 1, falses(10, 10))  # Создание объекта робота с размером поля 10x10
    return robot
end

# Методы класса Robot
function move!(robot::Robot, side::Symbol)
    if side == :up && robot.y > 1 && !robot.field[robot.x, robot.y-1]
        robot.y -= 1
    elseif side == :down && robot.y < size(robot.field, 2) && !robot.field[robot.x, robot.y+1]
        robot.y += 1
    elseif side == :left && robot.x > 1 && !robot.field[robot.x-1, robot.y]
        robot.x -= 1
    elseif side == :right && robot.x < size(robot.field, 1) && !robot.field[robot.x+1, robot.y]
        robot.x += 1
    end
end

function isborder(robot::Robot, side::Symbol)
    if side == :up && (robot.y == 1 || robot.field[robot.x, robot.y-1])
        return true
    elseif side == :down && (robot.y == size(robot.field, 2) || robot.field[robot.x, robot.y+1])
        return true
    elseif side == :left && (robot.x == 1 || robot.field[robot.x-1, robot.y])
        return true
    elseif side == :right && (robot.x == size(robot.field, 1) || robot.field[robot.x+1, robot.y])
        return true
    else
        return false
    end
end

function putmarker!(robot::Robot)
    robot.field[robot.x, robot.y] = true
end

function ismarker(robot::Robot)
    return robot.field[robot.x, robot.y]
end

function temperature(robot::Robot)
    return size(robot.field, 1) - robot.x + 1
end

function show!(robot::Robot)
    for j in size(robot.field, 2):-1:1
        for i in 1:size(robot.field, 1)
            if i == robot.x && j == robot.y
                print("R ")
            elseif robot.field[i, j]
                print("X ")
            else
                print(". ")
            end
        end
        println()
    end
end

# Пример использования класса Robot
robot = Robot()
move!(robot, :right)
putmarker!(robot)
move!(robot, :down)
putmarker!(robot)
show!(robot)
