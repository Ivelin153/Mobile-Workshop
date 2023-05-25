//
//  LoginView.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 23.05.23.
//

import SwiftUI

struct LoginView: View {
    @State private var path: [String] = []
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isEmailValid = true
    @State private var isPasswordVisible = false
    @State private var isLoginValid = false
    
    var body: some View {
        NavigationStack(path: $path) {
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
                    .autocapitalization(.none)
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
                        
                        if self.email == "ivelin@gmail.com" && self.password == "password" {
                            // Perform login action
                            self.isLoginValid = true
                            path.append("Login success")

                        } else {
                            self.isLoginValid = false
                        }
                        
                        password = ""
                    }, label: {
                        HStack{
                            Text("Log in")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 220, height: 60)
                                .background(Color.init(red: 71/255, green: 51/255, blue: 122/255))
                                .cornerRadius(15.0)
                        }
                    })
                    .navigationDestination(for: String.self, destination: {text in ProductDetailView(text: text)})
                    
                    if !isLoginValid {
                        Text("Invalid email or password")
                            .foregroundColor(.red)
                            .padding(.top, 10)
                    }
                }
                .padding()
            }
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
