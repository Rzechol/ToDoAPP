//
//  ToDoAPPApp.swift
//  ToDoAPP
//
//  Created by Bartosz Rzechółka on 01/08/2022.
//

import SwiftUI

@main
struct ToDoAPPApp: App {
    
   @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
