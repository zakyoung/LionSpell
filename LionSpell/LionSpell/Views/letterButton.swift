//
//  letterButton.swift
//  LionSpell
//
//  Created by Zak Young on 1/14/24.
//

import SwiftUI

struct letterButton: View {
    @EnvironmentObject var gameManager: GameManager
    let letter: String
    var body: some View {
        let factor: Double = {
            switch gameManager.letterButtons.count {
            case 5:
                return 2.0
            case 6:
                return 2.5
            default:
                return 3.0
            }
        }()
        Button(action: { gameManager.addLetter(letter: letter) }) {
            ZStack {
                letterButtonShapes(factors: factor)
                Text("\(letter)")
                    .foregroundStyle(Color.blue)
                    .fontWeight(.medium)
                    .font(.system(size: 48))
            }
        }.contentShape(letterButtonShapes(factors: factor))
    }
}
#Preview {
    letterButton(letter:"Z")
}
