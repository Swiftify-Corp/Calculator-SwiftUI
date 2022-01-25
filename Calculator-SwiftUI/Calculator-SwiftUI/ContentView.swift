//  Converted by Storyboard to SwiftUI Converter - https://swiftify.com/converter/storyboard2swiftui

import SwiftUI

// --------------------------------------------------------------------------------
// ContentViewController
// --------------------------------------------------------------------------------
struct ContentView: View {
    @State private var descriptionDisplay = " "
    @State private var display = "0"
    @State private var memoryDisplay = " "
    
    @State private var brain = CalculatorBrain()
    @State var userIsInTheMiddleOfTyping = false

    @State private var variables = [String: Double]() {
        didSet {
            memoryDisplay = variables.compactMap { $0 + ":\($1)" }.joined(separator: ", ").beautifyNumbers()
        }
    }
        
    var body: some View {
        ZStack(alignment: .topLeading) {
            GeometryReader { geometry in
                VStack() {
                    HStack() {
                        Text(memoryDisplay)
                            .frame(dynamicWidth: 5, dynamicHeight: 0, alignment: .trailing)
                            .font(.system(size: 20, weight: .regular))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(red: 0.0, green: 0.0, blue: 1.0))
                        
                        Spacer().frame(dynamicWidth: 0)
                        
                        Text(descriptionDisplay)
                            .frame(dynamicWidth: 563, dynamicHeight: 0, alignment: .trailing)
                            .font(.system(size: 30, weight: .regular))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color(white: 1.0))
                    }
                    .frame(dynamicWidth: 568, dynamicHeight: 0)
                    
                    Spacer().frame(dynamicHeight: 1)
                    
                    Text(display)
                        .frame(dynamicWidth: 568, dynamicHeight: 25, alignment: .trailing)
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
                                        .frame(dynamicWidth: 141.5, dynamicHeight: 48, alignment: .center)
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
                                        .frame(dynamicWidth: 141, dynamicHeight: 48, alignment: .center)
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
                                        .frame(dynamicWidth: 141.5, dynamicHeight: 48, alignment: .center)
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
                                        .frame(dynamicWidth: 141, dynamicHeight: 48, alignment: .center)
                                }
                                .aspectRatio(contentMode: .fill)
                                .font(.system(size: 30, weight: .regular))
                                .accentColor(Color(white: 1.0))
                                .background(Color(red: 0.0, green: 0.47843137, blue: 1.0))
                            }
                            .frame(dynamicWidth: 568, dynamicHeight: 48)
                            .tag(2)
                            
                            Spacer().frame(dynamicHeight: 1)
                            
