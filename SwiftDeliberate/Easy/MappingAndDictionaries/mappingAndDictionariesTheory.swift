//
//  mappingAndDictionariesTheory.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 19.07.2026.
//

import Foundation

/**
 # 📖 ШПАРГАЛКА ПО МАППИНГУ (MAPPING / СЛОВАРЬ-ПЕРЕВОДЧИК)
 
 ## 🔤 ПЕРЕВОД И ПРОИСХОЖДЕНИЕ
 * **Mapping** — Отображение, преобразование, соответствие (От англ. *map* — "карта", лат. *mappa* — "платок, ткань, чертёж земли"). Буквально: "прокладывание маршрута" или "нанесение связей на карту".
 * **Dictionary** — Словарь (От лат. *dictionarium* — "собрание слов").
 
 *В математике:* Функция f(x) = y — это mapping, где каждому элементу x ставится в соответствие элемент y.
 *В программировании:* `dict["Shrek"] = 0` — здесь имя человека отображается (маппится) в понятный компьютеру индекс.
 
 ## 👨‍💻 КОГДА ПОЯВИЛСЯ? КТО АВТОР?
 * **Концепция:** Идея ассоциативных массивов (словарей/маппинга) зародилась ещё в 1960-х годах в языке LISP (автор Джон Маккарти).
 * **В Swift:** Стал доступен с первого релиза в 2014 году (архитектор Крис Латтнер). Хэш-таблицы (основа `Dictionary`) в Swift были оптимизированы для максимальной скорости доступа за константное время $O(1)$.
 * **Идея:** Предоставить разработчику понятный человеческий интерфейс для работы со сложными машинными структурами данных.
 
 ## 🧠 СУТЬ МАППИНГА
 Маппинг — это архитектурный паттерн преобразования данных из одного формата в другой. Чаще всего реализуется через словари `[Ключ: Значение]`, где уникальный "человеческий" ключ жестко связывается с "машинным" значением (например, индексом массива).
 
 ### Базовая формула:
 ```swift
 let словарь: [ТипКлюча: ТипЗначения] = [
     "ПонятныйКлюч1": МашинноеЗначение1,
     "ПонятныйКлюч2": МашинноеЗначение2
 ]
 ```
 
 ### 💳 Практический кейс: Двумерный массив банка (bankDB)
 Без маппинга разработчику приходится писать `bankDB[0][1]`, что является "магическими числами" и ведёт к ошибкам. С маппингом мы обучаем код понимать имена.
 
 ```swift
 // 1️⃣ Создаем маппинг пользователей в индексы массива
 let userIndexes: [String: Int] = [
     "Shrek": 0,
     "Fiona": 1,
     "Donkey": 2,
     "Puss": 3
 ]
 ```
 
 ## ⚙️ АЛГОРИТМ БЕЗОПАСНОГО ИСПОЛЬЗОВАНИЯ (В САБСКРИПТЕ)
 Главное правило маппинга: **Никаких крашей при отсутствии ключа!** Всегда используем безопасное извлечение (`guard let`).
 
 ```swift
 subscript(name: String, cardIndex: Int) -> String {
     // 1. Переводим человеческое имя в индекс через guard let
     guard let mappedIndex = userIndexes[name] else {
         return "❌ Ошибка: Пользователь не найден"
     }
     
     // 2. Проверяем границы двумерного массива, защищаясь от Out of Bounds
     guard mappedIndex < bankDB.count, cardIndex < bankDB[mappedIndex].count else {
         return "❌ Ошибка: Неверный индекс карты"
     }
     
     // 3. Возвращаем безопасный результат
     return bankDB[mappedIndex][cardIndex]
 }
 ```
 
 ## 🧩 ЧАСТЫЕ ПРИМЕРЫ В РЕАЛЬНЫХ ПРОЕКТАХ
 * **Пользователи:** `"userID_9482"` (Ключ) → `User` (Объект в памяти)
 * **Локализация:** `"welcome_title"` (Ключ) → `"Добро пожаловать!"` (Строка на экране)
 * **Статусы заказа:** `"paid"` (Ответ сервера) → `.success` (Enum в Swift)
 * **Навигация:** `"profile_screen"` (ID) → `ProfileViewController` (Экран)
 
 ## 🏆 ЗОЛОТОЕ ПРАВИЛО
 В промышленной разработке никогда не заставляйте код полагаться на ручные индексы `0, 1, 2`. Всегда создавайте слой-переводчик (маппинг). Это делает код гибким: если завтра "Shrek" переместится с нулевого индекса на десятый, вам придется изменить всего одну цифру в словаре, а не переписывать всю логику программы.
 */

