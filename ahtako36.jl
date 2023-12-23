function move_perimeter!(robot::Robot)
    directions = ["front", "left", "right", "back"]
    for side in directions
        if !isborder(robot, side)
            move!(robot, side)
            show!(robot)
        end
    end
end
