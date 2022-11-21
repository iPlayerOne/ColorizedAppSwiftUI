//
//  ContentView.swift
//  ColorizedAppSwiftUI
//
//  Created by ikorobov on 12.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue = Double.random(in: 0...255).rounded()
    @State private var greenValue = Double.random(in: 0...255).rounded()
    @State private var blueValue = Double.random(in: 0...255).rounded()
    
    @FocusState private var currentField: Field?
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.yellow
                .ignoresSafeArea()
                .onTapGesture {
                    currentField = nil
                }
            
            VStack(spacing: 40) {
                ColorView(red: redValue, green: greenValue, blue: blueValue)
                
                VStack {
                    SliderLineView(value: $redValue, sliderColor: .red)
                        .focused($currentField, equals: .red)
                    SliderLineView(value: $greenValue, sliderColor: .green)
                        .focused($currentField, equals: .green)
                    SliderLineView(value: $blueValue, sliderColor: .blue)
                        .focused($currentField, equals: .blue)
                }
                .frame(height: 150)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button(action: previousField) {
                            Image(systemName: "chevron.up")
                        }
                        Button(action: nextField) {
                            Image(systemName: "chevron.down")
                        }
                        Spacer()
                        Button("Done") {
                            currentField = nil
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

extension ContentView {
    private enum Field {
        case red
        case green
        case blue
    }
    
    private func previousField() {
        switch currentField {
            case .red:
                currentField = .green
            case .green:
                currentField = .blue
            case .blue:
                currentField = .red
            case .none:
                currentField = nil
        }
    }
    
    private func nextField() {
        switch currentField {
            case .red:
                currentField = .green
            case .green:
                currentField = .blue
            case .blue:
                currentField = .red
            case .none:
                currentField = nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
