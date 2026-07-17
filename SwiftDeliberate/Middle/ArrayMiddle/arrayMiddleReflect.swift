//
//  arrayMiddleReflect.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 07.07.2026.
//

import Foundation

/*
 📐🚕💨 РЕФЛЕКСИЯ: Массивы (Middle)
 
 🧠 ГРАБЛИ (где ошибалась):
 
 1. Думала, что `lazy` кэширует результат
 → При повторном обращении код выполняется заново
 ✅ Решение: использовать `lazy` только для однократных цепочек
 
 2. Не понимала, почему `ArraySlice` держит память
 → `ArraySlice` хранит ссылку на весь оригинальный массив
 ✅ Решение: использовать `Array(slice)` если нужен новый массив
 
 3. В `reduce(into:)` забывала про `&` перед `result`
 → Ошибка компиляции
 ✅ Решение: `reduce(into: [:]) { result, item in ... }` — `into` уже делает результат изменяемым
 
 4. Перепутала `removeFirst()` и `removeLast()`
 → `removeFirst()` — O(n), `removeLast()` — O(1)
 ✅ Решение: для частых удалений использовать `removeLast()` и реверс
 
 🔥 ИНСАЙТЫ:
 
 1. `lazy` откладывает выполнение до момента обращения.
 `lazy.map` + `first` обрабатывает только нужные элементы.
 Полезно, когда результат — не вся коллекция.
 
 2. `reduce(into:)` быстрее, чем обычный `reduce` на больших данных.
 Не создаёт промежуточных копий.
 
 3. `ArraySlice` держит ссылку на весь оригинальный массив.
 Возможна утечка памяти, если оригинал большой.
 
 4. `removeLast()` — O(1), `removeFirst()` — O(n).
 Для частых удалений с начала — используй реверс.
 
 5. `printf-отладка` (print) — метод отладки через вывод в консоль.
 Появился в 1960-х. Брайан Керниган (1979) писал, что лучший инструмент отладки —
 это вдумчивое обдумывание + искусно расставленные print.
 
 6. `reduce(into:)` — универсальный инструмент для работы с коллекциями.
 Позволяет конструировать любые трансформации данных за один проход O(n).
 
 📌 ⚜️ THE GOLDEN RULES:
 
 ⚜️ "Use lazy only for chains where you need first or prefix."
 → Используй lazy только для цепочек, где нужен first или prefix.
 
 ⚜️ "Do not use lazy for small arrays — overhead is higher than benefit."
 → Не используй lazy для маленьких массивов — накладные расходы выше пользы.
 
 ⚜️ "lazy is not thread-safe."
 → lazy не потокобезопасен.
 
 ⚜️ "Use removeLast() for O(1), removeFirst() for O(n)."
 → Используй removeLast() для O(1), removeFirst() для O(n).
 
 ⚜️ "ArraySlice holds a reference to the original array — beware of memory leaks."
 → ArraySlice держит ссылку на оригинальный массив — остерегайся утечек памяти.
 
 ⚜️ "reduce(into:) is faster than reduce for large data — use it for aggregation."
 → reduce(into:) быстрее обычного reduce на больших данных — используй для агрегации.
 
 ⚜️ "Printf-debugging: print is your friend for understanding code flow."
 → printf-отладка: print — твой друг для понимания потока кода.
 
 📚 ПАТТЕРНЫ:
 
 1. Lazy цепочка для экономии вычислений:
 `array.lazy.map { $0 * 2 }.first { $0 > 10 }`
 
 2. Агрегация через reduce(into:):
 `items.reduce(into: [:]) { $0[$1, default: 0] += 1 }`
 
 3. Безопасная работа со срезами:
 `let newArray = Array(arraySlice)`
 
 4. Реверс для частых удалений с начала:
 `array.reversed().removeLast()` вместо `removeFirst()`
 
 🎯 ИТОГ ПО ТЕМЕ «МАССИВЫ (MIDDLE)»:
 
 - Теория: lazy, reduce(into:), ArraySlice, сложность операций
 - Практика: примеры с assert-проверками
 - Понимание: O(n), O(1), память, оптимизация
 - Система: теория → код → рефлексия
 */
