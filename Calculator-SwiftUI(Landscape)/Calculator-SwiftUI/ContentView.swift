//  Converted by Storyboard to SwiftUI Converter - https://swiftify.com/converter/storyboard2swiftui

import SwiftUI

// --------------------------------------------------------------------------------
// ContentViewController
// --------------------------------------------------------------------------------
struct ContentView: View {
    @State var descriptionDisplay = " "
    @State var display = "0"
    @State var memoryDisplay = " "
    
    @State var brain = CalculatorBrain()
    @State var userIsInTheMiddleOfTyping = false

    @State var variables = [String: Double]() {
        didSet {
            memoryDisplay = variables.compactMap { $0 + ":\($1)" }.joined(separator: ", ").beautifyNumbers()
        }
    }
    
    var displayValue: Double {
        return (NumberFormatter().number(from: display)?.doubleValue) ?? 0.0
    }
    
    var decimalSeparator: String {
        return NumberFormatter().decimalSeparator ?? ""
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            GeometryReader { geometry in
                VStack() {
                    HStack() {
                        Text(memoryDisplay)
                            .frame(dynamicWidth: 5, dynamicHeight: 36, alignment: .trailing)
                            .font(.system(size: 20, weight: .regular))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(red: 0.0, green: 0.0, blue: 1.0))
                        
                        Spacer().frame(dynamicWidth: 0)
                        
                        Text(descriptionDisplay)
                            .frame(dynamicWidth: 315, dynamicHeight: 36, alignment: .trailing)
                            .font(.system(size: 30, weight: .regular))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(white: 1.0))
                    }
                    .frame(dynamicWidth: 320, dynamicHeight: 36)
                    
                    Spacer().frame(dynamicHeight: 1)
                    
                    Text(display)
                        .frame(dynamicWidth: 320, dynamicHeight: 48, alignment: .trailing)
                        .font(.system(size: 40, weight: .regular))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(white: 1.0))
                    
                    Spacer().frame(dynamicHeight: 1)
                    
                    VStack() {
                        Group {
                            HStack() {
                                Button(action: {
                                    reset()
                                }) {
                                    Text("C").lineLimit(1).font(.system(size: 30, weight: .regular))
                                        .frame(dynamicWidth: 79.5, dynamicHeight: 79.5, alignment: .center)
                                }
                                .aspectRatio(contentMode: .fill)
                                .font(.system(size: 30, weight: .regular))
                                .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                .background(Color(red: 1.0, green: 1.0, blue: 0.0))
                                
                                Spacer().frame(dynamicWidth: 1)
                                
                                Button(action: {
                                    undo()
                                }) {
                                    Text("CE").lineLimit(1).font(.system(size: 30, weight: .regular))
                                        .frame(dynamicWidth: 79, dynamicHeight: 79.5, alignment: .center)
                                }
                                .aspectRatio(contentMode: .fill)
                                .font(.system(size: 30, weight: .regular))
                                .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                .background(Color(red: 1.0, green: 1.0, blue: 0.0))
                                
                                Spacer().frame(dynamicWidth: 1)
                                
                                Button(action: {
                                    storeToMemory()
                                }) {
                                    Text("→M").lineLimit(1).font(.system(size: 30, weight: .regular))
                                        .frame(dynamicWidth: 79.5, dynamicHeight: 79.5, alignment: .center)
                                }
                                .aspectRatio(contentMode: .fill)
                                .font(.system(size: 30, weight: .regular))
                                .accentColor(Color(white: 1.0))
                                .background(Color(red: 0.0, green: 0.47843137, blue: 1.0))
                                
                                Spacer().frame(dynamicWidth: 1)
                                
                                Button(action: {
                                    callMemory()
                                }) {
                                    Text("M").lineLimit(1).font(.system(size: 30, weight: .regular))
                                        .frame(dynamicWidth: 79, dynamicHeight: 79.5, alignment: .center)
                                }
                                .aspectRatio(contentMode: .fill)
                                .font(.system(size: 30, weight: .regular))
                                .accentColor(Color(white: 1.0))
                                .background(Color(red: 0.0, green: 0.47843137, blue: 1.0))
                            }
                            .frame(dynamicWidth: 320, dynamicHeight: 79.5)
                            .tag(2)
                            
                            Spacer().frame(dynamicHeight: 1)
                            
                            HStack() {
                                Group {
                                    Button(action: {
                                        reset()
                                    }) {
                                        Text("C").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 0, dynamicHeight: 79.5, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 1.0, green: 1.0, blue: 0.0))
                                    .isHidden(true, remove: true)
                                    .tag(1)
                                    
                                    Button(action: {
                                        undo()
                                    }) {
                                        Text("CE").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 0, dynamicHeight: 79.5, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 1.0, green: 1.0, blue: 0.0))
                                    .isHidden(true, remove: true)
                                    .tag(1)
                                    
                                    performOperationBuilder("x²")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                        .isHidden(true, remove: true)
                                        .tag(1)
                                    
                                    performOperationBuilder("√")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    performOperationBuilder("✅")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                }
                                
                                Group {
                                    performOperationBuilder("rand")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    performOperationBuilder("÷")
                                        .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                        .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                }
                            }
                            .frame(dynamicWidth: 320, dynamicHeight: 79.5)
                            
