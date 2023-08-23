//
//  RegisterView.swift
//  ios_roamantik_app
//
//  Created by Sebastien Cayetanot on 8/22/23.
//

import SwiftUI

struct RegisterView: View {
    
<<<<<<< HEAD
    @StateObject private var viewModel = RegistrationViewModelImpl(service: RegistrationServiceImpl()
    )
=======
    @StateObject private var viewModel = RegistrationViewModelImpl(service: RegistrationServiceImpl())
>>>>>>> 78356b6 (Commit drafted project)
    
    init() {
         UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(red: 0, green: (174/255), blue: (239/255), alpha: 1.0),
<<<<<<< HEAD
                   .font : UIFont(name:"Pacifico-Regular", size: 50)!]
=======
                  /* .font : UIFont(name:"Pacifico-Regular", size: 50)*/]
>>>>>>> 78356b6 (Commit drafted project)

    }
    
    var body: some View {
        NavigationView {
            ZStack() {
                VStack() {
                    Spacer()
                    VStack(spacing: 32) {
                        VStack(spacing: 16) {
                            Spacer().frame(maxHeight: 10)
                            
                            InputTextFieldView(text: $viewModel.userDetails.username, placeholder: "Username", keyboardType: .default, sfSymbol: nil)
                            
                            InputTextFieldView(text: $viewModel.userDetails.email, placeholder: "Email", keyboardType: .emailAddress, sfSymbol: nil)
                            
                            InputPasswordView(password: $viewModel.userDetails.password, placeholder: "Password", sfSymbol: nil)
                        }
                        
                        ButtonView(title: "Sign Up") {
                            viewModel.register()
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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
