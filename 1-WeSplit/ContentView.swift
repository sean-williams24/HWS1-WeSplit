//
//  ContentView.swift
//  1-WeSplit
//
//  Created by Sean Williams on 03/09/2020.
//  Copyright © 2020 Sean Williams. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2

    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let people = Double(numberOfPeople + 2)
        let percent = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0.0
        let tipAmount = orderAmount / 100 * percent
        
        return (orderAmount + tipAmount) / people
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.numberPad)
                }
                
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2 ..< 99) {
                        Text("\($0) people")
                    }
                }
                
                Section(header: Text("How much tip would you like to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("WeSplit")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
