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

func getAverage(in scores: [String: Int]) -> Double {
    var newScores = scores.merging(danny, uniquingKeysWith: { current, new in new })
    let average = Double(newScores.values.reduce(0, +)) / Double(newScores.values.count)
    return average
}
