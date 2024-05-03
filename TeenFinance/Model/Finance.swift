//
//  Finance.swift
//  TeenFinance
//
//  Created by MACBOOK PRO on 02/05/24.
//

import Foundation

struct Finance: Codable,Hashable{
    var name: String
    var percentage: Double
    var amount: String
}

extension Finance{
    static let dummyData: [Finance] = [
        Finance(name: "Saving", percentage: 0.25, amount: "25000")
    
    ]
}
