//
//  SymbolVM.swift
//  ConcurrencyView
//
//  Created by MacBook Pro on 22/04/24.
//

import Foundation

class SymbolVM: ObservableObject {
    @Published var symbols: [Symbol] = Symbol.dummyData
    
    
    // MARK: -ASYNCHRONOUS
    func downloadImageWithoutBlockingUI() async {
        let urlString = "https://res.cloudinary.com/dom97btrg/image/upload/v1713407655/samples/coffee.jpg?uuid=\(UUID().uuidString)"
        
        guard let url = URL(string: urlString) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            print(data)
            print(url)
        } catch {
            print("Error downloading image: \(error)")
        }
    }
    
    // MARK: -SYNCHRONOUS
    func downloadImageAndBlockUI() {
        let urlString = "https://res.cloudinary.com/dom97btrg/image/upload/v1713407655/samples/coffee.jpg?uuid=\(UUID().uuidString)"
        
        guard let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: 2)
            let output = try? Data(contentsOf: url)
            
            print(output!)
            print(url)
        }
    }
}
