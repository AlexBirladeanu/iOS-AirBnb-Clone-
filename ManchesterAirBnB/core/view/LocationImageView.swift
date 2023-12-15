//
//  LocationImageView.swift
//  ManchesterAirBnB
//
//  Created by Alex Bîrlădeanu on 25.11.2023.
//

import SwiftUI

struct LocationImageView: View {
    
    let imageURL: String?
    let clipCorners: Bool
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL ?? "")) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: 200, height: 200)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 400)
                    .clipShape(RoundedRectangle(cornerRadius: clipCorners ? 10 : 0))
            case .failure:
                Image(systemName: "house")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: clipCorners ? 10 : 0))
            @unknown default:
                Image(systemName: "house")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: clipCorners ? 10 : 0))
            }
        }
    }
}

#Preview {
    LocationImageView(imageURL: nil, clipCorners: true)
}
