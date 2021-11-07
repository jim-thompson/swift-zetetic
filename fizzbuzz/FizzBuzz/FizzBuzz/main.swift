//
//  main.swift
//  FizzBuzz
//
//  Created by Jim Thompson on 11/1/21.
//

import Foundation

for index in 1...100 {
    var output: String
//    if index % 15 == 0 {
    if (index % 5 == 0) && (index % 3 == 0) {
        output = "fizzbuzz"
    } else if index % 5 == 0 {
        output = "fizz"
    } else if index % 3 == 0 {
        output = "buzz"
    } else {
        output = "\(index)"
    }

    print(output)
}
