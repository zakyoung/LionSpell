//
//  hintsSheet.swift
//  LionSpell
//
//  Created by Zak Young on 1/28/24.
//

import SwiftUI

struct hintsSheet: View {
    @Binding var showingHintsSheet: Bool
    @EnvironmentObject var gameManager: GameManager
    var body: some View {
        Form{
            HStack{
                    Spacer()
                    Button("Dismiss") {
                        showingHintsSheet = false
                    }
                }.listRowBackground(Color.clear)
            Section(header: Text("Summary")) {
                Text("Total number of words: \(gameManager.getTotalNumberOfWords())")
                Text("Total Possible points: \(gameManager.getTotalNumberOfPoints())")
                Text("Number of Panagrams: \(gameManager.getTotalPanagrams())")
            }
            ForEach(Array(gameManager.getWordsOfLength().keys).sorted(),id:\.self){ length in // Here each one is a length
                Section(header: Text("Words of length \(length)")){
                    if let words = gameManager.getWordsOfLength()[length]{
                        ForEach(words.map { ($0.key, $0.value) }, id: \.0) { word, count in
                            Text("\(String(word)): \(count)")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    hintsSheet(showingHintsSheet: .constant(true))
}
