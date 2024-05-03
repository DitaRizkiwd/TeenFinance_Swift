//
//  RestCard.swift
//  TeenFinance
//
//  Created by MACBOOK PRO on 03/05/24.
//

import SwiftUI

struct RestCard: View {
    let budget: [Budget] = Bundle.main.decode("data.json")
    var expense: String
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Text("Rest: \(budget[0].name)")
                    .font(.system(.title2, design: .rounded))
                    .foregroundStyle(.white)
                HStack{
                    Group{
                        Text("Rest: \(expense)")
                    }
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    Spacer()
                }
            }
            .padding()
        }
        .frame(width: 350, height: 100)
        .background(LinearGradient(gradient: Gradient(colors: [Color.cyan, Color.green]), startPoint: .leading, endPoint: .trailing))
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
}

#Preview {
    RestCard(expense: "")
}
