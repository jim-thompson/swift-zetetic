//
//  ContentView.swift
//  group-test
//
//  Created by Jim Thompson on 10/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showEm = true
    @State private var showBorders = true
    var body: some View {
        VStack {
            if (showEm) {
                if (showBorders) {
                    Group {
                        Text("1")
                        Text("2")
                        Text("3")
                        Text("4")
                    }
                    .padding(4)
                    .foregroundColor(Color.red)
                    .border(Color.purple, width: 2)
                } else {
                    Group {
                        Text("1")
                        Text("2")
                        Text("3")
                        Text("4")
                    }
                }
            }
            Text("10")
        }
        .padding(100)
        .onTapGesture {
            showBorders.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
