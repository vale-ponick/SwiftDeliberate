//
//  consoleNotesManagerCode.swift
//  SwiftDeliberate
//
//  Created by Валерия Пономарева on 25.07.2026.
//

import Foundation

struct ConsoleNotesManagerCode {
    
    struct Note {
        let id: Int
        var title: String
        var text: String
    }
    // массив изменяемый + статический -> доступен из ЛЮБОЙ точки структуры
    static var notes: [Note] = [
        Note(id: 1, title: "Idea on Swift", text: "Create file with emoji"),
        Note(id: 2, title: "my errors", text: "Once more, Vale.ponick!"),
        Note(id: 3, title: "Slogan", text: "Don't worry, be happy!")
    ]
    
    static func run() {
        print("▶️ Запуск: ConsoleNotesManagerCode")
        print("📝 Console Notes Manager")
        
        var isRunning = true
        
        while isRunning {
            print("\n\(Emoji.Navigation.menu) --- MAIN MENU: ---")
            print("\(Emoji.Numbers.one) \(Emoji.Commands.list) Show notes")
            print("\(Emoji.Numbers.two) \(Emoji.Navigation.menu) Create note")
            print("\(Emoji.Numbers.zero) \(Emoji.Commands.exit) Exit.Bye, Vale.ponick!")
            print("Enter number: ", terminator: "")
            
            if let input = readLine() {
                switch input {
                case "1":
                    print("\n\(Emoji.Commands.list) MY NOTES:")
                    if notes.isEmpty {
                        print("\(Emoji.DataState.empty) List is empty")
                    } else {
                        for note in notes {
                            print("\(note.id). \(Emoji.Commands.show) \(note.title): \(note.text)")
                        }
                    }
                case "2":
                    print("\n\(Emoji.User.new) Enter title: ", terminator: "")
                    
                    if let titleInput = readLine(), !titleInput.isEmpty {
                        
                        print("\(Emoji.Navigation.menu) Enter text: ", terminator: "")
                        
                        if let textInput = readLine() {
                            let newId = ConsoleNotesManagerCode.notes.count + 1
                            let newNote = Note(id: newId, title: titleInput, text: textInput)
                            ConsoleNotesManagerCode.notes.append(newNote)
                            
                            print("\(Emoji.Commands.success) \(Emoji.DataState.saved) Note added!")
                        }
                        
                    } else {
                        print("\(Emoji.Commands.error) Error: Title can't be empty!")
                    }
                case "0":
                    print("\n\(Emoji.Commands.exit) Bye!App is complete")
                    isRunning = false
                default:
                    print("\n\(Emoji.Commands.error) Incorrect input! Try again")
                }
            }
        }

    }
}
