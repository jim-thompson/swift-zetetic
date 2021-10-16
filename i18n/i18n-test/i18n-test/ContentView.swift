//
//  ContentView.swift
//  i18n-test
//
//  Created by Jim Thompson on 10/15/21.
//

import SwiftUI

struct ContentView: View {
    let name = "John"
    let appleCount = 0
    
    var body: some View {
        VStack {
            Text("title-name \(name)")
            Text("fruit-count \(appleCount)", tableName: "Plurals")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
