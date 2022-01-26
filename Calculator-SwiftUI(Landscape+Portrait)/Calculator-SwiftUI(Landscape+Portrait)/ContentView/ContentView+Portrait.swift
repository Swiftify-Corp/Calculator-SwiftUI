//  Converted by Storyboard to SwiftUI Converter - https://swiftify.com/converter/storyboard2swiftui

import SwiftUI

// --------------------------------------------------------------------------------
// ContentViewController
// --------------------------------------------------------------------------------
extension ContentView {
    
    var portraitBody: some View {
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
                                    digitButtonBuilder("7")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    digitButtonBuilder("8")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                }
                                
                                Group {
                                    digitButtonBuilder("9")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
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
                                    digitButtonBuilder("4")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    digitButtonBuilder("5")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                }
                                
                                Group {
                                    digitButtonBuilder("6")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
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
                                    digitButtonBuilder("1")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    digitButtonBuilder("2")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                }
                                
                                Group {
                                    digitButtonBuilder("3")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    performOperationBuilder("+")
                                        .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                        .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                }
                            }
                            
                            Spacer().frame(dynamicHeight: 1)
                        }
                        
                        Group {
                            HStack() {
                                Group {
                                    performOperationBuilder("±")
                                        .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                        .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    digitButtonBuilder("0")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                }
                                
                                Group {
                                    digitButtonBuilder(".")
                                        .accentColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                                        .background(Color(red: 0.8784314, green: 0.8784314, blue: 0.8784314))
                                    
                                    Spacer().frame(dynamicWidth: 1)
                                    
                                    performOperationBuilder("=")
                                        .accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                                        .background(Color(red: 0.95686275, green: 0.57254905, blue: 0.2509804))
                                }
                            }
                        }
                    }
                }
            }
        }
        .background(Color(red: 0.6, green: 0.6, blue: 0.6))
    }
}
