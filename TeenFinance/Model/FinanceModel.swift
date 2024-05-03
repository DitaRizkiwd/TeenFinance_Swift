//
//  FinanceModel.swift
//  TeenFinance
//
//  Created by MACBOOK PRO on 02/05/24.
//

import Foundation
struct FinanceModel: Codable, Hashable{
    let saving, school, allowance, lifestyle: Allowance
    let entertainment: Allowance
}
struct Allowance: Codable, Hashable{
    let percentage, amount: Int
}

extension FinanceModel{
    static let dummyData: [FinanceModel] = [
        FinanceModel(
            saving: Allowance(percentage: 25, amount: 250000) ,
            school: Allowance(percentage: 25, amount: 250000),
            allowance: Allowance(percentage: 20, amount: 200000),
            lifestyle: Allowance(percentage: 20, amount: 200000),
            entertainment: Allowance(percentage: 10, amount: 100000))
    ]
    
}

