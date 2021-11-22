//
//  LocalStorage.swift
//  NativeiOS
//
//  Created by thinkpower on 2021/6/8.
//

import Foundation

public class LocalStorage{
    
    // 讀取json檔
  static func LoadJSON(withFilename filename: String) throws -> Data? {
        let fm = FileManager.default
        
        do{
            let url = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) ;
            
            var fileURL = url.appendingPathComponent(filename);
            fileURL = fileURL.appendingPathExtension("json");
            let data = try Data(contentsOf: fileURL);
            
        //    let decoder = JSONDecoder();
        //    let moneyBags = try? decoder.decode([MoneyBag].self, from: data);
            
            return data;
        }catch{
            return nil;
            
        }
    }
    
    // 儲存json檔
    static func SaveJson(jsonData: Data, filename: String) throws -> Bool{
        let fm = FileManager.default
        do{
            let url = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) ;
            
            var fileURL = url.appendingPathComponent(filename);
            
            fileURL = fileURL.appendingPathExtension("json");
            
            //        let data :Data = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]);
            //
            try jsonData.write(to: fileURL, options: [.atomicWrite])
            
            return true;
        }catch{
            return false;
        }
    }
}
