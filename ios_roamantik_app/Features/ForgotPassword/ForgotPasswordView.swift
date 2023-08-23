//
//  ForgotPasswordView.swift
//  ios_roamantik_app
//
//  Created by Sebastien Cayetanot on 8/22/23.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = ForgotPasswordViewModelImpl(service: ForgotPasswordServiceImpl())
    
    init() {
         UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(red: 0, green: (174/255), blue: (239/255), alpha: 1.0),
<<<<<<< HEAD
                   .font : UIFont(name:"Pacifico-Regular", size: 50)!]
=======
                  /* .font : UIFont(name:"Pacifico-Regular", size: 50)!*/]
>>>>>>> 78356b6 (Commit drafted project)

    }
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack(){
                    VStack(spacing: 16) {
                        Spacer().frame(maxHeight: 10)

                        InputTextFieldView(text: $viewModel.email, placeholder: "Email", keyboardType: .emailAddress, sfSymbol: nil)
                        
                        ButtonView(title: "Send Password Reset") {
                            viewModel.sendPasswordReset()
                            presentationMode.wrappedValue.dismiss()
                        }
                        Spacer().frame(maxHeight: 10)

                    }
                    .padding(.horizontal, 15)
                    .background(.ultraThinMaterial, in : RoundedRectangle(cornerRadius: 16.0))
                    .ignoresSafeArea()
                    .frame(height: 500, alignment: .bottom)
                }
            }
<<<<<<< HEAD
            .navigationTitle("Fizzin")
=======
            .navigationTitle("Roamantik")
>>>>>>> 78356b6 (Commit drafted project)
            .applyClose()
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
