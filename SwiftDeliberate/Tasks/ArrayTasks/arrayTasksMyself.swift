//
//  arrayTasksMyself.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 08.07.2026.
// 1️⃣ 2️⃣ 3️⃣ 4️⃣ 5️⃣ 6️⃣ 7️⃣ 8️⃣ 9️⃣ 🔟

import Foundation
/* ✅ КАК РЕШАТЬ
    Создай структуру ArrayTasksMyself
    Добавь метод static func run()
    Для каждой задачи напиши:
    print
    решение
    assert для проверки */

struct ArrayTasksMyself {
    static func run() {
        
        // MARK: - 1️⃣: Найди сумму всех элементов
        let numbers = [1, 2, 1, 2, 3, 3, 3, 4, 5, 6, 7, 7, 12, 21]
        let summa = numbers.reduce(0, +)
        print("Сумма всех элементов массива: \(summa)")
        assert((summa == 77), "❌ Ошибка: расчет не верен")
        print("✅ Проверка пройдена")
        
        // MARK: - 2️⃣. Найди максимум (без использования max()) Логика д.б. max простой: «Если текущее число num больше, чем наш известный maxNum, то мы обновляем maxNum, присваивая ему это число num».
        
        // var.1 - императивный
        var maxNum = Int.min
        for num in numbers {
            if num > maxNum {
                maxNum = num
            }
        }
        print("Максимальное число в массиве: \(maxNum)")
        assert((maxNum == numbers.max()), "❌ Ошибка: алгоритм поиска максимума работает неверно")
        print("✅ Проверка пройдена")
        
        // вар. 2 функциональный
        let maxNumber = numbers.reduce(Int.min) { $0 > $1 ? $0 : $1 }
        print("Максимальное число в массиве: \(maxNumber)")
        assert((maxNumber == numbers.max()), "❌ Ошибка: алгоритм поиска максимума работает неверно")
        print("✅ Проверка пройдена")
        
        // MARK: - 3️⃣. Комплексная обработка: Уникальность -> Разворот -> Минимум
        print("--- Задача 3️⃣: Комплексная обработка ---")
        
        // Шаг 1. Очистка от дубликатов
        let inputNumbers = [1, 2, 1, 2, 3, 3, 3, 4, 5, 6, 7, 7, 12, 21]
        var uniqueNumbers: [Int] = []
        for num in inputNumbers {
            if !uniqueNumbers.contains(num) {
                uniqueNumbers.append(num)
            }
        }
        
        // Шаг 2. Разворот массива задом наперёд
        var uniqueNums = [1, 2, 3, 4, 5, 6, 7, 12, 21]
        let _: [Int] = []
        uniqueNums.reverse()

        
        // Шаг 3  Разворот массива 'задом наперёд' ВРУЧНУЮ
        var reversedNums: [Int] = []
        
        for num in uniqueNumbers {
            reversedNums.insert(num, at: 0)
                
        }
        
        // Шаг 3. Поиск минимума ВРУЧНУЮ  - без .min()
        var minNum = Int.max
        
        for num in reversedNums {
            if num < minNum {
                minNum = num
            }
        }
        
        // Вывод результатов
        print("Уникальные: \(uniqueNumbers)")
        print("Развернутые: \(reversedNums)")
        print("Минимум: \(minNum)")
        
        // Проверки
        assert(minNum == inputNumbers.min(), "❌ Ошибка: алгоритм поиска минимума работает неверно")
        if minNum == inputNumbers.min() {
            print("🎉 Результат \(minNum) полностью совпадает с системным минимумом")
        }
        print("✅ Задача 3️⃣: Все проверки пройдены успешно!")
        
        // MARK: - 4️⃣. Найди дубликаты
        print("--- Задача 4️⃣: Найди дубликаты ---")
        // var. 1 простой + императивный
        let input = [1, 1, 1, 3, 3, 3, 5, 5, 7]
        
        var searchNums: [Int] = []
        var dublicateNums: [Int] = []
        
        for num in input {
            if !searchNums.contains(num) { // если НЕ содержит - добавь
                searchNums.append(num)
            } else if !dublicateNums.contains(num) {
                dublicateNums.append(num)
            }
        }
        
        // вар. 2 функциональный
        
        let arrayNumbers = [1, 1, 1, 3, 3, 3, 5, 5, 7]
         
        let partitionedNumbers = arrayNumbers.reduce(into: (searchNums: [Int](), dublicateNums: [Int]())) { result, num in
            if !result.searchNums.contains(num) {
                    result.searchNums.append(num)
            } else if !result.dublicateNums.contains(num) {
                result.dublicateNums.append(num)
                        }
                    }
           print(partitionedNumbers)
           
        
        // MARK: - 5️⃣. Проверь, отсортирован ли массив (по возрастанию)
        print("--- Задача  5️⃣: Проверь, отсортирован ли массив ---")
        // Логика: массив считается отсортированным, если каждый следующий элемент >= предыдущего.
        // Если хотя бы один элемент нарушает порядок → false.
        let nums1 = [1, 2, 3, 4, 5]      // → true
        let nums2 = [1, 3, 2, 4, 5]      // → false
        
        let nums = [1, 2, 3, 4, 5, 6, 4, 5, 7]
        
        func isSorted(_ array: [Int]) -> Bool {
            for num in 0..<array.count - 1 {
                if array[num] > array[num + 1] {
                    return false
                }
            }
            return true
        }
        print("nums1: \(isSorted(nums1) ? "✅ отсортирован" : "❌ не отсортирован")")
        print("nums2: \(isSorted(nums2) ? "✅ отсортирован" : "❌ не отсортирован")")

        assert(isSorted(nums1) == true, "❌ Ошибка: массив должен быть отсортирован")
        assert(isSorted(nums2) == false, "❌ Ошибка: массив не должен быть отсортирован")
        print("✅ Проверка пройдена")
    }
}
