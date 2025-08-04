//
//  ContentView.swift
//  weSplit
//
//  Created by Qayyax on 8/4/25.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    Form{
      ForEach(0..<100) { number in
        Text("Row \(number)")
      }
    }
  }
}

#Preview {
  ContentView()
}
