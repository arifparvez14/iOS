//
//  ContentView.swift
//  VStack
//
//  Created by Sharetrip-iOS on 14/09/2020.
//  Copyright © 2020 AP. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading ,spacing: 10){
            Text("First Subview").background(Color.blue)
            Text("Second Subview").background(Color.yellow)
            Text("Third Subview").background(Color.red)
            Text("Fourth Subview").background(Color.orange)
            HStack(alignment: .center){
                Rectangle()
                    .foregroundColor(Color.green)
                
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
                Image(systemName: "4.circle")
            }.border(Color.green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
