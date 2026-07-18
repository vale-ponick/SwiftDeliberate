//
//  cinemaHallTaskCode.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 18.07.2026.
//

import Foundation

struct CinemaHollTaskCode {
    static func run() {
        
    // MARK: - 1️⃣: Система бронирования зала кинотеатра: 'CinemaHall'
    print("1️⃣: Система бронирования зала кинотеатра: 'CinemaHall'.")
        
        struct CinemaHall { // Зал 3х3 (массив массивов строк)
            var seats: [[String]] = [
                ["0", "0", "0"], // Ряд 0
                ["0", "0", "0"], // Ряд 1
                ["0", "0", "0"]  // Ряд 2
            ]
            
            subscript(row: Int, seat: Int) -> String {
                get {
                    guard row >= 0 && row < 3,
                          seat >= 0 && seat < 3 else {
                        return "❌ Error! non-existent seat"
                    }
                    return seats[row][seat]
                }
                set {
                    guard row < seats.count && seat < seats[row].count else {
                        return
                    }
                    seats[row] [seat] = newValue
                } // 👈 1. Закрыли блок set
            } // 👈 2. Закрыли сабскрипт
        }
            
            // Tests for console:
            
            var hall = CinemaHall() // var, чтобы можно было изменять места
            
            // 1. Проверяем место (Ряд 1, Место 1) -> должно быть "0"
            print("Начальный статус: \(hall[1, 1])") // 0
            
            // 2. Бронируем это место (вызывается блок set)
            hall[1, 1] = "X"
            print("После бронирования: \(hall[1, 1])") // теперь там "X"!
            
            // 3. Тестируем защиту от краша (несуществующее место)
            print(hall[5, 9]) // Выведет ❌ Error! non-existent seat, но код НЕ УПАДЕТ!
    }
}
