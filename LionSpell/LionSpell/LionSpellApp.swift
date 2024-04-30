//
//  LionSpellApp.swift
//  LionSpell
//
//  Created by Zak Young on 1/14/24.
//

import SwiftUI

@main
struct LionSpellApp: App {
    @StateObject var gameManager: GameManager = GameManager(numberOfLetters: 5, sizeOfMinWord: 5, selectedLanguage: language.English, selectedDifficulty: problemSize.five) // Setting to 5 and 5
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameManager)
        }
    }
}
