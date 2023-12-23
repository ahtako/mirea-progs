function zebra_mark(r::Robot, along_side::String, across_side::String, num_passes::Int, num_start_passes::Int=0)
    # Расстановка маркеров по горизонтальным или вертикальным полосам
    for i in 1:num_start_passes
        r.move!(along_side)
    end
    for i in 1:num_passes
        r.putmarker!()
        r.move!(across_side)
        r.move!(along_side)
    end

    # Возвращение робота в исходное положение
    r.move!(opposite_direction(along_side))
    for i in 1:num_passes
        r.move!(opposite_direction(across_side))
        r.move!(opposite_direction(along_side))
    end
    for i in 1:num_start_passes
        r.move!(opposite_direction(along_side))
    end
end

function opposite_direction(direction::String)
    if direction == "forward"
        return "backward"
    elseif direction == "backward"
        return "forward"
    elseif direction == "right"
        return "left"
    elseif direction == "left"
        return "right"
    end
end

# Пример использования:
robot = Robot()
zebra_mark(robot, "forward", "right", 3, 2)
robot.show!()
