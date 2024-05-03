//
//  CardCategoryList.swift
//  TeenFinance
//
//  Created by MACBOOK PRO on 02/05/24.
//

import SwiftUI

struct CardCategoryList: View {
    @StateObject var financevm = FinanceViewModel()
    
    var body: some View {
        
        NavigationStack{
            ScrollView(showsIndicators: false) {
                ForEach(financevm.finance, id:\.self){
                    item in CardCategory(budgeting: item)
                }
                
                .task {
                    await financevm.ConfirmBudget()
                }
                .navigationTitle("Budget Planning")
                .navigationBarTitleDisplayMode(.inline)
                .font(.headline)
                
                //                .overlay{
                //                    financevm.isLoading ? ProgressView() : nil
                //                }
                
                //menngkap perubahan dari isReady
                .onChange(of: financevm.isReady) { oldValue, newValue in
                    if newValue{
                        Task{
                            financevm.ConfirmBudget
                        }
                        
                    }
                }
            }
            .overlay{
                financevm.isLoading ? ProgressView() : nil
            }
        }
    }
}

#Preview {
    CardCategoryList()
}
