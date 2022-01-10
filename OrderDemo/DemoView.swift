//
//  DemoView.swift
//  OrderDemo
//
//  Created by kai wen chen on 2022/1/4.
//

import SwiftUI

struct DemoView: View {
    @StateObject var dData = DemoData()
    var body: some View {
        VStack {
            ForEach(dData.shops){ sp in
                shopView(demoShop: sp)
            }
            Text("===================")
            Text("\(String(format:"%.2f",dData.avgPrice()))")
        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}

struct shopView: View {
    @State var demoShop = shop(title: "", address: "", menu: [product]())
    var body: some View {
        VStack{
            Text(demoShop.title)
            Text(demoShop.address)
            Text("---------")
            ForEach(demoShop.menu){ mn in
                VStack{
                    Text(mn.name)
                    Text(mn.cal)
                }
            }
        }
    }
}
