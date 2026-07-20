//
//  mappingTasksCode.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 20.07.2026.
// 0️⃣ 1️⃣ 2️⃣ 3️⃣ 4️⃣ 5️⃣ 6️⃣ 7️⃣ 8️⃣ 9️⃣

import Foundation

struct MappingTasksCode {
     static func run() {
        print("▶️ Запуск: Mapping Tasks (Easy)")
        // MARK: - 1️⃣. 'Color mapping'
        
        print("1️⃣. 'Color mapping' - приложение для дизайна интерьеров")
        /** Сервер присылает названия цветов ("red", "green", "blue").
         Напиши слой-переводчик, который возвращает эмодзи этого цвета, чтобы красиво выводить его на экран смартфона.
         Создай структуру ColorMapper.
         Внутри - > приватный словарь colors: [String: String].
         Заполни его парами, напр.: "red" ➡️ "🔴", "green" ➡️ "🟢", "blue" ➡️ "🔵".
         Напиши сабскрипт, который принимает имя цвета (String) и возвращает эмодзи (String).
         NB: Если на вход пришел неизвестный цвет, которого нет в словаре (например, "purple"), сабскрипт не должен падать / возвращать пустую строку. он -> дефолтный эмодзи: "❓".
         */
        
        struct ColorMapper {
            let colors: [String: String] = [
                "red": "🔴",
                "green": "🟢",
                "blue": "🔵"
            ]
            
            subscript(name: String) -> String {
                return colors[name] ?? "❓"
            }
        }
        
        // tests
        let colorMapper = ColorMapper() // 1️⃣ Создай ОДИН экземпляр нашей struct-переводчика и обращайся к нему через [] <- it's subscript!
         // 2️⃣ -> в [] tests strings + print result
        print(colorMapper["blue"]) // 🔵
        print(colorMapper["purple"]) // ❓
        print(colorMapper[""]) // ❓
    }
}
