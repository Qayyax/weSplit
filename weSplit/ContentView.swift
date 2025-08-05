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
  
  var totalPerPerson: Double {
    // calculate the total per person here
    return 0
  }
  
  var body: some View {
    NavigationStack {
    Form {
      // Asks for the amount to enter and the number of people splitting
      Section {
        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "CAD"))
          .keyboardType(.decimalPad)
        
        // Picker for how many people would split the cheque
        Picker("Number of People",  selection: $numberOfPeople  ) {
          ForEach(2..<100) {
            Text("\($0) people")
          }
        }
        .pickerStyle(.navigationLink)
      } header: {
        HStack {
          Text("Enter your Amount")
        }
      }
      
      // tip percentage section
      Section {
        Picker("Tip percentage", selection: $tipPercentage) {
          ForEach(tipPercentages, id: \.self) {
            Text($0, format: .percent)
          }
        }
        .pickerStyle(.segmented)
      } header: {
        HStack {
          Text("How much tip do you want to leave?")
        }
      }
      
      // Shows the total amount
      Section{
        Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "CAD"))
      } header: {
        HStack{
          Text("Total amount")
        }
      }
    }
    .navigationTitle("Bill splitting app")
    }
  }
}

#Preview {
  ContentView()
}
