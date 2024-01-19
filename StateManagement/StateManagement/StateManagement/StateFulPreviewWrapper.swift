//
//  StateFulPreviewWrapper.swift
//  StateManagement
//
//  Created by Hamza on 18/01/2024.
//

import SwiftUI



struct StateFulPreviewWrapper<Value , Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content
    
    var body: some View {
        content($value)
    }
        
  init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
    self._value = State(wrappedValue: value)
    self.content = content
    
  }

}



