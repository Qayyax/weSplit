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
  @FocusState private var amountIsFocused: Bool
  
  let tipPercentages = [10, 15, 20, 25, 0]
  
  var totalPerPerson: Double {
    let peopleCount = Double(numberOfPeople + 2)
    let tipSelection = Double(tipPercentage)
    
    // calculation
    let tipValue = checkAmount * (tipSelection / 100)
    let grandTotal = checkAmount + tipValue
    let amountPerPerson = grandTotal / peopleCount
    
    return amountPerPerson
  }
  
  var totalAmount: Double {
    let tipValue = checkAmount * (Double(tipPercentage) / 100)
    let grandTotal = checkAmount + tipValue
    return grandTotal
  }
  
  var body: some View {
    NavigationStack {
    Form {
      // Asks for the amount to enter and the number of people splitting
      Section ("Enter your Amount"){
        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "CAD"))
          .keyboardType(.decimalPad)
          .focused($amountIsFocused)
        
        // Picker for how many people would split the cheque
        Picker("Number of People",  selection: $numberOfPeople  ) {
          ForEach(2..<100) {
            Text("\($0) people")
          }
        }
      }
      
      // tip percentage section
      Section ("How much tip do you want to leave?") {
        Picker("Tip percentage", selection: $tipPercentage) {
          ForEach(tipPercentages, id: \.self) {
            Text($0, format: .percent)
          }
        }
        .pickerStyle(.segmented)
      }
      // Total amount for the check
      Section ("Total amount"){
        Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "CAD"))
          .foregroundStyle(tipPercentage == 0 ? Color.red : .primary)
      }
      
      // Shows the total amount
      Section ("Total amount per person"){
        Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "CAD"))
      }
    }
    .navigationTitle("Bill splitting app")
    .toolbar {
      if amountIsFocused {
        Button("Done") {
          amountIsFocused = false
        }
      }
    }
    }
  }
}

#Preview {
  ContentView()
}
