//
//  optionalsReflect.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 14.07.2026.
//

import Foundation

// Reflection: Fixing [Any] array filtering & discovering compactMap

/*
 1. Problem:
 Tried to filter [Any] elements by type using `array.filter(String($0))`.
 Issue: `filter` expects a Bool condition, and forcing `String($0)` crashes on incompatible types.
 
 2. Solution:
 Use the higher-order method `.compactMap { $0 as? String }`.
 
 3. Key Insights:
 • `compactMap` is specifically designed to filter out `nil` and unwrap optionals simultaneously.
 • Introduced in Swift 4.1 (authored by Max Howell, creator of Homebrew) to unburden `flatMap`.
 • Runs on an O(n) linear algorithm with a single `for-in` loop and `if let` check under the hood.
 
 4.
  ⚜️ THE GOLDEN RULE
  ⚓️ Pattern: 'Nil-filtering pattern' / 'Map to CompactMap upgrade'
   
  💬 "If .map yields an optional, drop .map and go with .compactMap."
   
  🧠 Why: Whenever a transform results in `Type?`, but the final array
     must be ⚡️ flat and `nil`-free, immediately choose `.compactMap`.
  */
/*
 ⚜️ THE GOLDEN RULE
 ⚓️ Pattern: 'Optional Chain Reduction'
  
 💬 "Combine optional chaining with nil-coalescing to handle empty or nil collections in a single line."
  
 🧠 Why: `array?.reduce(0, +) ?? 0` safely bypasses computation if the array is 📦 nil,
    returning a clean fallback value without nested `guard let` blocks.
 */
/*
 ⚜️ THE GOLDEN RULE
 ⚓️ Pattern: 'CompactMap Transformation'
  
 💬 "Use compactMap to filter out nil values and transform remaining elements in one go."
  
 🧠 Why: Instead of filtering first and mapping second, `.compactMap { $0?.uppercased() }`
    accomplishes both tasks in a single ⚡️ O(n) pass, keeping the code clean and optimal.
 */
/*
 ⚜️ THE GOLDEN RULE
 ⚓️ Pattern: 'Dual Optional Binding'
  
 💬 "Unwrap multiple optionals sequentially within a single guard let block, then use ONLY the safe variables."
  
 🧠 Why: Binding variables via `let safeName = name` removes the 📦 Optional wrapper.
    Referencing the original `name` afterwards re-introduces `Optional(...)` into your strings.
 */
/*
 ⚜️ THE GOLDEN RULE
 ⚓️ Pattern: 'Guard vs If-Let Decision'
  
 💬 "Use `guard let` to exit early when data is missing. Use `if let` when you need to execute different logic for both cases."
  
 🧠 Why: `guard let` keeps the "happy path" of your code flat and readable
    by handling errors immediately at the top.
    However, for simple fallback values, an inline `??` operator is often the cleanest choice.
 */
