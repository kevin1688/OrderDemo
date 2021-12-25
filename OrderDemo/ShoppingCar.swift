//
//  ShoppingCar.swift
//  OrderDemo
//
//  Created by kai wen chen on 2021/12/25.
//

import SwiftUI

struct ShoppingCar: View {
    @EnvironmentObject var myData:OData
    var body: some View {
        VStack {
            ForEach(myData.orders) { od in
                Text("\(od.menu.title)")
                    .padding()
            }
        }.tabItem {
            Image(systemName: "cart.fill")
        }
        
            
    }
}

struct ShoppingCar_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCar().environmentObject(OData())
    }
}
