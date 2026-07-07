//
//  arrayMiddleCode.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 07.07.2026.
//

import Foundation

struct ArraysMiddleCode {
    static func run() {
        print("▶️ Запуск: Массивы (Middle)")
        
        // MARK: - 1️⃣: lazy map + first (оптимизация)
        // 1.1 Обычный map + filter + first
        let names = ["Alex", "John", "Anna", "Maria", "Peter"]
        let normalRes = names .map { $0.uppercased() }
            .filter { $0.hasPrefix("A") }
            .first // Вернет Optional("ALEX")
        assert(normalRes == "ALEX", "❌ Ошибка: обычный map")
        
        // 1.1 Обычный map + filter + first
        print("▶️ Обычный map:")
        let normRes = names
            .map { name -> String in
                print("  🔄 map: \(name)")
                return name.uppercased()
            }
            .filter { name in
                print("  🔍 filter: \(name)")
                return name.hasPrefix("A")
            }
            .first
        print("📊 Результат: \(normRes ?? "nil")")
        
        // 1.2 lazy.map + filter + first
        let lazyRes = names.lazy
            .map { $0.uppercased() }
            .filter { $0.hasPrefix("A") }
            .first // Вернет Optional("ALEX")
        assert(lazyRes == "ALEX", "❌ Ошибка: lazy map")
        // 1.2 lazy.map + filter + first
        print("▶️ lazy map:")
        let lazyResult = names.lazy
            .map { name -> String in
                print("  🔄 map: \(name)")
                return name.uppercased()
            }
            .filter { name in
                print("  🔍 filter: \(name)")
                return name.hasPrefix("A")
            }
            .first
        print("📊 Результат: \(lazyResult ?? "nil")")
        
        // MARK: - 2️⃣: reduce(into:) — группировка
        let words = ["apple", "banana", "apple", "cherry", "banana", "banana"]
        
        // 2.1 Сгруппировать слова в словарь [String: Int] с помощью reduce(into:)
        
        
        // MARK: - 3️⃣: Вложенные массивы
        let ticTacToe: [[String]] = [
            ["X", "O", "X"],
            ["O", "X", "O"],
            ["O", "O", "X"]
        ]
        
        // 3.1 Получить элемент по индексу [1][1]
        // 3.2 Проверить, что результат == "X"
        
        
        // MARK: - 4️⃣: ArraySlice — опасность и правильное копирование
        var hugeArray = Array(1...1_000_000)
        let slice = hugeArray[0...4]
        let isolatedArray = Array(slice)
        hugeArray = []
        
        // 4.1 Проверить, что isolatedArray содержит 5 элементов
        
        
        // MARK: - 5️⃣: removeFirst() vs removeLast()
        var testArray = Array(1...10)
        
        // 5.1 Удалить последний элемент
        // 5.2 Удалить первый элемент
        
        
        print("✅ Массивы (Middle) пройдены!")
    }
}
