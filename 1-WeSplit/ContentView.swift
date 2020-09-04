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
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2

    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        Form {
            Section {
                TextField("Amount", text: $checkAmount)
                    .keyboardType(.numberPad)

            }
            
            Section {
                Text("$\(checkAmount)")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
