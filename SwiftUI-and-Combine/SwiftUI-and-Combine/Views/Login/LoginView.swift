//
//  LoginView.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//

import SwiftUI

struct LoginView: View {
    //MARK: -  ObservableObject
    @StateObject var loginVM = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                //Create Header
                HeaderView(title: "To Do List", subtitle: "Get things done", degree: 15, background: .pink)
                //Login Form
                Form {
                    //check email & password
                    if !loginVM.messageError.isEmpty {
                        Text(loginVM.messageError)
                            .foregroundColor(Color.red)
                            .font(.caption)
                            .offset(y:-10)
                    }
                    
                    TextField("Email Address", text: $loginVM.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    SecureField("Password",text: $loginVM.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    // Button
                    TLButton(title: "Log In",
                             color: .blue,
                             action: {
                        //Action here
                        self.loginVM.login()
                    })
                    
                    .padding()
                }
                .offset(y:-50)
                
                // Register account
                VStack {
                    Text("New around here?")
                    
                    //Link this navigation to Register view
                    NavigationLink("Register and account", destination: RegisterView())
                    
                }
                .padding(.bottom,50)
                
                Spacer()
            }
        }
    }
}

//#Preview {
//    LoginView()
//}