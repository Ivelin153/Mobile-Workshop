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
    @StateObject var productDetailModel = ProductDetailViewModel()
    
    @State public var text: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    if let product = productDetailModel.product{
                        
                        AsyncImage(url: URL(string: product.image)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(10)
                                    .padding(.horizontal, 20)
                            case .failure:
                                Image(systemName: "photo")
                            @unknown default:
                                EmptyView()
                            }
                        }
                        VStack(spacing: 16) {
                            HStack {
                                Text("Product Name")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                
                                Spacer()
                                
                                HStack(spacing: 0) {
                                    ProductRating(rating: product.rating)
                                        .padding(.trailing)
                                }
                            }
                            
                            HStack {
                                Text("Category: \(product.category)")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.gray)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            
                            Text(product.description)
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 16))
                            
                            Text(String(format: "$%.2f", Double(product.price)))
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 24))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                            
                            Button(action: {
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
                    } }
                .onAppear{
                    productDetailModel.fetchProductDetails()
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
}

struct ProductDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}

