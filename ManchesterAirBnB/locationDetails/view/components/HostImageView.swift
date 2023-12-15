//
//  HostImageView.swift
//  ManchesterAirBnB
//
//  Created by Alex Bîrlădeanu on 25.11.2023.
//

import SwiftUI

struct HostImageView: View {
    let imageURL: String?
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL ?? "")) { phase in
            switch phase {
            case .empty:
                placeholder
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.primary, lineWidth: 4)
                            .frame(width: 72, height: 72)
                    )
            case .failure:
                placeholder
            @unknown default:
                placeholder
            }
        }
    }
}

extension HostImageView {
    
    var placeholder: some View {
        Image(systemName: "person")
            .resizable()
            .scaledToFit()
            .frame(width: 64, height: 64)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.primary, lineWidth: 4)
                    .frame(width: 72, height: 72)
            )
    }
}

#Preview {
    HostImageView(imageURL: nil)
}
