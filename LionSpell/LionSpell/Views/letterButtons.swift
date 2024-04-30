//
//  letterButtons.swift
//  LionSpell
//
//  Created by Zak Young on 1/14/24.
//

import SwiftUI

struct letterButtons: View {
    @EnvironmentObject var gameManager: GameManager
    var body: some View {
            ZStack{
                if let firstLetter = gameManager.letterButtons.first{
                    letterButton(letter: firstLetter)
                        .foregroundColor(Color.yellow)
                }
                ForEach(gameManager.letterButtons.indices.dropFirst(),id:\.self){ index in
                    letterButton(letter:"\(gameManager.letterButtons[index])")
                        .offset(off(index: index - 1, total: gameManager.letterButtons.count - 1, radius: 100,level: gameManager.letterButtons.count))
                        .foregroundColor(Color.gray)
                    
                }
            }
    }
}
func off(index: Int, total: Int, radius: CGFloat, level:Int) -> CGSize {
    // This function is attempting to create a circle based off the index and the number of elements
    switch level{
    case 5:
        let angle = 2 * .pi / CGFloat(total) * CGFloat(index) + .pi / 4
        let xOffset = radius * cos(angle)
        let yOffset = radius * sin(angle)
        return CGSize(width: xOffset, height: yOffset)
    case 6:
        let angle = 2 * .pi / CGFloat(total) * CGFloat(index) + .pi/8
        let xOffset = radius * cos(angle)
        let yOffset = radius * sin(angle)
        return CGSize(width: xOffset, height: yOffset)
    default:
        let angle = 2 * .pi / CGFloat(total) * CGFloat(index) + .pi / 6
        let xOffset = radius * cos(angle)
        let yOffset = radius * sin(angle)
        return CGSize(width: xOffset, height: yOffset)
    }
    }

#Preview {
    letterButtons()
        .environmentObject(GameManager(numberOfLetters: 6, sizeOfMinWord: 6, selectedLanguage: language.English, selectedDifficulty: problemSize.six))
}
