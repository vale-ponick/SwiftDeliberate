//
📜 ТЗ: 🏔️📦 СУНДУК БИЛЬБО БЭГГИНСА (Easy + get/set)

/**
 Бильбо вернулся в Шир и сложил сокровища в сундук. 
 Он хочет быстро проверять, что лежит под номером (get), 
 и заменять вещи (set), если решит переложить их.
 
 🏗️ ЗАДАНИЕ:
 1. Структура BilboBagginsChest.
 2. Свойство items: [String] с 4 вещами:
    [0] "💎 Arkenstone"
    [1] "🪙 Gold of Erebor"
    [2] "🗡️ Sting"
    [3] "🛡️ Mithril Chainmail"
 3. Сабскрипт subscript(index: Int) -> String с get и set.
 4. Сабскрипт не добавляет элементы, только обновляет существующие.
 
 🛡️ БЕЗОПАСНОСТЬ:
 
 | Операция | Условие | Результат |
 |----------|---------|-----------|
 | get | Индекс существует | Возвращает сокровище |
 | get | Индекс вне диапазона | "📦 Such chest does not exist" |
 | set | Индекс существует | items[index] = newValue |
 | set | Индекс вне диапазона | return (игнорируем) |
 
 🧥 ЧТО БИЛЬБО КЛАДЁТ (set):
 - Индекс 2: "🧣 Silk vest with gold buttons" (вместо Жала)
 - Индекс 3: "🧙‍♂️ Old travel cloak" (вместо кольчуги)
 
 🧪 ТЕСТЫ:
 var chest = BilboBagginsChest()
 
 print(chest[0])  // 💎 Arkenstone
 print(chest[2])  // 🗡️ Sting
 print(chest[4])  // 📦 Such chest does not exist
 print(chest[-1]) // 📦 Such chest does not exist
 
 chest[2] = "🧣 Silk vest with gold buttons"
 print(chest[2])  // 🧣 Silk vest with gold buttons
 
 chest[3] = "🧙‍♂️ Old travel cloak"
 print(chest[3])  // 🧙‍♂️ Old travel cloak
 
 chest[5] = "💰 Secret gold" // игнорируется
 print(chest[5])  // 📦 Such chest does not exist
 
 🏆 ЗОЛОТОЕ ПРАВИЛО:
 «Прежде чем заглянуть в сундук — проверь, есть ли там полка с этим номером».
 В коде: используй `items.indices.contains(index)` вместо ручной проверки.
 
 💬 Commit: "feat: add BilboBagginsChest with safe subscript (get/set)"
 */
