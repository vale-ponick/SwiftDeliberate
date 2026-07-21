📚 Полный справочник Swift: определения + связи
1. ОПЦИОНАЛЫ (Optional)
📖 Определение:
Опционал — это тип, который может содержать значение или отсутствие значения (nil). Обертка над любым типом.

swift
var name: String? = "Иван"  // Может быть String или nil
🎯 Назначение:
Безопасно работать с данными, которых может не быть

Избавиться от null pointer exception (как в Java/C++)

Явно показать: "Этой переменной может не быть значения"

🔗 Связи:
String? — опционал строки

[String]? — опционал массива

Int?? — двойной опционал (редко, но бывает)

Связан с if let, guard let, ??, map, flatMap

⚠️ Особенности:
Метод разворачивания    Безопасность    Где использовать
if let    ✅ Безопасно    Внутри блока
guard let    ✅ Безопасно    Всюду после проверки
?? (nil coalescing)    ✅ Безопасно    Дефолтное значение
! (forced unwrap)    ❌ Опасно!    Только если 100% уверена
map / flatMap    ✅ Безопасно    Трансформации
swift
// Связь с if let
if let name = optionalName {
    print(name)  // Доступно только здесь
}

// Связь с guard let
guard let name = optionalName else { return }
print(name)  // Доступно везде дальше

// Связь с nil coalescing
let name = optionalName ?? "Аноним"  // Всегда String, не опционал
2. МАССИВ (Array)
📖 Определение:
Массив — упорядоченная коллекция элементов одного типа. Доступ по целочисленному индексу (от 0 до count-1).

swift
let numbers = [1, 2, 3, 4, 5]
let strings: [String] = ["a", "b", "c"]
🎯 Назначение:
Хранение упорядоченных данных

Быстрый доступ по индексу O(1)

Перебор элементов в цикле

🔗 Связи:
[T] — синтаксический сахар для Array<T>

Связан с Indices, Index, Count, enumerated()

Протоколы: Sequence, Collection, RandomAccessCollection

Взаимодействие с Subscript (доступ через [index])

⚠️ Особенности:
Операция    Сложность    Примечание
array[index]    O(1)    ⚠️ Падает, если индекс вне границ
array.append()    O(1)*    *амортизированно
array.insert(at:)    O(n)    Сдвигает элементы
array.remove(at:)    O(n)    Сдвигает элементы
array.contains()    O(n)    Линейный поиск
swift
// Связь с индексами
let indices = array.indices  // Range<Int>
if indices.contains(index) {  // Безопасная проверка
    let value = array[index]
}

// Связь с enumerated()
for (index, value) in array.enumerated() {
    print("\(index): \(value)")
}
3. СЛОВАРЬ (Dictionary)
📖 Определение:
Словарь — неупорядоченная коллекция пар "ключ-значение". Доступ по хешируемому ключу.

swift
let dict = ["name": "Иван", "age": "25"]
let scores: [String: Int] = ["Math": 95, "Physics": 88]
🎯 Назначение:
Быстрый поиск по ключу O(1)

Ассоциативные данные (как JSON)

Уникальные ключи

🔗 Связи:
[Key: Value] — синтаксический сахар

Ключи должны быть Hashable (String, Int, и т.д.)

Возвращает опционал при доступе

⚠️ Особенности:
Особенность    Почему
dict["key"] → Optional    Ключа может не быть (безопасно)
dict["key"]! → краш    Если ключа нет — падает
Неупорядочен    Нельзя полагаться на порядок
dict.values    Массив значений (неупорядочен)
dict.keys    Массив ключей (неупорядочен)
swift
// Связь с опционалами
if let value = dict["key"] {
    print(value)  // Безопасно
}

// Дефолтное значение
let value = dict["key", default: "default"]

// Связь с итерацией
for (key, value) in dict {
    print("\(key): \(value)")
}
4. МНОЖЕСТВО (Set)
📖 Определение:
Множество — неупорядоченная коллекция уникальных хешируемых элементов.

swift
let set: Set<Int> = [1, 2, 3, 4, 5]
let fruits: Set<String> = ["Apple", "Banana", "Orange"]
🎯 Назначение:
Хранение уникальных значений

Быстрые операции: объединение, пересечение, разность

Проверка принадлежности O(1)

🔗 Связи:
Элементы должны быть Hashable

Операции: union(), intersection(), subtracting(), symmetricDifference()

Методы: contains(), insert(), remove()

