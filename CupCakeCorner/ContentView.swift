//
//  ContentView.swift
//  CupCakeCorner
//
//  Created by Tamim Khan on 26/4/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Select Your Type", selection: $order.type){
                        ForEach(Order.types.indices){
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                Section{
                    Toggle("Any special Request?", isOn: $order.enableSpecialRequest.animation())
                    
                    if order.enableSpecialRequest{
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra spinkles", isOn: $order.addSpinkles)
                    }
                }
                Section{
                    NavigationLink{
                        AddressView(order: order)
                    }label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("CupCakeCorner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
