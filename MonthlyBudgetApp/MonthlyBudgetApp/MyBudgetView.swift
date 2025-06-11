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

    var body: some View {
        VStack {
            Text("My Budget")
                .font(.title)
            List {
                ForEach(budgets) { budget in
                    HStack {
                        Text(budget.category)
                        Spacer()
                        Text("Planned: Rp\(budget.planned)")
                        Text("Actual: Rp\(budget.actual)")
                    }
                }
            }
            HStack {
                TextField("Category", text: $newCategory)
                TextField("Planned Amount", text: $newPlanned)
                    .keyboardType(.decimalPad)
                Button("Add") {
                    if let amount = Double(newPlanned) {
                        budgets.append(Budget(category: newCategory, planned: amount, actual: 0))
                        newCategory = ""
                        newPlanned = ""
                    }
                }
            }
            .padding()
        }
        .navigationTitle("My Budget")
    }
}
