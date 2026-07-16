//
//  dictionaryTheory.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 13.07.2026.
//

import Foundation
/*
 🏆 THE GOLDEN RULE (задача 2)
 Словарь, объявленный как let, нельзя изменить. Для добавления элементов используй merging — он создаёт новый словарь.
 */
let scores = ["Ann": 85, "Joe": 92, "Jane": 78]
let danny = ["Danny": 88]

func getAverage(in scores: [String: Int], adding newEntry: [String: Int]) -> Double {
    let updated = scores.merging(newEntry, uniquingKeysWith: { $1 })
    return Double(updated.values.reduce(0, +)) / Double(updated.values.count)
}
// print(getAverage(in: scores, adding: danny))
