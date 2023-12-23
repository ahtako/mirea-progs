function create_cross(robot::Robot)
    # Проверяем, находится ли робот на границе
    while !isborder(est)
        # Проверяем, есть ли маркер в текущей клетке
        if !ismarker()
            # Если нет маркера, перемещаемся вправо
            move!(est)
        end
        # Ставим маркер в текущей клетке
        putmarker!()
    end

    # Перемещаемся вниз
    move!(sud)

    while !isborder(oest)
        if !ismarker()
            move!(oest)
        end
        putmarker!()
    end

    move!(Nord)

    while !isborder(sud)
        if !ismarker()
            move!(sud)
        end
        putmarker!()
    end

    move!(nord)

    while !isborder(est)
        if !ismarker()
            move!(est)
        end
        putmarker!()
    end

    move!(oest)

    # Возвращаемся в исходное положение
    move!(nord)
    move!(est)
end

# Создаем экземпляр робота
robot = Robot()

# Вызываем функцию создания креста из маркеров
create_cross(robot)
