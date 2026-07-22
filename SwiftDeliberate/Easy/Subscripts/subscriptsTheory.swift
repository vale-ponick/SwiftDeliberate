//
//  subscriptsTheory.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 18.07.2026.
//

import Foundation

/**
 # 📖 ШПАРГАЛКА ПО САБСКРИПТАМ (SUBSCRIPT)
 
 ## 🔤 ПЕРЕВОД И ПРОИСХОЖДЕНИЕ
 * **Subscript** — Нижний индекс, подстрочный знак (От лат. *subscriptus* — "подписанный внизу")
 * **Index** — Индекс, указатель (От лат. *index* — "указатель")
 
 *В математике:* x₁ (читается "икс первое") — здесь цифра 1 — это subscript.
 *В программировании:* `array[0]` — здесь 0 — это subscript.
 
 ## 👨‍💻 КОГДА ПОЯВИЛСЯ? КТО АВТОР?
 * **Язык:** Swift
 * **Автор:** Chris Lattner (главный архитектор Swift, Apple)
 * **Год появления:** 2014 (вместе с первым релизом Swift)
 * **Идея:** Вдохновлён языками C++, Python, Ruby, где уже были операторы [], но в Swift сделали более мощную и гибкую систему.
 
 ## 🧠 СУТЬ САБСКРИПТА
 Сабскрипт — это специальный синтаксис для доступа к элементам коллекций, структур, классов и перечислений через квадратные скобки `[]`.
 
 ### Базовый синтаксис:
 ```swift
 subscript(параметры) -> ВозвращаемыйТип {
     get {
         // вернуть значение
     }
     set(новоеЗначение) {
         // установить значение (опционально)
     }
 }
📚 ВСЕ ВАРИАНТЫ ПРИМЕРОВ
*/

// MARK: - 🏛️ ОБЪЯВЛЕНИЕ КАСТОМНЫХ ТИПОВ ДЛЯ ШПАРГАЛКИ

/// 4️⃣ Свой сабскрипт для класса/структуры
struct TimesTable {
let multiplier: Int
subscript(index: Int) -> Int { multiplier * index }
}

/// 5️⃣ Сабскрипт с несколькими параметрами
struct Matrix {
let rows: Int, cols: Int
var grid: [Double]
subscript(row: Int, col: Int) -> Double {
get { grid[(row * cols) + col] }
set { grid[(row * cols) + col] = newValue }
}
}

/// 6️⃣ Сабскрипт с разными типами параметров (Перегрузка)
struct Language {
subscript(key: String) -> String { "Translation for (key)" }
subscript(code: Int) -> String { "Number (code) in words" }
}

/// 7️⃣ Сабскрипт с опциональным возвратом
struct SafeArray {
let items = [1, 2, 3, 4, 5]
subscript(index: Int) -> Int? { items.indices.contains(index) ? items[index] : nil }
}

/// 8️⃣ Сабскрипт для словаря с значением по умолчанию
struct DefaultDict {
private var storage = ["a": 1, "b": 2]
subscript(key: String) -> Int { storage[key] ?? 0 }
}

/// 9️⃣ Сабскрипт, который только читает (get-only)
struct WeekDays {
private let days = ["Mon", "Tue", "Wed", "Thu", "Fri"]
subscript(index: Int) -> String { days[index] }
}

/// 🔟 Сабскрипт с динамическим ключом (тип String)
class Configuration {
private var settings = ["theme": "dark"]
subscript(key: String) -> String? {
get { settings[key] }
set { settings[key] = newValue }
}
}

/// 1️⃣1️⃣ Статический сабскрипт (Продвинутый уровень)
enum GlobalConfig {
private static let data = ["API_URL": "https://swift.com"]
static subscript(key: String) -> String? { data[key] }
}

/// 1️⃣2️⃣ Сабскрипт с параметрами по умолчанию (Продвинутый уровень)
struct Lookup {
subscript(query: String, uppercase: Bool = false) -> String {
uppercase ? query.uppercased() : query
}
}

/// 🔲 Многомерный сабскрипт с обязательными внешними именами аргументов
struct Table {
subscript(row row: Int, col col: Int) -> String {
"Item at (row)x(col)"
}
}

// 🏆 Безопасное расширение для Топ-Способа с собеседований
extension Array {
subscript(safe index: Int) -> Element? {
return indices.contains(index) ? self[index] : nil
}
}

// MARK: - ⚙️ ИСПОЛНЯЕМЫЙ КОД (ЗАПУСК ПРИМЕРОВ)

