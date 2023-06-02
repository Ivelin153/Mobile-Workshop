//
//  LoginView.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 23.05.23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginModel: LoginViewModel = LoginViewModel()
    
    @State private var isPasswordVisible = false;
    @State private var isEmailValid = true;
    @State private var path: [String] = [];
    
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
                    
                    TextField("Email", text: $loginModel.email)
                        .padding()
                        .autocapitalization(.none)
                        .background(isEmailValid ? Color.white : Color.red)
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                        .onChange(of: loginModel.email) {value in
                            self.isEmailValid = loginModel.isValidEmail(value)
                        }
                    
                    HStack {
                        if isPasswordVisible {
                            TextField("Password", text: $loginModel.password)
                        } else {
                            SecureField("Password", text: $loginModel.password)
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
                    
                    Button(action: loginModel.login) {
                        HStack{
                            Text("Log in")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 220, height: 60)
                                .background(loginModel.isLogInButtonDisabled() ? .gray : Color.init(red: 71/255, green: 51/255, blue: 122/255))
                                .cornerRadius(15.0)
                        }
                    }
                    .disabled(loginModel.isLogInButtonDisabled() || !self.isEmailValid)
                    .navigationDestination(isPresented: $loginModel.isLoginValid, destination: {ProductDetailView()})
                    
                    if !loginModel.isLoginValid {
                        Text("Invalid email or password")
                            .foregroundColor(.red)
                            .padding(.top, 10)
                    }
                }
                .alert(isPresented: $loginModel.showError) {
                    Alert(title: Text("Login Failed"),
                          message: Text("Your email or password is incorrect. Please try again."),
                          dismissButton: .default(Text("OK")))
                }
                .padding()
            }
        }
    }
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
