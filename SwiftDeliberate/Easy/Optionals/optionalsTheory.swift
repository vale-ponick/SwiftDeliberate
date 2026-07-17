//
//  optionalsTheory.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 14.07.2026.
//

import Foundation
/*
 📐🚕💨 ТЕОРИЯ: Опционалы (Easy)
 
 🎯 Главная задача:
 Опционал — это тип, который может содержать значение или его отсутствие (`nil`).
 Используется для типобезопасной работы с отсутствующими данными.
 
 📖 История:
 Появился в Swift 1.0 (2014). Разработан командой Apple под руководством Криса Латтнера.
 Идея: заменить `null` из других языков на типобезопасную модель.
 
 ⚙️ Как работает под капотом:
 Опционал — это перечисление (enum) с двумя кейсами:
 
 enum Optional<Wrapped> {
     case none          // nil
     case some(Wrapped) // значение
 }
 
 🔹 На пальцах (доступно):
 
 Представь, что у тебя есть коробка.
 - В ней может лежать вещь (значение).
 - Или она может быть пустой (nil).
 - Ты не можешь взять вещь, не проверив, есть ли она там.
 - Swift заставляет тебя проверить коробку, прежде чем достать содержимое.
 
 В Swift:
 var name: String? = "Vale"  // коробка с именем
 name = nil                  // коробка пуста
 
 🔹 Инженерно (точно):
 
 - Опционал — это enum `Optional<Wrapped>`.
 - `.none` — состояние `nil`.
 - `.some(Wrapped)` — состояние со значением.
 - Это value type, живёт в стеке, но может ссылаться на данные в куче.
 
 🔹 Инструменты разворачивания:
 */

// 🛡️ 1. guard let — ранний выход при nil
func exampleGuardLet(user: [String: String]) {
    guard let name = user["name"] else {
        return
    }
    print(name)  // name доступен дальше
}

// 🔍 2. if let — проверка внутри блока
func exampleIfLet(user: [String: String]) {
    if let age = user["age"] {
        print(age)  // age доступен только здесь
    }
}

// 🔄 3. ?? — значение по умолчанию
func exampleNilCoalescing(user: [String: String]) {
    let city = user["city"] ?? "Unknown"
    print(city)
}

// ⚠️ 4. ! — принудительное разворачивание (краш при nil)
func exampleForceUnwrap(user: [String: String]) {
    let name = user["name"]!  // ТОЛЬКО если уверена на 100%
    print(name)
}

/*
 🧠 GOLDEN RULE:
 - `guard let` — разворачивает и оставляет значение в текущей области (current scope).
 - `if let` — разворачивает и создаёт новую область (new scope).
 - `??` — не разворачивает, а подменяет `nil` на значение по умолчанию.
 - `!` — разворачивает насильно. Не используй, если не уверена на 100%.
 
 🔹 compactMap — частный случай работы с опционалами
 
 `compactMap` одновременно:
 - фильтрует `nil`
 - преобразует элементы
 - возвращает массив без опционалов
 
 📌 Когда использовать:
 - Вместо `filter { $0 != nil } + map { $0! }`
 - Для парсинга строк в числа
 - Для приведения типов в гетерогенных массивах
 */

// 💻 Примеры compactMap:

let mixed: [Any] = ["Swift", 42, "Practice"]
let strings = mixed.compactMap { $0 as? String }
// ["Swift", "Practice"]

let numbers = ["10", "abc", "30"]
let ints = numbers.compactMap { Int($0) }
// [10, 30]

let optionalArray: [Int?] = [1, nil, 3]
let clean = optionalArray.compactMap { $0 }
// [1, 3]

/*
 🧠 GOLDEN RULE для compactMap:
 Если внутри замыкания `map` получается опционал (`Type?`),
 а в финальном массиве ты не хочешь видеть `nil` — используй `.compactMap`.
 
 📌 Когда использовать compactMap:
 - Для фильтрации `nil` в массиве
 - Для одновременного преобразования и очистки
 - Вместо цепочки `filter + map`
 
 📌 Когда НЕ использовать:
 - Если `nil` нужен как часть данных
 - Если преобразование не может вернуть `nil`

 _____
 
  📚 ШПАРГАЛКА ПО ОПЦИОНАЛАМ
  
  1️⃣ Объявление:
     var name: String? = "Vale"
     var age: Int? = nil
  
  2️⃣ Разворачивание:
     guard let name = name else { return }  // ранний выход
     if let age = age { ... }               // внутри блока
     let city = city ?? "Unknown"           // значение по умолчанию
     let value = optional!                  // ТОЛЬКО если уверена!
  
  3️⃣ Работа с коллекциями:
     array.compactMap { $0 as? String }     // фильтр + приведение
     array.compactMap { $0 }                // убрать nil
     array?.reduce(0, +) ?? 0               // опциональная цепочка + nil‑coalescing
  
  4️⃣ Проверка на nil:
     if name != nil { ... }                 // редко, лучше использовать разворачивание
  
  5️⃣ Сложность:
     guard let — O(1)
     if let — O(1)
     ?? — O(1)
     compactMap — O(n)
 
 🏆 THE GOLDEN RULE (для опционалов)
 "Optionals are not scary — they are just containers. Choose the right tool:
 guard let for early exit,
 if let for branching,
 ?? for defaults,
 compactMap for collections."
 
 Опционалы не страшны — это просто контейнеры. Выбирай правильный инструмент:
 guard let для раннего выхода,
 if let для ветвления,
 ?? для значений по умолчанию,
 compactMap для коллекций.
  */
 
