//
//  bilboBagginsTreasureCode.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 20.07.2026.
//

import Foundation

struct BilboBagginsTreasureCode {
    static func run() {
       // MARK: - Bilbo Baggins Treasure Code
        print("Bilbo Baggins Treasure Code: Создай структуру BilboBagginsChest. Объяви изменяемое свойство items: [String] (массив строк). Реализуй сабскрипт с одним параметром index: Int, содержащий оба блока — get и set:get — возвращает сокровище по индексу в виде строки.set — заменяет существующее сокровище по индексу новым значением (newValue).")
        
        struct BilboBagginsChest {
            var items: [String] = [
                "💎 Arkenstone",
                "🪙 Gold of Erebor",
                "🗡️ Sting",
                "🛡️ Mithril Chainmail"
            ]
            subscript(index: Int) -> String {
                get {
                    guard items.indices.contains(index) else {
                        return "📦 Such chest does not exist"
                    }
                    return items[index]
                }
                set {
                    guard items.indices.contains(index)  else {
                        return
                    }
                    items[index] = newValue
                }
            }
        }
        
        var chest = BilboBagginsChest()
        
        // tests for reading (get)
        print(chest[0]) // 💎 Arkenstone
        print(chest[2]) // 🗡️ Sting
        print(chest[5]) // 📦 Such chest does not exist
        print(chest[-12]) // 📦 Such chest does not exist
        print(chest[12]) // 📦 Such chest does not exist
        
        // 2. tests for -> успешная замена (set)
        chest[2] = "🧣 Silk vest with gold buttons"
        print(chest[2])  // 🧣 Silk vest with gold buttons

        chest[3] = "🧙‍♂️ Old travel cloak"
        print(chest[3])  // 🧙‍♂️ Old travel cloak

        // 3. Проверяем защиту от выхода за границы в блоке set
        chest[5] = "💰 Secret gold" // Код НЕ должен упасть! Операция игнорируется.
        print(chest[5])  // "📦 Such chest does not exist"
    }
}
