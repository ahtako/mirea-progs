function find_marker(r::Robot)
    start_position = (0, 0)  # начальная позиция робота
    queue = [(start_position, [])]  # очередь для BFS
    visited = Set{Tuple{Int, Int}}()  # множество посещенных координат

    while !isempty(queue)
        current, path = dequeue!(queue)
        x, y = current

        if r.ismarker(x, y)
            return true
        end

        if current in visited
            continue
        end

        for direction in ["up", "down", "left", "right"]
            new_x, new_y = move_in_direction(x, y, direction)

            if !r.isborder(x, y, direction) && !(new_x, new_y) in visited
                enqueue!(queue, ((new_x, new_y), path + [direction]))
            end
        end

        push!(visited, current)
    end

    return false
end

function move_in_direction(x, y, direction)
    if direction == "up"
        return x, y + 1
    elseif direction == "down"
        return x, y - 1
    elseif direction == "left"
        return x - 1, y
    elseif direction == "right"
        return x + 1, y
    end
end






robot = Robot()
found_marker = find_marker(robot)
if found_marker
    println("Маркер найден!")
else
    println("Маркер не найден.")
end
