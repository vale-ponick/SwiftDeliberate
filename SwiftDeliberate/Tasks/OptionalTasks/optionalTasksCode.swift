//
//  optionalTasksCode.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 23.07.2026.
// 1️⃣ 2️⃣ 3️⃣ 4️⃣ 5️⃣ 6️⃣ 7️⃣ 8️⃣ 9️⃣ 🔟

import Foundation

struct OptionalTasksCode {
    static func run() {
        print("▶️ Запуск: OptionalTasksCode(Easy  -> Medium")
        
        // MARK: - 📝 ЗАДАЧИ ПО ОПЦИОНАЛАМ (Easy → Medium)
        
        // MARK: - 1️⃣: «Безопасное извлечение»: easy
        print("\n1️⃣. «Безопасное извлечение»: easy.")
        print("Напиши функцию, которая принимает: массив строк и индекс. Функция должна безопасно вернуть элемент по индексу. Если индекс некорректный — вернуть 'Not found'.")
        
        let words = ["Swift", "API", "SwiftUI", "", "Optionals Tasks"]
        
        func safeExtraction(from words: [String], at index: Int) -> String {
            guard words.indices.contains(index) else {
                return "Not found"
            }
            return words[index]
        }
        print("🔹 words[3] = \(safeExtraction(from: words, at: 3))")   // ""
        print("🔹 words[4] = \(safeExtraction(from: words, at: 4))")   // "SwiftUI"
        print("🔹 words[0] = \(safeExtraction(from: words, at: 0))")   // "Swift"
        print("🔹 words[7] = \(safeExtraction(from: words, at: 7))")   // "Not found"
        
        // MARK: - 2️⃣ 'Компакт-карта': medium
        print("\n2️⃣ 'Компакт-карта': Дан массив с опциональными числами. Используй compactMap, чтобы убрать nil и вывести сумму.")
        
        let optionalNumbers = [1, nil, 3, nil, 5]
        // var. 1 - ДВА прохода по массиву: .compactMap создаёт новый чистый массив в памяти, затем reduce его складывает.
        let sum = optionalNumbers
            .compactMap { $0 }
            .reduce(0, +)
        print("Summa: \(sum)") // 9
        
        // Как решить эту задачу всего за ОДИН проход по массиву и без выделения лишней памяти под промежуточный массив?
        let singlePassSum = optionalNumbers.reduce(0) { accumulated, nextOptional in accumulated + (nextOptional ?? 0) }
        print("Summa onsingle pass: \(singlePassSum)") // 9
        
        // var. 3 'super-sugar' short!
        let superSugarSum = optionalNumbers.reduce(0) { $0 + ($1 ?? 0) }
        print("Super-sugar summa: \(superSugarSum)") // 9
        
        // MARK: - 3️⃣. «Парсинг строк»: medium
        print("3️⃣. Дан массив строк. Используй compactMap + Int(), чтобы получить массив чисел. Выведи результат")
        
        let stringNumbers = ["12", "swift", "21", "API", "888"]
        
        let nums = stringNumbers.compactMap { Int($0) }
        print(nums) // [12, 21, 888]
        
        // O(n) и без лишней памяти
        let summa = stringNumbers.reduce(0) {$0 + (Int($1) ?? 0) }
        print(summa) // 921
        
        // MAK: - 4️⃣. 'Парсинг профиля из вложенного JSON': hard
        print("4️⃣. Парсинг профиля из вложенного JSON")
              
        let networkResponse: [String: Any] = ["user": ["profile": ["meta": ["age": 25]]]]

        func parseUserAge(from response: [String: Any]) -> Int {
            // 🛠 ТВОЙ КОД ЗДЕСЬ (Никаких подсказок от дипсиков!)
            // Помни про опциональную цепочку и приведение типов через as? [String: Any]
            return 0
              }

              // Твоя будущая проверка через assert:
              // let age = parseUserAge(from: networkResponse)
              // assert(age == 25, "❌ Ошибка: возраст извлечен неверно!")
        
        
    }
}
