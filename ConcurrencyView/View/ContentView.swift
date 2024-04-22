//
//  ContentView.swift
//  ConcurrencyView
//
//  Created by MacBook Pro on 22/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var symbolVM = SymbolVM()
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 100), spacing: 12)
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(symbolVM.symbols) { item in
                        Image(systemName: item.name)
                            .padding()
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .frame(width: 100, height: 100)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.indigo, Color.cyan]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                    }
                }
            }
            .navigationTitle("Symbols")
        }
    }
}

#Preview {
    ContentView()
}
