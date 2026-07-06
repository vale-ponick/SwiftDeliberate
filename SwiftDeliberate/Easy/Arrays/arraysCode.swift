//
//  arraysCode.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 06.07.2026.
//

import Foundation

struct ArraysCode {
    static func run() {
        print("▶️ Запуск: Массивы (Easy)")
        
        // MARK: - 1️⃣: Создание и добавление элементов
        var tasks: [String] = []
        tasks.append("Learn Swift")
        tasks.append("Build project")
        
        print("▶️ Проверка: количество добавленных элементов")
        let count = tasks.count
        print("Результат: \(count)")

        assert((count == 2), "❌ Ошибка: count не совпадает")
        print("✅ Проверка пройдена")
        
        print("▶️ Проверка: первый элемент == 'Learn Swift'")
        let first = tasks[0]
        print("Result: \(first)")
        
        assert((first == "Learn Swift"), "❌ Ошибка: первый элемент не совпадает")
        print("✅ Проверка пройдена")

        
        // MARK: - 2️⃣: Вставка элемента по индексу
        
        tasks.insert("Review arrays", at: 0)
        print("▶️ Проверка: первый элемент == 'Review arrays'")
        let firstAfterInsert = tasks[0]
        print("Result: \(firstAfterInsert)")
        
        assert((firstAfterInsert == "Review arrays"), "❌ Ошибка: новый элемент не совпадает")
        print("✅ Проверка пройдена")
        
        // MARK: - 3️⃣. Удаление элементов
        tasks.removeLast()
        print("▶️ Проверка: количество элементов после удаления")
        let countAfterRemove = tasks.count
        print("Result: \(tasks.count)")
        assert((countAfterRemove == 2),"❌ Ошибка: count не совпадает")
        
        // MARK: - 4️⃣. Проверка наличия элемента
        
        print("▶️ Проверка: массив содержит 'Learn Swift'?")
        let containsLearnSwift = tasks.contains("Learn Swift")
        print("Result: \(containsLearnSwift)")
        assert((containsLearnSwift == true), "❌ Ошибка: элемент 'Learn Swift' не найден")
        print("✅ Проверка пройдена")
        
        print("▶️ Проверка: массив содержит 'Python'?")
        let containsPython = tasks.contains("Python")
        print("Result: \(containsPython)")
        assert((containsPython == false), "❌ Ошибка: элемент 'Python' найден, хотя его быть не должно")
        print("✅ Проверка пройдена")

        // MARK: - 5️⃣. Преобразование с map
        let numbers = [1, 2, 3, 4, 5]
        
        print("▶️ Проверка: результат == массив строк?")
        let numbersStr = numbers.map(String.init)
        print("Result: \(numbersStr)")
        assert((numbersStr == ["1", "2", "3", "4", "5"]), "❌ Ошибка: тип - не массив строк")
        print("✅ Проверка пройдена")
       
        
        // MARK: - 6️⃣. Фильтрация с filter
        print("▶️ Проверка: результат == массив четных чисел?")
        let evenNums = numbers
            .filter { $0 % 2 == 0 }
            .map(String.init)
        print("Result: \(evenNums)")
        assert((evenNums == ["2", "4"]), "❌ Ошибка: массив содержит не четные числа")
        print("✅ Проверка пройдена")
      
        // MARK: - 7️⃣. Сумма с reduce
        print("▶️ Проверка: сумма всех чисел")
        let summa = numbers.reduce(0, +)
        print("Result: \(summa)")
        assert((summa == 15), "❌ Ошибка: сумма не корректна")
        print("✅ Проверка пройдена")
        
        // MARK: - 8️⃣. Очистка данных с compactMap
        let mixedStrings = ["12", "21", "7", "hi, vale!", "compactMap", "Swift", nil]
        print("▶️ Проверка: исключены ли строки и nil?")
       
        let validIntegers = mixedStrings.compactMap { Int($0 ?? "") }
        print("Result: \(validIntegers)")
        assert((validIntegers == [12, 21, 7]), "❌ Ошибка: compactMap не сработал")
        print("✅ Проверка пройдена")
        
        // MARK: - 9️⃣. Проверка с allSatisfy и contains
        
        let cartPrices = [250, 400, 1000, 50, 1200]
        
        let isBudgetCart = cartPrices.allSatisfy { $0 < 2000 }
        let hasLuxuryItem = cartPrices.contains(where: { $0 > 1000 })
        
        assert((isBudgetCart == true), "❌ Ошибка: товаров дороже 2000 нет")
        assert((hasLuxuryItem == true), "❌ Ошибка: товары дороже 1000 есть")
        print("✅ Проверка пройдена")
        
        // MARK: -  🔟. Сортировка: sort vs sorted
        
        var ticketPrices = [2500, 1200, 5000, 800, 3100]
        
        print("▶️ Проверка: создан ли новый массив, а исходный - сохранен неизменным?")
        let sortedPrices = ticketPrices.sorted() { $0 < $1 }
        assert((sortedPrices == [800, 1200, 2500, 3100, 5000]), "❌ Ошибка: новый массив билетов не создан")
    
        print("▶️ Проверка: изменен ли исходный массив?")
        ticketPrices.sort(by: <)
        assert((ticketPrices == [800, 1200, 2500, 3100, 5000]), "❌ Ошибка: билеты не отсортированы по увеличению цены: от балкона к партеру")
        
        // MARK: -  1️⃣1️⃣. Разделение / Ограничение выборки: prefix + suffix)
        
        let prices = [800, 1200, 2500, 3100, 5000]
        
        let topCheapArray = Array(prices.prefix(3)) // Вот он, правильный вариант!
            
        
        assert((topCheapArray == [800, 1200, 2500]), "❌ Ошибка: есть билеты дешевле")
        print("✅ Проверка пройдена")
       
        
               
        print("✅ Массивы (Easy) пройдены!")
    }
}
 

