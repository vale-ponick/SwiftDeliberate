//
//  dictionariesCode.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 13.07.2026.
//

import Foundation

struct DictionariesCode {
    static func run() {
        print("▶️ Запуск: Словари (Easy)")
        
        // MARK: - 1️⃣: Безопасное извлечение из словаря
        print("Дан словарь с данными пользователя. Извлеки имя и возраст, используя guard let. Если ключа нет — верни значения по умолчанию.")
        
        
        let _: [String: Any] = [
            "name": "Vale",
            "age": 30
        ]
        
        // MARK: - ✏️ ЗАДАЧИ
        print("Задача 1. Дан массив строк. Напиши код, который создаст Set из уникальных слов, а затем выведет количество уникальных элементов.")
        // var.1
        let words = ["cat", "dog", "cat", "bird", "cat"]

        func getUniqueCount(in array: [String]) -> Int {
            Set(array).count
        }
        print(getUniqueCount(in: words)) // 3

        // var. 2 generic
        // В угловых скобках <Element: Hashable> мы ставим условие для типа

        let numbersInt = [1, 2, 2, 3, 1]
        let doubles = [1.1, 2.2, 1.1]

        func countUniqueElements<Element: Hashable>(in array: [Element]) -> Int {
            Set(array).count
        }
        print(countUniqueElements(in: words)) // 3
        print(countUniqueElements(in: numbersInt)) // 3
        print(countUniqueElements(in: doubles)) // 2

        // MARK: - Задача 2.
        print("Задача 2. Дан словарь. Напиши код, который добавляет новый ключ 'Denny' со значением 88, а затем выводит средний балл всех студентов (используй values).")

        let scores = ["Ann": 85, "Joe": 92, "Jane": 78]
        let danny = ["Danny": 88]
        func getAverage(in scores: [String: Int]) -> Double {
            let newScores = scores.merging(danny, uniquingKeysWith: { current, new in new })
            let average = Double(newScores.values.reduce(0, +)) / Double(newScores.values.count)
            return average
        }

        print(getAverage(in: scores)) // 85.75

        // Задача 3.
        print("Дан массив чисел [10, 20, 30, 40, 50]. Используя filter, создай новый массив только из чисел, больших 25.")
        let intNums = [10, 20, 30, 40, 50]
        let newArray = intNums.filter { $0 > 25 }
        print(newArray) // [30, 40, 50]
        
        // Задача 4.
        print("Дан массив. Используя map, создай массив строк, где каждое число превращается в 'Number: X'.")
        let numbers = [1, 2, 3, 4, 5]
        let numString = numbers.map { "Number: \($0)" }

        print(numString) // ["Number: 1", "Number: 2", "Number: 3", "Number: 4", "Number: 5"]
    }
}
        
