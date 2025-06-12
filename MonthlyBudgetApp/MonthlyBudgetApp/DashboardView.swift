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
        ScrollView {
            VStack(spacing: 20) {
                // Header with Balance
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(height: 120)
                    VStack {
                        Text("Rp10,000,000")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                        Text("Gap Rp-10,000,000 (-0.5%)")
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                    .padding()
                }
                .overlay(
                    Text("Dashboard")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.top, 40),
                    alignment: .bottomLeading
                )
                .padding(.horizontal)

                // Category Chart
                VStack(spacing: 10) {
                    Text("Category chart")
                        .font(.headline)
                        .foregroundColor(.purple)
                    Chart {
                        ForEach(budgets, id: \.id) { budget in
                            SectorMark(
                                angle: .value("Amount", budget.actual),
                                innerRadius: .ratio(0.6),
                                angularInset: 1.5
                            )
                            .foregroundStyle(by: .value("Category", budget.category))
                        }
                    }
                    .chartForegroundStyleScale([
                        "Dokumen perencanaan": Color.orange,
                        "Other": Color.green
                    ])
                    .frame(height: 200)
                    .padding()

                    // Legend
                    HStack(spacing: 10) {
                        HStack(spacing: 5) {
                            Circle()
                                .fill(Color.orange)
                                .frame(width: 10, height: 10)
                            Text("Dokumen perencanaan")
                        }
                        HStack(spacing: 5) {
                            Circle()
                                .fill(Color.green)
                                .frame(width: 10, height: 10)
                            Text("Other")
                        }
                    }
                    .font(.caption)
                    .foregroundColor(.gray)
                }

                // Statistical Chart
                VStack(spacing: 10) {
                    Text("Statistical chart")
                        .font(.headline)
                        .foregroundColor(.purple)
                    VStack(spacing: 5) {
                        Text("Balance")
                            .font(.caption)
                        Text("Rp10,000,000")
                            .font(.title2)
                    }
                    Picker("", selection: .constant("Month")) {
                        Text("Month").tag("Month")
                        Text("Year").tag("Year")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.bottom, 10)

                    Chart {
                        ForEach(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"], id: \.self) { day in
                            BarMark(
                                x: .value("Day", day),
                                y: .value("Amount", Double.random(in: 0...1000000))
                            )
                            .foregroundStyle(Color.blue)
                        }
                        ForEach(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"], id: \.self) { day in
                            LineMark(
                                x: .value("Day", day),
                                y: .value("Amount", Double.random(in: 0...1000000))
                            )
                            .foregroundStyle(Color.blue.opacity(0.6))
                        }
                    }
                    .frame(height: 200)
                    .padding()
                }
            }
            .padding()
        }
        .background(Color.gray.opacity(0.1))
    }
}
