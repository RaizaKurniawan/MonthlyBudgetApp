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
            VStack{
                Text("Balance")
                    .font(.caption)
                Text("Rp. 10,000,000")
                    .font(.largeTitle)
                Text("Gap Rp. - 10,000,000 (-0.5%)")
                    .font(.caption)
                    .foregroundColor(.red)
            }
            .padding()
            
            // Category chart
            Chart{
                ForEach(budgets, id: \.id) { budget in
                    SectorMark(angle: .value("Amount", <#T##value: Plottable##Plottable#>))
                }
            }
        }
    }
}