⚠️ Особенности:
Особенность    Почему
❌ set[0] — нет сабскрипта    Неупорядочен, нет индексов
✅ set.contains(1)    O(1) — быстрая проверка
Уникальность    Автоматически удаляет дубликаты
swift
// Связь с массивами
let array = [1, 2, 2, 3, 3, 4]
let setFromArray = Set(array)  // [1, 2, 3, 4] — дубли убраны

// Операции множеств
let a: Set = [1, 2, 3]
let b: Set = [3, 4, 5]
a.union(b)         // [1, 2, 3, 4, 5]
a.intersection(b)  // [3]
a.subtracting(b)   // [1, 2]
5. КОРТЕЖ (Tuple)
📖 Определение:
Кортеж — группа значений разных типов, объединенных в одну сущность. Фиксированный размер.

swift
let person = (name: "Иван", age: 25, isActive: true)
let coordinates = (10, 20)  // Без имен
🎯 Назначение:
Временная группировка данных

Возврат нескольких значений из функции

Простая структура без создания отдельного типа

🔗 Связи:
Доступ через .0, .1 или через имена

Может содержать любые типы

Используется в enumerated(), zip()

⚠️ Особенности:
Особенность    Почему
❌ tuple[0] — нет сабскрипта    Кортеж не коллекция
✅ tuple.0 или tuple.name    Доступ через точку
Нельзя добавить/удалить элементы    Фиксированный размер
Не соответствует Sequence    Нельзя использовать в for-in
swift
// Связь с функциями
func getUser() -> (name: String, age: Int) {
    return ("Иван", 25)
}
let user = getUser()
print(user.name)  // "Иван"
print(user.0)     // "Иван"

// Связь с enumerated()
for (index, value) in array.enumerated() {
    print("\(index): \(value)")
}
6. САБСКРИПТ (Subscript)
📖 Определение:
Сабскрипт — синтаксический сахар для доступа к элементам через квадратные скобки []. Это как функция, но с особым синтаксисом.

swift
struct Team {
    let players = ["Дзюба", "Головин"]
    subscript(index: Int) -> String {
        players[index]
    }
}
print(team[1])  // Головин
🎯 Назначение:
Удобный доступ к элементам коллекций

Сокращение кода (не писать getElement(at:))

Привычный синтаксис для пользователей структуры

🔗 Связи:
Связан с Array, Dictionary, String (у них есть сабскрипты)

Может быть get, set, throws

Может быть static (вызов у типа)

Может принимать несколько параметров

⚠️ Особенности:
Особенность    Пример
get только чтение    subscript(i) -> T { return items[i] }
get/set чтение/запись    subscript(i) -> T { get { ... } set { ... } }
throws с ошибками    subscript(i) -> T { get throws { ... } }
static у типа    static subscript(key: String) -> String
С именами параметров    subscript(from: String, to: String) -> String
swift
// Связь с guard (безопасность)
subscript(index: Int) -> T {
    get throws {
        guard items.indices.contains(index) else {
            throw ChestError.outOfBounds
        }
        return items[index]
    }
}

// Связь с generics
struct Box<T> {
    subscript(index: Int) -> T { ... }
}
7. GENERICS (Обобщения)
📖 Определение:
Generics — механизм, позволяющий писать гибкий, переиспользуемый код, который работает с любыми типами, сохраняя при этом строгую типизацию.

swift
struct Box<T> {
    var value: T
}
let intBox = Box(value: 42)
let stringBox = Box(value: "Hello")
🎯 Назначение:
Избежать дублирования кода

Создавать универсальные структуры и функции

Сохранять типобезопасность

🔗 Связи:
Связан с Array<T>, Dictionary<Key, Value>, Optional<Wrapped>

Ограничения через where и протоколы (T: Equatable)

Используется в протоколах с associatedtype

⚠️ Особенности:
Ограничение    Синтаксис
Один тип    struct Box<T>
Несколько типов    struct Pair<T, U>
Ограничение протоколом    func compare<T: Equatable>(a: T, b: T)
Сложные ограничения    func process<T, U>(...) where T: Sequence, U: Equatable
swift
// Связь с протоколами
protocol Identifiable {
    associatedtype ID: Hashable
    var id: ID { get }
}

// Связь с where
func filter<T: Sequence>(_ sequence: T) where T.Element: Equatable {
    // ...
}
8. ПРОТОКОЛЫ (Protocol)
📖 Определение:
Протокол — это контракт, описывающий свойства и методы, которые должен реализовать тип. Аналог интерфейса в других языках.

