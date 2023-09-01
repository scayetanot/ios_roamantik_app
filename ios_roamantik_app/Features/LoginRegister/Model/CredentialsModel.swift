//
//  LoginCredentialsModel.swift
//  ios_roamantik_app
//
//  Created by Sebastien Cayetanot on 8/22/23.
//

import Foundation

struct CredentialsModel {
    var email: String
    var password: String
}

extension CredentialsModel {
    
    static var new: CredentialsModel {
        CredentialsModel(email: "", password: "")
    }
}
