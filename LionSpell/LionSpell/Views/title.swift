//
//  title.swift
//  LionSpell
//
//  Created by Zak Young on 1/14/24.
//

import SwiftUI

struct title: View {
    var body: some View {
        HStack{
            LetterInTitle(letter:"L")
            LetterInTitle(letter:"I")
            LetterInTitle(letter:"O")
            LetterInTitle(letter:"N")
                .padding([.trailing])
            LetterInTitle(letter:"S")
            LetterInTitle(letter:"P")
            LetterInTitle(letter:"E")
            LetterInTitle(letter:"L")
            LetterInTitle(letter:"L")
        }
    }
}

#Preview {
    title()
}
