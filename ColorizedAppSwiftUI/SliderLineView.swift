//
//  SliderLineView.swift
//  ColorizedAppSwiftUI
//
//  Created by ikorobov on 12.09.2022.
//

import SwiftUI

struct SliderLineView: View {
    
    @Binding var value: Double
    @State private var text = ""
    
    let sliderColor: Color
    
    var body: some View {
        HStack {
            TextView(value: value)
            
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(sliderColor)
                .onChange(of: value) { newValue in
                    text = value.formatted()
                }
            
            TextFieldView(text: $text, value: $value)
        }
        .onAppear {
            text = value.formatted()
        }
        .padding( .horizontal, 12.0)
        
    }
}

struct SliderLineView_Previews: PreviewProvider {
    static var previews: some View {
        SliderLineView(value: .constant(100), sliderColor: .red)
    }
}
