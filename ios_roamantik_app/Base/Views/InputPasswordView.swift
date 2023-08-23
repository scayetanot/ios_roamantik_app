//
//  InputPasswordView.swift
//  ios_roamantik_app
//
//  Created by Sebastien Cayetanot on 8/22/23.
//

import SwiftUI

struct InputPasswordView: View {
    @Binding var password: String
    let placeholder: String
    let sfSymbol: String?
    
    private let textFieldLeading: CGFloat = 30
    
    var body: some View {
        SecureField(placeholder, text: $password)
            .frame(maxWidth: .infinity,
            minHeight: 44)
            .padding(.leading, sfSymbol == nil ? textFieldLeading / 2 : textFieldLeading)
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

struct InputPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InputPasswordView(password: .constant(""), placeholder: "Password", sfSymbol: "lock")
                .previewLayout(.sizeThatFits)
                .previewDisplayName("TextInput with sfsymbol")
                .padding()
            
            InputPasswordView(password: .constant(""), placeholder: "Password", sfSymbol: nil)
                .previewLayout(.sizeThatFits)
                .previewDisplayName("TextInput with sfsymbol")
                .padding()
        }

    }
}

