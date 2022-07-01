//
//  main.swift
//  fmantest
//
//  Created by Jim Thompson on 11/7/21.
//

import Foundation

//print("Hello, World!")

var fman = FileManager.default

//print()
//
//let username: String = NSUserName()
//let fullusername: String = NSFullUserName()
//
//print("User name = <\(username)>")
//print("Full user name = <\(fullusername)>")
//
//print()
//
//let nshome = NSHomeDirectory()
//print("NS home = <\(nshome)>")
//
//let home = fman.homeDirectoryForCurrentUser
//print("home = <\(home)>")
//
//print()
//
//let nstmp = NSTemporaryDirectory()
//print("NS temp = <\(nstmp)>")
//
//let tmp = fman.temporaryDirectory
//print("temp = <\(tmp)>")
//
//print()
//
//let root = NSOpenStepRootDirectory()
//print("root = <\(root)>")
//
//let root_url = NSURL.fileURL(withPath: root, isDirectory: true)
//print("root URL = <\(root_url)>")
//
//let root_url2 = NSURL(fileURLWithPath: root, isDirectory: true)
//print("root URL 2 = <\(root_url2)>")
//
//print()

let cwd = fman.currentDirectoryPath
let cwd_url = URL(fileURLWithPath: cwd)

let attrKeys: [URLResourceKey] = [
    .fileAllocatedSizeKey,
    .isDirectoryKey,
    .isExecutableKey,
    .isSymbolicLinkKey
]

let attrKeysSet = Set(attrKeys)

var homefiles = try? fman.contentsOfDirectory(
    at: cwd_url,
    includingPropertiesForKeys: attrKeys,
    options: []
)

extension URL: Comparable {
    public static func < (lhs: URL, rhs: URL) -> Bool {
        let lhsFile = lhs.lastPathComponent
        let rhsFile = rhs.lastPathComponent
        return lhsFile.caseInsensitiveCompare(rhsFile) == .orderedAscending
    }
}

func fileAttributStrings(_ file: URL) -> (String, String) {
    let resValues = try? file.resourceValues(forKeys: attrKeysSet)
    
    guard resValues != nil else { return ("", "") }
    
    let _resValues = resValues!
    
    // Pull the various attributes we're interested in out of the
    // resource value set.
    let isDir = _resValues.isDirectory ?? false
    let isExecutable = _resValues.isExecutable ?? false
    let isSymbolicLink = _resValues.isSymbolicLink ?? false
    let size: Int? = _resValues.fileAllocatedSize

    let typeStr = isDir ? "/" : isSymbolicLink ? "@" : isExecutable ? "*" : ""
    
    var sizeStr = "          "
    if size != nil && !isDir && !isSymbolicLink {
        sizeStr = humanSizeStr(size!)
    }

    return (typeStr, sizeStr)
}

// Borrow from this post: https://stackoverflow.com/questions/24196689/how-to-get-the-power-of-some-integer-in-swift-language
precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ** : PowerPrecedence
func ** (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

var show_bytes = true

func humanSizeStr(_ size: Int) -> String {
    let kB = 2 ** 10
    let MB = kB ** 2
    let _ = kB ** 3
    let _ = kB ** 4
    
    
    var formatstr = NSString(string: "%7.1f")
    var dsize = Double(size)
    var squal = "   "
    
    if size > MB {
        dsize = Double(size) / Double(MB)
        squal = " MB"
    } else if size > kB {
        dsize = Double(size) / Double(kB)
        squal = " kB"
    } else {
        dsize = Double(size)
        if show_bytes {
            formatstr = NSString(string: "%4d")
            squal = " bytes"
        } else {
            formatstr = NSString(string: "%7d")
            squal = "   "
        }
    }

    let sizestr = NSString(format: formatstr, dsize) as String
    return sizestr + squal
}


var files = homefiles!
var sortedfiles = files.sorted()

print("Files in \(cwd):")
for f in sortedfiles {
    let (typestr, sizestr) = fileAttributStrings(f)
    print("\(sizestr) \(f.lastPathComponent)\(typestr)")
}
