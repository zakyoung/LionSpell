//
//  bottomButton.swift
//  LionSpell
//
//  Created by Zak Young on 1/14/24.
//

import SwiftUI
struct bottomButton: View {
    let action: () -> Void
    let imageName: String
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.gray)
                .frame(width: 40,height:32)
                .opacity(0.35)
                .cornerRadius(5)
            Button(action:action){
                Image(systemName:"\(imageName)")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width:20,height:20)
                
            }
        }
    }
}
