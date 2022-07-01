//
//  ContentView.swift
//  toggletest
//
//  Created by Jim Thompson on 11/14/21.
//

import SwiftUI

struct NakedCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .foregroundColor(configuration.isOn ? .accentColor : .secondary)
                .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                .imageScale(.large)
        }
//        .buttonStyle(PlainButtonStyle())
    }
}

// An example view showing the style in action
struct ContentView: View {
    @State private var isOn = false

    var body: some View {
        Toggle("Switch Me", isOn: $isOn)
            .toggleStyle(NakedCheckboxToggleStyle())
    }
}
