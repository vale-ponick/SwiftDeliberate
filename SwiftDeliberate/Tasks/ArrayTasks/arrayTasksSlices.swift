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

        print("✅ compress — все проверки пройдены")
        print("\n✅ Все задачи по срезам и плейлисту пройдены!")
    }    
}

