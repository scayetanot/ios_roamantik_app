//
//  LoginCredentialsModel.swift
//  ios_roamantik_app
//
//  Created by Sebastien Cayetanot on 8/22/23.
//

import Foundation

struct LoginCredentialsModel {
    var email: String
    var password: String
}

extension LoginCredentialsModel {
    
    static var new: LoginCredentialsModel {
        LoginCredentialsModel(email: "", password: "")
    }
}
