//
//  closuresTheory.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 22.07.2026.
//

import Foundation

/*
 📐🚕💨 ТЕОРИЯ: Замыкания (Closures) (Middle)
 
 🎯 Главная задача:
 Замыкание — это самодостаточный блок кода, который можно передавать в переменные, функции и использовать как синтаксический сахар для лаконичности.
 
 📖 История:
 Концепция пришла из функционального программирования. В Swift отточена до идеала Крисом Латтнером в Swift 3.0 (2016) в рамках реформы "Swift Evolution" (предложение SE-0046), когда правила именования и передачи блоков кода стали строгими и едиными.
 
 ⚙️ Как работает под капотом:
 Замыкания являются ссылочным типом данных (`Reference Type`). Они хранятся в куче (Heap) и умеют "захватывать" и удерживать переменные из той области видимости, где они были созданы.
 
 🔹 На пальцах (доступно):
 Представь, что замыкание — это функция, у которой украли имя.
 Вместо того чтобы писать полноценную `func`, ты просто пишешь логику в фигурных скобках `{ }` и передаешь ее как обычную строковую переменную.
 
 🔹 Инженерно (точно):
 Синтаксис замыкания всегда разделен ключевым словом `in`.
 { (параметры) -> возвращаемый_тип in
     // выполняемый код
 }
 
 ⚡️ Синтаксический сахар в Замыканиях:
 */

// 🚧 1. Ключевое слово "in"
let array = ["Swift", "Java"]

func exampleWithIn() {
    array.forEach { lang in
        print(lang)
    }
}

// 🚀 2. Сокращенный аргумент $0
func exampleWithShorthand() {
    array.forEach { print($0) }
}

// 🏃‍♂️ 3. @escaping
func fetchData(completion: @escaping (String) -> Void) {
    DispatchQueue.global().async {
        completion("Data received")
    }
}

// 🔄 4. @autoclosure
func log(_ message: @autoclosure () -> String) {
    print(message())
}

/*
 🧠 GOLDEN RULE для Closures:
 - Всё, что ДО слова `in` — это параметры, имя которым ты даешь САМА.
 - Если используешь `$0`, параметры и слово `in` стираются целиком.
 - Замыкания захватывают переменные из контекста — используй `[weak self]` для избежания retain cycles.
 
 📚 ШПАРГАЛКА ПО ЗАМЫКАНИЯМ
 
 1️⃣ Базовый синтаксис:
    { (параметры) -> Тип in
        // код
    }
 
 2️⃣ Сокращения:
    array.map { $0 * 2 }          // $0 — первый параметр
    array.filter { $0 > 5 }       // $0 — элемент
    array.reduce(0) { $0 + $1 }   // $0 — аккумулятор, $1 — элемент
 
 3️⃣ С параметрами:
    array.sorted { (a: Int, b: Int) -> Bool in
        return a < b
    }
 
 4️⃣ С захватом:
    [weak self] in
    guard let self = self else { return }
 
 5️⃣ @escaping:
    func asyncTask(completion: @escaping () -> Void)
 
 6️⃣ @autoclosure:
    func log(_ message: @autoclosure () -> String)
 
 7️⃣ Trailing closure:
    array.map { $0 * 2 }  // скобки опущены
 
 💻 Примеры с реальными API:
 
 let numbers = [1, 2, 3, 4, 5]
 
 let sorted = numbers.sorted { $0 < $1 }
 let evens = numbers.filter { $0 % 2 == 0 }
 let strings = numbers.map { "Number: \($0)" }
 let sum = numbers.reduce(0) { $0 + $1 }
 
 if let firstEven = numbers.first(where: { $0 % 2 == 0 }) {
     print(firstEven)
 }
 
 📈 РЕФЛЕКСИЯ по Замыканиям:
 💡 Озарение (Aha! moment): Конструкции типа `{ id in ... }` в SwiftUI — это не магия, а просто имя переменной `id`, которое я сама дала текущему элементу массива, а Swift автоматически подставляет его при переборе!
 
 🛡️🔥 ДЕВИЗ ЗАМЫКАНИЙ:
 
 "Not today, retain cycle."
 "Weak. Unowned. Capture List."
 Middle.
 
 🚕💨 CODE PRO
 
 🏔️🔥 PRINCIPLES:
 1. Always use weak self in closures
 2. Always think about capture list
 3. Always use trailing closure
 4. Always prefer $0 over long names
 5. Always be Middle
 
 📈 STATUS: v1.0 | Juniour+ | Swift 5.9+
 */