// MARK: - 📚 ВСЕ ВАРИАНТЫ ПРИМЕРОВ МАППИНГА

/**
 ### 1️⃣ Словарь [Key: Value] (встроенный маппинг в Swift)
 Если ключа нет в словаре -> возвращает nil (безопасно, без краша).
 */
// MARK: - 🏛️ ОБЪЯВЛЕНИЕ КАСТОМНЫХ ТИПОВ ДЛЯ ШПАРГАЛКИ

/// 4️⃣ Базовый маппинг "Один к Одному" (Преобразование типов)
struct StatusMapper {
    /// Маппим строковый статус от сервера во внутренний системный код
    let serverStatuses: [String: Int] = [
        "active": 200,
        "pending": 102,
        "blocked": 403
    ]
    
    subscript(status: String) -> Int {
        // Если статус неизвестен, возвращаем дефолтный код ошибки 400
        return serverStatuses[status] ?? 400
    }
}

/// 5️⃣ Двумерный маппинг банковской базы данных (Многопараметрический)
struct BankDatabaseMapper {
    /// Маппинг пользователей в индекс строки двумерного массива
    private let userIndexes: [String: Int] = [
        "Shrek": 0, "Fiona": 1, "Donkey": 2
    ]
    
    /// Сама база данных (двумерный массив: строки — пользователи, столбцы — балансы их карт)
    var bankDB: [[String]] = [
        ["100$", "250$", "50$"],  // Карты Шрека
        ["5000$", "1200$"],       // Карты Фионы
        ["0$", "3$"]              // Карты Осла
    ]
    
    subscript(name: String, cardIndex: Int) -> String {
        get {
            // 1. Маппим имя пользователя в индекс строки
            guard let mappedIndex = userIndexes[name] else {
                return "❌ Клиент не найден"
            }
            // 2. Безопасно проверяем границы массивов (Out of Bounds)
            guard mappedIndex < bankDB.count, cardIndex < bankDB[mappedIndex].count else {
                return "❌ Карта не существует"
            }
            // 3. Возвращаем данные
            return bankDB[mappedIndex][cardIndex]
        }
        set {
            // Сеттер позволяет обновлять баланс: bankMapper["Shrek", 0] = "150$"
            guard let mappedIndex = userIndexes[name],
                  mappedIndex < bankDB.count,
                  cardIndex < bankDB[mappedIndex].count else { return }
            bankDB[mappedIndex][cardIndex] = newValue
        }
    }
}

/// 6️⃣ Перегрузка маппинга (Разные типы ключей)
struct CityFinder {
    private let nameToCode = ["Moscow": 7, "London": 44, "New York": 1]
    private let codeToName = [7: "Moscow", 44: "London", 1: "New York"]
    
    /// Маппинг по имени города (String -> Int)
    subscript(name: String) -> Int? {
        return nameToCode[name]
    }
    
    /// Маппинг по телефонному коду (Int -> String)
    subscript(code: Int) -> String? {
        return codeToName[code]
    }
}

/// 7️⃣ Полностью безопасный маппинг с опциональным возвратом (Safe Mapping)
struct SafeUserMapper {
    private let users = ["Admin": "ID_001", "Moderator": "ID_002"]
    
    subscript(role: String) -> String? {
        // Возвращает nil, если роли не существует (не крашит приложение)
        guard let id = users[role] else {
            return nil
        }
        return id
    }
}

/// 8️⃣ Динамический инвертированный маппинг (Get-Only)
struct ArrayToIndexMapper {
    let list = ["Apple", "Banana", "Orange", "Kiwi"]
    
    /// Маппим строковое значение обратно в его индекс внутри массива
    subscript(element: String) -> Int? {
        // Ищет первое вхождение строки и возвращает её индекс
        return list.firstIndex(of: element)
    }
}

/// 9️⃣ Маппинг локализации (Read-Only словарь с дефолтным значением)
struct Localization {
    private var dictionary = ["hello": "Привет", "goodbye": "До свидания"]
    
    subscript(key: String) -> String {
        // Если перевода нет, возвращаем сам ключ, чтобы интерфейс не остался пустым
        return dictionary[key] ?? key
    }
}

/// 🔟 Маппинг перечислений (Enum Mapping)
enum AppTheme { case light, dark }
struct ThemeColorMapper {
    subscript(theme: AppTheme) -> String {
        switch theme {
        case .light: return "#FFFFFF"
        case .dark:  return "#121212"
        }
    }
}

/// 1️⃣1️⃣ Маппинг с использованием generics (для супер-профи)
struct GenericMapper<Key: Hashable, Value> {
    private let dict: [Key: Value]
    subscript(key: Key) -> Value? {
        return dict[key]
    }
}
