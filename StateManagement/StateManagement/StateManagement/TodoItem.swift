//
//  TodoItem.swift
//  StateManagement
//
//  Created by Hamza on 18/01/2024.
//

import Foundation

struct TodoItem: Codable {
    
    let id: UUID
    var title : String
    var description: String?
    var isDone: Bool = false
    
    
}








