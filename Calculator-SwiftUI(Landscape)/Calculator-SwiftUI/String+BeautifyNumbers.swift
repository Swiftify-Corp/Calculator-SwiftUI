//
//  String+BeautifyNumbers.swift
//  Calculator-Storyboard
//
//  Created by Ibrahim Hassan on 20/01/22.
//

import Foundation

extension String {
    static let DecimalDigits = 6

    func beautifyNumbers() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = String.DecimalDigits

        var text = self as NSString
        var numbers = [String]()
        
        guard let regex = try? NSRegularExpression(pattern: "[.0-9]+", options: .caseInsensitive) else {
            return ""
        }
        
        let matches = regex.matches(in: self, options: [], range: NSRange(location: 0, length: text.length))
        numbers = matches.map { text.substring(with: $0.range) }

        for number in numbers {
            text = text.replacingOccurrences(
                of: number,
                with: formatter.string(from: NSNumber(value: Double(number) ?? 0.0)) ?? ""
            ) as NSString
        }
        
        return text as String
    }
}
