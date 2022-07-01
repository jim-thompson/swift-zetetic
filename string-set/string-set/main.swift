//
//  main.swift
//  string-set
//
//  Created by Jim Thompson on 6/27/22.
//

import AppKit

class WordGrinder {
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    var letters : Set<String> = Set<String>()
    var two_letter_list : [String: [String]] = [:]
    
    //let test_input = """
    //Coconut
    //Conduct
    //Conduction
    //Conduit
    //Count
    //Cutout
    //Donut
    //Duct
    //Induct
    //Induction
    //Intuit
    //Intuition
    //Noun
    //Outdid
    //Outdo
    //Tout
    //Tuition
    //Tunic
    //Tutu
    //Udon
    //Unction
    //Undid
    //Undo
    //Unit
    //Unto
    //"""
    
    let word_list = """
Alive
Anvil
Avail
Available
Avian
Believable
Believe
Bevel
Bivalve
Eave
Eleven
Enliven
Enviable
Even
Evil
Lava
Lave
Leave
Leaven
Levee
Level
Livable
Live
Liveable
Liven
Naive
Naval
Nave
Navel
Vain
Vale
Valve
Vane
Vanilla
Vanillin
Veal
Veil
Vein
Venal
Viable
Vibe
Vile
Villa
Villain
Vine
"""
    
    func words(from str: String) -> [String] {
        let separators = CharacterSet(charactersIn: " \n")
        return str.components(separatedBy: separators)
    }
    
    func validate_words_in(_ string_to_test: String) -> Bool {
        for w in words(from: string_to_test.lowercased()) {
            //        print("testing word \(w)")
            if w.count <= 3 {
                print("Word too short: \(w)")
                return false
            }
            
            for c in w {
                if alphabet.contains(c) {
                    let s = String(c)
                    if letters.contains(s) {
                        //                    print("    Testing char \(c), found")
                    } else {
                        letters.insert(s)
                        //                    print("    Testing char \(c), not found")
                    }
                }
            }
        }
        
        // If we didn't find exactly seven letters, then the input is ill-formed.
        if letters.count < 7 {
            print("Too few unique letters!")
            return false
        } else if letters.count > 7 {
            print("Too many unique letters!")
            return false
        } else {
            return true
        }
    }
    
    //unique_chars_in(test_input)
    
    func create_two_letter_list(_ string_to_digest: String) {
        for w in words(from: string_to_digest.lowercased()) {
            let prefix = String(w.prefix(2))
            
            if two_letter_list[prefix] == nil {
                //            print("Creating word list for prefix \(prefix)")
                two_letter_list[prefix] = []
                //            print("Now \(two_letter_list.count) prefixes")
            }
            
            two_letter_list[prefix]!.append(w)
        }
    }
    
    func validate() -> Bool {
        return true
    }
    
    func grind() {
        create_two_letter_list(word_list)
        
        let sorted_keys = two_letter_list.sorted {
            return $0.key < $1.key
        }
        
        
        var current_letter = ""
        for (p, l) in sorted_keys {
            if p.prefix(1) != current_letter {
                print()
                current_letter = String(p.prefix(1))
            }
            print("\(p.uppercased())", terminator: "")
            print("-\(l.count) ", terminator: "")
        }
        print()
    }
    
    //for (prefix, _) in two_letter_list {
    //    print(prefix)
    //}
    
    //print("----")
    //print("Found \(letters.count) unique letters:")
    
    //for f in letters.sorted() {
    //    print(f, " ", terminator: "")
    //}
    //print()
    
}

var foo = WordGrinder()

if !foo.validate() {
    print("*** ERROR in input. Aborting.")
    exit(1)
}

foo.grind()
