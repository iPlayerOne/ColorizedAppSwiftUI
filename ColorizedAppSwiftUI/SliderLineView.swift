//
//  SliderLineView.swift
//  ColorizedAppSwiftUI
//
//  Created by ikorobov on 12.09.2022.
//

import SwiftUI

struct SliderLineView: View {
    
    let sliderColor: Color
    
    @Binding var value: Double
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .foregroundColor(sliderColor)
                .frame(width: 40)
            
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(sliderColor)
            
            TextFieldView(value: $value)
        }
        .padding( .horizontal, 12.0)
        
    }
}

struct SliderLineView_Previews: PreviewProvider {
    static var previews: some View {
        SliderLineView(sliderColor: .red, value: .constant(100))
    }
}
