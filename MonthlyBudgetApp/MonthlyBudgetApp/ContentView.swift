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
    var type: String // "Income" or "Spend"
}

struct Budget: Identifiable {
    let id = UUID()
    var category: String
    var planned: Double
    var actual: Double
}

struct ContentView: View {
    @State private var transactions: [Transaction] = [
        Transaction(category: "Dokumen perencanaan", amount: 799999, date: Date(), type: "Spend"),
        Transaction(category: "Other", amount: 200001, date: Date().addingTimeInterval(-86400), type: "Income"),
        Transaction(category: "Food", amount: 150000, date: Date().addingTimeInterval(-172800), type: "Spend")
    ]
    @State private var budgets: [Budget] = [
        Budget(category: "Dokumen perencanaan", planned: 1000000, actual: 799999),
        Budget(category: "Other", planned: 500000, actual: 200001)
    ]
    @State private var isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")

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

// Preview
#Preview {
    ContentView()
}
