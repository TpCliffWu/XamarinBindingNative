//
//  MagicTool.swift
//  MagicTool
//
//  Created by thinkpower on 2021/11/22.
//

import Foundation

public class MagicTool:NSObject
{
    // 1.開戶 產生公私鑰 回傳公鑰
    @objc
    public func GeneratePublicKey(guid:String)-> String {
        
        let pkGen = PublicKeyGenerator.init();
        return  pkGen.GetPub(guid: guid);
    }
}
