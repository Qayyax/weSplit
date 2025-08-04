//
//  ContentView.swift
//  weSplit
//
//  Created by Qayyax on 8/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
  @State private var name = ""
    var body: some View {
        NavigationStack {
                Section {
                  Form{
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                  }
                }
                Section {
                  Form{
                    Text("Hello, world!")
                    Text("Hello, world!")
                  }
                }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
