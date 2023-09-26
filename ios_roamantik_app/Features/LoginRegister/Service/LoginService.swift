//
//  LoginService.swift
//  ios_roamantik_app
//
//  Created by Sebastien Cayetanot on 8/22/23.
//

import Combine
import Foundation
import FirebaseAuth

protocol LoginService {
    func login(with credentials: CredentialsModel) -> AnyPublisher<Void, Error>
    func register(with credentials: CredentialsModel) -> AnyPublisher<Void, Error>
    func resetPassword(with email: String) -> AnyPublisher<Void, Error>
}

enum RegistrationKeys: String {
    case userName
}

final class LoginServiceImpl: LoginService {
    
    func login(with credentials: CredentialsModel) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                Auth.auth()
                    .signIn(withEmail: credentials.email, password: credentials.password)
                { res, error in
                    if let err = error {
                        promise(.failure(err))
                    } else {
                        promise(.success(()))
                    }
                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
    
    func register(with credentials: CredentialsModel) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                Auth.auth()
                    .createUser(withEmail: credentials.email,
                                password: credentials.password)
                { res, error in
                    if let err = error {
                        promise(.failure(err))
                    } else {
                        promise(.success(()))
                    }
                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
    
    func resetPassword(with email: String) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                Auth.auth()
                    .sendPasswordReset(withEmail: email)
                { error in
                    if let err = error {
                        promise(.failure(err))
                    } else {
                        promise(.success(()))
                    }
                    
                }
                
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
