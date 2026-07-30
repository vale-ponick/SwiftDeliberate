//
//  emodji.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 27.07.2026.
//

import Foundation

/**
 📌 СТАНДАРТНЫЕ ЭМОДЗИ ДЛЯ ПРОЕКТА (Шпаргалка)

 🔹 Навигация / Действия:
    ▶️ Запуск
    📝 Меню / Заметки
    🧠 Логика / Памятка
    ⚙️ Настройки

 🔹 Цифры (для меню):
    1️⃣ 2️⃣ 3️⃣ 4️⃣ 5️⃣ 6️⃣ 7️⃣ 8️⃣ 9️⃣ 🔟 0️⃣

 🔹 Команды (для switch/case):
    📋 Показать       🔥 Внимание    💡 Подсказка / Идея
    ✏️ Редактировать  🗑️ Удалить     📂 Список
    🔄 Обновить       ✅ Успех       ❌ Ошибка
    ⚠️ Предупреждение ℹ️ Информация  🚪 Выход

 🔹 Данные / Состояния:
    📭 Пусто         📦 Данные       🔄 Загрузка
    💾 Сохранено     🔍 Поиск        📊 Статистика

    🌟 Бонус         🎯 Цель         🖖 Спок
 
 🔹 Git Коммиты (для фиксации изменений в коде):
    ✨ Новая фича / Функция
    🐛 Исправление бага / Ошибки
    📝 Документация / Комментарии / Шпаргалки
    🎨 Стиль / Форматирование / Эмодзи в UI
    ⚡️ Повышение производительности / Оптимизация
    🔥 Удаление кода или файлов
    🚀 Релиз / Готовая версия
*/

enum Emoji {
    enum Navigation { // Caseless enum = enum without cases, used as a namespace for static constants.
        static let start = "▶️"
        static let menu = "📝"
        static let logic = "🧠"
        static let settings = "⚙️"
    }
    enum Numbers { // Caseless enum = enum without cases, used as a namespace for static constants
        static let zero = "0️⃣"
        static let one = "1️⃣"
        static let two = "2️⃣"
        static let three = "3️⃣"
        static let four = "4️⃣"
        static let five = "5️⃣"
        static let six = "6️⃣"
        static let seven = "7️⃣"
        static let eight = "8️⃣"
        static let nine = "9️⃣"
        static let ten = "🔟"
        static let all = [zero, one, two, three, four, five, six, seven, eight, nine, ten]
    }
    enum Commands {
        static let show = "📋"
        static let attention = "🔥"
        static let hint = "💡"
        static let edit = "✏️"
        static let delete = "🗑️"
        static let list = "📂"
        static let refresh = "🔄"
        static let success = "✅"
        static let error = "❌"
        static let warning = "⚠️"
        static let info = "ℹ️"
        static let exit = "🚪"
        static let dangerous = "🚨"
        static let stop = "🛑"
        static let crash = "🧨"
        static let workInProgress = "🚧"
    }
    enum DataState {
        static let empty = "📭"
        static let data = "📦"
        static let loading = "🔄"
        static let saved = "💾"
        static let search = "🔍"
        static let statistics = "📊"
    }
    enum Design {
        static let bonus = "🌟"
        static let target = "🎯"
        static let spock = "🖖"
    }
    enum User {
        static let profile = "👤"
        static let `new` = "🆕" // кавычки `` нужны, потому что new — это служебное слово в Swift
        static let key = "🔑"
        static let victory = "🏆"
        static let congrats = "🎉"
        static let success = "💪"
    }
}
