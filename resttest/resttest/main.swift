//
//  main.swift
//  resttest
//
//  Created by Jim Thompson on 11/14/21.
//

import Foundation

var session = URLSession.shared

struct arrayOfDictionaries: Codable {
    var stuff = [[String:String]]()
}

let url = URL(string: "https://gist.githubusercontent.com/reinder42/932d7671859959f6363b4d9b4e18bb91/raw/306631d79a5166bb0d86b12ac7d8cc42fecb996e/users.json")!

let task = session.dataTask(with: url) { data, response, error in
//    print(data as Any)
//    print(response as Any)
//    print(error as Any)
    
    if (error != nil) || (data == nil) {
        print("Client error")
        return
    }
    
    let resp = response as? HTTPURLResponse
    
    guard resp != nil else {
        print("Error unpacking response")
        return
    }
    
    let code: Int = resp!.statusCode
    print("Server response \(code).")

    guard (200...299).contains(code) else {
              print("Server error \(code).")
              return
          }
    
    guard let mime = response!.mimeType, (mime == "application/json" || mime == "text/plain") else {
        print("Wrong MIME type")
        return
    }
    
    do {
        let json = try JSONSerialization.jsonObject(with: data!, options: []) as? arrayOfDictionaries
        print(json)
//
//        let str = String(decoding: data!, as: UTF8.self)
//        print(str)

        
        
    } catch {
        print("JSON error")
    }
    
    print("That's all...")
}

task.resume()

while(true) {
}

//print("Done.")
