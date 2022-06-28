//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Sadman Adib on 26/6/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    
}
