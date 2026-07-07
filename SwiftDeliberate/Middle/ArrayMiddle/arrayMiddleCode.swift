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
        
        // MARK: - 1️⃣: lazy map + first
        
        // 1.1 Eager map + filter + first ("Full pipeline")
        let names = ["Alex", "John", "Anna", "Maria", "Peter"]
        let normalRes = names .map { $0.uppercased() } // преобразует КАЖДЫЙ элемент массива -> заглавные
            .filter { $0.hasPrefix("A") } // фильтрует массив условие - начинается с буквы А
            .first // Вернет Optional("ALEX") // вернет первый элемент т.к. его м. НЕ б. => вернет String?
        assert(normalRes == "ALEX", "❌ Ошибка: обычный map")
        
        // 1.1 Eager map + filter + first ("Full pipeline")
        // вар. 2 «Пошаговая трассировка кода с выводом состояния»
        print("▶️ Обычный map:")
        let normRes = names
            .map { name -> String in // синтаксис замыкания знаком уже, но еще НЕ привычен - надо добавить в рефлексию
                print("  🔄 map: \(name)") // ГЛАВНОЕ здесь - принтты т.к. они показывают алгоритм действия кода построчно = по командно
                return name.uppercased()
            }
            .filter { name in // тот же синтакс замыкания
                print("  🔍 filter: \(name)")
                return name.hasPrefix("A")
            }
            .first
        print("📊 Результат: \(normRes ?? "nil")") // работа с опц-лом - если нил
        
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
        print("📊 Результат: \(lazyResult ?? "nil")") // optional "ALEX"
        
        // MARK: - 2️⃣: reduce(into:) — группировка
        let words = ["apple", "banana", "apple", "cherry", "banana", "banana"]
        
        // 2.1 Частота слов
        let wordsCounts = words
            .reduce(into: [:]) { counts, word in
                counts[word, default: 0] += 1
            }
        print(wordsCounts)
        
        // 2.2 Уникальные слова (сохраняя порядок)
        let unuqueWords = words.reduce(into: (list: [String](), seen: Set<String>())) { result, word in
            if result.seen.insert(word).inserted {
                result.list.append(word)
            }
        }.list
        
        print("Unuque words: \(unuqueWords)")
        
        // 2.3 Группировка слов по первой букве (Классика для UI-списков)
                // Превращает [String] в словарь списков [Character: [String]]
        // реальный пример того, как подготавливать данные для секций в UITableView или UICollectionView
                let groupedByFirstLetter = words.reduce(into: [Character: [String]]()) { result, word in
                    if let firstLetter = word.first {
                        result[firstLetter, default: []].append(word)
                    }
                }
                print(groupedByFirstLetter) // ["a": ["apple", "apple"], "b": ["banana", ...], "c": ["cherry"]]
                
                // 2.4 Разделение (Partition) на две группы за один проход
                // Напр., разделяем слова на короткие (<= 5 букв) и длинные (> 5 букв)
        // демонстрирует, как за один цикл O(N) разложить массив по 2 разным карманам кортежа, не вызывая два раза метод .filter.
                let partitionedWords = words.reduce(into: (short: [String](), long: [String]())) { result, word in
                    if word.count <= 5 {
                        result.short.append(word)
                    } else {
                        result.long.append(word)
                    }
                }
                print("Short: \(partitionedWords.short), Long: \(partitionedWords.long)")
        
        // 2.1 Сгруппировать слова в словарь [String: Int] с помощью reduce(into:)
               let groupingWords = words.reduce(into: [String: Int]()) { result, word in
                   result[word, default: 0] += 1
               }
               
               print("Grouping words in dictionary: \(groupingWords)")
               // ["apple": 2, "banana": 3, "cherry": 1]
        
        // 2.5 Супер-Комбо: Map + Filter за ОДИН проход процессора
               // Задача: Оставить только слова на букву "a" и сделать их капсом.
               // Вместо .filter{...}.map{...} (что создало бы 2 массива в памяти), делаем один проход:
               let optimizedWords = words.reduce(into: [String]()) { result, word in
                   if word.hasPrefix("a") {
                       result.append(word.uppercased())
                   }
               }
               print("Optimized: \(optimizedWords)") // ["APPLE", "APPLE"]

               // 2.6 Сглаживание матрицы (Аналог flatMap / flattened())
               // Задача: превратить вложенный массив [[String]] в плоский [String]
               let matrixOfWords = [["apple", "banana"], ["cherry", "date"]]
               let flatWords = matrixOfWords.reduce(into: [String]()) { result, subArray in
                   result.append(contentsOf: subArray) // Быстро добавляет элементы подмассива в конец
               }
               print("Flat array: \(flatWords)") // ["apple", "banana", "cherry",
        
        // MARK: - 3️⃣: Вложенные массивы
        let ticTacToe: [[String]] = [
            ["X", "O", "X"],
            ["O", "X", "O"],
            ["O", "O", "X"]
        ]
        
        // 3.1 Получить элемент по индексу [1][1]
        let center = ticTacToe[1][1]
        print("▶️ Центр игрового поля: \(center)")
        assert(center == "X", "❌ Ошибка: центр должен быть X")
        
        
        // MARK: - 4️⃣: ArraySlice — опасность и правильное копирование
        var hugeArray = Array(1...1_000_000)
        let slice = hugeArray[0...4]
        let isolatedArray = Array(slice)
        hugeArray = []
        
        // 4.1 Проверить, что isolatedArray содержит 5 элементов
        print("▶️ isolatedArray содержит \(isolatedArray.count) элементов")
        assert(isolatedArray.count == 5, "❌ Ошибка: срез должен содержать 5 элементов")
        
        
        // MARK: - 5️⃣: removeFirst() vs removeLast()
        var testArray = Array(1...10)
        
        // 5.1 Удалить последний элемент
        let lastRemoved = testArray.removeLast()
        print("▶️ Удалён последний элемент: \(lastRemoved)")
        assert(testArray == [1, 2, 3, 4, 5, 6, 7, 8, 9], "❌ Ошибка: removeLast() сработал неверно")

        // 5.2 Удалить первый элемент
        let firstRemoved = testArray.removeFirst()
        print("▶️ Удалён первый элемент: \(firstRemoved)")
        assert(testArray == [2, 3, 4, 5, 6, 7, 8, 9], "❌ Ошибка: removeFirst() сработал неверно")
        
        
        print("✅ Массивы (Middle) пройдены!")
    }
}
