//
//  ContentView.swift
//  images
//
//  Created by Jim Thompson on 11/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("friday")
            .resizable()
            .scaledToFit()
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
