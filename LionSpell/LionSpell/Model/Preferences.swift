//
//  Preferences.swift
//  LionSpell
//
//  Created by Zak Young on 1/25/24.
//

import Foundation
enum language: String, CaseIterable, Identifiable{
    case English, French
    var id:String {self.rawValue}
}
enum problemSize: Int, CaseIterable, Identifiable{
    case five = 5
    case six = 6
    case seven = 7
    var id: Int{self.rawValue}
}
struct Preferences{
    // TEST COMMENT
    var languagePreference: language
    var problemSizePreference: problemSize
    init(languagePreference: language, problemSizePreference: problemSize) {
        self.languagePreference = languagePreference
        self.problemSizePreference = problemSizePreference
    }
}
