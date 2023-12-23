function move_perimeter!(robot::Robot)
    directions = ["front", "left", "right", "back"]
    for side in directions
        if !isborder(robot, side)
            move!(robot, side)
            show!(robot)
        end
    end
end

function move_to_cell!(robot::Robot, x::Int, y::Int)
    current_x, current_y = position(robot)
    while current_x != x || current_y != y
        if current_x < x
            if !isborder(robot, "right")
                move!(robot, "right")
                current_x += 1
            elseif !isborder(robot, "front")
                move!(robot, "front")
                current_y += 1
            elseif !isborder(robot, "left")
                move!(robot, "left")
                current_x -= 1
            else
                move!(robot, "back")
                current_y -= 1
            end
        elseif current_x > x
            if !isborder(robot, "left")
                move!(robot, "left")
                current_x -= 1
            elseif !isborder(robot, "front")
                move!(robot, "front")
                current_y += 1
            elseif !isborder(robot, "right")
                move!(robot, "right")
                current_x += 1
            else
                move!(robot, "back")
                current_y -= 1
            end
        elseif current_y < y
            if !isborder(robot, "front")
                move!(robot, "front")
                current_y += 1
            elseif !isborder(robot, "right")
                move!(robot, "right")
                current_x += 1
            elseif !isborder(robot, "back")
                move!(robot, "back")
                current_y -= 1
            else
                move!(robot, "left")
                current_x -= 1
            end
        elseif current_y > y
            if !isborder(robot, "back")
                move!(robot, "back")
                current_y -= 1
            elseif !isborder(robot, "right")
                move!(robot, "right")
                current_x += 1
            elseif !isborder(robot, "front")
                move!(robot, "front")
                current_y += 1
            else
                move!(robot, "left")
                current_x -= 1
            end
        end
        show!(robot)
    end
end
