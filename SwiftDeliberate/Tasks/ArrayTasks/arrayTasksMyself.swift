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
        
    }
}
