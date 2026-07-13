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
    }
}
