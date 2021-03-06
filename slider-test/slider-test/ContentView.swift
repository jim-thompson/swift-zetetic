//
//  ContentView.swift
//  slider-test
//
//  Created by Jim Thompson on 10/13/21.
//

import SwiftUI

struct ContentView: View {
    @State private var speed = 50.0
    @State private var isEditing = false
    
//    var body: some View {
//        Slider(
//            value: $speed,
//            in: 0...100,
//            step: 5
//        ) {
//            Text("Speed")
//        } minimumValueLabel: {
//            Text("0")
//        } maximumValueLabel: {
//            Text("100")
//        } onEditingChanged: { editing in
//            isEditing = editing
//        }
//        Text("\(speedDisplay)")
//            .foregroundColor(isEditing ? .red : .blue)
//    }
    
    var body: some View {
        VStack {
            Slider(value: $speed,
                   in: 0...100, step: 0.1,
                   label: {
                Text("Speed")
            }, minimumValueLabel: {
                Text("0")
            }, maximumValueLabel: {
                Text("100")
            },
                   onEditingChanged: { editing in
                isEditing = editing
            })
                .padding(.horizontal)
            Text("\(speedDisplay)")
                .foregroundColor(speed > 50 ? .green : .blue)
        }
    }
    
    var speedDisplay: String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1

        return formatter.string(from: NSNumber(value: speed)) ?? "?"
//        return "?"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
