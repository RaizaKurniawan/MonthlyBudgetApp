//
//  LoginView.swift
//  MonthlyBudgetApp
//
//  Created by raizakurniawan on 11/06/25.
//
import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var showError = false

    // Dummy credentials (for testing)
    private let validEmail = "user@example.com"
    private let validPassword = "password123"

    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.8), Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                Spacer()

                // Title and Description
                Text("Welcome")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text("Manage your finances with ease")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)

                // Login Form
                VStack(spacing: 20) {
                    if showError {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                            .transition(.opacity)
                            .id(errorMessage) // Force re-render on message change
                    }

                    TextField("Email", text: Binding(
                        get: { email },
                        set: { email = $0.lowercased() } // Convert to lowercase
                    ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .autocapitalization(.none) // Prevent auto-capitalization

                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .textContentType(.password)

                    Button(action: {
                        // Validasi login
                        let normalizedEmail = email.lowercased()
                        if normalizedEmail == validEmail && password == validPassword {
                            UserDefaults.standard.set(true, forKey: "isLoggedIn")
                            isLoggedIn = true
                            errorMessage = ""
                            showError = false
                        } else {
                            errorMessage = "Invalid email or password"
                            showError = true
                            // Schedule fade-out after 4 seconds
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                withAnimation {
                                    showError = false
                                }
                            }
                        }
                    }) {
                        Text("Log In")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(10)
                    }

                    Button(action: {
                        // Navigasi ke Sign Up (bisa tambah view terpisah)
                    }) {
                        Text("Sign Up")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.7))
                            .cornerRadius(10)
                    }

                    Button(action: {
                        // Aksi Forgot Password
                    }) {
                        Text("Forgot Password?")
                            .font(.caption)
                            .foregroundColor(.white)
                            .underline()
                    }
                }
                .padding(.horizontal, 30)

                Spacer()
            }
        }
    }
}

// Preview
#Preview {
    LoginView(isLoggedIn: .constant(false))
}
