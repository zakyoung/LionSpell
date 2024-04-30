//
//  bottomButtons.swift
//  LionSpell
//
//  Created by Zak Young on 1/14/24.
//

import SwiftUI

struct bottomButtons: View {
    @EnvironmentObject var gameManager: GameManager
    @Binding var showingInfoSheet: Bool
    @Binding var showingHintsSheet: Bool
    func act() -> Void{
        
    }
    var body: some View {
        HStack{
            bottomButton(action:gameManager.shuffleLetters,imageName:"shuffle.circle")
            Spacer()
            bottomButton(action:gameManager.newGame,imageName:"arrow.clockwise.circle")
            Spacer()
            bottomButton(action:{self.showingHintsSheet.toggle()},imageName:"questionmark.square")
                .sheet(isPresented: $showingHintsSheet, content: {
                    hintsSheet(showingHintsSheet: $showingHintsSheet)
                })
            Spacer()
            bottomButton(action:{self.showingInfoSheet.toggle()},imageName:"info.circle")
                .sheet(isPresented: $showingInfoSheet, content: {
                    infoSheet(showingInfoSheet: $showingInfoSheet)
                })
        }.padding()
    }
}
#Preview {
    bottomButtons(showingInfoSheet: .constant(false), showingHintsSheet: .constant(false))
        .environmentObject(GameManager(numberOfLetters: 5, sizeOfMinWord: 5, selectedLanguage: language.English, selectedDifficulty: problemSize.five))
}

