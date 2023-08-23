//
//  RegistrationKeys.swift
//  ios_roamantik_app
//
//  Created by Sebastien Cayetanot on 8/22/23.
//

import Combine
import Foundation
import FirebaseAuth
import FirebaseDatabase

enum RegistrationKeys: String {
    case userName
}

protocol RegistrationService {
    func register(with registration: RegistrationModel) -> AnyPublisher<Void, Error>
}

final class RegistrationServiceImpl: RegistrationService {
    
    func register(with registration: RegistrationModel) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                Auth.auth()
                    .createUser(withEmail: registration.email,
                                password: registration.password) { res, error in
                        
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            if let uid = res?.user.uid {
                                let values = [RegistrationKeys.userName.rawValue: registration.username] as [String: Any]
                             
                                Database.database()
                                    .reference()
                                    .child("user")
                                    .child(uid)
                                    .updateChildValues(values) { error, ref in
                                        if let err = error {
                                            promise(.failure(err))
                                        } else {
                                            promise(.success(()))
                                        }
                                            
                                    }
                                
                            } else {
                                promise(.failure(NSError(domain: "Invalid User Id", code: 0, userInfo: nil)))
                            }
                        }
                    }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}