/// Главная функция, объединяющая все примеры.
func runAllSubscriptExamples() {

// 1️⃣ Массив
do {
let fruits = ["apple", "banana", "cherry"]
print(fruits[1]) // "banana"
}

// 2️⃣ Словарь
do {
let capitals = ["France": "Paris", "Italy": "Rome"]
print(String(describing: capitals["France"])) // Optional("Paris")
print(String(describing: capitals["Spain"])) // nil
}

// 3️⃣ Строка
do {
let text = "Hello"
let index = text.index(text.startIndex, offsetBy: 1)
print(text[index]) // "e"
}

// 4️⃣ Свой сабскрипт
do {
let table = TimesTable(multiplier: 3)
print(table[5]) // 15
}

// 5️⃣ Сабскрипт с несколькими параметрами
do {
var matrix = Matrix(rows: 2, cols: 2, grid: [1.0, 2.0, 3.0, 4.0])
print(matrix[0, 1]) // 2.0
matrix[1, 1] = 99.0
print(matrix.grid) // [1.0, 2.0, 3.0, 99.0]
}

// 6️⃣ Перегрузка сабскрипта
do {
let lang = Language()
print(lang["hello"]) // "Translation for hello"
print(lang[42]) // "Number 42 in words"
}

// 7️⃣ Опциональный возврат
do {
let safe = SafeArray()
print(String(describing: safe[10])) // nil
}

// 8️⃣ Дефолтное значение
do {
let custom = DefaultDict()
print(custom["a"]) // 1
print(custom["z"]) // 0
}

// 9️⃣ Get-only
do {
let week = WeekDays()
print(week[2]) // "Wed"
}

// 🔟 Динамический ключ
do {
let config = Configuration()
print(String(describing: config["theme"])) // "dark"
config["theme"] = "light"
print(String(describing: config["theme"])) // "light"
}

// 1️⃣1️⃣ Статический сабскрипт
do {
print(String(describing: GlobalConfig["API_URL"])) // "https://swift.com"
}

// 1️⃣2️⃣ Параметры по умолчанию
do {
let search = Lookup()
print(search["apple"]) // "apple"
print(search["apple", true]) // "APPLE"
}

// 1️⃣3️⃣ Внешние имена (Table)
do {
let table = Table()
print(table[row: 1, col: 2]) // "Item at 1x2"
}

// 🏆 Безопасный сабскрипт
do {
let nums = [1, 2, 3]
print(String(describing: nums[safe: 5])) // nil
}
}

// MARK: - 🚨 ЧАСТЫЕ ОШИБКИ

/*

❌ ОШИБКА 1: Строка как массив
let char = str[0] — НЕ РАБОТАЕТ!

❌ ОШИБКА 2: Force unwrap словаря
let value = dict["b"]! — КРАШ!

❌ ОШИБКА 3: Выход за границы массива
let x = nums[5] — КРАШ!
*/

// MARK: - ⚠️ ВАЖНЫЕ ПРАВИЛА

/*

Сабскрипт может иметь любое количество параметров

Параметры могут быть любых типов

Сабскрипт можно перегружать

Может быть только get или get + set

Входные параметры не могут использовать inout
*/

// MARK: - 🧠 ИТОГ

/*
Сабскрипт — это доступ к элементам через квадратные скобки [].

📊 Сравнение:

Массив: array[0] → значение (краш при ошибке)

Словарь: dict["key"] → опционал (nil при ошибке)

Свои типы: настраивается как угодно

🏆 GOLDEN RULE:
Словарь прощает отсутствие ключа (nil), массив — нет (краш).
Всегда проверяй границы!
*/

// MARK: - 📊 ШПАРГАЛКА ПО СЛОЖНОСТИ

/*
Доступ по сабскрипту: O(1)
Кастомный сабскрипт с contains: O(1)
*/

// MARK: - 📈 РЕФЛЕКСИЯ

/*
🛠 Что далось легко:
Синтаксис сокращенного чтения без блоков get/set.

🌀 С чем была путаница:
Откуда берется newValue и как сделать внешние метки обязательными.

💡 Озарение:
Квадратные скобки у массивов — это не магия Xcode,
а такой же сабскрипт, написанный инженерами Apple!
*/

// MARK: - 🛡️🔥 ДЕВИЗ САБСКРИПТОВ

/*
"Fast access. Safe index.
Clean brackets.
Middle."

🚕💨 CODE PRO

🏔️🔥 PRINCIPLES:

 1. Use safe subscript (guard + contains)
 2. Remember: dictionary returns optional
 3. Check array bounds
 4. Use external labels for clarity
 5. Strive to be Middle

📈 STATUS: v1.0 | Junior+ | Swift 5.9+
*/


