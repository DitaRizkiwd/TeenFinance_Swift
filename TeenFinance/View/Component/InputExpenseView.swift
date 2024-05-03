//
//  InputExpenseView.swift
//  TeenFinance
//
//  Created by MACBOOK PRO on 03/05/24.
//

import SwiftUI

struct InputExpenseView: View {
    @StateObject var financeVM = FinanceViewModel()
    @State private var isActive = false
    @State private var expense: String = ""
    
    let budget: [Budget] = Bundle.main.decode("data.json")
    
    func subtractExpense(expenses: Double)-> Double {
        var rest: Double =  budget[0].amount - expenses
        return rest
    }
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 16) {
                    
                    Group {
                        HStack {
                            Text("Budget : ")
                                .font(.system(size: 28, design: .rounded))
                            Text(String(format: "%.1f%", budget[0].amount))
                                .font(.system(size: 28, design: .rounded))
                            
                        }
                        .foregroundStyle(.white)
                        
                        TextField("Enter your Expense", text:$expense)
                            .keyboardType(.numberPad)
                            .background(Color.white)
                            .cornerRadius(10)
                        
                    }
                    .padding()
                    
                    
                    Button{
                        Task{
                            subtractExpense(expenses: Double(expense) ?? 0.0)
                        }
                        
                        
                    }
                    label : {
                        Text("Submit")
                    }
                    .padding()
                    .foregroundStyle(.white)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.cyan
                                /*LinearGradient(colors: [.blue, .cyan],startPoint: .trailing, endPoint: .leading*///)
                    )
                    
                }
                .frame(width: 350, height: 200)
                .background(LinearGradient(gradient: Gradient(colors: [Color.cyan, Color.green]), startPoint: .leading, endPoint: .trailing))
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                
//                RestCard(expense: expense)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(MotionAnimationBackground())
            .navigationTitle("Expense: \(budget[0].name)")
            RestCard(expense: String(subtractExpense(expenses: Double(expense) ?? 0.0)))
            
            
            
        }
    }
}
#Preview {
    InputExpenseView()
}
