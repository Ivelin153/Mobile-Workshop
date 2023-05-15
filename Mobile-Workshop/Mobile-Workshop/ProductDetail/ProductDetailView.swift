//
//  ProductDetailView.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 14.05.23.
//
import SwiftUI
import Foundation
import SwiftUI

struct ProductDetailView: View {
    @State public var text: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            headerView
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    productImageView
                    
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
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden()
        
    }
    
    
    var headerView: some View {
        HStack {
            Spacer()
            
            Text("Product Details")
                .fontWeight(.bold)
                .multilineTextAlignment(.center) // Align the text in the center
            
            Spacer()
            
            Image(systemName: "cart")
                .font(.title)
        }
        .padding()
        .frame(maxWidth: .infinity) // Expand the HStack to fill the available space
    }
    
    var productImageView: some View {
        Image(systemName: "photo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 250)
            .padding()
    }
}

struct ProductDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}

