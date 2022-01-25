//
//  ViewController.swift
//  Calculator-Storyboard
//
//  Created by Ibrahim Hassan on 20/01/22.
//

import UIKit

class ContentViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var descriptionDisplay: UILabel!
    @IBOutlet weak var memoryDisplay: UILabel!
    @IBOutlet weak var decimalSeparatorButton: UIButton!

    var userIsInTheMiddleOfTyping = false

    private let decimalSeparator = NumberFormatter().decimalSeparator!

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!

        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            if decimalSeparator != digit || !textCurrentlyInDisplay.contains(decimalSeparator) {
                display.text = textCurrentlyInDisplay + digit
            }
        } else {
            switch digit {
                case decimalSeparator:
                    display.text = "0" + decimalSeparator
                case "0":
                    if "0" == display.text {
                        return
                    }
                    fallthrough
                default:
                    display.text = digit
            }
            userIsInTheMiddleOfTyping = true
        }
    }

    var displayValue: Double {
        return (NumberFormatter().number(from: display.text!)?.doubleValue)!
    }

    private var brain = CalculatorBrain()

    private func displayResult() {
        let evaluated = brain.evaluate(using: variables)

        if let error = evaluated.error {
            display.text = error
        } else if let result = evaluated.result {
            display.text = String(result).beautifyNumbers()
        }

        if "" != evaluated.description {
            descriptionDisplay.text = evaluated.description.beautifyNumbers() + (evaluated.isPending ? "…" : "=")
        } else {
            descriptionDisplay.text = " "
        }
    }

    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        displayResult()
    }

    @IBAction func reset(_ sender: UIButton) {
        brain = CalculatorBrain()
        descriptionDisplay.text = " "
        userIsInTheMiddleOfTyping = false
        variables = [String: Double]()
    }

    @IBAction func undo(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping, var text = display.text {
            text.remove(at: text.index(before: text.endIndex))
            if text.isEmpty || "0" == text {
                text = "0"
                userIsInTheMiddleOfTyping = false
            }
            display.text = text
        } else {
            brain.undo()
            displayResult()
        }
    }

    private var variables = [String: Double]() {
        didSet {
            memoryDisplay.text = variables.compactMap { $0 + ":\($1)" }.joined(separator: ", ").beautifyNumbers()
        }
    }

    @IBAction func storeToMemory(_ sender: UIButton) {
        variables["M"] = displayValue
        userIsInTheMiddleOfTyping = false
        displayResult()
    }

    @IBAction func callMemory(_ sender: UIButton) {
        brain.setOperand(variable: "M")
        userIsInTheMiddleOfTyping = false
        displayResult()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        adjustButtonLayout(for: view, isPortrait: traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular)
        decimalSeparatorButton.setTitle(decimalSeparator, for: .normal)

        brain.addUnaryOperation(named: "✅", { [unowned self] operand -> Double in
            self.display.textColor = UIColor.green
            return sqrt(operand)
        }) { "√(" + $0 + ")"
        }
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        adjustButtonLayout(for: view, isPortrait: newCollection.horizontalSizeClass == .compact && newCollection.verticalSizeClass == .regular)
    }

    private func adjustButtonLayout(for view: UIView, isPortrait: Bool) {
        for subview in view.subviews {
            if subview.tag == 1 {
                subview.isHidden = isPortrait
            } else if subview.tag == 2 {
                subview.isHidden = !isPortrait
            }
            if let stack = subview as? UIStackView {
                adjustButtonLayout(for: stack, isPortrait: isPortrait)
            }
        }
    }
}
