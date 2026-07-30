//
//  structAndClassSnippets.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 30.07.2026.
//

import Foundation

struct StructAndClassSnippets {
    static func run() {
        print("▶️ Запуск: Struct And Class Snippets\n")
        
        // 1. VALUE TYPE (Structs) vs REFERENCE TYPE (Classes)
        
        // А. Struct полностью КОПИРУЕТСЯ. Оригинал всегда в безопасности.
        do {
            struct Spaceship {
                var name: String
                var fuel: Int
            }
            
            let enterprise = Spaceship(name: "USS Enterprise", fuel: 100)
            var discovery = enterprise // Создана независимая COPY
            
            discovery.fuel = 50
            print("1. Структура (Оригинал защищен. Ожидаем 100): \(enterprise.fuel)")
        }
        
        // 2. REFERENCE TYPE (Классы копируют ссылки)
        
        do {
            class Commander {
                var name: String
                init(name: String) { self.name = name }
            }
            
            let firstCommander = Commander(name: "James Kirk")
            let secondCommander = firstCommander // Обе константы смотрят на ОДИН дом в памяти
            
            secondCommander.name = "Spock" // Меняем мебель внутри дома
            print("2. Класс (Оригинал изменился по ссылке. Ожидаем Spock): \(firstCommander.name)")
        }
        
        // 💡 Инсайт: 'let' для класса запрещает менять адрес дома (secondCommander = Commander(...)),
        // но изменять var-свойства внутри этого дома компилятор полностью разрешает!
        
        // 3. MUTATING (Мутация внутри структур)
        
        // Суть: Структура — Value Type. Метод не может менять её свойства,
        // пока перед func не стоит key-word 'mutating'.
        do {
            struct CargoShip {
                let name: String
                var tonnage: Int
                
                mutating func loadCargo(weight: Int) {
                    tonnage += weight // Перезаписывает свойство ВНУТРИ структуры
                }
            }
            
            var voyager = CargoShip(name: "USS Voyager", tonnage: 100) // NB: var!
            voyager.loadCargo(weight: 50)
            
            print("3. Мутирующий метод (ожидаем 150): \(voyager.tonnage)")
            
            // let fixedVoyager = CargoShip(name: "Static", tonnage: 100)
            // fixedVoyager.loadCargo(weight: 50) // 🛑 Error! let-struct нельзя мутировать.
        }
        
        // 4. CLASS REFERENCE (Общий объект в памяти)
        // ==========================================
        // Суть: Изменение любого свойства через одну константу-ссылку
        // мгновенно меняет данные для ВСЕХ остальных ссылок на этот класс.
        do {
            class SpaceProbe {
                var serialNumber: Int
                var destination: String
                init(serialNumber: Int, destination: String) {
                    self.serialNumber = serialNumber
                    self.destination = destination
                }
            }
            
            let firstProbe = SpaceProbe(serialNumber: 2112, destination: "Mars")
            let secondProbe = firstProbe // Обе ссылки ведут на один зонд
            
            secondProbe.destination = "Jupiter"
            firstProbe.serialNumber = 8888
            
            print("4. Итог по ссылкам класса (ожидаем 8888 и Jupiter): \(secondProbe.serialNumber) - \(secondProbe.destination)")
        } 
    }
}

