//
//  AddressView.swift
//  CupCakeCorner
//
//  Created by Tamim Khan on 26/4/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    
    var body: some View {
        
        Form{
            Section{
                TextField("Name", text: $order.name)
                TextField("Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section{
                NavigationLink{
                    CheckoutView(order: order)
                }label: {
                    Text("check out")
                }
            }
            .disabled(order.hasValidAddress == false)
            .navigationTitle("Delivary Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}
struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddressView(order: Order())
        }
    }
}
