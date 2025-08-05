//
//  ContentView.swift
//  weSplit
//
//  Created by Qayyax on 8/4/25.
//

import SwiftUI

struct ContentView: View  {
  @State private var checkAmount = 0.0
  @State private var numberOfPeople = 2
  @State private var tipPercentage = 20
  
  let tipPercentages = [10, 15, 20, 25, 0]
  var body: some View {
    Text("Hello, world!")
  }
}

#Preview {
  ContentView()
}
