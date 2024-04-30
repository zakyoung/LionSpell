//
//  ContentView.swift
//  LionSpell
//
//  Created by Zak Young on 1/14/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gameManager: GameManager
    @State var showingInfoSheet = false
    @State var showingHintsSheet = false
    var body: some View {
        VStack {
            title()
            Spacer()
            wordsFoundByUser()
            currentUserConstruction()
            letterButtons()
                .frame(width: 400,height: 370.0)
            deleteAndSubmit()
            scoreDisplay()
            bottomButtons(showingInfoSheet: $showingInfoSheet, showingHintsSheet: $showingHintsSheet)
        }.background(Color(red: 0.53, green: 0.76, blue: 0.76))
    }
}

#Preview {
    ContentView()
        .environmentObject(GameManager(numberOfLetters: 5, sizeOfMinWord: 5, selectedLanguage: language.English, selectedDifficulty: problemSize.five))
}
