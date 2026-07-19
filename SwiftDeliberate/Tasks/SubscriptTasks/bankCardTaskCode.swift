//
//  bankCardTaskCode.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 19.07.2026.
//

import Foundation

struct BankCardTaskCode {
    static func run() {
     
        // MARK: - ☕️💳 КОММЕРЧЕСКИЙ КЕЙС: ЛЕНТА БАНКОВСКИХ КАРТ (USER CARDS)
        print("☕️💳 КОММЕРЧЕСКИЙ КЕЙС: ЛЕНТА БАНКОВСКИХ КАРТ - 'USER CARDS'.")
        
        // 📝 Условие задачи: Создай struct BankDatabase. Внутри неё -> [[String]], где каждый внутренний массив —> кошелек конкретного клиента.
        
        // вар. 1 swift style
        
        struct BankDatabase {
            var userCards: [[String]] = [
                ["Мир", "Visa"],      // Клиент 0 (Shrek) — 2 карты
                ["Mastercard"],       // Клиент 1 (Fiona) — 1 карта
                ["Мир", "UnionPay"], // Клиент 2 (Donkey) — 2 карты
                []                    // Клиент 3 (Puss) - 0 карт
            ]
            
            subscript( userIndex: Int, cardIndex: Int) -> String { // my КАСТОМНЫЙ САБСКРИПТ - т.н. 'Read-Only'
                guard userCards.indices.contains(userIndex), userIndex >= 0,
                      userCards[userIndex].indices.contains(cardIndex) else { // indices.contains auto проверяет и >= 0, и верхнюю динамическую границу!
                    return "💳 Card not found"
                }
                return userCards[userIndex][cardIndex]
            }
        }
        // tests:
        // ☕️💳 КОММЕРЧЕСКИЙ КЕЙС: ЛЕНТА БАНКОВСКИХ КАРТ - 'USER CARDS'.
        let bankDB = BankDatabase()
        print(bankDB[0,1]) // Visa
        print(bankDB[1,0]) // Mastercard
        print(bankDB[1,1]) // 💳 Card not found
        print(bankDB[3,1]) // 💳 Card not found
        
    // var. 2
        print("☕️💳 ПРОДВИНУТЫЙ ВАРИАНТ С ИМЕНАМИ И ПЕРЕМЕННОЙ-ХРАНИЛИЩЕМ.")
                
                struct BankDatabasePro {
                    // 1. Наша база данных карт по цифровым индексам
                    var userCards: [[String]] = [
                        ["Мир", "Visa"],      // Индекс 0 (Shrek)
                        ["Mastercard"],       // Индекс 1 (Fiona)
                        ["Мир", "UnionPay"],  // Индекс 2 (Donkey)
                        []                    // Индекс 3 (Puss) - карт нет
                    ]
                    
                    // 2. Наш "переводчик" из Имени в Цифровой Индекс (Словарь)
                    let userIndexes: [String: Int] = [
                        "Shrek": 0,
                        "Fiona": 1,
                        "Donkey": 2,
                        "Puss": 3
                    ]
                    
                    // Сабскрипт принимает Имя (String) и Индекс карты (Int)
                    subscript(name: String, cardIndex: Int) -> String {
                        // ШАГ 1: Переводим имя в цифровой индекс.
                        // Если такого имени нет в словаре — сразу возвращаем ошибку
                        guard let mappedUserIndex = userIndexes[name] else {
                            return "❌ Client not registered in bank"
                        }
                        
                        // ШАГ 2: Используем ПЕРЕМЕННУЮ-ХРАНИЛИЩЕ.
                        // Мы один раз достаем кошелек и сохраняем его, т.к. будем работать с ним несколько раз.
                        let currentUserWallet = userCards[mappedUserIndex]
                        
                        // ШАГ 3: Новое бизнес-условие. Проверяем, не пуст ли кошелек?
                        guard !currentUserWallet.isEmpty else {
                            return "💳 Client not open card"
                        }
                        
                        // ШАГ 4: Динамически проверяем существование карты в сохраненном кошельке
                        guard currentUserWallet.indices.contains(cardIndex) else {
                            return "💳 Card not found"
                        }
                        
                        // План А: Возвращаем карту из переменной-хранилища
                        return currentUserWallet[cardIndex]
                    }
                }
                
                // === ТЕСТЫ С ИМЕНАМИ ДЛЯ КОНСОЛИ ===
                let bankDBPro = BankDatabasePro()
                
                // Ищем по имени и индексу!
                print(bankDBPro["Shrek", 1])   // Visa
                print(bankDBPro["Fiona", 0])   // Mastercard
                print(bankDBPro["Shrek", 0])  // "Мир"
                print(bankDBPro["Donkey", 1]) // "UnionPay"
                print(bankDBPro["Fiona", 1])   // 💳 Card not found (У Фионы всего 1 карта)
                print(bankDBPro["Puss", 0])    // 💳 Client not open card (Сработало новое правило!)
                print(bankDBPro["Pinocchio", 0]) // ❌ Client not registered in bank
            }
        }
    
  
