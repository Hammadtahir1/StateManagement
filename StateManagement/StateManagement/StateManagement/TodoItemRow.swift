//
//  TodoItemRow.swift
//  StateManagement
//
//  Created by Hamza on 18/01/2024.
//

import SwiftUI

struct TodoItemRow: View {
    
    @Binding var item: TodoItem
    var body: some View {
        HStack {
            Button("Button") {
                item.isDone.toggle()
            }
            VStack(alignment: .leading) {
                
                Text(item.title)
                    .font(.headline)
                    .strikethrough(item.isDone)
                
                if let description = item.description {
                    Text(description)
                        .font(.subheadline)
                        .strikethrough(item.isDone)
                }
                
            }
            .padding(.leading)
            
            Spacer()
        }
        .padding(.leading)
        .frame(height: 70)
    }
        
}
struct TodoItemRow_Previews: PreviewProvider {

    static let TodoItemWithoutDescription = TodoItem(
        id: UUID(),
        title: "Buy some bread 🍞"
      
        )
    
    static let TodoItemWithDescription = TodoItem(
        id: UUID(),
        title: "Buy some milk 🥛",
        description: "Get a lactose free one"
       
        )
    
    static var previews: some View {
        Group {
        TodoItemRow(item: .constant(TodoItemWithoutDescription))
                .previewDisplayName("Without Description")
            
        StateFulPreviewWrapper(TodoItemWithDescription){ TodoItem in
            TodoItemRow(item: TodoItem)
                
            }
            .previewDisplayName("With Description")
     
               
        }
                .previewLayout(.fixed(width: 300, height: 70))
        
    }
        
}
