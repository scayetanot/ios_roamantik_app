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
    
<<<<<<< HEAD
   // @State var player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "splash", ofType: "mov")!))
    
  //  @State var player = AVPlayer(url: Bundle.main.url(forResource: "splash", withExtension: "mov")!) // 2

=======
    @State private var imageOffsets: [CGPoint] = Array(repeating: CGPoint.zero, count: 15)
    @State private var showingOverlay = true
        
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
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
        ZStack() {
<<<<<<< HEAD
            // VideoPlayerView()
            //   .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            //VideoPlayer(player: player)
            //  .frame(width: UIScreen.main.bounds.width, height: //UIScreen.main.bounds.height)
=======
            ForEach(0..<15) { index in
                Image("splash_\(String(index))")
                    .resizable()
                    .frame(width: 200, height: 150)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(24.0)
                    .position(
                        x: imageOffsets[index].x+20,
                        y: imageOffsets[index].y+20
                    )
            }
            
>>>>>>> 78356b6 (Commit drafted project)
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
<<<<<<< HEAD
        .frame(height: .infinity, alignment: .bottom)
        .navigationTitle("Fizzin")
=======
        .ignoresSafeArea()
        .onAppear {
            for index in 0..<15 {
                imageOffsets[index] = CGPoint(x: .random(in: 0..<screenWidth), y: .random(in: 0..<screenHeight))
            }
        }
        .navigationTitle("Roamantik")
>>>>>>> 78356b6 (Commit drafted project)
    }
}

struct LoginViewView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
