//
//  subscriptTasks.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 18.07.2026.
//

import Foundation

struct SubscriptTasksCode {
    static func run() {
        
        // MARK: - 1️⃣: Локализация приложения
        print("1️⃣: Локализация приложения.")

        struct AppLocalization {
            var translations: [String: String] = [
                "login_button": "Войти",
                "logout_button": "Выйти"
            ]
            
            subscript(key: String) -> String {
                return translations[key] ?? "⚠️ Missing translation for key: [\(key)]"
            }
        }

        // Тесты для 1️⃣:
        let localization = AppLocalization()
        print(localization["login_button"]) // "Войти"
        print(localization["register_button"]) // "⚠️ Missing translation for key: [register_button]"
        
        /** В крупных проектах тексты для кнопок и экранов загружаются из файлов локализации (переводов) в виде словаря [String: String]. Если переводчик забыл добавить фразу, интерфейс приложения не должен показывать пустоту или nil.
         */
        
        // MARK: - 🕹️ 2️⃣: Безопасный инвентарь (HeroInventory)
        
        /**Напомню шаблон - работаем с массивом [String], и сабскрипту понадобятся блоки get и set.Коммерческое требование:При чтении (get) вне границ — возвращаем "Empty Slot".При записи (set) вне границ — приложение не падает, а просто игнорирует операцию. */
         
        // MARK: - 2️⃣: Безопасный инвентарь. Коммерческий Middle
        print("2️⃣: Безопасный инвентарь.")

        struct HeroInventory {
            var items: [String] = ["Меч", "Щит", "Зелье"]
            
            subscript(index: Int) -> String {
                get { // Защита: проверяем только ЧИСЛО index. К массиву items пока НЕ обращаемся!
                    guard index >= 0 && index < items.count else { return "empty slot" // // plan B (follback): индекс опасен, возвращаем заглушку
                    }  // Теперь мы на 100% уверены, что индекс безопасен, и приложение не упадет
                    return items[index] // plan A: возвращаем реальный предмет
                }
                set {  // Точно такая же защита для записи
                    guard index >= 0 && index < items.count else {
                        return // Если индекс плохой, просто выходим (return без значения) и игнорируем запись
                    }
                    items[index] = newValue // Если всё хорошо — обновляем значение
                }
            }
        }
        // ✅ Тесты для 2️⃣ (ВНЕ структуры):
                var inventory = HeroInventory()

                // 1. Проверка чтения (GET):
                print(inventory[0])  // "Меч"
                print(inventory[2])  // "Зелье"
                print(inventory[5])  // "empty slot"

                // 2. Проверка записи (SET):
                inventory[1] = "Кольцо"
                print(inventory[1])  // "Кольцо"

                // 3. Попытка записи вне границ:
                inventory[10] = "Алмаз"
                print(inventory[10]) // "empty slot"
            }
        }

      
    
