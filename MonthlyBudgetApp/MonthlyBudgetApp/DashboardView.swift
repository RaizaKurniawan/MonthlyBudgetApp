//
//  DashboardView.swift
//  MonthlyBudgetApp
//
//  Created by raizakurniawan on 11/06/25.
//
import SwiftUI
import Charts

struct DashboardView: View {
    @Binding var transactions: [Transaction]
    @Binding var budgets: [Budget]

    var body: some View {
        VStack {
            // Balance
            VStack {
                Text("Balance")
                    .font(.caption)
                Text("Rp10,000,000")
                    .font(.largeTitle)
                Text("Gap Rp-10,000,000 (-0.5%)")
                    .font(.caption)
                    .foregroundColor(.red)
            }
            .padding()

            // Category Chart (Pie Chart)
            Chart {
                ForEach(budgets, id: \.id) { budget in
                    SectorMark(
                        angle: .value("Amount", budget.actual),
                        innerRadius: .ratio(0.6),
                        angularInset: 2
                    )
                    .foregroundStyle(by: .value("Category", budget.category))
                }
            }
            .frame(height: 200)
            .chartForegroundStyleScale([
                "Dokumen perencanaan": Color.orange,
                "Other": Color.purple
            ])
            .padding()

            // Latest Activity
            VStack {
                Text("Latest Activity")
                ForEach(transactions) { transaction in
                    HStack {
                        Image(systemName: transaction.type == "Income" ? "arrow.up" : "arrow.down")
                            .foregroundColor(transaction.type == "Income" ? .green : .red)
                        Text(transaction.category)
                        Spacer()
                        Text(String(format: "Rp%.0f", transaction.amount))
                    }
                    .padding(.vertical, 2)
                }
            }
            .padding()

            // Navigation Links
            HStack {
                NavigationLink(destination: MyBudgetView(budgets: $budgets)) {
                    Text("My Budget")
                }
                NavigationLink(destination: MyTransactionView(transactions: $transactions)) {
                    Text("My Transaction")
                }
            }
        }
        .navigationTitle("Dashboard")
    }
}
