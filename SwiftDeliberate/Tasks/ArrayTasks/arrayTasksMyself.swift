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
        
        // MARK: - 6️⃣. Перевернуть массив (без .reversed())
        print("---🧩 ЗАДАЧА 6️⃣. Перевернуть массив (без .reversed()) ---")
        /* 📋 ТЗ: Напиши функцию reverseArray(_:). Без reversed(). Верни новый массив (не меняй оригинал). Используй O(n) по времени и O(n) по памяти. */
        
        let nums = [1, 2, 3, 4, 5, 6, 7] // → [5, 4, 3, 2, 1]
        
        func reverseArray(_ array: [Int]) -> [Int] {
            var result: [Int] = [] // создай пустой массив = хранилище
            for i in array {
                result.insert(i, at: 0)
            }
            return result
        }
        print(reverseArray(nums)) // [7, 6, 5, 4, 3, 2, 1]
        assert(reverseArray(nums) == [7, 6, 5, 4, 3, 2, 1], "❌ Ошибка: массив д.б. перевернут")
        
        // MARK: - 7️⃣. Найти второй max (без .sorted)
        print("---7️⃣. Найти второй max (без .sorted). Вариант 1: Дубликаты ИГНОРИРУЮТСЯ---")

        let nums7 = [3, 7, 2, 9, 4, 9, 6]

        // Вариант 1: Дубликаты ИГНОРИРУЮТСЯ (Ищем второй макс среди уникальных) -> Ожидаем 7
        func checkMaxNumUnique(in array: [Int]) -> Int? {
            guard array.count >= 2 else { return nil }
            var maxNum = Int.min
            var secondMax = Int.min
            
            for num in array {
                if num > maxNum {
                    secondMax = maxNum
                    maxNum = num
                } else if num > secondMax && num < maxNum { // Строго меньше первого макса
                    secondMax = num
                }
            }
            return secondMax
        }

        // Вариант 2: Дубликаты УЧИТЫВАЮТСЯ -> Ожидаем 9
        print("---7️⃣. Найти второй max (без .sorted). Вариант 2: Дубликаты УЧИТЫВАЮТСЯ---")
        func checkMaxNumWithDuplicates(_ array: [Int]) -> Int? {
            guard array.count >= 2 else { return nil }
            var maxNum = Int.min
            var secondMax = Int.min
            
            for num in array {
                if num > maxNum {
                    secondMax = maxNum
                    maxNum = num
                } else if num > secondMax { // Может быть равен первому максу
                    secondMax = num
                }
            }
            return secondMax
        }

        // Проверки:
        print(checkMaxNumUnique(in: nums7) ?? "nil")         // Выведет: 7
        print(checkMaxNumWithDuplicates(nums7) ?? "nil")     // Выведет: 9

        assert(checkMaxNumUnique(in: nums7) == 7, "❌ Ошибка в логике уникальных чисел")
        assert(checkMaxNumWithDuplicates(nums7) == 9, "❌ Ошибка в логике учета дубликатов")
        
        
        // MARK: - 8️⃣. Отфильтровать чётные числа и возвести их в квадрат
        print("---8️⃣. Отфильтровать чётные числа и возвести их в квадрат.---")
        
        // Императивный вариант (цикл for-in)
        func filterAndSquareEvenNums(in array: [Int]) -> [Int] {
            
            var result: [Int] = []
            
            for num in array {
                if num % 2 == 0 {
                    result.append(num * num)
                }
            }
        return result
        }
        
        // вар. 2 функциональный 'swift-style' - .filter + .map
        
        func filterAndSquareEvenNums(_ array: [Int]) -> [Int] {
            array
                .filter { $0 % 2 == 0 }
                .map { $0 * $0 }
        }
        
        // Проверка:
        let withEvens = [1, 2, 3, 4, 5, 6]
        let withoutEvens = [1, 3, 5, 7]
        print(filterAndSquareEvenNums(in: withEvens)) // → [4, 16, 36]
        print(filterAndSquareEvenNums(in: withoutEvens)) // []
        print(filterAndSquareEvenNums(withEvens)) // → [4, 16, 36]
        print(filterAndSquareEvenNums(withoutEvens)) // []
        
        // MARK: - 9️⃣. Сдвинуть массив на n позиций вправо
        print("---📋 ТЗ 9️⃣: Сдвинуть массив на K позиций вправо. Не меняй оригинал. Если n > array.count - обработай. Выбор: один проход /  ---")
        
        // вар. 1 array + slice
        func rotateRight(_ array: [Int], n: Int) -> [Int] {
            guard !array.isEmpty else { return [] } // если массив пуст => не тратим время и память
            let steps = n % array.count // остаток от деления на n
            let split = array.count - steps // срез = длина массива - шаг
            return Array(array[split...] + array[..<split])
        }
        
        // вар. 2 цикл for-in
        func rotateRight(in array: [Int], n: Int) -> [Int] {
            guard !array.isEmpty else { return [] }
            
            var result = array // копируем массив, оригинал НЕ трогаем - ? массив = тип-значение => копия отдельно
            let steps = n % array.count
            
            for _ in 0..<steps {
                let last = result.removeLast() // удалили + сохранили
                result.insert(last, at: 0)
            }
            return result
        }

        let nums9 = [1, 2, 3, 4, 5, 6, 7] // сдвиг на 2 → [4, 5, 1, 2, 3]
        print(rotateRight(nums9, n: 3)) // [5, 6, 7, 1, 2, 3, 4]
        print(rotateRight(in: nums9, n: 2)) // [6, 7, 1, 2, 3, 4, 5]
        
        // MARK: - 🔟: Найти второе по величине уникальное число в массиве.
                print("\n🔟: Второе по величине уникальное число")
                

                // MARK: - Подход "Easy" (Через Set и сортировку)
                // Время: O(N log N) из-за сортировки | Память: O(N) для создания Set
                func secondLargestMid(_ array: [Int]) -> Int? {
                    var largest: Int? = nil
                    var second: Int? = nil
                    
                    for num in array {
                        if num == largest { continue }                // 🚫 Игнорируем двойников
                        if num > (largest ?? Int.min) {              // 📈 Новый рекорд?
                            second = largest                         // Старый рекорд → 2 место
                            largest = num                            // 🥇 Новый 1 место
                        } else if num > (second ?? Int.min) {        // 📈 Между 1 и 2?
                            second = num                             // 🥈 Новое 2 место
                        }
                    }
                    return second
                }
                
                print(secondLargestMid([3, 7, 2, 9, 4, 9, 6]) ?? 0) // 7
                
                // MARK: - 1️⃣1️⃣: Безопасный парсинг строки с числами.
                print("\n1️⃣1️⃣: Безопасный парсинг строки с числами.")
  
                    
                enum ParseError: Error {
                    case emptyInput
                    case invalidToken(String)
                }
                    
                // MARK: - Парсер (Императивный подход через цикл)
                func parseNumsStrict(_ string: String, separator: Character = ",") throws -> [Int] {
                    let trimmed = string.trimmingCharacters(in: .whitespacesAndNewlines)
                    guard !trimmed.isEmpty else { throw ParseError.emptyInput }
                        
                    let components = trimmed.split(separator: separator)
                    var result: [Int] = []
                        
                    for comp in components {
                        let token = comp.trimmingCharacters(in: .whitespacesAndNewlines)
                        if token.isEmpty { continue }
                            
                        guard let num = Int(token) else { throw ParseError.invalidToken(token) }
                        result.append(num)
                    }
                    return result
                }
                    
                // MARK: - Парсер (Функциональный подход через функциональные методы)
                func parseNumsElegant(_ string: String, separator: Character = ",") throws -> [Int] {
                    let trimmed = string.trimmingCharacters(in: .whitespacesAndNewlines)
                    guard !trimmed.isEmpty else { throw ParseError.emptyInput }
                        
                    return try trimmed
                        .split(separator: separator)
                        .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                        .filter { !$0.isEmpty }
                        .map { token in
                            guard let num = Int(token) else { throw ParseError.invalidToken(token) }
                            return num
                        }
                }
                
                do {
                    let parsed = try parseNumsElegant("3, 7, 2, 9, 4, 9, 6")
                    print("Распарсенный массив: \(parsed)")
                } catch {
                    print("Ошибка: \(error)")
                }
                
                // MARK: - 1️⃣2️⃣: Сумма уникальных чисел (3 варианта)
                print("\n1️⃣2️⃣: Сумма уникальных чисел")
                

                func sumOfUnique(in nums: [Int]) -> Int {
                    var counts: [Int: Int] = [:]          // 1️⃣ словарь для подсчёта
                    
                    for num in nums {                     // 2️⃣ считаем частоту каждого числа
                        counts[num, default: 0] += 1      // default: 0 — если ключа нет, подставляем 0 - иначе складываем
                    }
                    
                    return counts                         // 3️⃣ оставляем только те, у кого частота == 1
                        .filter { $0.value == 1 }         //    берём ключи (числа)
                        .map { $0.key }                   //    суммируем
                        .reduce(0, +)
                }

                //  Set «на лету» - самый быстрый
                func sumOfUnique(nums: [Int]) -> Int {
                    var uniques = Set<Int>()              // 1️⃣ числа, которые встретились 1 раз
                    var duplicates = Set<Int>()           // 2️⃣ числа, которые встретились >1 раза
                    var totalSum = 0                      // 3️⃣ текущая сумма уникальных чисел
                    
                    for num in nums {
                        if duplicates.contains(num) {     // если уже в дубликатах — пропускаем
                            continue
                        }
                        
                        if uniques.contains(num) {        // если уже есть в уникальных — второе появление
                            uniques.remove(num)           // убираем из уникальных
                            duplicates.insert(num)        // добавляем в дубликаты
                            totalSum -= num               // вычитаем из суммы
                        } else {
                            uniques.insert(num)           // первое появление — добавляем
                            totalSum += num               // прибавляем к сумме
                        }
                    }
                    return totalSum
                }

                //  Set + subtracting - элегантный Swift-стиль, использует продвинутый .insert().inserted.
                func sumOfUniqueShort(_ nums: [Int]) -> Int {
                    var uniques = Set<Int>()
                    var duplicates = Set<Int>()
                    
                    for num in nums { // insert() возвращает кортеж (inserted: Bool, memberAfterInsert: Element)
                        if !uniques.insert(num).inserted { // inserted == false означает, что элемент уже был в множестве
                            duplicates.insert(num)
                        }
                    }
                    return uniques.subtracting(duplicates).reduce(0, +)     // вычитает одно множество из другого
                }

                let numsForTest = [1, 2, 3, 1, 2, 3, 4, 5, 6, 7]
                print(sumOfUnique(in: numsForTest)) // 22
                print(sumOfUnique(nums: numsForTest)) // 22
                print(sumOfUniqueShort(numsForTest)) // 22
    }
}
