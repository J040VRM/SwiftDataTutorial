//
//  Home.swift
//  SwiftDataTutorial
//
//  Created by João Vitor Rocha Miranda on 07/08/25.
//

import SwiftUI
import SwiftData

struct Home: View {
    /*Active Todos*/
    @Query(
        filter: #Predicate<Todo> {
            !$0.isCompleted
        },
        sort: [SortDescriptor(
            \Todo.lastUpdated,
             order: .reverse
        )],
        animation: .snappy) private var activeList: [Todo]
    
    /*Model Context*/
    @Environment(\.modelContext) private var context
    @State private var showAll: Bool = false
    var body: some View {
        List{
            Section(activeSectionTitle){
                ForEach(activeList){
                    TodoRowView(todo: $0)
                }
            }
            /*Compelted list*/
            CompletedTodoList(showAll: $showAll)
            
        }
        .toolbar{
            ToolbarItem(placement: .bottomBar){
                Button(action: {
                    /*Creating an empty todo*/
                    let todo = Todo(task: "", priority: .normal)
                    /*Savin todo*/
                    context.insert(todo)
                }, label:{
                    Image(systemName: "plus.circle.fill")
                        .fontWeight(.light)
                        .font(.system(size: 42))
                })
            }
        }
    }
    
    var activeSectionTitle: String{
        let count = activeList.count
        return count == 0 ? "Active" : "Active (\(count))"
    }
}

#Preview {
    ContentView()
}
