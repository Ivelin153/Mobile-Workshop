//
//  ContentView.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 3.05.23.
//

import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isEmailValid = true
    @State private var isPasswordVisible = false
    @State private var isLoginValid = true
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 40)
                
                TextField("Email", text: $email, onEditingChanged: { isEditing in
                    if !isEditing {
                        self.isEmailValid = self.isValidEmail(email)
                    }
                })
                .padding()
                .background(isEmailValid ? Color.white : Color.red)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                
                HStack {
                    if isPasswordVisible {
                        TextField("Password", text: $password)
                    } else {
                        SecureField("Password", text: $password)
                    }
                    Button(action: {
                        self.isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(Color.secondary)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                
                Button(action: {
                    if self.email == "Ivelin@gmail.com" && self.password == "password" {
                        // Perform login action
                        self.isLoginValid = true
                    } else {
                        self.isLoginValid = false
                    }
                    
                    password = ""
                }) {
                    Text("Log in")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                }
                
                if !isLoginValid {
                    Text("Invalid email or password")
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }
            }
            .padding()
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
