//
//  TextFieldView.swift
//  ColorizedAppSwiftUI
//
//  Created by ikorobov on 13.09.2022.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var value: Double
    @State private var alertPresented = false
    
    var body: some View {
        TextField(
            "\(lround(value))",
            value: $value,
            formatter: NumberFormatter()
        ){ _ in
            checkField()
        }
        .multilineTextAlignment(.trailing)
        .font(.system(size: 19))
        .textFieldStyle(.roundedBorder)
        .background(.white)
        .frame(width: 50)
        .foregroundColor(.black)
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
        let approvedRange = 0...255
        if approvedRange.contains(lround(value)) {
            return
        } else {
            alertPresented.toggle()
            value = 255
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(value: .constant(50))
    }
}
