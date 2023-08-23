//
//  LoginView.swift
//  ios_roamantik_app
//
//  Created by Sebastien Cayetanot on 8/22/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var showRegistration = false
    @State private var showForgotPassword = false
    
    @StateObject private var viewModel = LoginViewModelImpl(service: LoginServiceImpl())
    
   // @State var player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "splash", ofType: "mov")!))
    
  //  @State var player = AVPlayer(url: Bundle.main.url(forResource: "splash", withExtension: "mov")!) // 2

    
    
    init() {
         UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(red: 0, green: (174/255), blue: (239/255), alpha: 1.0),
                   .font : UIFont(name:"Pacifico-Regular", size: 50)!]

    }
    
    var body: some View {
        ZStack() {
            // VideoPlayerView()
            //   .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            //VideoPlayer(player: player)
            //  .frame(width: UIScreen.main.bounds.width, height: //UIScreen.main.bounds.height)
            VStack(){
                Spacer()
                VStack(spacing: 16) {
                    VStack(spacing: 16) {
                        Spacer().frame(maxHeight: 10)
                        
                        InputTextFieldView(text: $viewModel.credentials.email,
                                           placeholder: "Email",
                                           keyboardType: .emailAddress,
                                           sfSymbol: nil)
                        
                        InputPasswordView(password: $viewModel.credentials.password,
                                          placeholder: "Password",
                                          sfSymbol: nil)
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            //ForgotPasswordView()
                            showForgotPassword.toggle()
                        }, label: {
                            Text("Forgot Password?")
                                .foregroundColor(RoamantikColors.cVividBlue)
                        })
                        .font(.system(size: 16, weight: .bold))
                        .sheet(isPresented: $showForgotPassword, content:{
                            ForgotPasswordView()
                        })
                    }
                    
                    VStack(spacing: 16) {
                        ButtonView(title: "Login") {
                            viewModel.login()
                        }
                        
                        HStack {
                            Text("Need an account? ")
                            Button(action: {
                                showRegistration.toggle()
                            }, label: {
                                Text("Signup")
                                    .foregroundColor(RoamantikColors.cVividBlue)
                            })
                            .font(.system(size: 16, weight: .bold))
                            .sheet(isPresented: $showRegistration, content:{
                                RegisterView()
                            })
                        }
                    }
                    Text("Copyright 2023 ")
                    Spacer().frame(maxHeight: 10)
                }
                .padding(.horizontal, 20)
                .background(.ultraThinMaterial, in : RoundedRectangle(cornerRadius: 16.0))
                .ignoresSafeArea()
                .frame(height: 500, alignment: .bottom)
                
            }
        }
        .frame(height: .infinity, alignment: .bottom)
        .navigationTitle("Fizzin")
    }
}

struct LoginViewView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
