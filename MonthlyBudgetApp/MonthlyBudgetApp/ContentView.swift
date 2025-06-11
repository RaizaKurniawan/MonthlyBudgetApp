//
//  ContentView.swift
//  MonthlyBudgetApp
//
//  Created by raizakurniawan on 11/06/25.
//

import SwiftUI

// Model Data
struct Transaction: Identifiable {
    let id = UUID()
    var category: String
    var amount: Double
    var date: Date
    var type: String
    
}

struct Budget: Identifiable {
    let id = UUID()
    var category: String
    var planned: Double
    var actual: Double
}

struct ContentView: View {
    @State private var transactions: [Transaction] = []
    @State private var budgets: [Budget] = []
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            if isLoggedIn {
                DashboardView(transactions: $transactions, budgets: $budgets)
                    .navigationDestination(for: String.self) { destination in
                        if destination == "MyBudget" {
                            MyBudgetView(budgets: $budgets)
                        } else if destination == "MyTransaction" {
                            MyTransactionView(transactions: $transactions)
                        }
                    }
            } else {
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

#Preview {
    ContentView()
}
