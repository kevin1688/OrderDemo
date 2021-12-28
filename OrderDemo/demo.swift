//
//  demo.swift
//  OrderDemo
//
//  Created by kai wen chen on 2021/12/28.
//

import SwiftUI

struct demo: View {
    
    @State var bminumber = "0"
    @State var sizeBox:CGFloat = 200
    
    var body: some View {
        VStack(spacing:10) {
            Text("TDEE 計算")
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .frame(maxWidth:.infinity)
                .frame( height: 60, alignment: .center)
                .background(Color.gray)
            VStack {
                Text("輸入你的ＢＭＩ")
                    .font(.system(size: 36))
                .padding(.bottom,10)
                
                TextField("輸入您的BMI", text: $bminumber)
                    .padding(.horizontal,20)
                    .foregroundColor(.white)
                    .font(.system(size: 36))
                    .frame(width: 250, height: 50, alignment: .center)
                    .background(Color.blue)
                    .cornerRadius(16)
                    .padding(.horizontal,50)
            }.padding(.vertical,20)
            HStack {
                Text("選擇你的運動量")
                    .font(.system(size: 36))
                .padding(.bottom,10)
                Image(systemName: "q.circle")
                    .font(.system(size: 36))
            }
            HStack(spacing:10) {
                Text("5")
                    .font(.system(size: 48))
                    .foregroundColor(.white)
                    .frame(width: sizeBox, height: sizeBox, alignment: .center)
                    .background(Color.blue)
                    .cornerRadius(36)
                Text("10")
                    .font(.system(size: 48))
                    .foregroundColor(.white)
                    .frame(width: sizeBox, height: sizeBox, alignment: .center)
                    .background(Color.blue)
                    .cornerRadius(36)
            }
            HStack(spacing:10) {
                Text("20")
                    .font(.system(size: 48))
                    .foregroundColor(.white)
                    .frame(width: sizeBox, height: sizeBox, alignment: .center)
                    .background(Color.blue)
                    .cornerRadius(36)
                Text("20")
                    .font(.system(size: 48))
                    .foregroundColor(.white)
                    .frame(width: sizeBox, height: sizeBox, alignment: .center)
                    .background(Color.blue)
                    .cornerRadius(36)
            }
            Spacer()
            Text("計算")
                .font(.system(size: 48, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .frame(width: 400, height: 100, alignment: .center)
                .background(Color.red)
                .cornerRadius(32)
        }
    }
}

struct demo_Previews: PreviewProvider {
    static var previews: some View {
        demo()
    }
}
