//
//  variableTheory.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 27.07.2026.
//

import Foundation

struct VariableTheory {
    static func run() {
        print("▶️ Запуск: Variable Theory")
        
        // MARK: - 📝 Variable Theory)
        // 🔥 ХИТРЫЕ ВОПРОСЫ: LET + VAR
        
        let a = 5
        var b = a
        // a = 10  // ❌ ошибка, let неизменяема
        b = 10
        
        struct Point {
            var x: Int
            var y: Int
        }
        let point = Point(x: 1, y: 2)
        // point.x = 5 // ❌ экземпляр структуры -> let => все его свойства становятся НЕизменяемыми, даже если объявлены var
        
        class Cat {
            var name: String // Теперь тут let!
            init(name: String) { self.name = name }
        }
        
        let cat = Cat(name: "Jerry")
        print(cat.name) // Jerry
        cat.name = "Tom" // ✅ можно, класс через let — меняем свойства
        print(cat.name) // Tom
        // cat = Cat(name: "Charlie") // ❌ let для класса замораживает только его адрес в памяти
    
        print(cat) // Выведет: SwiftDeliberate.VariableTheory...Cat ($10004e78c)
        // 💡 Почему? Класс — ссылочный тип. Swift печатает его системный путь и адрес в памяти ($...), а не внутренности.

/**
 ENGINEERING MEMORY AUDIT: Value Types vs Reference Types & Scoping

  💡 Аллокация (Allocation) — процесс резервирования оперативной памяти
     (в Stack или Heap) под экземпляр объекта для хранения его данных.
  
  1. МЕХАНИКА АЛЛОКАЦИИ И МУТАБЕЛЬНОСТИ (Stack vs Heap):
     - Экземпляр Class аллоцируется в Heap. Константа `let cat` в Stack хранит лишь константный указатель (Immutable Pointer) на этот адрес.
     - Мутация `cat.name = "Tom"` валидна: меняются данные в Heap, сам указатель неизменен.
     - Переприсвоение ссылки `cat = Cat(...)` запрещено: это нарушает константность указателя.
     - Struct (Value Type): `let` замораживает объект целиком на Stack. Мутация полей запрещена.

  2. УРОВЕНЬ ОБЪЯВЛЕНИЯ ПОЛЕЙ (Property Level) vs ОБЛАСТЬ ВИДИМОСТИ (Scope):
     
     A. Уровень полей структуры/класса:
        - Место, где переменная «рождается» как неотъемлемая часть объекта.
        - Определяет МУТАБЕЛЬНОСТЬ (через let/var) и внутреннюю структуру самого объекта.
        - Данные привязаны к жизненному циклу объекта и аллоцируются вместе с ним.
     
     B. Область видимости (Scope):
        - Границы кода (фигурные скобки `{ }` внутри функций, циклов, условий).
        - Определяет ДОСТУПНОСТЬ переменной («Кто имеет право её видеть?»).
        - Локальные переменные методов создаются в Stack при вызове и уничтожаются при выходе из Scope.
          Пример: в `func run() { var temp = 5 }` за пределами функции `temp` физически не существует.
 
  Commit: docs: optimize memory allocation and scope documentation
  */
    }
}
