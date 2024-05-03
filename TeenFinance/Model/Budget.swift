//
//  Budget.swift
//  TeenFinance
//
//  Created by MACBOOK PRO on 03/05/24.
//

import Foundation
struct Budget: Codable, Identifiable{
    let id: Int
    var name: String
    var percentage: Double
    var amount: Double
}
