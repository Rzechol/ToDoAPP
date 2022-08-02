//
//  ListView.swift
//  ToDoAPP
//
//  Created by Bartosz Rzechółka on 01/08/2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
   
    

    var body: some View {
        ZStack {
            if listViewModel.remoteTodos.isEmpty {
                NoTodoView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.remoteTodos) { item in
                        ListRowView(todo: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.uptadeTodo(item: item)
                                }
                            }
                            
                    }
                    .onDelete(perform: listViewModel.deleteTodo)
                    .onMove(perform:listViewModel.moveTodo)
                }
                .listStyle(DefaultListStyle())
            }
        }
        
        .navigationTitle("Todo list 📋")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
        
    }
}


