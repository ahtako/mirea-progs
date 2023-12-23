function is_inside_maze(robot)
    # Проверяем все стороны, чтобы узнать, где находится робот
    if isborder(robot, :left)        isborder(robot, :right)        isborder(robot, :up)        isborder(robot, :down)
        return "Внутри лабиринта"
    else
        return "Снаружи лабиринта"
    end
end

# Пример использования
robot = Robot()
result = is_inside_maze(robot)
println(result)
