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
        
        // MARK: - Задача 5: guard let в функции
        
        print("Напиши функцию, которая принимает опциональное имя и возраст. Если оба значения есть — верни строку '<имя>, <возраст> лет'. Если хотя бы одно nil — верни 'Данные неполные'.")

        func getUserInfo(name: String?, age: Int?) -> String {
            guard let safeName = name,
                  let safeAge = age else { return "Data not full" }
            
            return "Name: \(safeName), age - \(safeAge)"
        }
        print(getUserInfo(name: "Vale.ponick", age: 59)) // Name: Vale.ponick, age - 59
        print(getUserInfo(name: "", age: 59)) // Name: , age - 59
        print(getUserInfo(name: "Vale.ponick", age: nil)) // Data not full
        
        // MARK: - 1️⃣. guard let или if let?
        print("Задача: Напиши функцию, которая принимает опциональный массив чисел. Если массив есть — верни его сумму. Если нет — верни 0")
        // NB: swift-style -> Optional Chaining + Nil‑coalescing - когда нужно просто значение по умолчанию
        let numbers: [Int]? = [1, 2, 3, 4, 5]
        let nums: [Int]? = []

        func sumArray(_ numbers: [Int]?) -> Int {
            return numbers?.reduce(0, +) ?? 0
        }
        print(sumArray(numbers)) // 15
        print(sumArray(nums)) // 0
        
        // var. 2 guard let (Проверка на входе - когда нужно выйти из функции при nil)
        func sumArrayWithGuard(_ numbers: [Int]?) -> Int {
            guard let safeNumbers = numbers else {
                return 0
            }
        return safeNumbers.reduce(0, +)
        }
        
        // var. 3 if let (условное ветвление - когда нужна логика внутри блока)
        func sumArrayWithIf(_ numbers: [Int]?) -> Int {
            if let safeNums = numbers {
                return safeNums.reduce(0, +)
            } else {
                return 0
            }
        }
        
        // MARK: - Задача 2: guard let или ???

        print("Напиши функцию, которая принимает опциональное имя. Если имя есть — верни его с приветствием. Если нет — верни 'Гость'.")
        
        // Если нужно выйти из функции
        func greet(_ name: String?) -> String {
            guard let safeGreeting = name else {
                return "guest"
                }
                return "hi, \(safeGreeting)"
        }
        print(greet("Vale")) // hi, Vale
        print(greet("")) // hi,
        print(greet(nil)) // guest
        
        // проверка только на nil
        // Если нужно просто подставить значение
        func greetWithNilcoalescing(_ name: String?) -> String {
                return "Hi, \(name ?? "guest")"
        }
        // MARK: - Задача 3: if let или ??

        print("У тебя есть опциональный словарь с настройками. Если есть ключ 'theme' — используй его. Если нет — установи 'light'.")

        let settings: [String: String]? = ["theme": "dark"]
     
        func getTheme(_ setting: [String: String]?) -> String {
                return settings?["theme"] ?? "light"
        }
        print(getTheme(settings)) // dark
        
    }
}
