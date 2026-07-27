//
//  consoleNotesManagerTasksReflect.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 27.07.2026.
//

import Foundation

/*
 📐🚕💨 DevLog: Консольный менеджер заметок

 📅 Период: 25.07.2026 – 27.07.2026

 🧠 ГЛАВНЫЕ ПОБЕДЫ:
 1. Создала файл emodji.swift с Caseless enum для эмодзи
 2. Научилась структурировать консольное меню (repeat-while + switch)
 3. Создала модель Note с id, title, text

 ⚠️ ГРАБЛИ (ошибки, которые запомнила):
 1. guard let !text.isEmpty → guard !text.isEmpty else
    ✅ Решение: guard проверяет Bool, а не разворачивает опционал

 2. while isRunning = true → while isRunning
    ✅ Решение: = присваивание, == сравнение, а isRunning уже Bool

 3. Забывала сохранять результат readLine()
    ✅ Решение: guard let text = readLine(), !text.isEmpty else

 4. Забывала continue после проверки пустоты
    ✅ Решение: continue — пропустить итерацию и выйти из switch

 5. let notes → var notes (если добавляем/удаляем)
    ✅ Решение: var для изменяемых массивов

 🔥 ИНСАЙТЫ (важные выводы):
 1. Emoji лучше выносить в отдельный файл — переиспользуется
 2. enum без case — идеальный контейнер для констант
 3. Структура — фундамент чистого кода

 📌 ⚜️ THE GOLDEN RULES:
 ⚜️ "Caseless enum = namespace for static constants" → enum без case — контейнер
 ⚜️ "readLine() всегда возвращает String?" → проверяй через guard
 ⚜️ "continue = skip current iteration" → не забывай после проверок
 ⚜️ "Structure is the foundation" → структура — основа

 ✅ ПРОГРЕСС:
 emodji.swift — создан ✅
 consoleNotesManagerCode.swift — структура + меню ✅
 consoleNotesManagerTasksReflect.swift — рефлексия ✅
 Git commit — зафиксирован ✅

 🎯 СЛЕДУЮЩИЙ ШАГ:
 Добавить удаление заметок (case "3") и редактирование (case "4")
 */
