//
//  SymbolVM.swift
//  ConcurrencyView
//
//  Created by MacBook Pro on 22/04/24.
//

import Foundation

class SymbolVM: ObservableObject {
    @Published var symbols: [Symbol] = Symbol.dummyData
}
