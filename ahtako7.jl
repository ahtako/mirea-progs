# Определяем класс Robot
struct Robot
    position::Tuple{Int, Int}
    marker::Bool
end

# Определяем методы для класса Robot
methods(Robot) = (
    move!(robot::Robot, side::Symbol) = begin
        x, y = robot.position
        if side == :up
            robot.position = (x, y + 1)
        elseif side == :down
            robot.position = (x, y - 1)
        elseif side == :left
            robot.position = (x - 1, y)
        elseif side == :right
            robot.position = (x + 1, y)
        else
            error("Invalid side")
        end
    end,

    isborder(robot::Robot, side::Symbol) = begin
        x, y = robot.position
        if side == :up && y == 1
            return true
        elseif side == :down && y == 8
            return true
        elseif side == :left && x == 1
            return true
        elseif side == :right && x == 8
            return true
        else
            return false
        end
    end,

    putmarker!(robot::Robot) = begin
        robot.marker = true
    end,

    ismarker(robot::Robot) = begin
        return robot.marker
    end,

    temperature(robot::Robot) = begin
        # Реализуйте здесь логику для получения температуры в текущей клетке
        # Верните соответствующее значение
    end,

    show!(robot::Robot) = begin
        for y in 8:-1:1
            for x in 1:8
                if (x, y) == robot.position
                    print("R ")
                elseif robot.marker && (x + y) % 2 == 0
                    print("M ")
                else
                    print("X ")
                end
            end
            println()
        end
    end
)

# Создаем экземпляр класса Robot и выполняем команды
robot = Robot((4, 4), false)
robot.putmarker!()
robot.show!()
