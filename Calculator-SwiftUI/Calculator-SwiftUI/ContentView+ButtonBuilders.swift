//
//  ContentView+ButtonBuilders.swift
//  Calculator-SwiftUI
//
//  Created by Ibrahim Hassan on 26/01/22.
//

extension ContentView {
    func performOperationBuilder(_ operation: String) -> some View {
        Button(action: {
            performOperation(operation)
        }) {
            let operation = Text(operation).lineLimit(1).font(.system(size: 30, weight: .regular))
                
            operation.frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
        }
        .aspectRatio(contentMode: .fill)
        .font(.system(size: 30, weight: .regular))
    }
    
    func digitButtonBuilder(_ number: String) -> some View {
        Button(action: {
            touchDigit(number)
        }) {
            let number = Text(number).lineLimit(1).font(.system(size: 30, weight: .regular))
            
            number.frame(dynamicWidth: 80, dynamicHeight: 48, alignment: .center)
        }
        .aspectRatio(contentMode: .fill)
        .font(.system(size: 30, weight: .regular))
        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
        .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
    }
}
