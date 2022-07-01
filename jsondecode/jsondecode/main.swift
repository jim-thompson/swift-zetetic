//
//  main.swift
//  jsondecode
//
//  Created by Jim Thompson on 11/14/21.
//

import Foundation

//print("Hello, World!")
//
//let urlstr = "https://gist.githubusercontent.com/reinder42/932d7671859959f6363b4d9b4e18bb91/raw/306631d79a5166bb0d86b12ac7d8cc42fecb996e/users.json"
//
//struct arrayOfDictionaries: Decodable {
//    var stuff = [[String:String]]()
//}

//if let url = URL(string: urlstr) {
//    if let data = try? Data(contentsOf: url) {
//
//        let str = String(decoding: data, as: UTF8.self)
//        print(str)
//
//        let decoder = JSONDecoder()
//
//        do {
//            let stuff = try decoder.decode(arrayOfDictionaries.self, from: data)
//            print(stuff as Any)
//
//        } catch {
//            print("Oops")
//        }
//    }
//}

//struct foo: Codable {
//    var str: [String:String]
//}
//
//let jsonstr = "[ \"bar\" : \"foo\" ]"
//
//print(jsonstr)
//
//let data = jsonstr.data(using: .utf8)
//print(data)
//
//let decoder = JSONDecoder()
//
//do {
//    let foostuff = try decoder.decode(foo.self, from: data!)
//    print(foostuff as Any)
//}
    
//struct GroceryProduct: Codable {
//    var name: String
//    var points: Int
//    var description: String?
//}

//struct foo: Codable {
//    var stuff = [[String:String]]()
//}

let testdata = """
[
  {
    "first_name": "Ford",
    "last_name": "Prefect",
    "age": 5000
  },
  {
    "first_name": "Zaphod",
    "last_name": "Beeblebrox",
    "age": 999
  },
  {
    "first_name": "Arthur",
    "last_name": "Dent",
    "age": 42
  },
  {
    "first_name": "Trillian",
    "last_name": "Astra",
    "age": 1234
  }
]
""".data(using: .utf8)!

//let decoder = JSONDecoder()
//let product = try decoder.decode(foo.self, from: json)

let jsonObject = try JSONSerialization.jsonObject(with: testdata, options: [])
//
//struct jsonDecoded {
//    var entries = [[String:String]]()
//}
//
//var decodedArrayOfDicts = jsonDecoded()

func populateArrayOfDictsFromJSONObject(object: Any) -> [[String:String]]
{
    var returnValue = [[String:String]]()
    
    if let jsonArray = object as? [Any] {
        for item in jsonArray {
            if let jsonDict = item as? [String: Any] {
                var entryDict = [String:String]()
                
                for (key, value) in jsonDict {
                    if let strValue = value as? String {
                        entryDict[key] = strValue
                    } else if let intValue = value as? Int {
                        entryDict[key] = "\(intValue)"
                    }
                }
                
                returnValue.append(entryDict)
            }
        }
    }
}


for (index, dict) in decodedArrayOfDicts.entries.enumerated() {
    print("Element \(index):")
    for (key, value) in dict {
        print("    \(key): \(value)")
    }
}

//print(product.name) // Prints "Durian"

