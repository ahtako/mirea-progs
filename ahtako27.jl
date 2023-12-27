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
    if direction == Nord
        return Sud
    elseif direction == Sud
        return Nord
    elseif direction == est
        return ost
    elseif direction == ost
        return est
    end
end

function has_internal_partition(r::Robot, along_side::String, across_side::String, num_passes::Int, num_start_passes::Int=0)
    # Проверка наличия внутренних перегородок
    for i in 1:num_start_passes
        if r.isborder(along_side)
            return true
        end
        r.move!(along_side)
    end
    for i in 1:num_passes
        if r.isborder(across_side) || r.isborder(along_side)
            return true
        end
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

    return false
end

# Пример использования:
robot = Robot()
has_internal_partition(robot, "forward", "right", 3, 2)
robot.show!()
