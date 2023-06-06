//
//  ContentView.swift
//  SandwichApp
//
//  Created by Tia Lendor on 5/30/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: SandwichStore
    @State private var sandwiches: [Sandwich] = []
    
    var body: some View {
        NavigationView {
            List{
                ForEach(store.sandwiches) { sandwich in
                    SandwichCell(sandwich: sandwich)
                }
                .onMove(perform: moveSandwich)
                .onDelete(perform: deleteSandwich)
                HStack {
                    Spacer()
                    Text("\(store.sandwiches.count) Sandwiches")
                    Spacer()
                }
            }
            .navigationTitle("Tia's Sandwiches")
            .toolbar {
                #if os(iOS)
                EditButton()
                #endif
                Button("Add", action: makeSandwich)
            }
            Text("Select a sandwich")
                .font(.largeTitle)
        }
        .onAppear(perform: restockSandwiches)
//        .onReceive(store.$sandwiches) { newSandwiches in
//            sandwiches = newSandwiches
//        }
    }
    
    func restockSandwiches() {
        store.sandwiches = testData
    }
    
    func makeSandwich() {
        withAnimation {
            store.sandwiches.append(store.ChefsChoice())
        }
    }
    
    func moveSandwich(from: IndexSet, to: Int) {
        withAnimation {
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteSandwich(offsets: IndexSet) {
        withAnimation {
            store.sandwiches.remove(atOffsets: offsets)
        }
        
        if store.sandwiches.count <= 0 {
            restockSandwiches()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: testStore)
            .preferredColorScheme(.dark)
            .environment(\.sizeCategory, .extraExtraLarge)
    }
}

struct SandwichCell: View {
    var sandwich: Sandwich
    var body: some View {
        NavigationLink(destination: SandwichDetail(sandwich: sandwich)){
            HStack{
                Image(sandwich.thumbnailName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 75)
                    .cornerRadius(8)
                
                VStack(alignment: .leading) {
                    Text(sandwich.name)
                    Text("\(sandwich.ingredientCount) ingredients")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
