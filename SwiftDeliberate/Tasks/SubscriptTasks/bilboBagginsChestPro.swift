//
//  bilboBagginsChestPro.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 20.07.2026.
//

import Foundation

enum ChestError: Error, LocalizedError {
    case outOfBounds(index: Int)
    
    var errorDescription: String? {
        switch self {
        case .outOfBounds(let index):
            return "📦 Ошибка: Секция \(index) отсутствует в сундуке!"
        }
    }
}

/// Универсальный, безопасный сундук уровня Pro.
struct ProBilboChest<T>: Sequence {
    private var items: [T]
    
    init(items: [T]) {
        self.items = items
    }
    
    // 1. Сабскрипт строго Read-Only (только get) — теперь Xcode доволен!
    subscript(index: Int) -> T {
        get throws {
            guard items.indices.contains(index) else {
                throw ChestError.outOfBounds(index: index)
            }
            return items[index]
        }
    }
    
    // 2. Безопасная функция перезаписи с поддержкой ошибок (throws)
    mutating func updateItem(at index: Int, with newValue: T) throws {
        guard items.indices.contains(index) else {
            throw ChestError.outOfBounds(index: index)
        }
        items[index] = newValue
    }
    
    func makeIterator() -> IndexingIterator<[T]> {
        return items.makeIterator()
    }
}

// MARK: - Исполняемая структура для запуска теста
struct ProBilboChestCode {
    static func run() {
        print("=== Запуск Pro-версии сундука Бильбо Бэггинса ===")
        
        var chest = ProBilboChest(items: [
            "💎 Arkenstone",
            "🪙 Gold of Erebor",
            "🗡️ Sting",
            "🛡️ Mithril Chainmail"
        ])
        
        // 1. Тестируем Sequence (цикл for-in)
        print("\n1. Содержимое сундука через цикл:")
        for treasure in chest {
            print("- \(treasure)")
        }
        
        // 2. Тестируем успешную работу
        print("\n2. Чтение и модификация сокровищ:")
        do {
            let oldWeapon = try chest[2]
            print("Достали старое оружие: \(oldWeapon)")
            
            // Замена через функцию, так как сабскрипт стал read-only
            try chest.updateItem(at: 2, with: "🧣 Silk vest with gold buttons")
            
            let newTreasure = try chest[2]
            print("Положили вместо него: \(newTreasure)")
        } catch {
            print(error.localizedDescription)
        }
        
        // 3. Тестируем перехват ошибок при выходе за границы (как в get, так и в функции)
        print("\n3. Тест безопасности (выход за границы):")
        do {
            try chest.updateItem(at: 10, with: "💰 Secret Gold")
        } catch {
            print("Перехвачена ожидаемая ошибка:")
            print(error.localizedDescription)
        }
    }
}
