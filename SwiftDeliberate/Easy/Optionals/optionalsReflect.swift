//
//  optionalsReflect.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 14.07.2026.
//

import Foundation

/*
 📐🚕💨 РЕФЛЕКСИЯ: Опционалы

 🧠 ГРАБЛИ (где ошибалась):

 1. Пыталась фильтровать `[Any]` через `array.filter(String($0))`
    → Ошибка: `filter` требует Bool, а `String($0)` крашит на несовместимых типах.
    ✅ Решение: `.compactMap { $0 as? String }`

 2. Сравнивала `playlist == playlist.reversed()` без `Array()`
    → Ошибка: `reversed()` возвращает коллекцию, а не массив.
    ✅ Решение: `Array(playlist.reversed())`

 3. В `assert` для `compress` проверяла `!=`, хотя массив мог не измениться
    → Ошибка: если дубликаты не подряд — массив не сжимается.
    ✅ Решение: проверять `.count <=`


 🔥 ИНСАЙТЫ:

 1. `compactMap` — это не магия, а замена цепочке `filter + map`.
    Появился в Swift 4.1 (Max Howell).

 2. `guard let` — разворачивает и оставляет в текущей области.
    `if let` — разворачивает и прячет в новую область.
    `??` — не разворачивает, а подменяет значение.

 3. Опционалы — это enum с двумя состояниями: `.some` и `.none`.
    Это не магия, а типобезопасный контейнер.


 📌 ⚜️ THE GOLDEN RULES (англ. формулировки):

 ⚜️ "If .map yields an optional, drop .map and go with .compactMap."
    → Если внутри `map` получается опционал, а `nil` не нужен — используй `.compactMap`.

 ⚜️ "Unwrap multiple optionals sequentially within a single guard let block."
    → Разворачивай несколько опционалов в одном `guard let`.

 ⚜️ "Use guard let to exit early. Use if let when you need both cases."
    → `guard let` — для раннего выхода, `if let` — когда нужны обе ветки.

 ⚜️ "Combine optional chaining with nil-coalescing to handle empty collections in one line."
    → `array?.reduce(0, +) ?? 0` — одна строка вместо цепочки проверок.

 ⚜️ "Instead of chaining `.compactMap { $0 }.map { ... }`, combine them into a single `.compactMap` call."
    → Объединяй операции в один проход, чтобы не гонять массив дважды.


 💡 Озарение по reduce (Aha! moment):
 
 Вопрос: почему в `reduce(0) { $0 + (Int($1) ?? 0) }` мы оборачиваем только `$1`?
 
 Ответ:
 - `$0` — это аккумулятор, он AUTO `Int` (накопленная сумма)
 - `$1` — текущий элемент, он `String`, => его нужно преобразовать в `Int`
 
 Итог:
 $0 — всегда готовый результат,
 $1 — требует обработки.
 Это правило работает во всех замыканиях с двумя параметрами (map, filter, reduce).


 🛠 Что далось легко:
 - Понимание оператора `??`
 - Базовый синтаксис `if let`

 🌀 С чем была путаница:
 - `guard let` и область видимости
 - `compactMap` vs `flatMap` (исторически)
 - `reduce` и `$0` vs `$1`

 🎯 ИТОГ ПО ОПЦИОНАЛАМ:
 - Это не страшно, это просто контейнер.
 - Главное — выбрать правильный инструмент.
 - `compactMap` — теперь мой друг.

 🛡️🔥 CODE PRO
 📈 STATUS: v1.0 | Middle | Swift 5.9+
 */
