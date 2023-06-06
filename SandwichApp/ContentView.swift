//
//  ContentView.swift
//  SandwichApp
//
//  Created by Tia Lendor on 5/30/23.
//

import SwiftUI

struct ContentView: View {
//    var sandwiches: [Sandwich] = []
    @ObservedObject var store: SandwichStore
    
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
    }
    
    func makeSandwich() {
        withAnimation {
            store.sandwiches.append(Sandwich(name: "Patty Melt", ingredientCount: 4))
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
