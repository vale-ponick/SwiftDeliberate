//
//  variablePractice.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 27.07.2026.
//

import Foundation

struct VariablePractice {
    static func run() {
        print("▶️ Запуск: Variable Practice")
        
        // MARK: - 📝 Variable Practice)
        struct Point {
            var x: Int
            var y: Int
        }
        
        var currentPosition = Point(x: 10, y: 20) // основная точка
        let backupPosition = currentPosition // резервная точка
        
        currentPosition.x = 99 // ok
        print(currentPosition) // Point(x: 99, y: 20)
        print(backupPosition)  // Point(x: 10, y: 20) Изменится ли резервная копия, если мы поменяли оригинал? нет создается автономная/самостоятельная КОПИЯ
        
        class Car {
            var driver: String
            init(driver: String) { self.driver = driver }
        }

        let myCar = Car(driver: "Валерия")
        print(myCar.driver) // Валерия
        let sharedCar = myCar

        sharedCar.driver = "ИИ-Штурман"
        print(sharedCar.driver) // ИИ-Штурман
        print(myCar.driver) // ИИ-Штурман
        
       // Тест 1. Структура внутри Структуры (Value inside Value)
        struct Coordinates {
            var latitude: Double
            var longitude: Double
        }

        struct RoutePoint {
            let name: String
            var coords: Coordinates // 💡 Тут var!
        }

        // Создаем константную точку
        let checkpoint = RoutePoint(name: "Мариинск", coords: Coordinates(latitude: 56.2, longitude: 87.7))

        // 🛠️ ЗАДАНИЕ: Раскомментируйте строчку ниже. Скомпилируется ли код?
        // checkpoint.coords.latitude = 56.5 // Cannot assign to property: 'checkpoint' is a 'let' constant

        print("Тест 1 завершен")
        
        // Тест 2. Класс внутри Класса (Reference inside Reference)Теперь посмотрим, как ведут себя два класса, вложенные друг в друга
        class Engine {
            var horsepower: Int = 150
        }

        class Truck {
            let engine = Engine() // 💡 Тут let!
        }

        let myTruck = Truck()

        // 🛠️ ЗАДАНИЕ: Запустите этот код и проверьте вывод в консоль
        myTruck.engine.horsepower = 250
        print("Мощность мотора:", myTruck.engine.horsepower) // Мощность мотора: 250
        
        // 🔥 Последний рубеж: Тест 3 (Класс внутри Структуры)
        class Tracker {
        var pointsCount = 0
    }

    struct Trip {
        let title: String
        let tracker: Tracker // 💡 Класс внутри структуры!
    }

    let travel = Trip(title: "В Белокуриху", tracker: Tracker())
    travel.tracker.pointsCount = 10

    print("Название:", travel.title) // Название: В Белокуриху
    print("Счетчик точек в трекере:", travel.tracker.pointsCount) // Счетчик точек в трекере: 10
        
        /**
         Название поездки (travel.title) — это свойство самой структуры. Оно иммутабельно (let), и его изменить нельзя.
         
         А трекер (travel.tracker) хранит внутри структуры только адрес ссылки на область в Куче. Адрес остался прежним? Прежним. Значит, структура не изменилась. А вот данные по этому адресу в Куче изменять можно, если внутри класса они объявлены через var.
         
         «Результаты практикума:
         Тест 1 (Value inside Value) — let-структура полностью блокирует вложенные var-структуры.
         Тест 2 (Reference inside Reference) — let-класс разрешает мутацию var-свойств вложенного класса, т.к. указатели в Stack неизменны.
         Тест 3 (Reference inside Value) — Сработало! let-структура блокирует только адрес ссылки вложенного класса, но разрешает менять его var-данные в Heap. Ура!»
         */
    }
}
