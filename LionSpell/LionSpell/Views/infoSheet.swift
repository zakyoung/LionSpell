//
//  infoSheet.swift
//  LionSpell
//
//  Created by Zak Young on 1/28/24.
//

import SwiftUI

struct infoSheet: View {
    @Binding var showingInfoSheet: Bool
    @EnvironmentObject var gameManager: GameManager
    var body: some View {
        Form{                
            HStack{
                    Spacer()
                    Button("Dismiss") {
                        showingInfoSheet = false
                    }
            }.listRowBackground(Color.clear)
            Section(header: Text("DIFFICULTY LEVEL")) {
                Picker("DIFFICULTY LEVEL", selection: $gameManager.selectedDifficulty){
                    ForEach(problemSize.allCases){ size in
                        Text("\(size.rawValue)").tag(size)
                    }
                }
                    .pickerStyle(.segmented)
            }
            Section(header:Text("LANGUAGE")){
                Picker("LANGUAGE", selection: $gameManager.selectedLanguage){
                    ForEach(language.allCases){ language in
                        Text("\(language.rawValue)")
                            .tag(language)
                    }
                }.pickerStyle(.segmented)
            }
        }
    }
}

#Preview {
    infoSheet(showingInfoSheet: .constant(true))
}
