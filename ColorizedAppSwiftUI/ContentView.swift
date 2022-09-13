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
                SliderLineView(
                    sliderColor: .green,
                    value: $greenValue.animation()
                )
                SliderLineView(
                    sliderColor: .blue,
                    value: $blueValue.animation()
                )
            }
            .focused($isActive)
            .keyboardType(.numberPad)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isActive = false
                    }
                    
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
