//
//  ContentView.swift
//  ColorizedAppSwiftUI
//
//  Created by ikorobov on 12.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue = Double.random(in: 0...255)
    @State private var greenValue = Double.random(in: 0...255)
    @State private var blueValue = Double.random(in: 0...255)
    
    @FocusState private var isActive: Bool
    @FocusState private var currentField: Field?
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.yellow.ignoresSafeArea()
            
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 150)
                    .foregroundColor(
                        Color(
                            red: redValue/255,
                            green: greenValue/255,
                            blue: blueValue/255
                        )
                    )
                    .padding()
                
                SliderLineView(
                    sliderColor: .red,
                    value: $redValue.animation()
                )
                .focused($currentField, equals:.red)
                
                SliderLineView(
                    sliderColor: .green,
                    value: $greenValue.animation()
                )
                .focused($currentField, equals: .green)
                
                SliderLineView(
                    sliderColor: .blue,
                    value: $blueValue.animation()
                )
                .focused($currentField, equals: .blue)
            }
            .focused($isActive)
            .keyboardType(.numberPad)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button(
                        action: { previousField() },
                        label:{ Image(systemName: "chevron.up") }
                    )
                        .disabled(!isPreviousPossible())
                    Button(
                        action: { nextField() },
                        label:{ Image(systemName: "chevron.down") }
                    )
                        .disabled(!isNextPossible())
                    Spacer()
                    Button("Done") {
                        isActive = false
                    }
                    
                }
            }
        }
    }
}

extension ContentView {
    enum Field: Int, CaseIterable {
        case red, green, blue
    }
    
    private func previousField() {
        currentField = currentField.map {
            Field(rawValue: $0.rawValue - 1) ?? .red
        }
    }

    private func nextField() {
        currentField = currentField.map {
            Field(rawValue: $0.rawValue + 1) ?? .green
        }
    }
    
    private func isPreviousPossible() -> Bool {
        guard let focusedField = currentField else {
            return false
        }
        return focusedField.rawValue > 0
    }

    private func isNextPossible() -> Bool {
        guard let focusedField = currentField else {
            return false
        }
        return focusedField.rawValue < Field.allCases.count - 1
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
