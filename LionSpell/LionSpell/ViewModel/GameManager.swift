//
//  GameManager.swift
//  LionSpell
//
//  Created by Zak Young on 1/21/24.
//

import Foundation
class GameManager: ObservableObject{
    @Published var numberOfLetters:Int
    var sizeOfMinWord:Int
    var scramble: ScrambleProblem
    @Published var letterButtons:[String]
    @Published var currentScore: Int = 0
    @Published var isRealWord: Bool = false
    @Published var isEmpty: Bool = true // This will be used so that the delete button is greyed out when their are no typed letters
    @Published var selectedLanguage: language{
        didSet{
            newGame()
        }
    }
    @Published var selectedDifficulty: problemSize{
        didSet{
            numberOfLetters = selectedDifficulty.rawValue
            sizeOfMinWord = selectedDifficulty.rawValue
            newGame()
        }
    }
    @Published var currentLettersGuessed: [String] = []{
        didSet{
            let word: String = currentLettersGuessed.joined(separator: "")
            if (scramble.legalWords.contains(word) && !wordsAlreadyFound.contains(word)){
                isRealWord = true
            }
            else{
                isRealWord = false
            }
        }
    }
    @Published var wordsAlreadyFound: [String] = []
    init(numberOfLetters:Int,sizeOfMinWord:Int,selectedLanguage:language,selectedDifficulty:problemSize) {
        self.numberOfLetters = numberOfLetters
        self.sizeOfMinWord = sizeOfMinWord
        let pref: Preferences = Preferences(languagePreference: selectedLanguage, problemSizePreference: selectedDifficulty)
        self.selectedLanguage = selectedLanguage
        self.selectedDifficulty = selectedDifficulty
        scramble = ScrambleProblem(numberOfLetters: numberOfLetters, sizeOfMinWord: sizeOfMinWord, userPreferenes: pref )
        letterButtons = scramble.lettersCorrectOrder
    }
    func newGame(){ // Clear everything and start from scratch
        let pref: Preferences = Preferences(languagePreference: selectedLanguage, problemSizePreference: selectedDifficulty)
        scramble = ScrambleProblem(numberOfLetters: numberOfLetters, sizeOfMinWord: sizeOfMinWord, userPreferenes: pref )
        letterButtons = scramble.lettersCorrectOrder
        shuffleLetters()
        currentScore = 0
        isRealWord = false
        isEmpty = true
        currentLettersGuessed = []
        wordsAlreadyFound = []
    }
    func submitWord(){ // Check to make sure that the word is real and that the word is not already found then clear out the letters guessed
        let word: String = currentLettersGuessed.joined(separator: "")
        if (isRealWord && !wordsAlreadyFound.contains(word)){
            wordsAlreadyFound.append(word)
            currentScore += wordScoreValue(word: word)
            isEmpty = true
            currentLettersGuessed = []
        }
    }
    private func wordScoreValue(word:String) -> Int{ // when word uses all of the letters 10 extra points are added.
        var finalScore = 0;
        if word.count == 4{
            finalScore += 1
        }
        if word.count > 4{
            finalScore += word.count
        }
        if Set(word).count == numberOfLetters{
            finalScore += 10
        }
        return finalScore
    }
    func addLetter(letter:String) -> Void{
        currentLettersGuessed.append(letter)
        isEmpty = false
    }
    func deleteLetter() -> Void{
        currentLettersGuessed.removeLast()
        if (currentLettersGuessed.isEmpty){
            isEmpty = true
        }
    }
    func shuffleLetters(){
        let firstElement = letterButtons.first
        var otherElements = letterButtons.dropFirst()
        otherElements.shuffle()
        letterButtons = [firstElement!] + otherElements
    }
    func getTotalNumberOfWords() -> Int{
        return scramble.makeableWords.count
    }
    func getTotalNumberOfPoints() -> Int{
        return scramble.totalPossiblePoints
    }
    func getTotalPanagrams() -> Int{
        return scramble.numberOfPanagrams
    }
    func getWordsOfLength () -> [Int:[Character:Int]]{
        return scramble.wordsOfLength
    }
}
