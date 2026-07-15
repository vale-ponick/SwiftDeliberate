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


 📌 ЗОЛОТЫЕ ПРАВИЛА (англ. формулировки):

 ⚜️ "If .map yields an optional, drop .map and go with .compactMap."
    → Если внутри `map` получается опционал, а `nil` не нужен — используй `.compactMap`.

 ⚜️ "Unwrap multiple optionals sequentially within a single guard let block."
    → Разворачивай несколько опционалов в одном `guard let`.

 ⚜️ "Use guard let to exit early. Use if let when you need both cases."
    → `guard let` — для раннего выхода, `if let` — когда нужны обе ветки.

 ⚜️ "Combine optional chaining with nil-coalescing to handle empty collections in one line."
    → `array?.reduce(0, +) ?? 0` — одна строка вместо цепочки проверок.


 🎯 ИТОГ ПО ОПЦИОНАЛАМ:

 - Это не страшно, это просто контейнер.
 - Главное — выбрать правильный инструмент.
 - `compactMap` — теперь мой друг.
 */