swift
protocol Flyable {
    var maxSpeed: Int { get }
    func fly()
}
🎯 Назначение:
Абстракция поведения

Множественное наследование (в отличие от классов)

Разделение интерфейса и реализации

Тестирование (моки, заглушки)

🔗 Связи:
Связан с extension (дефолтные реализации)

С associatedtype (generic protocols)

С Self (ссылка на реализующий тип)

С where для ограничений

⚠️ Особенности:
Особенность    Пример
Свойства    var name: String { get set }
Методы    func doSomething()
Инициализаторы    init(name: String)
Ассоциированные типы    associatedtype Item
Дефолтная реализация    extension Flyable { func fly() { ... } }
swift
// Связь с generics
protocol Stack {
    associatedtype Element
    mutating func push(_ element: Element)
    mutating func pop() -> Element?
}

struct IntStack: Stack {
    typealias Element = Int
    // ...
}

// Protocol как тип
let flyable: Flyable = Bird()

// Protocol Composition
func process(thing: Flyable & Swimable) { ... }
9. ENUM (Перечисление)
📖 Определение:
Enum — тип данных, который определяет конечный набор возможных значений.

swift
enum Status {
    case active
    case inactive
    case pending
}
🎯 Назначение:
Ограниченный набор значений (безопасность)

Управление состояниями

Группировка связанных значений

Связанные значения (associated values) для доп. данных

🔗 Связи:
Связан с switch (исчерпывающая проверка)

С associated values (как Result)

С raw values (строки, числа)

С CaseIterable для итерации

⚠️ Особенности:
Особенность    Пример
Associated values    case error(code: Int)
Raw values    enum Color: String { case red = "FF0000" }
Computed properties    var description: String { ... }
Методы    func doSomething() { ... }
swift
// Связь с switch (исчерпывающая проверка)
switch status {
case .active: print("Active")
case .inactive: print("Inactive")
case .pending: print("Pending")
}  // Компилятор проверит, что все case обработаны

// Связь с Error (для throw)
enum NetworkError: Error {
    case timeout
    case serverError(code: Int)
}
10. КЛАСС vs СТРУКТУРА
📖 Определение:
Структура — value type (копируется при присваивании).
Класс — reference type (передается по ссылке).

swift
// Структура (Value Type)
struct Point {
    var x: Int
    var y: Int
}

// Класс (Reference Type)
class Person {
    var name: String
    init(name: String) { self.name = name }
}
🎯 Назначение:
Тип    Когда использовать
Структура    Простые данные, неизменяемость, Value semantics
Класс    Сложная логика, наследование, Reference semantics
🔗 Связи:
Структуры: Equatable, Hashable (автоматически)

Классы: наследование, деинициализаторы (deinit)

Оба: протоколы, свойства, методы

⚠️ Особенности:
Особенность    Структура    Класс
Тип    Value    Reference
Наследование    ❌    ✅
deinit    ❌    ✅
let-константа    ❌ Нельзя изменить свойства    ✅ Можно изменить
Copy    Копия (независимая)    Ссылка (общая)
swift
// Связь с let/var
struct PointValue { var x: Int }
class PointRef { var x: Int; init(x: Int) { self.x = x } }

let point1 = PointValue(x: 1)
point1.x = 2  // ❌ Ошибка!

let point2 = PointRef(x: 1)
point2.x = 2  // ✅ Работает!

// Связь с копированием
var a = PointValue(x: 1)
var b = a
b.x = 2
print(a.x)  // 1 (a не изменился)

var c = PointRef(x: 1)
var d = c
d.x = 2
print(c.x)  // 2 (c изменился!)
📊 Сводная таблица: ВСЕ КОЛЛЕКЦИИ
Тип    Упорядочен    Уникальность    Доступ    Субскрипт
Array    ✅    ❌    По индексу [0]    ✅ Обычное значение (опасно!)
Dictionary    ❌    Ключи уникальны    По ключу ["key"]    ✅ Опционал (безопасно!)
Set    ❌    ✅    contains()    ❌ Нет [index]
Tuple    ✅    N/A    tuple.0    ❌ Нет [0]
🔥 Ключевые связи в Swift
text
Опционалы ↔ if let/guard let
Массивы ↔ indices/contains (безопасность)
Сабскрипты ↔ guard/throws (защита)
Generics ↔ Протоколы (гибкость)
Enum ↔ switch (исчерпываемость)
Классы ↔ Структуры (value vs reference)
🎯 Итог: Карта знаний
text
Базовые типы
    ├── Value Types
    │   ├── Структуры (Struct)
    │   ├── Перечисления (Enum)
    │   ├── Кортежи (Tuple)
    │   └── Коллекции
    │       ├── Array (упорядочен, дубли)
    │       ├── Dictionary (ключ-значение, уникальные ключи)
    │       └── Set (неупорядочен, уникальные)
    │
    ├── Reference Types
    │   └── Классы (Class)
    │
    ├── Опционалы (Optional)
    │   ├── nil безопасность
    │   ├── if let / guard let / ??
    │   └── map / flatMap
    │
    ├── Обобщения (Generics)
    │   ├── <T>
    │   ├── where
    │   └── associatedtype
    │
    ├── Протоколы (Protocols)
    │   ├── Контракт
    │   ├── Extension (дефолтная реализация)
    │   └── Protocol Composition
    │
    └── Сабскрипты (Subscript)
        ├── get / set
        ├── throws
        ├── static
        └── с параметрами
