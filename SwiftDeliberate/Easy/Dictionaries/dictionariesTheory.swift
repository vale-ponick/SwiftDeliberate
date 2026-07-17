//
//  dictionaryTheory.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 13.07.2026.
//

import Foundation
/*
 📚 ШПАРГАЛКА ПО СЛОВАРЯМ (Dictionary)
 
 1️⃣ СОЗДАНИЕ:
    let dict: [String: Int] = ["a": 1, "b": 2]
    var empty: [String: Int] = [:]
 
 2️⃣ ДОСТУП:
    dict["a"]              // Optional(1) — безопасно
    dict["c"]              // nil — нет краша!
    dict["a", default: 0]  // 1 — безопасно с default
 
 3️⃣ ДОБАВЛЕНИЕ/ИЗМЕНЕНИЕ:
    dict["c"] = 3          // только если var
    dict.merge(["d": 4]) { $1 }  // создаёт новый словарь
 
 4️⃣ УДАЛЕНИЕ:
    dict.removeValue(forKey: "a")  // возвращает Optional
    dict["a"] = nil                // удаляет ключ
 
 5️⃣ ОБХОД:
    for (key, value) in dict { ... }
    for key in dict.keys { ... }
    for value in dict.values { ... }
 
 6️⃣ ГРУППИРОВКА:
    Dictionary(grouping: items, by: \.self)
    Dictionary(grouping: items, by: { $0.category })
 
 7️⃣ ПРЕОБРАЗОВАНИЕ:
    dict.mapValues { $0 * 2 }
    dict.filter { $0.value > 10 }
    dict.keys.contains("a")
 
 8️⃣ ИНИЦИАЛИЗАТОРЫ:
    Dictionary(uniqueKeysWithValues: zip(keys, values))
    Dictionary(zip(keys, values), uniquingKeysWith: { $1 })
 
 9️⃣ АГРЕГАЦИЯ:
    dict.values.reduce(0, +)  // сумма всех значений
    dict.reduce(into: [:]) { ... }
 
 🔟 ПАМЯТЬ И СЛОЖНОСТЬ:
    Поиск по ключу: O(1)
    Вставка/удаление: O(1)
    Обход всех элементов: O(n)

 🏆 THE GOLDEN RULES
 
 Задача 2: Словарь, объявленный как let, нельзя изменить.
          Для добавления элементов используй merging — он создаёт новый словарь.
 
 Задача 5: Для подсчёта частоты элементов в больших массивах используй forEach с default:,
          для маленьких — элегантный Dictionary(grouping:).
 
 Задача 6: sorted(by:) не изменяет исходный массив, а возвращает новый.
          Используй trailing closure для читаемого кода.
 
 Задача 7: При создании словаря из двух массивов всегда проверяй, не дублируются ли ключи.
          Если да — используй uniquingKeysWith: для разрешения конфликтов.
 */

// MARK: - Пример использования merging
let scores = ["Ann": 85, "Joe": 92, "Jane": 78]
let danny = ["Danny": 88]

func getAverage(in scores: [String: Int], adding newEntry: [String: Int]) -> Double {
    let updated = scores.merging(newEntry, uniquingKeysWith: { $1 })
    return Double(updated.values.reduce(0, +)) / Double(updated.values.count)
}
// print(getAverage(in: scores, adding: danny)) // 85.75
