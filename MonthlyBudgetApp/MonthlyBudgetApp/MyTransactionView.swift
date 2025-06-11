//
//  MyTransactionView.swift
//  MonthlyBudgetApp
//
//  Created by raizakurniawan on 11/06/25.
//

import SwiftUI

struct MyTransactionView: View {
    @Binding var transactions: [Transaction]
    @State private var category = ""
    @State private var amount = ""
    @State private var type = "Spend"

    var body: some View {
        VStack {
            Text("My Transaction")
                .font(.title)
            List {
                ForEach(transactions) { transaction in
                    HStack {
                        Text(transaction.category)
                        Spacer()
                        Text(String(format: "Rp%.0f", transaction.amount))
                        Text(transaction.type)
                    }
                }
            }
            HStack {
                TextField("Category", text: $category)
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
                Picker("Type", selection: $type) {
                    Text("Income").tag("Income")
                    Text("Spend").tag("Spend")
                }
                .pickerStyle(MenuPickerStyle())
                Button("Add") {
                    if let amountValue = Double(amount) {
                        transactions.append(Transaction(category: category, amount: amountValue, date: Date(), type: type))
                        category = ""
                        amount = ""
                    }
                }
            }
            .padding()
        }
        .navigationTitle("My Transaction")
    }
}
