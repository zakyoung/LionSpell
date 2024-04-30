//
//  currentUserConstruction.swift
//  LionSpell
//
//  Created by Zak Young on 1/14/24.
//

import SwiftUI

struct currentUserConstruction: View {
    @EnvironmentObject var gameManager: GameManager
    var body: some View {
            HStack(spacing:15){
                ForEach(gameManager.currentLettersGuessed.indices,id:\.self){ index in
                    Text("\(gameManager.currentLettersGuessed[index])")
                        .foregroundColor(.black)
                        .font(.system(size: 36))
                        .fontWeight(.bold)
                }
            }.frame(minHeight:50)
    }
}

#Preview {
    currentUserConstruction()
        .environmentObject(GameManager(numberOfLetters: 5, sizeOfMinWord: 5, selectedLanguage: language.English, selectedDifficulty: problemSize.five))
}
