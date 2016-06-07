//
//  ViewController.swift
//  UndoHistoryTDD
//
//  Created by Bojan Stefanovic on 2016-06-06.
//  Copyright © 2016 Bojan Stefanovic. All rights reserved.
//

import UIKit

internal final class ViewController: UIViewController {

    // Cool stuff.
    private var intHistory = UndoHistory(initialValue: [1, 2, 3])

    // Works with structs too.
    private struct AxiomZen {
        var axiom: String
        var age: Int
    }

    // Set first Axiom Zen employee. 😎
    private var axiomZenHistory = UndoHistory(initialValue: AxiomZen(axiom: "Bojan", age: 24))

    // Add newest Axiom Zen employee to Stack
    @IBAction private func addRandomNameAndAgeButtonWasPressed(sender: UIButton) {
        let randomString = randomAlphaNumericString(5)
        let randomNumber = Int(arc4random_uniform(30))

        axiomZenHistory.currentItem = AxiomZen(axiom: randomString, age: randomNumber)
    }

    private func randomAlphaNumericString(length: Int) -> String {
        let allowedChars = "abcdefghijklmnopqrstuvwxyz_–"
        let allowedCharsCount = UInt32(allowedChars.characters.count)
        var randomString = ""

        for _ in (0 ..< length) {
            let randomNumber = Int(arc4random_uniform(allowedCharsCount))
            let newCharacter = allowedChars[allowedChars.startIndex.advancedBy(randomNumber)]
            randomString += String(newCharacter)
        }
        
        return randomString
    }

    // Remove newest Axiom Zen employee from Stack.
    @IBAction private func undoButtonWasPressed(sender: UIButton) {
        axiomZenHistory.undo()
    }

    // Check who the neweset Axiom Zen employee is.
    @IBAction func peekButtonWasPressed(sender: UIButton) {
        print(axiomZenHistory.currentItem)
    }
}
