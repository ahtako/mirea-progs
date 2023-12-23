function find_largest_rectangle(robot)
    max_average_temperature = -Inf
    max_rectangle = []
    max_perimeter = 0
    
    for i in 1:size(robot.grid, 1)
        for j in 1:size(robot.grid, 2)
            for k in i:size(robot.grid, 1)
                for l in j:size(robot.grid, 2)
                    rectangle = [(i, j), (k, l)]
                    perimeter = calculate_perimeter(rectangle)
                    average_temperature = calculate_average_temperature(robot, rectangle)
                    
                    if average_temperature > max_average_temperature
                        max_average_temperature = average_temperature
                        max_rectangle = rectangle
                        max_perimeter = perimeter
                    end
                end
            end
        end
    end
    
    return max_rectangle
end

function calculate_perimeter(rectangle)
    top_left = rectangle[1]
    bottom_right = rectangle[2]
    
    return 2 * (bottom_right[1] - top_left[1] + bottom_right[2] - top_left[2])
end

function calculate_average_temperature(robot, rectangle)
    top_left = rectangle[1]
    bottom_right = rectangle[2]
    perimeter_temperature = 0
    perimeter_cells = 0
    
    for i in top_left[1]:bottom_right[1]
        for j in top_left[2]:bottom_right[2]
            if i == top_left[1] || i == bottom_right[1] || j == top_left[2] || j == bottom_right[2]
                perimeter_temperature += robot.temperature(i, j)
                perimeter_cells += 1
            end
        end
    end
    
    return perimeter_temperature / perimeter_cells
end

# Пример использования:
robot = Robot()
largest_rectangle = find_largest_rectangle(robot)
robot.show!(largest_rectangle)
