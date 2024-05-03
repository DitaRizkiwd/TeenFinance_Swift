//
//  ContentView.swift
//  TeenFinance
//
//  Created by MACBOOK PRO on 02/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Inputview()
                .tabItem {
                    Label("Input", systemImage: "square.and.pencil")
                }
            CardCategoryList()
                .tabItem {
                    Label("Planning", systemImage: "dollarsign.circle")
                }
            ChartView()
                .tabItem {
                    Label("Chart", systemImage: "chart.bar")
                }
            InputExpenseView()
                .tabItem {
                    Label("Expense", systemImage: "pencil.and.outline")
                }
            
        }
        
    }
}

#Preview {
    ContentView()
}
