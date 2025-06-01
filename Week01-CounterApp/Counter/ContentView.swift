//
//  ContentView.swift
//  Counter
//
//  Created by jahnavi patel on 6/1/25.
//

import SwiftUI

struct ContentView: View {
    @State var step = 0
    var body: some View {
        VStack(spacing: 40) {
            Text("Counter")
                .font(.system(size: 40, weight: .heavy, design: .serif))
            HStack(spacing: 40) {
                Button(action: { step -= 1 }) {
                    Text("-")
                        .padding()
                        .foregroundColor(.white)
                        .background(.orange)
                        .cornerRadius(10)
                }
                Text(step, format: .number)
                    .font(.system(size: 50, weight: .heavy, design: .serif))
                Button(action: { step += 1 }) {
                    Text("+")
                        .padding()
                        .foregroundColor(.white)
                        .background(.orange)
                        .cornerRadius(10)
                }

            }
            Button(action: { step = 0 }) {
                Text("Reset")
                    .padding([.horizontal], 40)
                    .padding()
                    .foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
