//
//  LoginViewModel.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 30.05.23.
//

import Foundation
import Factory

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoginValid = false
    @Published var showError = false
    @Published var isLoggingIn = false
    
    
    private let repository = Container.shared.userRepository()
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isLogInButtonDisabled() -> Bool {
        return self.email.isEmpty || self.password.isEmpty || self.isLoggingIn
    }
    
    func login() {
        Task {
            do {
                self.isLoggingIn = true
                print("button clicked")
                let request = LoginRequest(identifier: self.email, password: self.password)
                let loginResponse = try await repository.login(request: request)
                print(loginResponse);
                let jwtToken = loginResponse.jwt
                JWTStorage.shared.jwtToken = jwtToken
                self.isLoginValid = true
                                        
            } catch {
                print("Login error: \(error)")
                isLoggingIn = false
                self.password = "";
                showError = true;
            }
        }
    }
    
}
