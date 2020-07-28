//
//  ContentView.swift
//  Tipster
//
//  Created by Brandon Law on 2020-07-28.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = ""
    @State private var tipPercentage = 0
    
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var totalTax: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(amount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        
        return tipValue
    }
    
    var totalOverall: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(amount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                // Bill Amount
                Section (header: Text("Bill Amount")) {
                    TextField("Enter bill amount", text: $amount)
                }
                
                // Tip
                Section(header: Text("Tip Percentage")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                // Grand Total
                Section(header: Text("Total")) {
                    Text("$\(totalTax, specifier: "%.2f") in taxes")
                    Text("$\(totalOverall, specifier: "%.2f") in taxes")
                }
            }
            .navigationBarTitle("Tipster")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
