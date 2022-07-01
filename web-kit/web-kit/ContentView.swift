//
//  ContentView.swift
//  webkit
//
//  Created by Jim Thompson on 11/18/21.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    var body: some View {
        Text("This is a **test**!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView

    let webView = WKWebView()
    
    let content = """
    <html>
      <body>
        Hello, world
      </body>
    </html>
"""
    
    func makeUIView(context: Context) -> WKWebView {
        let baseURL = URL(string: "file:///Users/jct/Desktop/TestPage.html")!
        
//        webView.loadHTMLString(content, baseURL: baseURL)
        webView.load(URLRequest(url: baseURL))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) { }
}
