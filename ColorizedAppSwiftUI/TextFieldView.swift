//
//  TextFieldView.swift
//  ColorizedAppSwiftUI
//
//  Created by ikorobov on 13.09.2022.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var text: String
    @Binding var value: Double
    
    @State private var alertPresented = false
    
    var body: some View {
        TextField("", text: $text) { _ in
            withAnimation {
                checkField()
            }
        }
        .frame(width: 55, alignment: .trailing)
        .multilineTextAlignment(.trailing)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.decimalPad)
        .alert(
            "Not that fast!",
            isPresented: $alertPresented,
            actions: {}
        ) {
            Text("Try something between 0 and 255")
        }
    }
}

extension TextFieldView {
    private func checkField() {
        if let value = Int(text), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        alertPresented.toggle()
        value = 0
        text = "0"
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(text: .constant(""), value: .constant(50))
    }
}
