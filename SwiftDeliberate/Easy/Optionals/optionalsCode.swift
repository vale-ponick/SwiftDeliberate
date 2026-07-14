//
//  optionalsCode.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 13.07.2026.
//

import Foundation

struct OptionalsCode {
    static func run() {
        print("▶️ Запуск: Опционалы (Easy)")
        
        // MARK: - 1️⃣: Безопасное извлечение из словаря
        print("Дан словарь с данными пользователя. Извлеки имя и возраст, используя guard let. Если ключа нет — верни значения по умолчанию.")
        
        
        let user: [String: Any] = [
            "name": "Vale",
            "age": 30
        ]
        
        func extractUser(from dictionary: [String: Any]) -> (name: String, age: Any) {
            guard let name = dictionary["name"] as? String,
                  let age = dictionary["age"] as? Int else {
                return ("Unknown", 0)
            }
            return  (name, age)
        }
        // Пример использования:
        let result = extractUser(from: user)
        print("Имя: \(result.name), Возраст: \(result.age)") // Имя: Vale, Возраст: 30
        
        // MARK: - 2️⃣. Приведение типа. Дан массив с элементами разных типов. Отфильтруй только строки и выведи их.

        let mixed: [Any] = ["Swift", 42, "Optional", true, "Practice"]
        
        func filterString(in array: [Any]) -> [String] {
            return array.compactMap { $0 as? String } //одновременно фильтрация + приведение типов  - .compactMap - перебирает элементы -> приводит к НУЖНОМУ типу (as? String) и auto отбрасывает все, что вернуло nil
        }
        let rslt = filterString(in: mixed)
        print(rslt) // ["Swift", "Optional", "Practice"]

// MARK: - Задача 3: Nil‑coalescing в действии
print("ТЗ: Дан опциональный массив чисел. Если он nil — верни пустой массив. Если есть — верни сумму элементов.")
        
        let optionalNumbers: [Int]? = [1, 2, 3, 4, 5]
        
        func checkOnOptional(_ array: [Int]?) -> Int {
            return array?.reduce(0, +) ?? 0
        }
        print(checkOnOptional(optionalNumbers)) // 15
        print(checkOnOptional(nil))             // 0

        // MARK: - Задача 4: Обработка nil в массиве опционалов
        print("Дан массив опциональных строк. Отфильтруй все nil, а оставшиеся строки приведи к верхнему регистру.")
        
        let items: [String?] = ["apple", nil, "banana", nil, "cherry"]
        
        func processString(_ array: [String?]) -> [String] {
            return array.compactMap { $0?.uppercased() }
        }
        print(processString(items)) // ["APPLE", "BANANA", "CHERRY"]
    }
}
