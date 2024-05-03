//
//  Inputview.swift
//  TeenFinance
//
//  Created by MACBOOK PRO on 02/05/24.
//

import SwiftUI

struct Inputview: View {
    //@State private var budgetInput: String = ""
    //    @State private var intVal: Int?
    @StateObject var financeVM = FinanceViewModel()
    @State private var isActive = false
    @State private var showToast = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 16) {
                    
                    Group {
                        Text("Set Your Budget")
                            .font(.system(size: 28, design: .rounded))
                            .foregroundStyle(.white)
                        TextField("Enter your Budget", text: $financeVM.budget)
                            .keyboardType(.numberPad)
                            .background(Color.white)
                            .cornerRadius(10)
                            
                    }
                    .padding()
                   
                    
                    Button{
                        Task{
                            await financeVM.ConfirmBudget()
                            
                        }
                        showToast = true
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
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(MotionAnimationBackground())
            .navigationTitle("Balance: \(financeVM.budget)")
            
            VStack {
                if showToast {
                    // Tampilkan toast jika showToast adalah true
                    VStack {
                        Text("Success for set your budget, move to planning tab for see your planning budget")
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                    }
                    .transition(.opacity) // Efek transisi untuk muncul dan menghilang
                    .animation(.easeIn(duration: 0.5)) // Animasi untuk muncul dan menghilang
                    .onAppear {
                        // Setelah beberapa waktu, atur showToast ke false untuk menyembunyikan toast
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            showToast = false
                        }
                    }
                }
            }
            
        }
    }
    
    
}


#Preview {
    Inputview()
}

        
   
