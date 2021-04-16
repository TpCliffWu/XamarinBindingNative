//
//  ContentView.swift
//  NativeiOS
//
//  Created by thinkpower on 2021/4/14.
//

import SwiftUI
import MagicTool

struct ContentView: View {
    var body: some View {
        
        // 顯示文字
        let magic = MagicTool.init();
        
        let str = magic.GetString();
        
        Text(str)
            .padding()
        
        // 加總陣列
        let arr = [1,2,3,4,5];
        
        let sum = magic.MathIntAddition(intArray: arr);
        
        Text(String(sum))
            .padding();
        
        // 轉成base64
        let b64 = magic.StringToBase64(str: str);
        
        Text(b64)
            .padding()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
