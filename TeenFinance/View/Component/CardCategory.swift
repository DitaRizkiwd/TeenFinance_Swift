//
//  CardCategory.swift
//  TeenFinance
//
//  Created by MACBOOK PRO on 02/05/24.
//

import SwiftUI

struct CardCategory: View {
    var budgeting: Finance
    
    var body: some View {
                ZStack{
                    VStack(alignment: .leading){
                        Text(budgeting.name)
                            .font(.system(.title2, design: .rounded))
                            .foregroundStyle(.white)
                        HStack{
                            Group{
                                Text(budgeting.amount)
                            }
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            Spacer()
                            HStack{
                                Circle()
                                    .fill(.cyan)
                                    .frame(width: 10, height: 20)
                                
                                Text(String(format: "%.1f%%", budgeting.percentage * 100))
                                    .font(.subheadline)
                            }
                            .padding(.horizontal,8)
                            .background(Color(.systemGroupedBackground))
                            .clipShape(Capsule())
                        }
                    }
                    .padding()
                }
                .frame(width: 350, height: 100)
                .background(LinearGradient(gradient: Gradient(colors: [Color.cyan, Color.green]), startPoint: .leading, endPoint: .trailing))
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                

//                
            }
        }


#Preview {
    CardCategory(budgeting: Finance.dummyData[0])
}
