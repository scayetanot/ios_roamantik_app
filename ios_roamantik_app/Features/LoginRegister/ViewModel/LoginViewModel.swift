//
//  LoginViewModel.swift
//  ios_roamantik_app
//
//  Created by Sebastien Cayetanot on 8/22/23.
//

import Foundation
import Combine

enum LoginState {
    case successfullyLoggedIn
    case successfullyRegistered
    case failed(error: Error)
    case na
}

protocol LoginViewModel {
    func login()
    func register()
    func resetPassword(with email: String)
    var service: LoginService { get }
    var state: LoginState { get }
    var hasError: Bool { get }
    var credentials: CredentialsModel { get }
    init(service: LoginService)
}

final class LoginViewModelImpl: ObservableObject, LoginViewModel {
    
    var service: LoginService
    
    @Published var state: LoginState = .na
    
    @Published var credentials: CredentialsModel = CredentialsModel.new
    
    @Published var hasError: Bool = false
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: LoginService) {
        self.service = service
        setupErrorSubscription()
    }
    
    func login() {
        service
            .login(with: credentials)
            .sink { res in
                switch res {
                case .failure(let err):
                    self.state = .failed(error: err)
                default: break
                }
            } receiveValue: { [weak self] in
                self?.state = .successfullyLoggedIn
            }
            .store(in: &subscriptions)
    }
    
    func register() {
        service
            .register(with: credentials)
            .sink { [weak self] res in
                switch res {
                case .failure(let error):
                    self?.state = .failed(error: error)
                default:
                    break
                }
            } receiveValue: { [weak self] in
                self?.state = .successfullyRegistered
            }
            .store(in: &subscriptions)
    
    }
    
    func resetPassword(with email: String) {
        service
            .resetPassword(with: email)
            .sink { [weak self] res in
                switch res {
                case .failure(let error):
                    self?.state = .failed(error: error)
                default:
                    break
                }
                
            } receiveValue: { [weak self] in
                self?.state = .na
            }
            .store(in: &subscriptions)
        
    }
}

private extension LoginViewModelImpl {
    
    func setupErrorSubscription() {
        $state
            .map { state -> Bool in
                switch state {
                case .successfullyLoggedIn,
                     .successfullyRegistered,
                     .na:
                    return false
                case .failed:
                    return true
                }
            }
            .assign(to: &$hasError)
    }
}
