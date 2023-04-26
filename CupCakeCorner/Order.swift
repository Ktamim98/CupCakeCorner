//
//  Order.swift
//  CupCakeCorner
//
//  Created by Tamim Khan on 26/4/23.
//

import SwiftUI

class Order: ObservableObject{
    static let types = ["vanilla", "strawberry", "chocolate", "rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    @Published var enableSpecialRequest = false{
        didSet{
            if enableSpecialRequest == false{
                extraFrosting = false
                addSpinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSpinkles = false
    
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool{
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty{
            return false
        }
        return true
    }
    
    
}
