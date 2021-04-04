//
//  ContentView.swift
//  WellSplit
//
//  Created by Sharetrip-iOS on 18/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
    @State private var name = ""
    
    var body: some View {
        NavigationView{
            Form {
                Group{
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }

            }
            .navigationTitle(Text("SwiftUI"))
        }
        
        ForEach(0..<5){
            Text("Row \($0)")
        }
        
        Button("Tap Count \(tapCount)") {
            self.tapCount += 1
        }
        
        Form {
            TextField("Enter your name", text: $name)
            Text("Your name is \(name)")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
