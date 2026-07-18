//
//  dictionaryTasksCode.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 17.07.2026.
//

import Foundation

struct DictionaryTasksCode {
    static func run() {
        
        // MARK: - 1️⃣: Добавление ключа + средний балл (merging)
        print("1️⃣: Добавление ключа + средний балл")
        
        let scores = ["Ann": 85, "Joe": 92, "Jane": 78]
        let danny = ["Danny": 88]
        
        func getAverage(in scores: [String: Int]) -> Double {
            let newScores = scores.merging(danny, uniquingKeysWith: { current, new in new })
            let average = Double(newScores.values.reduce(0, +)) / Double(newScores.values.count)
            return average
        }
        
        print(getAverage(in: scores)) // 85.75
        
        // MARK: - 2️⃣: Подсчёт вхождений (forEach + Dictionary(grouping:))
        print("\n2️⃣: Подсчёт вхождений")
        
        let items = ["apple", "banana", "apple", "orange", "banana", "grape", "apple"]
        
        // var. 1 forEach + default:
        func checkElements(in items: [String]) -> [String: Int] {
            var counts: [String: Int] = [:]
            
            items.forEach({ counts[$0, default: 0] += 1 })
            return counts
        }
        
        print(checkElements(in: items)) // ["grape": 1, "orange": 1, "apple": 3, "banana": 2]
        
        // var.2 Dictionary(grouping:by:) + mapValues
        func getCountElements(in items: [String]) -> [String: Int] {
            Dictionary(grouping: items, by: { $0 }).mapValues { $0.count }
        }
        
        print(getCountElements(in: items)) // ["grape": 1, "orange": 1, "apple": 3, "banana": 2]
        
        // MARK: - 3️⃣: Создание словаря из массивов
        print("\n3️⃣: Создание словаря из массивов")
        
        let keys = ["a", "b", "c"]
        let values = [1, 2, 3]
        
        func createDict(from keys: [String], values: [Int]) -> Bool {
            Dictionary(uniqueKeysWithValues: zip(keys, values))
                        .keys.contains("b")
        }
        
        print(createDict(from: keys, values: values)) // true
        
        // var. 2 Dictionary(_:uniquingKeysWithValues:)
        let keys1 = ["a", "b", "a", "b", "c"]
        let values1 = [1, 2, 777, 1, 2]
        
        // Вариант А: Оставляем СТАРОЕ значение (первое встреченное)
        let dictKeepCurrent = Dictionary(zip(keys1, values1), uniquingKeysWith: { (current, new) in current })
        print(dictKeepCurrent) // Результат: ["a": 1, "b": 2, "c": 2]
        
        // Вариант Б: Выбираем НОВОЕ значение (перезаписываем)
        let dictKeepNew = Dictionary(zip(keys1, values1), uniquingKeysWith: { (current, new) in new })
        print(dictKeepNew) // Результат: ["b": 1, "a": 777, "c": 2]
        
        // MARK: - 4️⃣: Группировка Person по городу
        print("\n4️⃣: Группировка Person по городу")
        
        struct Person {
            let name: String
            let city: String
        }
        
        let people = [
            Person(name: "Ann", city: "London"),
            Person(name: "Bob", city: "London"),
            Person(name: "Dilan", city: "Paris"),
            Person(name: "Joe", city: "New York"),
            Person(name: "Sam", city: "New York"),
            Person(name: "Adam", city: "London"),
            Person(name: "Liza", city: "Rome"),
            Person(name: "Ivan", city: "Ufa"),
            Person(name: "Andy", city: "London"),
            Person(name: "Eva", city: "Praga")
        ]
        
        let groupedByCity = Dictionary(grouping: people, by: \.city)
        let cityCounts = groupedByCity.mapValues { $0.count }
        print("Количество людей по городам: \(cityCounts)")
        
        // MARK: - 5️⃣: Группировка оценок студентов + средний балл
        print("\n5️⃣: Группировка оценок студентов + средний балл")
        
        let grades = [
            "Alice: 85",
            "Bob: 92",
            "Alice: 78",
            "Charlie: 88",
            "Bob: 95",
            "Alice: 91"
        ]
        
        // Группировка через reduce
        let groupedGrades = grades.reduce(into: [String: [Int]]()) { result, entry in
            let parts = entry.split(separator: ": ")
            let name = String(parts[0])
            if let grade = Int(parts[1]) {
                result[name, default: []].append(grade)
            }
        }
        
        print("Сгруппированные оценки: \(groupedGrades)")
        
        // Вычисление среднего балла для каждого студента
        let averages = groupedGrades.mapValues { grades in
            Double(grades.reduce(0, +)) / Double(grades.count)
        }
        print("Средние баллы: \(averages)")
        
        // Фильтрация студентов со средним баллом >= 85
        let highAchievers = averages.filter { $0.value >= 85 }
        print("Отличники (≥85): \(highAchievers)")
    }
}
