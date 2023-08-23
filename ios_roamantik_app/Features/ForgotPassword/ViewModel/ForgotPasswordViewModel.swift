//
//  ForgotPasswordViewModel.swift
//  ios_roamantik_app
//
//  Created by Sebastien Cayetanot on 8/22/23.
//

import Combine
import Foundation

protocol ForgotPasswordViewModel {
    func sendPasswordReset()
    var service: ForgotPasswordService { get }
    var email: String { get }
    init(service: ForgotPasswordService)
}

final class ForgotPasswordViewModelImpl: ForgotPasswordViewModel, ObservableObject {
    
    let service: ForgotPasswordService
    
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var email: String = ""
    
    init(service: ForgotPasswordService) {
        self.service = service
    }
    
    func sendPasswordReset() {
        service
            .sendPasswordReset(to: email)
            .sink { res in
                switch res {
                case .failure(let err):
                    print("Failed: \(err)")
                default: break
                }
            } receiveValue: {
                print("Sent Password reset link")
            }
            .store(in: &subscriptions)
    }
    
}
