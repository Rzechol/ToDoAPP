//
//  ListViewModel.swift
//  ToDoAPP
//
//  Created by Bartosz Rzechółka on 01/08/2022.
//

import Foundation
import UIKit

class ListViewModel: ObservableObject {
    
    @Published var remoteTodos: [TodoModel] = [] {
        didSet {
            saveTodo()
        }
    }
    
    let todoKey: String = "todo_list"
    
    init(){
        getTodo()
    }
    
    func getTodo() {
        guard
            let data = UserDefaults.standard.data(forKey: todoKey),
            let savedTodo = try? JSONDecoder().decode([TodoModel].self, from: data)
        else { return }
        
        self.remoteTodos = savedTodo
    }
    func deleteTodo(indexSet: IndexSet) {
        remoteTodos.remove(atOffsets: indexSet)
    }
    
    func moveTodo(from: IndexSet, to: Int) {
        remoteTodos.move(fromOffsets: from, toOffset: to)
    }
    
    func addTodo(title: String) {
        let newTodo = TodoModel(title: title, isCompleted: false)
        remoteTodos.append(newTodo)
    }
    
    func uptadeTodo(item: TodoModel) {
        
        if let index = remoteTodos.firstIndex(where: { $0.id == item.id}) {
            remoteTodos[index] = item.updateCompletion()
        }
        
    }
    func saveTodo() {
        if let encodetData = try? JSONEncoder().encode(remoteTodos) {
            UserDefaults.standard.set(encodetData, forKey: "todo_list")
        }
    }
}
