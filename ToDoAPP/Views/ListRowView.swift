//
//  ListRowView.swift
//  ToDoAPP
//
//  Created by Bartosz Rzechółka on 01/08/2022.
//

import SwiftUI

struct ListRowView: View {
    
    let todo: TodoModel
    
    
    var body: some View {
        VStack{
        HStack {
            Image(systemName: todo.isCompleted ?  "checkmark.square" : "square")
                .foregroundColor(todo.isCompleted ? .green : .red)
            Text(todo.title)
            
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
            
            
            HStack{
       
            infoPanelView(todo: todo)
                .padding(.horizontal)
                
               
        
            
            }
    }
    }
}

struct ListRowView_Previews: PreviewProvider {
    
     static var todo1 = TodoModel(title: "First", isCompleted: false)
     static var todo2 = TodoModel(title: "second", isCompleted: true)
    
    
    static var previews: some View {
        Group {
            ListRowView(todo: todo1)
            ListRowView(todo: todo2)
        }
        .previewLayout(.sizeThatFits)
    }
}
