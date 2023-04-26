//
//  CheckoutView.swift
//  CupCakeCorner
//
//  Created by Tamim Khan on 26/4/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    @State private var confarmationMessage = ""
    @State private var showingConfarmation = false
    @State private var showAlert = false
    
    
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3){ image in
                    image
                        .resizable()
                        .scaledToFit()
                }placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("your total cost is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                Button("place order"){
                    Task{
                        await placeOrder()
                    }
                }
                    .padding()
            }
        }
        .navigationTitle("Check Out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank you!" ,isPresented: $showingConfarmation){
            Button("ok"){}
        }message: {
            Text(confarmationMessage)
        }
        
        .alert("Oops" ,isPresented: $showAlert){
            Button("ok"){}
        }message: {
            Text("no internet")
        }
    }
    
    func placeOrder() async{
        guard let encode = try? JSONEncoder().encode(order) else{
            print("faild to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do{
            let(data, _) = try await URLSession.shared.upload(for: request, from: encode)
            
            let decodeOrder = try JSONDecoder().decode(Order.self, from: data)
            confarmationMessage = "your order for \(decodeOrder.quantity)x \(Order.types[decodeOrder.type].lowercased()) is on the way"
            showingConfarmation = true
            
        }catch{
            showAlert = true
            print("check out faild")
        }
        
    }
    
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
