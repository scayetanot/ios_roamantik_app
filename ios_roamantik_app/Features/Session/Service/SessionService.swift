//
//  SessionService.swift
//  ios_roamantik_app
//
//  Created by Sebastien Cayetanot on 8/22/23.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseDatabase



enum SessionState {
    case loggedIn
    case loggedOut
}

protocol SessionService {
    var state: SessionState { get }
    var userDetails: SessionUserDetails? { get }
    init()
    func logout()
}

final class SessionServiceImpl: ObservableObject, SessionService {
    
    @Published var state: SessionState = .loggedOut
    @Published var userDetails: SessionUserDetails?
    
    private var handler: AuthStateDidChangeListenerHandle?
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        setupFirebaseAuthHandler()
    }
    
    deinit {
        guard let handler = handler else { return }
        Auth.auth().removeIDTokenDidChangeListener(handler)
    }
    
    func logout() {
        try? Auth.auth().signOut()
    }
}
    
private extension SessionServiceImpl {
    
    func setupFirebaseAuthHandler() {
        
        handler = Auth
                    .auth()
                    .addStateDidChangeListener { [weak self] _,_ in
                        guard let self = self else { return }
                        
                        let currentUser = Auth.auth().currentUser
                        self.state = currentUser == nil ? .loggedOut : .loggedIn
                        
                        if let uid = currentUser?.uid {
                            
                            Database
                                .database()
                                .reference()
                                .child("users")
                                .child(uid)
                                .observe(.value) { [weak self] snapshot,tmp  in
                                    
                                  //  guard let self = self,
                                  //        let value = snapshot.value as? NSDictionary,
                                  //        let userName = value[RegistrationKeys.userName.rawValue] as? String
                                  //  else {
                                  //      return
                                  //  }

                                  //  DispatchQueue.main.async {
                                  //      self.userDetails = SessionUserDetails(userName: userName)
                                    //  }
                                }
                        }
                    }
    
    }
    
}
    

