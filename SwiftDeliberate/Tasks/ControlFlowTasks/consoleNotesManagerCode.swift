//
//  consoleNotesManagerCode.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 25.07.2026.
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
 
 //  🔹 Git Коммиты (для фиксации изменений в коде):
 //     ✨ Новая фича / Функция
 //     🐛 Исправление бага / Ошибки
 //     📝 Документация / Комментарии / Шпаргалки
 //     🎨 Стиль / Форматирование / Эмодзи в UI
 //     ⚡️ Повышение производительности / Оптимизация
 //     🔥 Удаление кода или файлов
 //     🚀 Релиз / Готовая версия
*/

struct ConsoleNotesManagerCode {
    
    struct Note {
        let id: Int
        var title: String
        var text: String
    }
    
    static func run() {
        print("▶️ Запуск: ConsoleNotesManagerCode")
                
        // MARK: - 📝 Console Notes Manager
        print("📝 Console Notes Manager")
        
        print("\n\(Emoji.Commands.list) LIST NOTES: ")
        let notes: [Note] = [
            Note(id: 1, title: "Idea on Swift", text: "Create file with emoji"),
            Note(id: 2, title: "my errors", text: "Once more, Vale.ponick!"),
            Note(id: 3, title: "Slogan", text: "Don't worry, be happy!")
        ]
        for note in notes {
            print("\(note.id). \(Emoji.Commands.show) \(note.title) \(note.text)")
        }
        var isRunning = true
        
        while isRunning {
            print("\n\(Emoji.Navigation.menu) --- MAIN MENU: ---")
            print("\(Emoji.Numbers.one) \(Emoji.Commands.list) Show notes")
            print("\(Emoji.Numbers.two) \(Emoji.Navigation.menu) Create note")
            print("\(Emoji.Numbers.zero) \(Emoji.Commands.exit) Exit.Bye, Vale.ponick!")
            print("Enter number: ", terminator: "")
            
            if let input = readLine() {
                switch input {
                case "1":
                    print("\n\(Emoji.Commands.list) MY NOTES:")
                    if notes.isEmpty {
                        print("\(Emoji.DataState.empty) List is empty")
                    } else {
                        for note in notes {
                            print("\(note.id). \(Emoji.Commands.show) \(note.title): \(note.text)")
                        }
                    }
                case "0":
                    print("\n\(Emoji.Commands.exit) Bye!App is complete")
                    isRunning = false
                default:
                    print("\n\(Emoji.Commands.error) Incorrect input! Try again")
                }
            }
        }

    }
}
