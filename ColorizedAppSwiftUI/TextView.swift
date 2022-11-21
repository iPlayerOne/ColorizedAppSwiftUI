//
//  TextView.swift
//  ColorizedAppSwiftUI
//
//  Created by ikorobov on 21.11.2022.
//

import SwiftUI

struct TextView: View {
    
    let value: Double
    
    var body: some View {
        Text(value.formatted())
            .frame(width: 35, alignment: .leading)
            .foregroundColor(.white)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(value: 5.0)
    }
}
