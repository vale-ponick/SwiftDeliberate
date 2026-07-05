//
//  typesCode.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 05.07.2026.
//

import Foundation

struct TypesCode {
    static func run() {
        print("▶️ Запуск: Типы данных (Easy)")
        
        // Кейс 1: .toggle() меняет Bool без знака равенства
        var isDarkMode = true
        isDarkMode.toggle()
        assert(isDarkMode == false, "Отказ: toggle не переключил флаг")
        
        // Кейс 2: Изменение элемента кортежа не трогает остальные свойства
        var airport = (code: "DME", city: "Домодедово")
        airport.code = "SVO"
        assert(airport.city == "Домодедово", "Отказ: повреждены соседние данные кортежа")
        
        // Кейс 3: Символ `_` позволяет игнорировать часть кортежа при разложении
        let product = (name: "iPhone", price: 999)
        let (_, productPrice) = product
        assert(productPrice == 999, "Отказ: неверно извлечена цена")
        
        print("✅ Успешно пройдено!")
    }
}

struct User { var age: Int }

struct Types_Middle_Code {
    static func run() {
        print("▶️ Запуск: Типы данных (Middle)")
        
        // Кейс 1: Прямое сравнение дробей через == запрещено из-за погрешности Double
        let result: Double = 0.1 + 0.2
        let isNearlyEqual = abs(result - 0.3) < Double.ulpOfOne
        assert(isNearlyEqual == true, "Отказ: ошибка округления Double")
        
        // Кейс 2: Оператор `&+` позволяет сделать переполнение UInt8 без краша приложения
        let maxByte: UInt8 = 255
        let overflowResult = maxByte &+ 1
        assert(overflowResult == 0, "Отказ: оператор &+ сработал неверно")
        
        // Кейс 3: Ключевое слово inout позволяет функции мутировать оригинальную структуру
        var user = User(age: 20)
        modifyAge(for: &user)
        assert(user.age == 21, "Отказ: функция inout не изменила оригинал")
        
        print("✅ Успешно пройдено!")
    }
    
    private static func modifyAge(for user: inout User) {
        user.age += 1
    }
}
