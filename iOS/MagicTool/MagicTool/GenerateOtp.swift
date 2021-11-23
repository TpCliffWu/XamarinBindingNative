//
//  GenerateOtp.swift
//  NativeiOS
//
//  Created by thinkpower on 2021/6/8.
//

import Foundation


public class GenerateOtp{
    
    //產生barcode otp
    public func  BarcodeOtp( guid:String,  cvc:String,  walletId:String)->String {
        
        
        // 取得HMACKey
        let hmacKey = GetHMACKey(guid: guid) ?? "";
        
        if(hmacKey.isEmpty){
            return "";
        }
        
        
        // 交易時間
        let currentDate = Date();
        let dataFormatter = DateFormatter();
        dataFormatter.timeZone = TimeZone(identifier: "UTC");
        dataFormatter.dateFormat = "yyyyMMddHHmmss";
        let time = dataFormatter.string(from: currentDate);

        
        let nonce = String(Int.random(in: 0...999));
            
        let connectionString = time + cvc + walletId + nonce;
        
        let otp = SubHash(connectionString:connectionString,hmacKey:hmacKey);
        
        let identifyCode = "99";
        let version = "1";
        
        let minFormatter = DateFormatter();
        minFormatter.timeZone = TimeZone(identifier: "UTC");
        minFormatter.dateFormat = "mmss";
        let mmss = dataFormatter.string(from: currentDate);
        let flag = "0";
        
        return identifyCode + version + cvc + walletId + mmss + nonce + flag + otp;
    }
    
    public func NumberOtp(guid:String,cvc:String,payableNumber:String,amount:String)->String
    {
        // 取得HMACKey
        let tag = "[NumberOtp]";
        
        let hmacKey = GetHMACKey(guid: guid) ?? "";
        
        if(hmacKey.isEmpty){
            return "";
        }
        
        let padAmount = max(18, amount.count);
        let amount18 = String(repeatElement("0", count: padAmount - amount.count)) + amount;

         let connectionString = cvc + payableNumber + amount18;
        print (tag + connectionString + "," + hmacKey);
        return SubHash(connectionString:connectionString,hmacKey:hmacKey);

    }

    
    // 讀取檔案取得HMACKey
    private func GetHMACKey( guid:String)->String? {
        
        let fileName = "HMACKey";
        // 讀取檔案
        let jsonData = try! LocalStorage.LoadJSON(withFilename: fileName);
       
        if (jsonData != nil)
        {
            let decoder = JSONDecoder();
            
            let _jsonData = jsonData!;
          
            let oldStoreKeys = try? decoder.decode([StoreModel].self, from: _jsonData);
            
            if(oldStoreKeys != nil)
            {
                let _oldStoreKeys = oldStoreKeys as! Array<StoreModel>;
                
                if(_oldStoreKeys.filter{$0.Guid == guid}.count > 0)
                {
                    // 已經有有相同guid
                    let storeKey = _oldStoreKeys.filter{$0.Guid == guid}.first;
                    return storeKey?.HmacKey;
                }
            }
        }
        return "";
    }
    
    
    
    // 取16進位字串4碼 當otp
    public func SubHash(connectionString:String,hmacKey:String)->String
    {
        let hexString = Hash(connectionString: connectionString, hmacKey: hmacKey);
        
        let characters = hexString.map { String($0) };
        
        let numbers = ["0", "1", "2", "3","4","5","6","7","8","9"];

        var finalOtp = "";
        for s in characters
        {
            if(numbers.contains(s))
            {
                finalOtp += s;
            }
            // 取滿4碼
            if(finalOtp.count >= 4)
            {
                break;
            }
        }
        
        // 未滿4碼
        if(finalOtp.count < 4)
        {
            let alphabetMap = ["A":"0",
                               "B":"1",
                               "C":"2",
                               "D":"3",
                               "E":"4",
                               "F":"5"];
            
            for s in characters
            {
                if(alphabetMap.keys.contains(s))
                {
                    finalOtp += alphabetMap[s] ?? "";
                }
                
                // 取滿4碼
                if(finalOtp.count >= 4)
                {
                    break;
                }
            }
        }
        return finalOtp;
    }
    
   public func Hash(connectionString:String,hmacKey:String)->String
    {
    let hexkeyData = ConvertTool.dataWithHexString(hex:hmacKey);

    let messageByte = connectionString.data(using:.utf8);
    
    let heshData =  messageByte?.digest(Algorithm.sha256 , key:hexkeyData) as! Data;
    let hexString = ConvertTool.hexEncodedString(data: heshData);
   
    return hexString;
        
    }
    
//    // 16進位字串轉成data
//    func dataWithHexString(hex: String) -> Data {
//        var hex = hex
//        var data = Data()
//        while(hex.count > 0) {
//            let subIndex = hex.index(hex.startIndex, offsetBy: 2)
//            let c = String(hex[..<subIndex])
//            hex = String(hex[subIndex...])
//            var ch: UInt32 = 0
//            Scanner(string: c).scanHexInt32(&ch)
//            var char = UInt8(ch)
//            data.append(&char, count: 1)
//        }
//        return data
//    }
//
//    // data轉成16進位字串
//    func hexEncodedString(data:Data) -> String {
//        let hexDigits = Array("0123456789ABCDEF".utf16)
//        var hexChars = [UTF16.CodeUnit]()
//        hexChars.reserveCapacity(data.count * 2)
//
//        for byte in data {
//            let (index1, index2) = Int(byte).quotientAndRemainder(dividingBy: 16)
//          hexChars.append(hexDigits[index1])
//          hexChars.append(hexDigits[index2])
//        }
//
//        return String(utf16CodeUnits: hexChars, count: hexChars.count)
//      }
}
