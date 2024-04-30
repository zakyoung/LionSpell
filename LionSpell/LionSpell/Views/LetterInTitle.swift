//
//  LetterInTitle.swift
//  LionSpell
//
//  Created by Zak Young on 1/14/24.
//

import SwiftUI

struct LetterInTitle: View {
    let letter: String
    init(letter: String){
        self.letter = letter
    }
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.blue)
                .frame(width: 30, height: 30)
                .cornerRadius(10)
            Text("\(letter)")
                .foregroundColor(.white)
                .font(.system(size: 26))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    LetterInTitle(letter:"L")
}