Теперь это ПОЛНАЯ шпаргалка! 📚🔥

________ 
📄 Swift Cheat Sheet: Syntax Sugar & Interview Tricky QuestionsBlock 1. Syntactic Sugar (Clean Syntax)1. Optionals (String?)swiftvar name: String? = "John"

// Approach A: Nil Coalescing Operator (Plan B / One-liner)
let result = name ?? "Anonymous"

// Approach B: Optional Binding (if let) — Available ONLY inside the brackets
if let safeName = name {
    print(safeName) // Works here
}
// safeName is unavailable here

// Approach C: Guard Statement (guard let) — Available FOREVER below the check
guard let safeName = name else { return }
print(safeName) // Works here and anywhere below in this function

// Approach D: Optional Chaining
let firstLetter = name?.first // Safe call. If name is nil, returns nil without crashing
Используйте код с осторожностью.2. Closures & The in KeywordThe in keyword is a boundary. To the left are parameters (names you invent), to the right is the executable code.swiftlet array = ["Swift", "Java"]

// With a custom parameter name
array.forEach { lang in
    print(lang)
}

// Without a parameter name (Shorthand Syntax)
array.forEach { print($0) } // $0 is an automatic name for the current element
Используйте код с осторожностью.3. Basic Subscript (Square Brackets [])swiftstruct Team {
    let players = ["John", "Alex"]
    
    // Syntax: subscript(input) -> output { code }
    subscript(index: Int) -> String {
        players[index]
    }
}
let team = Team()
print(team[1]) // Outputs: Alex
Используйте код с осторожностью.Block 2. Interview "Tricky Questions" (OOP & Collections)Pitfall 1. Array vs. Dictionary Subscriptarray[0] ➡️ returns a regular value. If the index is out of bounds, the application crashes immediately.dict["key"] ➡️ ALWAYS returns an Optional (Value?). If the key is missing, it safely returns nil instead of crashing.Pitfall 2. let vs. var in OOP MutabilityModifying internal data via a subscript:In Structures (Value Type) — works only if the instance is created using var. Using let causes a compilation error.In Classes (Reference Type) — works even if the instance is declared as a let constant!Pitfall 3. Subscripts with Argument LabelsSubscripts can accept multiple parameters and use argument labels, acting exactly like a regular function:swiftstruct TicketFinder {
    subscript(from departure: String, to arrival: String) -> String {
        return "Ticket from \(departure) to \(arrival)"
    }
}
let finder = TicketFinder()
print(finder[from: "London", to: "Paris"]) // Called with argument labels!
Используйте код с осторожностью.Pitfall 4. Static Subscripts (static subscript)You can call a subscript directly on the type itself without creating an instance:swiftstruct AppSettings {
    static subscript(key: String) -> String {
        return "Value for key: \(key)"
    }
}
print(AppSettings["theme"]) // Called directly on the AppSettings struct!
Используйте код с осторожностью.Pitfall 5. Collections Without Integer SubscriptsSet — unordered collection. You cannot fetch an element by a simple integer index like set[0]. It requires Set.Index.Tuple — not a collection at all and has no subscripts. Access elements strictly via dot notation: tuple.0 or tuple.name.Pitfall 6. Where does newValue come from?When writing data via a subscript (e.g., team[0] = "New Player"), the assigned value is automatically placed into an implicit variable named newValue inside the set block.Pitfall 7. Modifying Collections Inside a DictionarySwift allows you to modify an array nested inside a dictionary directly through optional chaining: dict["scores"]?.append(10). These changes are written back to the original dictionary instantly.
