function average_marker_temperature(robot::Robot)
    marker_count = 0
    temperature_sum = 0
    
    for x = -Inf:Inf
        for y = -Inf:Inf
            robot.position = (x, y)
            if ismarker(robot)
                marker_count += 1
                temperature_sum += temperature(robot)
            end
        end
    end
    
    return temperature_sum / marker_count
end


robot = Robot()
# Здесь выполняются команды для перемещения робота и расстановки маркеров

average_temp = average_marker_temperature(robot)
println("Average marker temperature: ", average_temp)
