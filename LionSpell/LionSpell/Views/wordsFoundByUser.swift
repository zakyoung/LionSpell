//
//  wordsFoundByUser.swift
//  LionSpell
//
//  Created by Zak Young on 1/14/24.
//

import SwiftUI

struct wordsFoundByUser: View {
    @EnvironmentObject var gameManager: GameManager
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.gray.opacity(0.65))
                .frame(maxWidth: .infinity)
                .frame(height: 55)
            ScrollView(.horizontal){
                HStack{
                    ForEach(gameManager.wordsAlreadyFound.indices.reversed(), id:\.self) {index in
                        Text(gameManager.wordsAlreadyFound[index])
                            .foregroundColor(.black)
                            .font(.system(size: 26))
                            .fontWeight(.medium)
                    }
                }.padding(.leading)
            }
        }
    }
}

#Preview {
    wordsFoundByUser()
        .environmentObject(GameManager(numberOfLetters: 5, sizeOfMinWord: 5, selectedLanguage: language.English, selectedDifficulty: problemSize.five))
}
