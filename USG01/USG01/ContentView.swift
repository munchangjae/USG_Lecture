//
//  ContentView.swift
//  USG01
//
//  Created by 문창재 on 2023/01/12.
//

import SwiftUI

struct ContentView: View {
    @State private var isOpen:Bool = true

    
    var body: some View {
        VStack {
           
            
            if isOpen {
                Image(systemName: "lock.open")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                
                Text("열려있습니다.")
                
                Button("잠그기") {
                    isOpen = false
                }
            } else {
                Image(systemName: "lock")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                
                Text("잠겨있습니다.")
                
                Button("열기") {
                    isOpen = true
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
