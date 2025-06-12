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
    @State private var selectedDate = Date()

    var body: some View {
        VStack(spacing: 20) {
            Text("My Transaction")
                .font(.largeTitle)
                .foregroundColor(.purple)
                .padding(.top)

            List {
                ForEach(transactions) { transaction in
                    HStack {
                        Text(transaction.category)
                            .frame(width: 100, alignment: .leading)
                        Spacer()
                        Text(String(format: "Rp%.0f", transaction.amount))
                            .frame(width: 120, alignment: .center)
                        Text(transaction.type)
                            .frame(width: 80, alignment: .trailing)
                        Text(transaction.date, style: .date)
                            .frame(width: 100, alignment: .trailing)
                    }
                }
            }

            HStack(spacing: 10) {
                TextField("Category", text: $category)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100)
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 120)
                Picker("Type", selection: $type) {
                    Text("Income").tag("Income")
                    Text("Spend").tag("Spend")
                }
                .pickerStyle(MenuPickerStyle())
                .frame(width: 80)
                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .frame(width: 100)
                Button(action: {
                    if let amountValue = Double(amount) {
                        transactions.append(Transaction(category: category, amount: amountValue, date: selectedDate, type: type))
                        category = ""
                        amount = ""
                    }
                }) {
                    Text("Add")
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .navigationTitle("My Transaction")
        .background(Color.gray.opacity(0.1))
    }
}
