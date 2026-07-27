//
//  controlFlowCode.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 24.07.2026.
//

import Foundation

struct ControlFlow {
    static func run() {
        print("▶️ Запуск: Control Flow (Easy)")
              
              // MARK: - 1️⃣: Task
        
        for index in 1...3 {
            print("Итерация номер \(index)")
            /* Итерация номер 1
            Итерация номер 2
            Итерация номер 3 */
        }
        
        var count = 0

        repeat {
            count += 1
            if count == 2 {
                continue
            }
            print(count, terminator: " ")
        } while count < 3
    }
}

