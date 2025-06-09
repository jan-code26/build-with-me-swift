//
//  ContentView.swift
//  TipCalculator
//
//  Created by jahnavi patel on 6/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var billAmount: Double = 0.0
    @State private var selectedTipOption = 15
    @State private var customTipInput = ""
    @State private var split = 1

    let tipOptions = [10, 15, 20, -1] // -1 = Custom

    var tipPercentage: Double {
        if selectedTipOption == -1 {
            return Double(customTipInput) ?? 0
        } else {
            return Double(selectedTipOption)
        }
    }

    var tip: Double {
        billAmount * tipPercentage / 100
    }

    var totalPerPerson: Double {
        return (billAmount + tip) / Double(max(split, 1))
    }

    var body: some View {
        VStack(spacing: 30) {
            Text("Tip Calculator")
                .font(.system(size: 40, weight: .heavy, design: .serif))

            VStack(spacing: 10) {
                Text("Bill Total")
                    .font(.title2)
                TextField("Enter amount", value: $billAmount, format: .number)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }

            VStack(spacing: 10) {
                Text("Select Tip")
                    .font(.title2)

                Picker("Tip", selection: $selectedTipOption) {
                    ForEach(tipOptions, id: \.self) { option in
                        if option == -1 {
                            Text("Custom")
                        } else {
                            Text("\(option)%")
                        }
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)

                if selectedTipOption == -1 {
                    TextField("Enter custom tip %", text: $customTipInput)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }

            VStack(spacing: 10) {
                Text("Split Between")
                    .font(.title2)
                HStack(spacing: 40) {
                    Button(action: {
                        if split > 1 { split -= 1 }
                    }) {
                        Text("-")
                            .frame(width: 44, height: 44)
                            .background(.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    Text("\(split)")
                        .font(.system(size: 40, weight: .bold))

                    Button(action: { split += 1 }) {
                        Text("+")
                            .frame(width: 44, height: 44)
                            .background(.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }

            VStack(spacing: 10) {
                Text("Tip: $\(tip, specifier: "%.2f")")
                Text("Total Per Person: $\(totalPerPerson, specifier: "%.2f")")
            }
            .font(.title3)
            .padding(.top)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
