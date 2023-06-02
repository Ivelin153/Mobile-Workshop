//
//  ProductRating.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 1.06.23.
//

import Foundation
import SwiftUI

struct ProductRating: View {
    var rating: Int
    let maxRating: Int = 5
    
    var body: some View {
        HStack(spacing: 2) {
            Text("\(rating)")
            .font(.headline)
            .bold()
            
            ForEach(1...maxRating, id: \.self) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 12,height: 12)
                    .foregroundColor(Color("Textcolor"))            }
        }
    }
}

struct Rating_Previews: PreviewProvider {
    static var previews: some View {
        ProductRating(rating: 1)
    }
}
