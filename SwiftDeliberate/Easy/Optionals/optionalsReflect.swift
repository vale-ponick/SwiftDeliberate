//
//  optionalsReflect.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 14.07.2026.
//

import Foundation
/*
 Рефлексия: Исправление фильтрации массивов [Any] и открытие compactMap

 1. Какая была проблема:
 Пытался отфильтровать элементы [Any] по типу через array.filter(String($0)).
 Ошибка: filter ждет Bool (условие), а принудительное String($0) падает на несовместимых типах.
 Плюс guard let здесь создавал лишнюю вложенность.

 2. Какое решение найдено:
 Использовать метод высшего порядка .compactMap { $0 as? String }.

 3. Reflective Insights:
 • compactMap — это типа "отфильтруй nil и разверни опционалы".
 • Метод появился в Swift 4.1 (автор Макс Хауэлл, создатель Homebrew), чтобы разгрузить flatMap и вернуть коду математическую чистоту.
 • Под капотом у него линейный алгоритм O(n) с одним циклом for-in и проверкой if let.

 💡 Золотое правило разработчика:
 Если внутри замыкания map у вас получается опционал (Type?), но в финальном массиве вы НЕ хотите видеть nil и Optional(...) — ВСЕГДА заменяйте .map на .compactMap.
 */

// Reflection: Fixing [Any] array filtering & discovering compactMap

/*
 1. Problem:
 Tried to filter [Any] elements by type using `array.filter(String($0))`.
 Issue: `filter` expects a Bool condition, and forcing `String($0)` crashes on incompatible types.
 
 2. Solution:
 Use the higher-order method `.compactMap { $0 as? String }`.
 
 3. Key Insights:
 • `compactMap` is specifically designed to filter out `nil` and unwrap optionals simultaneously.
 • Introduced in Swift 4.1 (authored by Max Howell, creator of Homebrew) to unburden `flatMap`.
 • Runs on an O(n) linear algorithm with a single `for-in` loop and `if let` check under the hood.
 
 4. Takeaway Rule:
 Whenever a transform inside `.map` results in an optional (`Type?`), but the final array must be flat and `nil`-free, immediately choose `.compactMap`.
 */
