//
//  Menu.swift
//  OrderDemo
//
//  Created by kai wen chen on 2021/12/25.
//

import SwiftUI

struct Menu: View {
    @EnvironmentObject var myData:OData
    @State var isTapTitle = ""
    
    var body: some View {
        ScrollView(.vertical,showsIndicators:false) {
            VStack(alignment: .leading,spacing: 30) {
                ForEach(myData.menus) { od in
                    HStack(alignment: .center,spacing: 20) {
                        Image(od.img)
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                        Text("\(od.title)")
                            .font(.system(size: 48, weight: .black, design: .rounded))
                            .foregroundColor(.white)
                            .padding()
                    }
                    .frame(width: 350,alignment: .leading)
                    .padding()
                    .background(isTapTitle == od.title ? Color.red : Color.blue)
                    .cornerRadius(30)
                    .onTapGesture {
                        myData.addOrder(value: od)
                        withAnimation(.easeInOut) {
                            isTapTitle = od.title
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                isTapTitle = ""
                            }
                        }
                    }
                }
            }
        }
        .tabItem {
            Image(systemName: "house.fill")
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu().environmentObject(OData())
    }
}
