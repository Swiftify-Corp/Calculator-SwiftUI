//
//  ContentView+ButtonActions.swift
//  Calculator-SwiftUI
//
//  Created by Ibrahim Hassan on 26/01/22.
//

extension ContentView {
    func reset() {
        brain = CalculatorBrain()
        descriptionDisplay = " "
        display = "0"
        userIsInTheMiddleOfTyping = false
        variables = [String: Double]()
    }
    
    func undo() {
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
        variables["M"] = displayValue
        userIsInTheMiddleOfTyping = false
        displayResult()
    }
    
    func callMemory() {
        brain.setOperand(variable: "M")
        userIsInTheMiddleOfTyping = false
        displayResult()
    }
    
    func performOperation(_ mathematicalSymbol: String) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        brain.performOperation(mathematicalSymbol)
        displayResult()
    }
    
    func touchDigit(_ digit: String) {
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
