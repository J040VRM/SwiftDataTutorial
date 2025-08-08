//
//  ContentView.swift
//  SwiftDataTutorial
//
//  Created by João Vitor Rocha Miranda on 07/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            Home()
                .navigationTitle("Todo List")
        }
    }
}

#Preview {
    ContentView()
}
