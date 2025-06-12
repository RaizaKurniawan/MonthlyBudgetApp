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

    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.8), Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                // Placeholder for Logo (Removed as per request)
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

                // Login Form (Placeholder, can be expanded)
                VStack(spacing: 20) {
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)

                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)

                    Button(action: {
                        // Simulasi login sukses
                        isLoggedIn = true
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
