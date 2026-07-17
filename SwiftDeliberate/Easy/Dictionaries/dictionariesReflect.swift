//
//  dictionariesReflect.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 13.07.2026.
//

import Foundation

/*
 📐🚕💨 РЕФЛЕКСИЯ: Словари (Dictionary)

 🧠 ГРАБЛИ (где ошибалась):

 1. Пыталась изменить словарь, объявленный как `let`
    → Ошибка компиляции: "Cannot assign to property: 'scores' is a let constant"
    ✅ Решение: использовать `var` или метод `merging()`, который создаёт новый словарь

 2. Забывала про `default:` при доступе к ключу
    → Получала `nil` и пыталась работать с опционалом
    ✅ Решение: `counts[$0, default: 0] += 1` — безопасно и компактно

 3. `Dictionary(uniqueKeysWithValues:)` падает на дублирующихся ключах
    → Крэш при дублировании ключей в массиве
    ✅ Решение: использовать `Dictionary(zip:uniquingKeysWith:)` с замыканием

 4. В `merging` перепутала `current` и `new`
    → Не понимала, какое значение останется при конфликте
    ✅ Решение: `{ current, new in new }` — оставляем новое, `{ $0 }` — оставляем старое

 5. Пыталась добавить массив вместо словаря в `merging`
    → `scores.merging([88], ...)` — ошибка типа
    ✅ Решение: передавать словарь `["Danny": 88]`

 6. В `grouping` забывала про `mapValues` после группировки
    → Получала `[String: [Int]]` вместо `[String: Int]`
    ✅ Решение: `.mapValues { $0.count }` или `.mapValues { $0.reduce(0, +) }`

 🔥 ИНСАЙТЫ:

 1. `merging` — не изменяет исходный словарь, а создаёт новый.
    Это безопасно для `let`-констант.

 2. `Dictionary(grouping:)` создаёт словарь с массивами.
    `mapValues` — превращает массивы в нужный тип (count, sum, max).

 3. `default:` в словаре — это безопасный доступ без принудительного разворачивания.
    Альтернатива: `counts[$0] = (counts[$0] ?? 0) + 1`

 4. Для дублирующихся ключей всегда используй `uniquingKeysWith:`.
    Иначе — крэш.

 5. `reduce(into:)` для словарей — эффективнее классического `reduce`.
    Не создаёт промежуточных копий.

 6. `Dictionary` — это `struct` (тип-значение).
    Поэтому `merging` и `grouping` не изменяют оригинал.

 📌 ⚜️ THE GOLDEN RULES (англ. формулировки):

 ⚜️ "Use merging to add elements to a let dictionary."
    → Для добавления элементов в let-словарь используй merging.

 ⚜️ "Use default: to safely access dictionary values."
    → Используй default: для безопасного доступа к значениям словаря.

 ⚜️ "Dictionary access returns an Optional, not a crash."
    → Доступ по ключу возвращает Optional, а не краш.

 ⚜️ "Always handle duplicate keys when creating a dictionary from arrays."
    → Всегда обрабатывай дублирующиеся ключи при создании словаря из массивов.

 ⚜️ "Group then transform: Dictionary(grouping:).mapValues { ... }"
    → Сначала группируй, потом преобразуй значения через mapValues.

 ⚜️ "Use reduce(into:) for efficient dictionary aggregation."
    → Используй reduce(into:) для эффективной агрегации словарей.

 ⚜️ Pattern: 'Single-Pass Aggregation'
 
 💬 "Instead of chaining `.filter { }.map { }.reduce(0, +)`, use `reduce(into:)` for a single pass."
 
 🧠 Why: Chaining three higher-order functions forces Swift to loop through the collection three times.
    Combining them via `reduce(into:)` cuts execution time by 3x (O(n) efficiency).

 🎯 ИТОГ ПО СЛОВАРЯМ:

 - Словарь — это тип-значение (struct), не изменяется в `let`.
 - `merging` — безопасный способ добавить элементы.
 - `grouping` + `mapValues` — мощный паттерн для анализа данных.
 - `default:` — лучший друг при работе с опциональными значениями.
 - `uniquingKeysWith:` — защита от крэшей при дубликатах.
 - `reduce(into:)` — оптимальный выбор для агрегации.

 📚 ПАТТЕРНЫ (шпаргалка):

 1. Подсчёт частоты:
    `items.forEach { counts[$0, default: 0] += 1 }`

 2. Группировка + агрегация:
    `Dictionary(grouping: items, by: \.self).mapValues { $0.count }`

 3. Слияние словарей:
    `dict.merging(["key": value], uniquingKeysWith: { $1 })`

 4. Создание из массивов (без дубликатов):
    `Dictionary(uniqueKeysWithValues: zip(keys, values))`

 5. Создание с дубликатами:
    `Dictionary(zip(keys, values), uniquingKeysWith: { $1 })`

 6. Агрегация через reduce(into:):
    `items.reduce(into: [:]) { $0[$1, default: 0] += 1 }`

 7. Преобразование значений:
    `dict.mapValues { $0 * 2 }`

 8. Фильтрация:
    `dict.filter { $0.value > 10 }`

 🚀 СЛЕДУЮЩИЙ ШАГ:
 Optionals — теория, код, рефлексия.
 Либо Enums, Protocols, Closures — на выбор.
 */
