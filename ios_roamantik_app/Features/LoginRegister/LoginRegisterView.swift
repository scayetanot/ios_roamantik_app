//
//  LoginView.swift
//  ios_roamantik_app
//
//  Created by Sebastien Cayetanot on 8/22/23.
//

import SwiftUI

struct LoginRegisterView: View {
    
    @State private var showRegistration = false
    @State private var showForgotPassword = false
    
    @StateObject private var viewModel = LoginViewModelImpl(service: LoginServiceImpl())
    
    @State private var imageOffsets: [CGPoint] = Array(repeating: CGPoint.zero, count: 15)
    @State private var showingOverlay = true
            
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    
    var body: some View {
        NavigationView {
            ZStack() {
                VStack() {
                    HStack(){
                        Text("Roamantik")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(RoamantikColors.cSoftBeige)
                            .frame(alignment: .top)
                        
                    }
                    .padding(.top, 80)
                    Spacer()
                    VStack(spacing: 16) {
                        HStack() {
                            Spacer()
                            Button(action: {
                                self.showRegistration = false
                            }, label: {
                                Text("Sign-In")
                                    .foregroundColor(showRegistration ? RoamantikColors.cSoftBeige : RoamantikColors.cDeepBlue)
                                    .underline(color: showRegistration ? .clear : RoamantikColors.cDeepBlue)
                                    .fontWeight(showRegistration ? .none : .bold)
                            })
                            Spacer()
                            Button(action: {
                                self.showRegistration = true
                            }, label: {
                                Text("Sign-Up")
                                    .foregroundColor(showRegistration ? RoamantikColors.cDeepBlue : RoamantikColors.cSoftBeige)
                                    .underline(color: showRegistration ? RoamantikColors.cDeepBlue : .clear)
                                    .fontWeight(showRegistration ? .bold : .none)
                                
                            })
                            Spacer()
                            
                        }
                        .padding(.vertical, 15)
                        
                        VStack{
                            VStack{
                                HStack(spacing: 15){
                                    Image(systemName: "envelope")
                                        .foregroundColor(RoamantikColors.cDeepBlue)
                                    TextField("Enter Email Address", text: $viewModel.credentials.email)
                                    
                                }.padding(.vertical, 10)
                                
                                Divider()
                                    .background(RoamantikColors.cDeepBlue)
                                
                                HStack(spacing: 15){
                                    Image(systemName: "lock")
                                        .resizable()
                                        .frame(width: 15, height: 18)
                                        .foregroundColor(RoamantikColors.cDeepBlue)
                                    
                                    SecureField("Password", text: $viewModel.credentials.password)
                                    
                                    Button(action: {
                                        
                                    }) {
                                        Image(systemName: "eye")
                                            .foregroundColor(RoamantikColors.cDeepBlue)
                                    }
                                }.padding(.vertical, 10)
                                
                            }
                            .padding(.vertical)
                            .padding(.bottom, 0)
                            .cornerRadius(10)
                            .padding(.top, 25)
                            
                            HStack {
                                Spacer()
                                if self.showRegistration {
                                    Text("Forget Password?")
                                        .foregroundColor(.clear)
                                } else {
                                    NavigationLink(destination: ForgotPasswordView()) {
                                        Text("Forget Password?")
                                            .foregroundColor(RoamantikColors.cSoftBeige)
                                    }
                                }
                                
                            }.padding(.bottom, 30)
                            
                            
                            Button(action: {
                                if !self.showRegistration {
                                    viewModel.login()
                                } else {
                                    viewModel.register()
                                }
                            }, label : {
                                if !self.showRegistration{
                                    Text("Sign-in")
                                        .frame(maxWidth: .infinity, minHeight: 40)
                                } else {
                                    Text("Sign-up")
                                        .frame(maxWidth: .infinity, minHeight: 40)
                                }
                                
                            })
                            .background(RoamantikColors.cDeepBlue)
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .bold))
                            .cornerRadius(8.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(RoamantikColors.cDeepBlue, lineWidth: 2)
                            )
                            .padding(.vertical, 15)
                        }
                    }
                    .padding(.horizontal, 15)
                    .frame(minWidth: 0, maxWidth: screenWidth * 0.95, alignment: .top)
                    .background(.ultraThinMaterial, in : RoundedRectangle(cornerRadius: 16.0))
                    Spacer()
                }
            }
            .ignoresSafeArea()
            .background(
                Image("splash_1")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            )
        }
    }
}

struct LoginRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginRegisterView()
        }
    }
}
