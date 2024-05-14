//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Brian Vo on 5/13/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @State private var showUpcoming = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    
    ]
    
    
    var body: some View {
        NavigationStack(){
            UsersView(minimumJoinDate: showUpcoming ? .now : .distantPast, sortOrder: sortOrder)
            .navigationTitle("Users")
            
            .toolbar{
                Button("Add Sample", systemImage: "plus"){
                    
                    try? modelContext.delete(model: User.self)
                    
                    let first = User(name: "Giddey", city: "Oklahoma", joinDate: .now.addingTimeInterval(84000 * -10))
                    let second = User(name: "Lebron", city: "Cleavaland", joinDate: .now.addingTimeInterval(84000 * -5))
                    let third = User(name: "Spongebob", city: "Bikini Bottom", joinDate: .now.addingTimeInterval(84000 * 5))
                    
                    let fourth = User(name: "Patrick", city: "Bikini Bottom", joinDate: .now.addingTimeInterval(84000 * 10))
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                    
                
                
                }
                
                Button(showUpcoming ? "Show everyone" : "Show upcoming"){
                    showUpcoming.toggle()
                }
                Menu("Sort", systemImage: "arrow.up.arrow.down"){
                    Picker("Sort", selection: $sortOrder){
                        Text("Sort by name")
                            .tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate)
                            ])
                        Text("Sort by join date")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                            ])
                        
                    }
                }
                
                
                
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}
