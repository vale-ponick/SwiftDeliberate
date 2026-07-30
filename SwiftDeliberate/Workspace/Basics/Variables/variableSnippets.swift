//
//  snippets.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 27.07.2026.
//

import Foundation

struct VariableSnippets {
    static func run() {
        print("▶️ Запуск: Variable Snippets\n")
        
        // 1. ИЗМЕНЕНИЕ ПАРАМЕТРОВ В ФУНКЦИЯХ
        
        // MARK: - Ловушка: Аргументы функции всегда 'let' по умолчанию.
        do {
            // Вариант А: Через создание локальной var-копии
            func incrementByOne(value: Int) -> Int {
                var mutableValue = value
                mutableValue += 1
                return mutableValue
            }
            
            // Вариант Б: Напрямую через inout (меняет исходную переменную)
            func incrementInPlace(value: inout Int) {
                value += 1
            }
            
            var number = 10
            incrementInPlace(value: &number)
            print("1. Результат inout (ожидаем 11): \(number)")
        }
       
        // 2. ОБЛАСТЬ ВИДИМОСТИ И ЗАТЕНЕНИЕ (Shadowing)
     
        // MARK: - Суть: Переменные с одинаковым именем могут жить в разных блоках { }
        do {
            let scope = "Внутри функции"
            if true {
                let scope = "Внутри IF"
                print("2. Локально (ожидаем Внутри IF): \(scope)")
            }
            print("2. Глобально (ожидаем Внутри функции): \(scope)")
        }
  
        // 3. VALUE TYPES (Копирование базовых значений)
        
        // MARK: - Суть: Int, String, Array при присваивании ВСЕГДА копируются.
        do {
            var firstScore = 10
            var secondScore = firstScore // Создана независимая копия!
            secondScore = 99 // Меняем только копию
            
            print("3. Оригинал (10): \(firstScore), Копия (99): \(secondScore)")
        }
   
        // 4. КОПИРОВАНИЕ СЛОВАРЕЙ ПРИ ПЕРЕДАЧЕ
      
        // MARK: - Суть: Словари — это тоже Value Type. Функция получает копию.
        do {
            func changeSpeed(settings: [String: String]) {
                var localCopy = settings
                localCopy["Speed"] = "Fast" // Меняет только копию
            }
            
            var baseSettings = ["Speed": "Slow"]
            changeSpeed(settings: baseSettings)
            print("4. Словарь после функции (ожидаем Slow): \(baseSettings["Speed"]!)")
        }
        
        // 5. INOUT И ОГРАНИЧЕНИЯ CONSTANT (let)
        
        // MARK: - Ловушка: inout-функции принимают только 'var'. Передать 'let' нельзя.
        do {
            func addData(to array: inout [Int]) {
                array.append(42)
            }
            
            var mutableNumbers = [10, 20, 30]
            addData(to: &mutableNumbers) // ✅ Сработает с var
            print("5. Массив с var (добавилось 42): \(mutableNumbers)")
            
            // let immutableNumbers = [10, 20, 30]
            // addData(to: &immutableNumbers) // 🛑 Ошибка компиляции! let менять нельзя.
        }
      
        // 6. ВЫЧИСЛЯЕМЫЕ СВОЙСТВА (Computed Properties)
      
        // MARK: - Суть: Свойство с кодом внутри {} по умолчанию работает ТОЛЬКО НА ЧТЕНИЕ.
        do {
            var baseSpeed = 100
            var readOnlyKnots: Int {
                return baseSpeed * 2
            }
            print("6. Чтение свойства (ожидаем 200): \(readOnlyKnots)")
            // readOnlyKnots = 300 // 🛑 Ошибка компиляции! Нельзя записать.
        }

        // 7. МУТАЦИЯ СТРОК (String mutation)
        // MARK: - Строки — это Value Types, но их можно изменять через var.
        do {
            var log = "Отчет: "
            let status = "Системы в норме"
            log += status // ✅ Сработает
            // status += "!" // 🛑 Ошибка компиляции! status — это let.
            print("7. Итоговый лог: \(log)")
        }
        
        // 8. ЗАМОРОЗКА КОРТЕЖЕЙ (Tuples)
    
        // MARK: - Суть: Кортеж под 'let' полностью заморожен, менять элементы нельзя.
        do {
            var mutableSession = (id: 777, name: "Alex")
            mutableSession.name = "Max" // ✅ Работает
            print("8. Измененный кортеж (ожидаем Max): \(mutableSession.name)")
        }
      
        // 9. МЕХАНИКА INOUT (Copy-In Copy-Out / Наш Финальный Босс)
  
        // MARK: - Ловушка: inout возвращает значение в самом конце, стирая промежуточные изменения.
        do {
            var globalScoreTracker = 10
            
            func doubleScoreDemo(score: inout Int) {
                score *= 2
                globalScoreTracker = 50 // Временная замена в глобальной памяти
            }
            
            doubleScoreDemo(score: &globalScoreTracker)
            print("9. Результат Босса (ожидаем 20, так как 50 затрется): \(globalScoreTracker)")
        }
        // MARK: - 10. КОРТЕЖИ (Tuples): память и мутация

        do {
            // ✅ var-кортеж — можно менять элементы
            var user = (id: 1, name: "Alice")
            user.name = "Bob"
            print("10. var-кортеж (ожидаем Bob): \(user.name)")
            
            // ❌ let-кортеж — полностью заморожен
            let fixed = (x: 10, y: 20)
            // fixed.x = 30  // 🛑 Ошибка компиляции! let-кортеж нельзя менять
            
            // 🔥 Ловушка: кортеж внутри let-структуры
            struct Container {
                let point: (x: Int, y: Int)
            }
            let box = Container(point: (x: 5, y: 5))
            // box.point.x = 10  // 🛑 Ошибка! let-структура замораживает всё внутри
            
            // ✅ Кортеж внутри var-структуры
            struct MutableContainer {
                var point: (x: Int, y: Int)
            }
            var mutableBox = MutableContainer(point: (x: 1, y: 2))
            mutableBox.point.x = 99
            print("10. var-структура с кортежем (ожидаем 99): \(mutableBox.point.x)")
        }
        
 
        // 💡 ШПАРГАЛКА: МЕХАНИКА ПАМЯТИ ОТ СПОКА:
        
        /*
         Все базовые типы данных в Swift (Int, String, Double, Bool), а также массивы (Array) и словари (Dictionary) — это Value Types (Типы значений).
         В Swift они почти всегда реализованы как структуры.
         Когда мы пишем var backupCourse = originalCourse, Swift не связывает эти две переменные между собой. Он делает полную, независимую копию значения и кладет её в новую ячейку памяти.
         Это как распечатать документ на принтере: если ты черкнешь маркером на копии, на первом листке текст никак не изменится. Они живут отдельной жизнью.
        */
    }
}
