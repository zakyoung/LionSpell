//
//  Scramble.swift
//  LionSpell
//
//  Created by Zak Young on 1/21/24.
//

import Foundation

struct ScrambleProblem{
    let numberOfLetters: Int
    let sizeOfMinWord: Int
    let userPreferences: Preferences
    init(numberOfLetters:Int,sizeOfMinWord:Int, userPreferenes: Preferences){
        self.numberOfLetters = numberOfLetters
        self.sizeOfMinWord = sizeOfMinWord
        self.userPreferences = userPreferenes
    }
    var languageSource: [String]{
        switch userPreferences.languagePreference {
        case .English:
            return Words.words
        case .French:
            return FrenchWords.frenchWords
        }
    }
    var legalWords:Set<String>{
        Set(languageSource) // Converting to a set to allow for O(1) lookups
    }
    var starterWords:[String]{ // Set of all words that conform to the correct number of unique letters and the correct size of the word.
        var newWords: [String] = []
        for word in languageSource{
            if Set(word).count == userPreferences.problemSizePreference.rawValue && word.count == userPreferences.problemSizePreference.rawValue{ // Right now we want to have word count == the min word size of word
                newWords.append(word)
            }
        }
        return newWords
    }
    lazy var letters: [String] = {
        if let randomWord = starterWords.randomElement() {
            let letterSet = Set(randomWord)
            return letterSet.map { String($0) }
        } else {
            return []
        }
    }()
    lazy var makeableWords: [String] = {
        var words: [String] = []
        for word in languageSource {
            let wordSet = Set(word).map{ String($0) }
            if Set(wordSet).isSubset(of: Set(letters)) {
                words.append(word)
            }
        }
        return words
    }()
    lazy var lettersCorrectOrder:[String] = {
        var letterCounts = [String:Int]()
        for word in makeableWords{
            for lete in letters{
                if word.contains(lete){
                    if let count = letterCounts[lete]{
                        letterCounts[lete] = count + 1
                    }
                    else{
                        letterCounts[lete] = 1
                    }
                }
            }
        }
        return letterCounts.sorted { $0.value > $1.value }.map { $0.key } // This is sorting the keys by the size of the value so that we get the most common letter in the first spot which will go in the middle
    }()
    
    lazy var totalNumberOfPossibleWords: Int = {
        return makeableWords.count
    }()
    lazy var totalPossiblePoints: Int = {
        var possiblePoints: Int = 0
        for word in makeableWords{
            var finalScore = 0
            if word.count == 4{
                finalScore += 1
            }
            if word.count > 4{
                finalScore += word.count
            }
            if Set(word).count == numberOfLetters{
                finalScore += 10
            }
            possiblePoints += finalScore
        }
        return possiblePoints
    }()
    lazy var numberOfPanagrams: Int = {
        var possiblePanagrams: Int = 0
        for word in makeableWords{
            if Set(word).count == numberOfLetters{
                possiblePanagrams += 1
            }
        }
        return possiblePanagrams
    }()
    lazy var makeableWordsByLength: [Int:[String]] = {
        var lengthDictionary = [Int:[String]]()
        for word in makeableWords{
            let wordLength = word.count
            if lengthDictionary[wordLength] == nil{
                lengthDictionary[wordLength] = [word]
            }
            else{
                lengthDictionary[wordLength]?.append(word)
            }
        }
        return lengthDictionary
    }()
    lazy var wordsOfLength: [Int:[Character:Int]] = {
        var result: [Int:[Character:Int]] = [:]
        for (length,words) in makeableWordsByLength{
            var firstLetterCount: [Character:Int] = [:]
            for word in words{
                if let firstChar = word.first{
                    if firstLetterCount[firstChar] == nil{
                        firstLetterCount[firstChar] = 1
                    }
                    else{
                        firstLetterCount[firstChar]? += 1
                    }
                }
            }
            result[length] = firstLetterCount
        }
        return result
    }()
}



