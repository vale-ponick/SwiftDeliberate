//
//  dictionaryGrouping.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 17.07.2026.
//

import Foundation

// MARK: - Структуры для примеров

struct Transaction {
    let category: String
    let amount: Double
    let isActive: Bool
    let id: Int
}

struct Person {
    let name: String
    let city: String
}

// MARK: - Основная функция с примерами

func demonstrateGrouping() {
    print(" 🧠 ШПАРГАЛКА ПО ГРУППИРОВКЕ \n")
    
    // MARK: - ❓ Вопрос 1: Группировка + подсчёт одной строкой
    
    let items = ["🍎", "🍌", "🍎", "🍊", "🍌", "🍎"]
    let countResult = Dictionary(grouping: items, by: \.self).mapValues(\.count)
    print("✅ Вопрос 1: \(countResult)")
    print("📋 Шаг 1: группировка → [\"🍎\": [\"🍎\", \"🍎\", \"🍎\"], ...]")
    print("📋 Шаг 2: mapValues → считаем количество\n")
    
    // MARK: - ❓ Вопрос 3: Сравнение forEach vs grouping
    
    // Вариант А (forEach) — эффективнее по памяти
    var countsForEach: [String: Int] = [:]
    items.forEach { countsForEach[$0, default: 0] += 1 }
    print("✅ Вариант forEach: \(countsForEach)")
    
    // Вариант Б (grouping) — элегантнее
    let resultGrouping = Dictionary(grouping: items, by: \.self).mapValues(\.count)
    print("✅ Вариант grouping: \(resultGrouping)")
    print("🏆 Вердикт: forEach эффективнее по памяти (не создаёт промежуточные массивы)\n")
    
    // MARK: - ❓ Вопрос 4: mapValues для агрегации
    
    let transactions = [
        Transaction(category: "Food", amount: 15.5, isActive: true, id: 1),
        Transaction(category: "Food", amount: 8.0, isActive: false, id: 2),
        Transaction(category: "Transport", amount: 25.0, isActive: true, id: 3),
        Transaction(category: "Transport", amount: 12.0, isActive: true, id: 4)
    ]
    
    let groupedByCategory = Dictionary(grouping: transactions, by: \.category)
    
    // 1️⃣ Агрегация (Сумма)
    let sumsByCategory = groupedByCategory.mapValues { $0.reduce(0) { $0 + $1.amount } }
    print("✅ Сумма по категориям: \(sumsByCategory)")
    
    // 2️⃣ Экстремумы (max)
    let maxByCategory = groupedByCategory.mapValues { $0.max(by: { $0.amount < $1.amount }) }
    print("✅ Максимум по категориям: \(maxByCategory.compactMapValues { $0 })")
    
    // 3️⃣ Фильтрация (Только активные)
    let activeByCategory = groupedByCategory.mapValues { $0.filter { $0.isActive } }
    print("✅ Активные по категориям: \(activeByCategory.mapValues { $0.count }) элементов\n")
    
    // MARK: - ❓ Вопрос 5: Группировка по свойству (KeyPath)
    
    let people = [
        Person(name: "Anna", city: "Moscow"),
        Person(name: "Bob", city: "SPb"),
        Person(name: "Cara", city: "Moscow")
    ]
    
    let byCity = Dictionary(grouping: people, by: \.city)
    print("✅ Группировка по городу: \(byCity.keys)")
    for (city, persons) in byCity {
        print("   \(city): \(persons.map { $0.name })")
    }
    print()
    
    // MARK: - ❓ Вопрос 6: reduce(into:) — профи подход
    
    let sumsReduce = transactions.reduce(into: [:]) { result, tx in
        result[tx.category, default: 0] += tx.amount
    }
    print("✅ reduce(into:) суммы: \(sumsReduce)")
    print("🏆 Преимущество: O(N) времени, O(K) памяти, без промежуточных массивов\n")
    
    // MARK: - ❓ Вопрос 7: default: в словаре
    
    var countsVerbose: [String: Int] = [:]
    items.forEach { countsVerbose[$0] = (countsVerbose[$0] ?? 0) + 1 }
    
    var countsConcise: [String: Int] = [:]
    items.forEach { countsConcise[$0, default: 0] += 1 }
    
    print("✅ Безопасный доступ с default:")
    print("   Многословный вариант: \(countsVerbose)")
    print("   Краткий вариант: \(countsConcise)")
    print("🏆 default: безопасная альтернатива принудительному разворачиванию\n")
    
    // MARK: - ❓ Вопрос 8: Сортировка результата
    
    let sortedSums = sumsByCategory.sorted { $0.value > $1.value }
    print("✅ Сортировка по убыванию:")
    for (category, total) in sortedSums {
        print("   \(category): \(total)")
    }
    print("⚠️ sorted() возвращает массив кортежей, а не словарь\n")
    
    // MARK: - ❓ Вопрос 9: Кастомный ключ
    
    let words = ["apple", "apricot", "banana", "blueberry", "cherry"]
    let byFirstLetter = Dictionary(grouping: words, by: { String($0.first ?? " ") })
    print("✅ Группировка по первой букве:")
    for (letter, words) in byFirstLetter.sorted(by: { $0.key < $1.key }) {
        print("   \(letter): \(words)")
    }
    print()
    
    // MARK: - 📝 Задача 5: Подсчёт вхождений
    
    let itemsForTask = ["apple", "banana", "apple", "orange", "banana", "grape"]
    
    var wordCounts: [String: Int] = [:]
    itemsForTask.forEach { wordCounts[$0, default: 0] += 1 }
    print("✅ Задача 5 (forEach): \(wordCounts)")
    
    let wordCountsReduce = itemsForTask.reduce(into: [:]) { counts, word in
        counts[word, default: 0] += 1
    }
    print("✅ Задача 5 (reduce): \(wordCountsReduce)\n")
    
    // MARK: - 🔥 Финальная таблица
    
    print("========== 🏆 ФИНАЛЬНАЯ ТАБЛИЦА ==========")
    print("""
    | Сценарий                          | Инструмент              | Память | Скорость |
    |-----------------------------------|-------------------------|--------|----------|
    | Группировка + подсчёт (мало)      | Dictionary(grouping:)   | O(N)   | O(N)     |
    | Группировка + подсчёт (много)     | reduce(into:)           | O(K)   | O(N)     |
    | Группировка + агрегация           | reduce(into:)           | O(K)   | O(N)     |
    | Просто группировка                | Dictionary(grouping:)   | O(N)   | O(N)     |
    | Только подсчёт частоты            | forEach + default:      | O(K)   | O(N)     |
    """)
    
    print("\n🔥 Совет:")
    print("""
    Если вы напишете элегантный однострочник, а затем добавите:
    «Но на миллионных массивах я бы использовал forEach с default: 0,
    чтобы не забивать память промежуточными массивами»
    """)
    
    print("\n🏆 THE GOLDEN RULE:")
    print("Всегда знай, сколько данных ты обрабатываешь. Выбирай между элегантностью и эффективностью осознанно.")
    
    
    // Задача 5.
    print("Дан массив. Напиши код, который считает количество вхождений каждого элемента и сохраняет результат в словарь [String: Int]. (Подсказка: используй цикл или forEach).")
    
    // var. 1 forEach + default:
    func checkElements(in items: [String]) -> [String: Int] {
        var counts: [String: Int] = [:]
        
        items.forEach({ counts[$0, default: 0] += 1 })
        return counts
    }
    
    print(checkElements(in: items)) // ["grape": 1, "orange": 1, "apple": 3, "banana": 2]
    
    // var.2 Dictionary(grouping:by:) + mapValues
    
    func getCountElements(in items: [String]) -> [String: Int] {
        Dictionary(grouping: items, by: { $0 }).mapValues { $0.count }
    }
    
    print(getCountElements(in: items)) // ["grape": 1, "orange": 1, "apple": 3, "banana": 2]
}
