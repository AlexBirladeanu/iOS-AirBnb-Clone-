//
//  LocationListItemView.swift
//  ManchesterAirBnB
//
//  Created by Alex Bîrlădeanu on 23.11.2023.
//

import SwiftUI

struct LocationListItemView: View {
    
    var location: Location
    
    var body: some View {
        VStack(spacing: 8) {
            LocationImageView(imageURL: location.xl_picture_url, clipCorners: true)
                .foregroundStyle(Color.primary)
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(location.name ?? "Miami, Florida")
                        .foregroundStyle(Color.primary)
                    Text(location.city ?? "Constanta")
                        .foregroundStyle(.gray)
                    Text(location.country ?? "Romania")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4) {
                        Text("$\((location.price ?? 0.0).formatTwoDecimals())")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    .foregroundStyle(Color.primary)
                }
                Spacer()
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("\((location.review_scores_value ?? 4.86).formatTwoDecimals())")
                }
                .foregroundStyle(Color.primary)
            }
            .font(.footnote)
        }
        .padding()
    }
}

struct LocationListItemView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListItemView(location: dev.testLocation)
    }
}
