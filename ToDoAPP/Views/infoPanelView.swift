//
//  infoPanelView.swift
//  ToDoAPP
//
//  Created by Bartosz Rzechółka on 02/08/2022.
//

import SwiftUI

struct infoPanelView: View {
    
    @State private var isInfoPanelVisible: Bool = false
    
    let todo: TodoModel
    
    var body: some View {
        HStack {
            Image(systemName: "info.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
                .onLongPressGesture(minimumDuration: 1) {
                    withAnimation(.easeOut){
                        isInfoPanelVisible.toggle()
                    }
                }
            Spacer()
            
           
           VStack{
               HStack{
                Text("ID: \(todo.id)")
                    .multilineTextAlignment(.leading)
                    .frame( maxHeight: 20)
                    .font(.headline)
                   
                   
                   Spacer()
               }
               HStack {
                   Text("Title: \(todo.title)")
                        .multilineTextAlignment(.leading)
                        .frame(maxHeight: 20)
                    .font(.headline)
                   
                   Spacer()
               }
            
               HStack {
                   Text("IsCompleted: \(todo.isCompleted ? "YES" : "NO")")
                        .multilineTextAlignment(.trailing)
                        .frame(width: .infinity, height: 20)
                    .font(.headline)
                   
                   Spacer()
               }
                    
            }
           .padding(8)
           .background(.ultraThinMaterial)
           .cornerRadius(10)
           .frame(maxWidth:420)
           .opacity(isInfoPanelVisible ? 1 : 0)
            
        }
        
        
        
        
    }
}

struct infoPanelView_Previews: PreviewProvider {
    
    static var todo1 = TodoModel(title: "First", isCompleted: false)
    static var todo2 = TodoModel(title: "second", isCompleted: true)
    
    static var previews: some View {
        infoPanelView(todo: todo1)
            .previewLayout(.sizeThatFits)
    }
}
