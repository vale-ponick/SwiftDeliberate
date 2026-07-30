//
//  structAndClassPractics.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 30.07.2026.
//

import Foundation

struct StructAndClassPractics {
    static func run() {
        print("▶️ Запуск: Struct And Class Practics")
        
        print("📝 Struct And Class Practics")
        
        // MARK: - 1️⃣: 'Команда на взлет'
        print("1️⃣: Создай структуру Spaceship + 2 изменяемых свойства: name и fuel. Напиши функцию, внутри которой:Создай первый корабль через var с именем 'USS Enterprise' и уровнем топлива 100.Создай второй корабль через var, просто скопировав в него первый корабль.Измени у второго корабля имя на 'USS Discovery', а топливо уменьши до 50.Напечатай в консоль (через print) имя и топливо первого корабля.")
        
        struct UnatedSpaceShip {
            var name: String
            var fuel: Int
        }
        func runTask1() {
            let USSEnterprise = UnatedSpaceShip(name: "USS Enterprise", fuel: 100)
            var USSDiscovery = USSEnterprise
            
            USSDiscovery.fuel = 50
            print("Name: \(USSEnterprise.name), fuel: \(USSEnterprise.fuel)")
        }
        
        runTask1() // Name: USS Enterprise, fuel: 100
        /** Победа над ловушкой №1: Ты своими руками доказала, что изменение копии (USSDiscovery) вообще никак не тронуло оригинал (USSEnterprise), потому что структура — это Value Type.*/
        
        // MARK: - 2️⃣: 'Смена капитана'
        print("2️⃣: «Смена капитана» Внутри метода run(), ниже первой задачи, создай класс Commander (Командир), одно изменяемое свойство: name.NB: Класс - д.б. init(name: String) { self.name = name }, иначе компилятор выдаст ошибку.Напиши функцию runTask2(), внутри которой:Создай первого командира с именем 'James Kirk'. Подумай, что тут лучше использовать — let или var?Создай второго командира через var, просто приравняв его к первому.Измени у второго командира имя на 'Spock'.Напечатай в консоль имя первого командира.")
        
        class Commander {
            var name: String
            
            init(name: String) {
                self.name = name
            }
        }
        func runTask2() {
            let firsCommander = Commander(name: "James Kirk")
            let secondCommander = firsCommander
            secondCommander.name = "Spock"
            Swift.print("Name first commander: \(firsCommander.name)")
        }
        runTask2() // Name first commander: Spock
        
        // MARK: - 3️⃣: 'Заправка на ходу'
        print("3️⃣: 'Заправка на ходу' Создай struct CargoShip +  2 свойства: name (let) и tonnage ( var). Добавь метод mutating func loadCargo(weight: Int), который увеличивает tonnage на величину weight. Напиши функцию runTask3(), в которой create корабль через var с именем 'USS Voyager' и начальным весом 100. Вызови метод .loadCargo(weight: 50) и print итоговый тоннаж в консоль через print.")
        
        struct CargoShip {
            let name: String
            var tonnage: Int
            
            mutating func loadCargo(weight: Int) {
                tonnage += weight
            }
        }
        func runTask3 () {
            var voyager = CargoShip(name: "USS Voyager", tonnage: 100)
            voyager.loadCargo(weight: 50)
            print("Final tonnage: \(voyager.name) - \(voyager.tonnage)")
        }
        runTask3() // Final tonnage: USS Voyager - 150
        
        // MARK: - 4️⃣: 'Исследовательский Зонд'
        print("4️⃣: 'Исследовательский Зонд'. Создай класс SpaceProbe, 2 свойства (var): serialNumber + destination (цель полета). Напиши функцию runTask4(), внутри создай первый зонд через константу let с номером 2112 и целью 'Mars'.Создай второй зонд через константу let, просто приравняв его к первому.Измени у второго зонда цель полета (destination) на 'Jupiter'.Измени у первого зонда серийный номер (serialNumber) на 8888.Напечатай в консоль (через print) номер и цель полета второго зонда.")
        
        class SpaseProbe {
            var serialNumber: Int
            var destination: String
            
            init(serialNumber: Int, destination: String) {
                self.serialNumber = serialNumber
                self.destination = destination
            }
        }
        
        func runTask4() {
            let firstSpaseProb = SpaseProbe(serialNumber: 2112, destination: "Mars")
            let secondSpaseProb = firstSpaseProb
            secondSpaseProb.destination = "Jupiter"
            firstSpaseProb.serialNumber = 8888
            
            print("Firts space probe: serial number - \(firstSpaseProb.serialNumber), Second space probe destination - \(secondSpaseProb.destination)")
        }
        runTask4() // Firts space probe: serial number - 8888, Second space probe destination - Jupiter
        
        // MARK: - 5️⃣: 'Управление экипажем'
        print("\n5️⃣: Название модуля: 'CrewManager'.\nУровень: Junior.\nТип задачи: Проектирование структуры с мутацией и вычисляемыми свойствами.")
        
        print("📋 Создай структуру CrewMember с полями: name, position, spokenLanguage, age. Создай структуру Crew с массивом members и методом addMember(). Добавь вычисляемое свойство isFullyCrewed, которое проверяет, есть ли в команде 'Captain', 'Helmsman', 'Chief Engineer'. Проверь работу через print.")
        
        struct CrewMember { // член экипажа
            let name: String
            let position: String
            let spokenLanguage: String
            let age: Int
        }
        
        struct Crew {
            var members: [CrewMember] = []
            
            mutating func addMembers(_ member: CrewMember) {
                members.append(member)
            }
            
            var isFullyCrewed: Bool {
                let hasCaptine = members.contains { $0.position == "Captain" }
                let hasChiefEngineer = members.contains { $0.position == "Chief Engineer" }
                let hasHelmsman = members.contains { $0.position == "Helmsman" }
                return hasCaptine && hasChiefEngineer && hasHelmsman
            }
            
            mutating func removeMember(name: String) -> String? {
                if let index = members.firstIndex(where: { $0.name == name }) {
                    return "Delete: \(name)"
                } else {
                    return nil
                }
            }
        }
        // MARK: - 5️⃣: 'Управление экипажем'
        func runTask5() {
            var enterprise = Crew()
            
            enterprise.addMembers(CrewMember(name: "Kirk", position: "Captain", spokenLanguage: "English", age: 34))
            enterprise.addMembers(CrewMember(name: "Spock", position: "Helmsman", spokenLanguage: "Vulcan", age: 35))
            enterprise.addMembers(CrewMember(name: "Scotty", position: "Chief Engineer", spokenLanguage: "English", age: 40))
            
            print("Команда укомплектована? \(enterprise.isFullyCrewed)")
            
            // Проверка удаления
            if let result = enterprise.removeMember(name: "Spock") {
                print(result) // Spock
            } else {
                print("Член не найден")
            }
            
            print("Команда укомплектована после удаления? \(enterprise.isFullyCrewed)") // true
        }
        runTask5() // Команда укомплектована? true
        
        
        
        // MARK: - 6️⃣: 'БОРТЖУРНАЛ ЗВЁЗДНОГО ФЛОТА'
        print("\n6️⃣: Название модуля: 'БОРТЖУРНАЛ ЗВЁЗДНОГО ФЛОТА. Вселенная: Star Trek'.\nУровень: Junior+.\nТип задачи: Структуры, вычисляемые свойства, опционалы, работа с датой и безопасное извлечение.")
        
        print("📋 Ты — капитан корабля «Энтерпрайз». Твой бортовой журнал (Captain’s Log) должен хранить записи о миссиях.")
        
        enum DangerLevel: String {
            case low
            case medium
            case high
        }

        struct LogEntry {
            let title: String
            let stardate: Double
            let captainName: String
            let dangerLevel: DangerLevel?
        }

        struct CaptainLog {
            var entries: [LogEntry] = []
            
            var totalMissions: Int {
                entries.count
            }
            
            var lastEntry: LogEntry? {
                entries.max(by: { $0.stardate < $1.stardate })
            }
            
            var dangerousMissions: Int {
                entries.reduce(0) { $0 + ($1.dangerLevel == .high ? 1 : 0) }
            }
            
            mutating func addEntry(_ entry: LogEntry) {
                entries.append(entry)
            }
            
            mutating func removeEntry(byTitle title: String) -> String? {
                guard let removeIndex = entries.firstIndex(where: { $0.title == title }) else {
                    return nil
                }
                entries.remove(at: removeIndex)
                return "Delete: \(title)"
            }
        }

        // --- ТЕСТОВЫЙ БЛОК БЕЗ WARNINGS ---
        var captainLog = CaptainLog()

        captainLog.addEntry(LogEntry(title: "Встреча с клингонами", stardate: 4124.5, captainName: "Kirk", dangerLevel: .high))
        captainLog.addEntry(LogEntry(title: "Исследование туманности", stardate: 4125.1, captainName: "Picard", dangerLevel: .low))
        captainLog.addEntry(LogEntry(title: "Бой с ромуланами", stardate: 4126.0, captainName: "Kirk", dangerLevel: .high))

        print("Всего миссий: \(captainLog.totalMissions)")
        print("Опасных миссий: \(captainLog.dangerousMissions)") // Чистый Int, без ?? 0
        print("Последняя миссия: \(captainLog.lastEntry?.title ?? "—")") // Извлечение опционала через ??

        if let result = captainLog.removeEntry(byTitle: "Исследование туманности") {
            print(result)
        } else {
            print("Запись не найдена")
        }

        print("Всего миссий после удаления: \(captainLog.totalMissions)")
        
        /**
         6️⃣: Название модуля: 'БОРТЖУРНАЛ ЗВЁЗДНОГО ФЛОТА. Вселенная: Star Trek'.
         Уровень: Junior+.
         Тип задачи: Структуры, вычисляемые свойства, опционалы, работа с датой и безопасное извлечение.
         📋 Ты — капитан корабля «Энтерпрайз». Твой бортовой журнал (Captain’s Log) должен хранить записи о миссиях.

         🧪 ТЕСТ: Бортжурнал Звёздного флота
         Всего миссий: 3
         Опасных миссий: 2
         Последняя миссия: Бой с ромуланами
         Delete: Исследование туманности
         Всего миссий после удаления: 2
         */
    }
}
