//
//  arrayTasksSlices.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 12.07.2026.
//

import Foundation

struct ArrayTasksSlices {
    static func run() {
        
        // MARK: - 1️⃣: Топ-5 фильмов
        print("1️⃣: Топ-5 фильмов")
        
        let movies = [
            "Hobbit: An Unexpected Journey",
            "Schindler's List",
            "Pulp Fiction",
            "The Lord of the Rings",
            "Parker",
            "The Shawshank Redemption",
            "The Treasure of the Sierra Madre",
            "Mackenna's Gold",
            "The Good, the Bad and the Ugly",
            "Star Trek",
            "The Wizard of Oz",
            "12 Angry Men",
            "Shrek"
        ]
        
        func topFive(_ movies: [String]) -> [String] {
            guard !movies.isEmpty else { return [] }
            return movies.count >= 5 ? Array(movies.prefix(5)) : movies
        }
        
        print(topFive(movies))
        assert(topFive(movies) == [
            "Hobbit: An Unexpected Journey",
            "Schindler's List",
            "Pulp Fiction",
            "The Lord of the Rings",
            "Parker"
        ], "❌ Ошибка: top movies не верен")
        print("✅ Проверка пройдена")
        
        // MARK: - 2️⃣: Последние 3 фильма
        print("\n2️⃣: Последние 3 фильма")
        
        func lastThree(_ movies: [String]) -> [String] {
            guard !movies.isEmpty else { return [] }
            return movies.count >= 3 ? Array(movies.suffix(3)) : movies
        }
        
        print(lastThree(movies))
        assert(lastThree(movies) == [
            "The Wizard of Oz",
            "12 Angry Men",
            "Shrek"
        ], "❌ Ошибка: last movies не верен")
        print("✅ Проверка пройдена")
        
        // MARK: - 3️⃣: Фильмы с 3-го по 7-й
        print("\n3️⃣: Фильмы с 3-го по 7-й")
        
        func middleMovies(_ movies: [String]) -> [String] {
            guard movies.count >= 7 else { return [] }
            return Array(movies[2...6])
        }
        
        print(middleMovies(movies))
        assert(middleMovies(movies) == [
            "Pulp Fiction",
            "The Lord of the Rings",
            "Parker",
            "The Shawshank Redemption",
            "The Treasure of the Sierra Madre"
        ], "❌ Ошибка: middle movies не верен")
        print("✅ Проверка пройдена")
        
        // MARK: - 4️⃣: Практическая задача — Playlist
        print("\n4️⃣: Практическая задача — Playlist")
        
        let playlist = [
            "ABBA: Dancing Queen",
            "Boney M: Rasputin",
            "Iggy Pop: Death Car",
            "The Beatles: Yesterday",
            "Iggy Pop: Death Car",
            "Boney M: Rasputin",
            "ABBA: Dancing Queen"
        ]
        
        // Палиндром
        let isPalindrom = playlist == Array(playlist.reversed())
        print("🔹 Палиндром: \(isPalindrom)")
        
        // Перемешивание (Fisher-Yates)
        func shuffleManual(_ array: [String]) -> [String] {
            var result = array
            for i in stride(from: result.count - 1, through: 1, by: -1) {
                let j = Int.random(in: 0...i)
                result.swapAt(i, j)
            }
            return result
        }
        
        let shuffled = shuffleManual(playlist)
        print("🔹 Перемешанный (Fisher-Yates):")
        print(shuffled)
        assert(shuffled != playlist, "❌ Массив не перемешался")
        
        // Сжатие
        func compress(_ array: [String]) -> [String] {
            guard !array.isEmpty else { return [] }
            var result: [String] = []
            var last: String? = nil
            
            for item in array {
                if item != last {
                    result.append(item)
                    last = item
                }
            }
            return result
        }
        
        let compressed = compress(playlist)
        print("🔹 Сжатый плейлист:")
        print(compressed)
        assert(compressed.count <= playlist.count, "❌ Массив не сжат")
        
        // MARK: - 5️⃣: Сжатие массива (compress)
        print("\n5️⃣: Сжатие массива (compress)")

        let array = ["a", "b", "c", "c", "c", "b", "a"]

        // var. 1
        func compress1(_ array: [String]) -> [String] {
            guard !array.isEmpty else { return [] }
            var result: [String] = []
            var lastAdded: String? = nil
            
            for item in array {
                if item != lastAdded {
                    result.append(item)
                    lastAdded = item
                }
            }
            return result
        }

        // var. 2
        func compress2(_ array: [String]) -> [String] {
            guard !array.isEmpty else { return [] }
            var result: [String] = []
            result.append(array[0])
            
            for index in 1..<array.count {
                if array[index] != array[index - 1] {
                    result.append(array[index])
                }
            }
            return result
        }

        // var. 3 (reduce(into:))
        func compress3(_ array: [String]) -> [String] {
            return array.reduce(into: []) { result, item in
                if result.last != item {
                    result.append(item)
                }
            }
        }

        print(compress1(array))
        print(compress2(array))
        print(compress3(array))

        assert(compress1(array) == ["a", "b", "c", "b", "a"], "❌ Ошибка: compress1")
        assert(compress2(array) == ["a", "b", "c", "b", "a"], "❌ Ошибка: compress2")
        assert(compress3(array) == ["a", "b", "c", "b", "a"], "❌ Ошибка: compress3")

        // MARK: - 6️⃣: Сумма чисел, которые встречаются frequency/n раз
                print("\n6️⃣: Сумма чисел, которые встречаются frequency/n раз")
                
                // 🧩 ЗАДАЧА 1️⃣: Сумма чисел, которые встречаются frequency/n раз
                
                func sumOfNumbers(withFrequency frequency: Int, in array: [Int]) -> Int {
                    var counts: [Int: Int] = [:]
                    
                    for num in array {
                        counts[num, default: 0] += 1
                    }
                    return counts
                        .filter { $0.value == frequency }
                        .map {$0.key }
                        .reduce(0, +)
                }
                
                print(sumOfNumbers(withFrequency: 2, in: [1, 2, 3, 1, 2, 3, 4, 4, 4, 5, 5, 5, 6, 7]))  // 6
                print(sumOfNumbers(withFrequency: 3, in: [1, 2, 3, 1, 2, 3, 4, 4, 4, 5, 5, 5, 6, 7])) // 9
                print(sumOfNumbers(withFrequency: 4, in: [1, 2, 3, 1, 2, 3, 4, 4, 4, 5, 5, 5, 6, 7])) // 0
                
                // MARK: - 7️⃣: Найти кол-во чисел, которые встречаются нечетное кол-во раз
                print("\n7️⃣: Найти кол-во чисел, которые встречаются нечетное кол-во раз")
                
                // 🧩 ЗАДАЧА 1️⃣: Найти кол-во чисел, которые встречаются нечетное кол-во раз
                
                func countOddFrequency(_ nums: [Int]) -> Int {
                    var counts: [Int: Int] = [:]
                    
                    for num in nums {
                        counts[num, default: 0] += 1
                    }
                    return counts
                        .filter { $0.value % 2 != 0 }
                        .count
                }
                
                print(countOddFrequency([1,1,1])) // 1
                print(countOddFrequency([1, 1, 1, 3, 3, 3])) // 2
                print(countOddFrequency([3, 3, 1, 1, 2, 2, 5, 5, 7, 7])) // 0
                print(countOddFrequency([])) // 0
                
                // MARK: - 8️⃣: Есть ли в массиве число, которое встречается ровно n раз
                print("\n8️⃣: Есть ли в массиве число, которое встречается ровно n раз")
                
                // 🧩 ЗАДАЧА 1️⃣: Есть ли в массиве число, которые встречается ровно n раз
                
                func hasNumber(withExactFrequency n: Int, in nums: [Int]) -> Bool {
                    var counts: [Int: Int] = [:]
                    
                    for num in nums {
                        counts[num, default: 0] += 1
                    }
                    
                    return counts.contains { $0.value == n }
                }
                
                print(hasNumber(withExactFrequency: 3, in: [1, 1, 1, 2, 2, 5])) // true
                print(hasNumber(withExactFrequency: 2, in: [1, 1, 1, 2, 2, 5])) // true
                print(hasNumber(withExactFrequency: 5, in: [1, 1, 1, 2, 2, 5])) // false
                print(hasNumber(withExactFrequency: 0, in: [])) // false
                
                // MARK: - 9️⃣: Найти все числа, которые встречаются = n раз, и верни их в виде массива.
                print("\n9️⃣: Найти все числа, которые встречаются = n раз, и верни их в виде массива.")
                
                // 🧩 ЗАДАЧА 6 Найти все числа, которые встречаются = n раз, и верни их в виде массива.
                // вар. 1 императивный стиль: «Я говорю программе, КАК делать шаг за шагом»
                
                func numbers(withExactFrequency n: Int, in nums: [Int]) -> [Int] {
                    var counts: [Int: Int] = [:]
                    
                    for num in nums {
                        counts[num, default: 0] += 1
                    }
                    
                    var newNums: [Int] = []
                    let number = counts
                        .filter { $0.value == n }
                        .map { $0.key}
                    
                    newNums += number
                    return newNums
                }
                
                print(numbers(withExactFrequency: 2, in: [7, 7, 7, 6, 6, 5, 5] )) // [6, 5]
                
                // вар. 2 функциональный стиль: «Я говорю программе, ЧТО я хочу получить»
                
                func nums(withExactFrequency n: Int, in nums: [Int]) -> [Int] {
                    Dictionary(grouping: nums, by: { $0 })
                        .filter { $0.value.count == n }
                        .map { $0.key }
                }
                
                print(nums(withExactFrequency: 2, in: [7, 7, 7, 6, 6, 5, 5] )) // [6, 5]
        
        print("\n✅ Все задачи по срезам и плейлисту пройдены!")
    }
}

