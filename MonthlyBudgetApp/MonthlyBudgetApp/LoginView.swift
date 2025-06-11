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
        VStack(spacing: 20) {
            Text("Login")
                .font(.largeTitle)
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Login") {
                // Simulasi login sukses
                isLoggedIn = true
            }
            Button("Register") {
                // Navigasi ke register (bisa tambah view terpisah)
            }
        }
        .padding()
    }
}
