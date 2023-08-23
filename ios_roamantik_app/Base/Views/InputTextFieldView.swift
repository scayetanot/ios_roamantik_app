//
//  InputTextFieldView.swift
//  ios_roamantik_app
//
//  Created by Sebastien Cayetanot on 8/22/23.
//

import SwiftUI

struct InputTextFieldView: View {
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    let sfSymbol: String?
    
    private let textFieldLeading: CGFloat = 30
    
    var body: some View {
        VStack {
            
            TextField(placeholder, text: $text)
                .frame(maxWidth: .infinity,
                        minHeight: 44)
                .padding(.leading, sfSymbol == nil ? textFieldLeading / 2 : textFieldLeading)
                .keyboardType(keyboardType)
                .background(
                    ZStack(alignment: .leading) {
                        if let systemImage = sfSymbol {
                            Image(systemName: systemImage)
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.leading, 5)
                                .foregroundColor(Color.gray)
                        }
                        RoundedRectangle(cornerRadius: 10,
                                         style: .continuous)
                        .stroke(Color.gray)
                    }
                )
        }
    }
}

struct InputTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            InputTextFieldView(
                text: .constant(""),
                placeholder: "Email",
                keyboardType: .emailAddress,
                sfSymbol: "envelope"
            )
            .previewLayout(.sizeThatFits)
            .previewDisplayName("TextInput with sfsymbol")
            .padding()
            
            InputTextFieldView(
                text: .constant(""),
                placeholder: "First Name",
                keyboardType: .default,
                sfSymbol: nil
            )
            .previewLayout(.sizeThatFits)
            .previewDisplayName("TextInput with no sfsymbol")
            .padding()
        }

    }
}

