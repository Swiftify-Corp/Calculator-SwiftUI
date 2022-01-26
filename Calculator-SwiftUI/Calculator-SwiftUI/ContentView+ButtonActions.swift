//
//  ContentView+ButtonActions.swift
//  Calculator-SwiftUI
//
//  Created by Ibrahim Hassan on 26/01/22.
//

extension ContentView {
    func reset() {
        //TODO: Paste the contents of ContentViewController.reset()
        brain = CalculatorBrain()
        descriptionDisplay = " "
        userIsInTheMiddleOfTyping = false
        variables = [String: Double]()
    }
    
    func undo() {
        //TODO: Paste the contents of ContentViewController.undo()
        if userIsInTheMiddleOfTyping {
            var text = display
            text.remove(at: text.index(before: text.endIndex))
            if text.isEmpty || "0" == text {
                text = "0"
                userIsInTheMiddleOfTyping = false
            }
            display = text
        } else {
            brain.undo()
            displayResult()
        }
    }
    
    private func displayResult() {
        let evaluated = brain.evaluate(using: variables)

        if let error = evaluated.error {
            display = error
        } else if let result = evaluated.result {
            display = String(result).beautifyNumbers()
        }

        if "" != evaluated.description {
            descriptionDisplay = evaluated.description.beautifyNumbers() + (evaluated.isPending ? "…" : "=")
        } else {
            descriptionDisplay = " "
        }
    }
    
    func storeToMemory() {
        //TODO: Paste the contents of ContentViewController.storeToMemory()
        variables["M"] = displayValue
        userIsInTheMiddleOfTyping = false
        displayResult()
    }
    
    func callMemory() {
        //TODO: Paste the contents of ContentViewController.callMemory()
        brain.setOperand(variable: "M")
        userIsInTheMiddleOfTyping = false
        displayResult()
    }
    
    func performOperation(_ mathematicalSymbol: String) {
        //TODO: Paste the contents of ContentViewController.performOperation()
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        brain.performOperation(mathematicalSymbol)
        displayResult()
    }
    
    func touchDigit(_ digit: String) {
        //TODO: Paste the contents of ContentViewController.touchDigit()
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display
            
            if decimalSeparator != digit || !textCurrentlyInDisplay.contains(decimalSeparator) {
                display = textCurrentlyInDisplay + digit
            }
        } else {
            switch digit {
                case decimalSeparator:
                    display = "0" + decimalSeparator
                case "0":
                    if "0" == display {
                        return
                    }
                
                    fallthrough
                default:
                    display = digit
            }
            userIsInTheMiddleOfTyping = true
        }
    }
}