                            HStack() {
                                Group {
                                    Button(action: {
                                        reset()
                                    }) {
                                        Text("C").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 1.0, green: 1.0, blue: 0.0))
                                    .tag(1)
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        undo()
                                    }) {
                                        Text("CE").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 1.0, green: 1.0, blue: 0.0))
                                    .tag(1)
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation()
                                    }) {
                                        Text("x²").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    .tag(1)
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation()
                                    }) {
                                        Text("√").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation()
                                    }) {
                                        Text("✅").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                }
                                
                                Group {
                                    Button(action: {
                                        performOperation()
                                    }) {
                                        Text("rand").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation()
                                    }) {
                                        Text("÷").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                    .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                }
                            }
                            .frame(dynamicWidth: 568, dynamicHeight: 48)
                            
                            Spacer().frame(dynamicHeight: 1)
                            
                            HStack() {
                                Group {
                                    Button(action: {
                                        performOperation()
                                    }) {
                                        Text("xʸ").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    .tag(1)
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation()
                                    }) {
                                        Text("eˣ").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    .tag(1)
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation()
                                    }) {
                                        Text("10ˣ").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    .tag(1)
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        touchDigit()
                                    }) {
                                        Text("7").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        touchDigit()
                                    }) {
                                        Text("8").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                }
                                
                                Group {
                                    Button(action: {
                                        touchDigit()
                                    }) {
                                        Text("9").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation()
                                    }) {
                                        Text("×").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                    .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                }
                            }
                            .frame(dynamicWidth: 568, dynamicHeight: 48)
                            
                            Spacer().frame(dynamicHeight: 1)
                            
                            HStack() {
                                Group {
                                    Button(action: {
                                        performOperation()
                                    }) {
                                        Text("x⁻¹").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    .tag(1)
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation()
                                    }) {
                                        Text("ln").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    .tag(1)
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation()
                                    }) {
                                        Text("log").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    .tag(1)
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        touchDigit()
                                    }) {
                                        Text("4").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        touchDigit()
                                    }) {
                                        Text("5").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                }
                                
                                Group {
                                    Button(action: {
                                        touchDigit()
                                    }) {
                                        Text("6").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation()
                                    }) {
                                        Text("-").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                    .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                }
                            }
                            .frame(dynamicWidth: 568, dynamicHeight: 48)
                            
                            Spacer().frame(dynamicHeight: 1)
                            
                            HStack() {
                                Group {
                                    Button(action: {
                                        storeToMemory()
                                    }) {
                                        Text("→M").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(white: 1.0))
                                    .background(Color(red: 0.0, green: 0.47843137, blue: 1.0))
                                    .tag(1)
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation()
                                    }) {
                                        Text("sin").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    .tag(1)
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation()
                                    }) {
                                        Text("cos").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    .tag(1)
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        touchDigit()
                                    }) {
                                        Text("1").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        touchDigit()
                                    }) {
                                        Text("2").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                }
                                
                                Group {
                                    Button(action: {
                                        touchDigit()
                                    }) {
                                        Text("3").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation()
                                    }) {
                                        Text("+").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                    .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                }
                            }
                            .frame(dynamicWidth: 568, dynamicHeight: 48)
                            
                            Spacer().frame(dynamicHeight: 1)
                        }
                        
                        Group {
                            HStack() {
                                Group {
                                    Button(action: {
                                        callMemory()
                                    }) {
                                        Text("M").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(white: 1.0))
                                    .background(Color(red: 0.0, green: 0.47843137, blue: 1.0))
                                    .tag(1)
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation()
                                    }) {
                                        Text("sinh").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    .tag(1)
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation()
                                    }) {
                                        Text("cosh").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8392157, green: 0.8392157, blue: 0.8392157))
                                    .tag(1)
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {}) {
                                        Text("±").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                    .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        touchDigit()
                                    }) {
                                        Text("0").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                }
                                
                                Group {
                                    Button(action: {
                                        touchDigit()
                                    }) {
                                        Text(".").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                    .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    Button(action: {
                                        performOperation()
                                    }) {
                                        Text("=").lineLimit(1).font(.system(size: 30, weight: .regular))
                                            .frame(dynamicWidth: 80.5, dynamicHeight: 48, alignment: .center)
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .font(.system(size: 30, weight: .regular))
                                    .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                    .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                }
                            }
                            .frame(dynamicWidth: 568, dynamicHeight: 48)
                        }
                    }
                    .frame(dynamicWidth: 568, dynamicHeight: 293)
                }
                .frame(dynamicWidth: 568, dynamicHeight: 320)
            }
        }
        .frame(dynamicWidth: 568, dynamicHeight: 320)
        .background(Color(red: 0.6, green: 0.6, blue: 0.6))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (1st generation)"))
            .previewInterfaceOrientation(.landscapeRight)
            .preferredColorScheme(.light)
    }
}

// --------------------------------------------------------------------------------
// ContentView - Actions
// --------------------------------------------------------------------------------
extension ContentView {
    func reset() {
        //TODO: Paste the contents of ContentViewController.reset()
    }
    
    func undo() {
        //TODO: Paste the contents of ContentViewController.undo()
    }
    
    func storeToMemory() {
        //TODO: Paste the contents of ContentViewController.storeToMemory()
    }
    
    func callMemory() {
        //TODO: Paste the contents of ContentViewController.callMemory()
    }
    
    func performOperation() {
        //TODO: Paste the contents of ContentViewController.performOperation()
    }
    
    func touchDigit() {
        //TODO: Paste the contents of ContentViewController.touchDigit()
    }
}

// --------------------------------------------------------------------------------
// Dynamic Size Helper
// --------------------------------------------------------------------------------
struct DynamicSize {
    static private let baseViewWidth: CGFloat = 568.0
    static private let baseViewHeight: CGFloat = 320.0

    static func getHeight(_ height: CGFloat) -> CGFloat {
        return (height / baseViewHeight) * UIScreen.main.bounds.height
    }

    static func getWidth(_ width: CGFloat) -> CGFloat {
        return (width / baseViewWidth) * UIScreen.main.bounds.width
    }

    static func getOffsetX(_ x: CGFloat) -> CGFloat {
        return (x / baseViewWidth) * UIScreen.main.bounds.width
    }

    static func getOffsetY(_ y: CGFloat) -> CGFloat {
        return (y / baseViewHeight) * UIScreen.main.bounds.height
    }
}

// --------------------------------------------------------------------------------
// Frame and Offset Helper
// --------------------------------------------------------------------------------
extension View {
    func frame(dynamicWidth: CGFloat? = nil, dynamicHeight: CGFloat? = nil, alignment: Alignment = .center) -> some View {
        frame(
            width: DynamicSize.getWidth(dynamicWidth ?? 0),
            height: DynamicSize.getHeight(dynamicHeight ?? 0),
            alignment: alignment)
    }

    func offset(dynamicX: CGFloat = 0, dynamicY: CGFloat = 0) -> some View {
        offset(x: DynamicSize.getOffsetX(dynamicX), y: DynamicSize.getOffsetY(dynamicY))
    }
}



//        brain = CalculatorBrain()
//        descriptionDisplay.text = " "
//        userIsInTheMiddleOfTyping = false
//        variables = [String: Double]()
