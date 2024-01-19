//
//  JSONView.swift
//  StateManagement
//
//  Created by Hamza on 19/01/2024.
//

import SwiftUI

struct JSONView: View {
    
    @State var items: [TodoItem] = []
    
    var body: some View {
        
        VStack {
            ForEach(items, id: \.id) { item in
                Text(item.title)
            }
        }
        .onAppear {
            self.getData(fileName: "TodotIem")
        }
    }
    
    func getData(fileName: String) {
        
        var items: [TodoItem] = []
        
        if let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") {
            
            if let data = try? Data(contentsOf: fileURL) {
                do {
                    let decoder = JSONDecoder()
                    items = try decoder.decode([TodoItem].self, from: data)
                } catch {
                    fatalError("Couldn't decode \(fileName).json from main bundle.\n\(error)")
                }
            }
        }
        
        self.items = items
    }
}

struct JSONView_Previews: PreviewProvider {
    static var previews: some View {
        JSONView()
    }
}
