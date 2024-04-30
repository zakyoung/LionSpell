//
//  scoreDisplay.swift
//  LionSpell
//
//  Created by Zak Young on 1/14/24.
//

import SwiftUI

struct scoreDisplay: View {
    @EnvironmentObject var gameManager: GameManager
    var body: some View {
        Text("\(gameManager.currentScore)")
            .foregroundColor(.black)
            .font(.system(size: 36))
            .fontWeight(.bold)
    }
}
#Preview {
    scoreDisplay()
        .environmentObject(GameManager(numberOfLetters: 5, sizeOfMinWord: 5, selectedLanguage: language.English, selectedDifficulty: problemSize.five))
}