                            Spacer().frame(dynamicHeight: 1)
                            
                            HStack() {
                                Group {
                                    performOperationBuilder("xʸ")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                        .isHidden(true, remove: true)
                                        .tag(1)
                                    
                                    performOperationBuilder("eˣ")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                        .isHidden(true, remove: true)
                                        .tag(1)
                                    
                                    performOperationBuilder("10ˣ")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                        .isHidden(true, remove: true)
                                        .tag(1)
                                    
                                    digitButtonBuilder("7")
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    digitButtonBuilder("8")
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                }
                                
                                Group {
                                    digitButtonBuilder("9")
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    performOperationBuilder("×")
                                        .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                        .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                }
                            }
                            .frame(dynamicWidth: 320, dynamicHeight: 79.5)
                            
                            Spacer().frame(dynamicHeight: 1)
                            
                            HStack() {
                                Group {
                                    performOperationBuilder("x⁻¹")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                        .isHidden(true, remove: true)
                                        .tag(1)
                                    
                                    performOperationBuilder("ln")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                        .isHidden(true, remove: true)
                                        .tag(1)
                                    
                                    performOperationBuilder("log")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                        .isHidden(true, remove: true)
                                        .tag(1)
                                    
                                    digitButtonBuilder("4")
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    digitButtonBuilder("5")
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                }
                                
                                Group {
                                    digitButtonBuilder("6")
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    performOperationBuilder("-")
                                        .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                        .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                }
                            }
                            .frame(dynamicWidth: 320, dynamicHeight: 79.5)
                            
                            Spacer().frame(dynamicHeight: 1)
                            
                            HStack() {
                                Group {
                                    performOperationBuilder("→M")
                                        .accentColor(Color(white: 1.0))
                                        .background(Color(red: 0.0, green: 0.47843137, blue: 1.0))
                                        .isHidden(true, remove: true)
                                        .tag(1)
                                    
                                    performOperationBuilder("sin")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                        .isHidden(true, remove: true)
                                        .tag(1)
                                    
                                    performOperationBuilder("cos")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                        .isHidden(true, remove: true)
                                        .tag(1)
                                    
                                    digitButtonBuilder("1")
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    digitButtonBuilder("2")
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                }
                                
                                Group {
                                    digitButtonBuilder("3")
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    performOperationBuilder("+")
                                        .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                        .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                }
                            }
                            .frame(dynamicWidth: 320, dynamicHeight: 79.5)
                            
                            Spacer().frame(dynamicHeight: 1)
                        }
                        
                        Group {
                            HStack() {
                                Group {
                                    performOperationBuilder("M")
                                        .accentColor(Color(white: 1.0))
                                        .background(Color(red: 0.0, green: 0.47843137, blue: 1.0))
                                        .isHidden(true, remove: true)
                                        .tag(1)
                                    
                                    performOperationBuilder("sinh")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                        .isHidden(true, remove: true)
                                        .tag(1)
                                    
                                    performOperationBuilder("cosh")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                        .isHidden(true, remove: true)
                                        .tag(1)
                                    
                                    performOperationBuilder("±")
                                        .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                        .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    digitButtonBuilder("0")
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                }
                                
                                Group {
                                    digitButtonBuilder(".")
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    performOperationBuilder("=")
                                        .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                        .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                }
                            }
                            .frame(dynamicWidth: 320, dynamicHeight: 79.5)
                        }
                    }
                    .frame(dynamicWidth: 320, dynamicHeight: 482)
                }
                .frame(dynamicWidth: 320, dynamicHeight: 568)
            }
        }
        .frame(dynamicWidth: 320, dynamicHeight: 568)
        .background(Color(red: 0.6, green: 0.6, blue: 0.6))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (1st generation)"))
            .previewInterfaceOrientation(.portrait)
            .preferredColorScheme(.light)
    }
}
