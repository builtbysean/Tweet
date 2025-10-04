//
//  RegistrationView.swift
//  Tweet
//
//  Created by Sean Coffin on 10/3/25.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(AuthManager.self) private var authManager
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmedPassword = ""
    @State private var passwordsMatch = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "lightbulb")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            
            VStack(spacing: 8) {
                TextField("Enter your email", text: $email)
                    .autocapitalization(.none)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                
                ZStack(alignment: .trailing) {
                    SecureField("Enter your password", text: $password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    
                    if !password.isEmpty && !confirmedPassword.isEmpty {
                        Image(systemName: passwordsMatch ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundStyle(passwordsMatch ? .green : .red)
                            .padding(.horizontal)
                    }
                }
                .padding(.horizontal, 24)
                
                ZStack(alignment: .trailing) {
                    SecureField("Confirm your password", text: $confirmedPassword)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    
                    if !password.isEmpty && !confirmedPassword.isEmpty {
                        Image(systemName: passwordsMatch ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundStyle(passwordsMatch ? .green : .red)
                            .padding(.horizontal)
                    }
                }
                .padding(.horizontal, 24)
                .onChange(of: confirmedPassword) { oldValue, newValue in
                    passwordsMatch = newValue == password
                }
            }
            
            Button { signUp() } label: {
                Text("Sign up")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 352, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button { dismiss() } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.subheadline)
            }
            .padding(.vertical, 16)
        }
    }
}

private extension RegistrationView {
    func signUp() {
        Task { await authManager.signUp(email: email, password: password) }
    }
    
    var formIsValid: Bool {
        return email.isValidEmail() && passwordsMatch
    }
}

#Preview {
    RegistrationView()
        .environment(AuthManager())
}
