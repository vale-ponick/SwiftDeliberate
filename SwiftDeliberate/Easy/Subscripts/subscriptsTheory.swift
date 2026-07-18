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
 ```
 */

// MARK: - 📚 ВСЕ ВАРИАНТЫ ПРИМЕРОВ

/**
 ### 1️⃣ Массив (встроенный сабскрипт)
 Если индекс вне диапазона -> КРАШ!
 */
// MARK: - 🏛️ ОБЪЯВЛЕНИЕ КАСТОМНЫХ ТИПОВ ДЛЯ ШПАРГАЛКИ

/// 4️⃣ Свой сабскрипт для класса/структуры
struct TimesTable {
    let multiplier: Int
    
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

/// 5️⃣ Сабскрипт с несколькими параметрами
struct Matrix {
    let rows: Int, cols: Int
    var grid: [Double]
    
    subscript(row: Int, col: Int) -> Double {
        get {
            return grid[row * cols + col]
        }
        set {
            grid[row * cols + col] = newValue
        }
    }
}

/// 6️⃣ Сабскрипт с разными типами параметров (Перегрузка)
struct Language {
    subscript(key: String) -> String {
        return "Translation for \(key)"
    }
    
    subscript(key: Int) -> String {
        return "Number \(key) in words"
    }
}

/// 7️⃣ Сабскрипт с опциональным возвратом
struct SafeArray {
    let array = [1, 2, 3, 4, 5]
    
    subscript(index: Int) -> Int? {
        guard index >= 0 && index < array.count else {
            return nil
        }
        return array[index]
    }
}

/// 8️⃣ Сабскрипт для словаря с значением по умолчанию
struct DefaultDict {
    var dict = ["a": 1, "b": 2]
    let defaultValue: Int = 0
    
    subscript(key: String) -> Int {
        return dict[key] ?? defaultValue
    }
}

/// 9️⃣ Сабскрипт, который только читает (get-only)
struct WeekDays {
    let days = ["Mon", "Tue", "Wed", "Thu", "Fri"]
    
    subscript(index: Int) -> String {
        return days[index]
    }
}

/// 🔟 Сабскрипт с динамическим ключом (тип String)
class Configuration {
    var settings = ["theme": "dark", "font": "Arial"]
    
    subscript(key: String) -> String? {
        get {
            return settings[key]
        }
        set {
            settings[key] = newValue
        }
    }
}

/// 1️⃣1️⃣ Статический сабскрипт (Продвинутый уровень)
enum GlobalConfig {
    static var values = ["API_URL": "https://api.com"]
    
    static subscript(key: String) -> String? {
        return values[key]
    }
}

/// 1️⃣2️⃣ Сабскрипт с параметрами по умолчанию (Продвинутый уровень)
struct Lookup {
    subscript(key: String, upperCased: Bool = false) -> String {
        return upperCased ? key.uppercased() : key
    }
}

/// 🏆 ТОП-СПОСОБ С СОБЕСЕДОВАНИЙ (Вариант через глобальное Расширение):
extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


// MARK: - ⚙️ ИСПОЛНЯЕМЫЙ КОД (ЗАПУСК ПРИМЕРОВ И ОШИБОК)

/// Главная функция, объединяющая все примеры.
/// Она спасает от ошибки "Statements are not allowed at the top level".
func runAllSubscriptExamples() {
    
    /**
     ### 1️⃣ Массив (встроенный сабскрипт)
     Если индекс вне диапазона -> КРАШ!
     */
    do {
        let fruits = ["apple", "banana", "cherry"]
        let second = fruits[1]  // "banana"
        print(second)
    }

    /**
     ### 2️⃣ Словарь (встроенный сабскрипт)
     Возвращает опционал. Если ключа нет -> nil (без краша!)
     */
    do {
        let capitals = ["France": "Paris", "Italy": "Rome"]
        let capital = capitals["France"]  // "Paris" (опционал)
        let missing = capitals["Spain"]   // nil (без краша!)
        print(String(describing: capital), String(describing: missing))
    }

    /**
     ### 3️⃣ Строка (встроенный сабскрипт)
     Строка в Swift НЕ поддерживает text[0] напрямую! Но можно через специальный Index.
     */
    do {
        let text = "Hello"
        let index = text.index(text.startIndex, offsetBy: 1)
        let char = text[index]  // "e"
        print(char)
    }

    /**
     ### 4️⃣ Свой сабскрипт для класса/структуры
     */
    do {
        let table = TimesTable(multiplier: 3)
        let result = table[5]  // 15
        print(result)
    }

    /**
     ### 5️⃣ Сабскрипт с несколькими параметрами
     */
    do {
        var matrix = Matrix(rows: 2, cols: 2, grid: [1.0, 2.0, 3.0, 4.0])
        let value = matrix[0, 1]  // 2.0
        matrix[1, 1] = 99.0       // изменяем
        print(value, matrix.grid)
    }

    /**
     ### 6️⃣ Сабскрипт с разными типами параметров (Перегрузка)
     */
    do {
        let lang = Language()
        print(lang["hello"])  // "Translation for hello"
        print(lang[42])       // "Number 42 in words"
    }

    /**
     ### 7️⃣ Сабскрипт с опциональным возвратом
     */
    do {
        let safe = SafeArray()
        print(String(describing: safe[10]))  // nil (без краша!)
    }

    /**
     ### 8️⃣ Сабскрипт для словаря с значением по умолчанию
     */
    do {
        let custom = DefaultDict()
        print(custom["a"])  // 1
        print(custom["z"])  // 0 (не nil!)
    }

    /**
     ### 9️⃣ Сабскрипт, который только читает (get-only)
     */
    do {
        let week = WeekDays()
        print(week[2])  // "Wed"
        // week[2] = "Sun" // ❌ Ошибка компиляции! Только get
    }

    /**
     ### 🔟 Сабскрипт с динамическим ключом (тип String)
     */
    do {
        let config = Configuration()
        print(String(describing: config["theme"]))   // "dark"
        config["theme"] = "light"
        print(String(describing: config["theme"]))   // "light"
    }

    /**
     ### 1️⃣1️⃣ Статический сабскрипт (Продвинутый уровень)
     */
    do {
        let url = GlobalConfig["API_URL"] // Вызов напрямую у Енума!
        print(String(describing: url))
    }

    /**
     ### 1️⃣2️⃣ Сабскрипт с параметрами по умолчанию (Продвинутый уровень)
     */
    do {
        let search = Lookup()
        print(search["apple"])       // "apple"
        print(search["apple", true]) // "APPLE"
    }


    /**
     ## ⚠️ ВАЖНЫЕ ПРАВИЛА
     * **Сабскрипт может иметь любое количество параметров:** Хоть 0, хоть 10.
     * **Параметры могут быть любых типов:** Int, String, Double, даже [String].
     * **Сабскрипт может быть перегружен:** Можно сделать несколько вариантов с разными типами.
     * **Сабскрипт может быть только get или get + set:** Если нет set — только чтение.
     * **Входные параметры внутри скобок `[...]` не могут использовать `inout`:** Они всегда только для чтения.
     */

    // MARK: - 🚨 ЧАСТЫЕ ОШИБКИ НОВИЧКОВ

    /**
     ### ❌ ОШИБКА 1: Применить сабскрипт к строке как к массиву
     `let char = str[0]` — НЕ РАБОТАЕТ!
     */
    do {
        let str = "Hello"
        let index = str.index(str.startIndex, offsetBy: 0)
        let char = str[index]  // "H"
        print(char)
    }

    /**
     ### ❌ ОШИБКА 2: Force unwrap сабскрипта словаря без проверки
     `let value = dict["b"]!` — КРАШ, если ключа нет!
     */
    do {
        let dict = ["a": 1]
        if let value = dict["b"] {
            print(value)
        } else {
            print("Not found")
        }
    }

    /**
     ### ❌ ОШИБКА 3: Выход за границы массива
     `let x = nums[5]` — КРАШ!
     
     **✅ ПРАВИЛЬНО (Вариант через проверку indices):**
     */
    do {
        let nums = [1, 2, 3]
        if nums.indices.contains(5) {
            let _ = nums[5]
        }
    }

    /**
     **🏆 ТОП-СПОСОБ С СОБЕСЕДОВАНИЙ (Проверка нашего расширения в деле):**
     */
    do {
        let nums = [1, 2, 3]
        let x = nums[safe: 5]  // Вернет nil, никакого краша!
        print(String(describing: x))
    }

    /**
     ## 🧠 ИТОГ: ПРОСТОЕ ОПРЕДЕЛЕНИЕ
     Сабскрипт — это способ получить доступ к элемент внутри коллекции (или своего типа) через квадратные скобки `[]`.
     * В словаре — безопасно (возвращает опционал).
     * В массиве — опасно (может упасть).
     * В своих типах — можно настроить как угодно.
     
     ## 🏆 THE GOLDEN RULE
     Сабскрипт `[]` — это инструмент доступа, но помни: словарь прощает отсутствие ключа (возвращает nil), а массив — нет (упадет). Проверяй границы и опционалы!
     */
}


