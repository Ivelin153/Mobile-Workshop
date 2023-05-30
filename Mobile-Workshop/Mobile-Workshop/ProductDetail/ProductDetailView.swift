//
//  ProductDetailView.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 14.05.23.
//
import SwiftUI
import Foundation
import SwiftUI
import Alamofire

struct ProductDetailView: View {
    private let repository = AuthorizationRepository()
    private let networkingManager = NetworkManager()
    @State public var text: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 250)
                        .padding()
                    VStack(spacing: 16) {
                        HStack {
                            Text("Product Name")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            HStack(spacing: 0) {
                                Text("5")
                                ForEach(0..<5) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .font(.system(size: 14))
                                }
                            }
                        }
                        
                        HStack {
                            Text("Category: Home")
                                .font(.system(size: 12))
                                .foregroundColor(Color.gray)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        Text("Indulge in a heavenly tea experience with our Stargazer’s Tea Set, featuring a constellation-themed teapot and matching teacups. Crafted from fine porcelain, this elegant set will transport you to the cosmos with every sip.")
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 16))
                        
                        Text("$99.99")
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 24))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        Button(action: {
                            Task {
                                await login()
                            }
                            
                        }) {
                            Text("Add to cart")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 250, height: 60)
                                .background(Color.init(red: 71/255, green: 51/255, blue: 122/255))
                                .cornerRadius(15.0)
                        }
                        
                    }
                    .padding()
                }
                .padding(.vertical)
            }
            
            Spacer()
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "cart")
            }
        }
        .navigationTitle("Product Details")
        .navigationBarBackButtonHidden()
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
    
    
    private func login() async {
        do {
            let url = "https://ethereal-artefacts.fly.dev/api/auth/local"
            
            let parameters: Parameters = [
                "identifier": "test@test.com",
                "password": "test123"
            ]
            let responseModel: Authorization = try await networkingManager.request(url, method: .post, parameters: parameters)
            
            print(responseModel)
            
        }
        catch{
            print(String(describing: error)) // <- ✅ Use this for debuging!
            
            print("Error: \(error.localizedDescription)")
        }
    }
}

struct ProductDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}

