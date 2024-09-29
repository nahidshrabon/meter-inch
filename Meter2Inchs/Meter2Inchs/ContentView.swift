//
//  ContentView.swift
//  Meter2Inchs
//
//  Created by Md. Nahidul Islam on 29/9/2024.
//

import SwiftUI

struct ContentView: View {
    @State var meterText: String = ""
    @State var inchText: String = ""
    
    @FocusState var isMeterFocused: Bool
    @FocusState var isInchFocused: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            TextField("Enter Meter Value", text: $meterText)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numbersAndPunctuation)
                .focused($isMeterFocused)
                .onChange(of: meterText) { _, newValue in
                    if let value = Double(newValue) {
                        if isMeterFocused {
                            inchText = String(format: "%.2f", value * 39.3700787)
                        }
                    } else {
                        inchText = ""
                    }
                }
            
            TextField("Enter Inch Value", text: $inchText)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numbersAndPunctuation)
                .focused($isInchFocused)
                .onChange(of: inchText) { _, newValue in
                    if let value = Double(newValue) {
                        if isInchFocused {
                            meterText = String(format: "%.2f", value / 39.3700787)
                        }
                    } else {
                        meterText = ""
                    }
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(.teal)
    }
}

#Preview {
    ContentView()
}
