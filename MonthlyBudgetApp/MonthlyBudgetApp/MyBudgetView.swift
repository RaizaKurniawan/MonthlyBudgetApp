//
//  MyBudgetView.swift
//  MonthlyBudgetApp
//
//  Created by raizakurniawan on 11/06/25.
//

import SwiftUI

struct MyBudgetView: View {
    @Binding var budgets: [Budget]
    @State private var newCategory = ""
    @State private var newPlanned = ""
    @State private var newActual = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("My Budget")
                .font(.largeTitle)
                .foregroundColor(.purple)
                .padding(.top)

            List {
                ForEach(budgets) { budget in
                    HStack {
                        Text(budget.category)
                            .frame(width: 100, alignment: .leading)
                        Spacer()
                        Text("Planned: Rp\(Int(budget.planned))")
                            .frame(width: 120, alignment: .center)
                        Text("Actual: Rp\(Int(budget.actual))")
                            .frame(width: 120, alignment: .trailing)
                    }
                }
            }

            HStack(spacing: 10) {
                TextField("Category", text: $newCategory)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100)
                TextField("Planned Amount", text: $newPlanned)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 120)
                TextField("Actual Amount", text: $newActual)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 120)
                Button(action: {
                    if let planned = Double(newPlanned), let actual = Double(newActual) {
                        budgets.append(Budget(category: newCategory, planned: planned, actual: actual))
                        newCategory = ""
                        newPlanned = ""
                        newActual = ""
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
        .navigationTitle("My Budget")
        .background(Color.gray.opacity(0.1))
    }
}
