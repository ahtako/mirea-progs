function isborder(robot::Robot, side::Symbol, field_width::Int, field_height::Int, partitions::Array{Tuple{Int, Int}})
    x = robot.x
    y = robot.y
    if side == Nord && y == field_height-1
        return true
    elseif side == Sud && y == 0
        return true
    elseif side == ost && x == 0
        return true
    elseif side == est && x == field_width-1
        return true
    end
    
    for partition in partitions
        px, py = partition
        if side == Nord && y == py-1 && x >= px && x <= px+1
            return true
        elseif side == Sud && y == py && x >= px && x <= px+1
            return true
        elseif side == :left && x == px && y >= py && y <= py+1
            return true
        elseif side == :right && x == px+1 && y >= py && y <= py+1
            return true
        end
    end
    
    return false
end

function place_markers(robot::Robot, n::Int, field_width::Int, field_height::Int, partitions::Array{Tuple{Int, Int}})
    for i = 0:field_height-1
        for j = 0:field_width-1
            if (i ÷ n) % 2 == 0
                if (j ÷ n) % 2 == 0
                    move!(robot, est)
                    putmarker!(robot)
                else
                    move!(robot, est)
                end
            else
                if (j ÷ n) % 2 == 0
                    move!(robot, ost)
                else
                    move!(robot, ost)
                    putmarker!(robot)
                end
            end
        end
        if i != field_height-1
            if isborder(robot, Nord, field_width, field_height, partitions)
                move!(robot, est)
            else
                move!(robot, Nord)
            end
        end
    end
end

robot = Robot()
partitions = [(1, 1), (3, 2), (0, 3), (4, 3)]
place_markers(robot, 3, 5, 4, partitions)
show!(robot)
