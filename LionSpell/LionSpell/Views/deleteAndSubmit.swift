//
//  deleteAndSubmit.swift
//  LionSpell
//
//  Created by Zak Young on 1/14/24.
//

import SwiftUI

struct deleteAndSubmit: View {
    @EnvironmentObject var gameManager: GameManager
    var body: some View {
        HStack(){
            Button(action:gameManager.deleteLetter){
                Image(systemName:"delete.left")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width:25,height:30)
                    
            }
            .disabled(gameManager.isEmpty)
            Spacer()
            Button(action:gameManager.submitWord){
                Image(systemName:"square.and.arrow.up")
                    .resizable()
                    .foregroundColor(gameManager.isRealWord ? Color(red:0.0,green:0.75,blue:0.2) : .gray)
                    .frame(width:25,height:30)
                    
            }
            .disabled(!gameManager.isRealWord)
        }.padding()
    }
}

#Preview {
    deleteAndSubmit()
        .environmentObject(GameManager(numberOfLetters: 5, sizeOfMinWord: 5, selectedLanguage: language.English, selectedDifficulty: problemSize.five))
}
