//
//  ConvertTool.swift
//  NativeiOS
//
//  Created by thinkpower on 2021/6/9.
//

import Foundation

public class ConvertTool
{
    
    // 16進位字串轉成data
   static func dataWithHexString(hex: String) -> Data {
        var hex = hex
        var data = Data()
        while(hex.count > 0) {
            let subIndex = hex.index(hex.startIndex, offsetBy: 2)
            let c = String(hex[..<subIndex])
            hex = String(hex[subIndex...])
            var ch: UInt32 = 0
            Scanner(string: c).scanHexInt32(&ch)
            var char = UInt8(ch)
            data.append(&char, count: 1)
        }
        return data
    }
    
    // data轉成16進位字串
    static  func hexEncodedString(data:Data) -> String {
        let hexDigits = Array("0123456789ABCDEF".utf16)
        var hexChars = [UTF16.CodeUnit]()
        hexChars.reserveCapacity(data.count * 2)

        for byte in data {
            let (index1, index2) = Int(byte).quotientAndRemainder(dividingBy: 16)
          hexChars.append(hexDigits[index1])
          hexChars.append(hexDigits[index2])
        }

        return String(utf16CodeUnits: hexChars, count: hexChars.count)
      }
}
