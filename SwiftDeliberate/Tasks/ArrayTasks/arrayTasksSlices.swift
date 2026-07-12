//
//  arrayTasksSlices.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 12.07.2026.
//

import Foundation

struct ArrayTasksSlices {
    static func run() {
        
        // MARK: - 1️⃣: Напиши функцию topFive(), которая принимает массив фильмов + возвращает первые 5 фильмов + если их < 5 - все фильмы + использует срез + возвращает массив, а не срез
        print("1️⃣: Напиши функцию topFive()")
        
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
            return  movies.count >= 5 ? Array(movies.prefix(5)) : movies
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
        
        // MARK: - 2️⃣. ПОСЛЕДНИЕ 3 ФИЛЬМА. Напиши функцию lastThree(_:), которая: принимает массив фильмов + возвращает последние 3 фильма + использует срез + возвращает Array
        
        func lastThree(_ movies: [String]) -> [String] {
            guard !movies.isEmpty else { return [] }
            return movies.count >= 3 ? movies.suffix(3) : movies
        }
        
        print(lastThree(movies))
        
        assert(lastThree(movies) == [
            "The Wizard of Oz",
            "12 Angry Men",
            "Shrek"
        ], "❌ Ошибка: last movies не верен")
        
        print("✅ Проверка пройдена")
        
        // MARK: - 3️⃣. Напиши функцию middleMovies(_:), которая: принимает массив фильмов + возвращает фильмы с индекса 2 по индекс 6 (включительно) + использует срез + возвращает Array
        
        func middleMovies(_ movies: [String]) -> [String] {
            guard !movies.isEmpty, movies.count >= 7 else { return [] }
            return Array(movies[2...6])
        }
        print(middleMovies(movies))
        
        // MARK: - 4️⃣. ДОП: БЕЗОПАСНОСТЬ. Если индексы выходят за пределы массива — верни пустой массив. Используй guard или проверку if
    }
}
