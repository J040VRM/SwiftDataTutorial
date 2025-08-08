//
//  CompletedTodoList.swift
//  SwiftDataTutorial
//
//  Created by João Vitor Rocha Miranda on 07/08/25.
//

import SwiftUI
import SwiftData

struct CompletedTodoList: View {
    @Binding var showAll: Bool
    @Query private var completedList: [Todo] //Fetches all instances of the attached model type.

    
    init(showAll: Binding<Bool>){
        let predicate = #Predicate<Todo>{$0.isCompleted }
        let sort = [SortDescriptor(\Todo.lastUpdated, order: .reverse)]
        
        var descriptor = FetchDescriptor(predicate: predicate, sortBy: sort)
        if !showAll.wrappedValue{
            /*Limiting to 5*/
            descriptor.fetchLimit = 5
        }
        
        
        _completedList = Query(descriptor, animation: .snappy)
        _showAll = showAll
    }
    
    
    
    var body: some View {
        Section{
            ForEach(completedList){
                TodoRowView(todo: $0)
            }
        }header: {
            HStack{
                Text("Completed")
                
                Spacer(minLength: 0)
                
                if showAll && !completedList.isEmpty{
                    Button("Show Recents"){
                        showAll = false
                    }
                }
            }
            .font(.caption)
        }footer: {
            if completedList.count == 5 && !showAll && !completedList.isEmpty{
                HStack{
                    Text("Showing recent 5 Tasks")
                        .foregroundStyle(.gray)
                    
                    Spacer(minLength: 0)
                    
                    Button("Show All"){
                        showAll = true
                    }
                }
                .font(.caption)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
