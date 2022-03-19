//
//  SiMOIB_1
//
//  Created on 11.02.22.
//
import Foundation

let letters = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
let digits = "0123456789"
let chars = letters + digits

var passwords = [String]()
var times = [Double]()

generatePasswords()
printAllGenerations()
frequencyСheck(comboString(of: passwords))


func printAllGenerations() {
    for index in 0...passwords.count - 1 {
        print("_\(index + 1)_:")
        print("Password: \(passwords[index])")
        print("Gen time: \(times[index]) sec")
    }
}

func generatePasswords() {
    let numPass = 100
    print("Enter the number of characters:")
    while let input = readLine() {
        if let int = UInt(input) {
            for _ in 1...numPass {
                let start = DispatchTime.now()
                passwords.append(randomString(of: Int(int), chars: chars))
                let end = DispatchTime.now()
                let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
                let timeInterval = Double(nanoTime) / 1_000_000_000
                times.append(timeInterval)
            }
            break
        } else {
            print("Why are you being so coy?")
        }
    }
}

func randomString(of length: Int, chars: String) -> String {
    var randStr = ""
    for _ in 0 ..< length {
        randStr.append(chars.randomElement()!)
    }
    return randStr
}

func comboString(of pass: [String]) -> String {
    var comboS = ""
    for index in 0...pass.count - 1 {
        comboS += pass[index]
    }
    return comboS
}

func frequencyСheck(_ str: String) {
    
    var count = [Int](repeating: 0, count: chars.count)
    
    let arrStr = Array(str)
    
    for index in 0...chars.count - 1 {
        for char in 0...arrStr.count - 1 {
            let indexT = chars.index(chars.startIndex, offsetBy: index)
            if chars[indexT] == arrStr[char] {
                count[index] += 1
            }
        }
    }
    
    print("\n")
    for index in 0...chars.count - 1 {
        let indexT = chars.index(chars.startIndex, offsetBy: index)
        print("\(chars[indexT]) : \(count[index])")
    }
    
}
