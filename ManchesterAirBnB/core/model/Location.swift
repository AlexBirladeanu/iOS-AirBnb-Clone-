//
//  LocationsResponse.swift
//  ManchesterAirBnB
//
//  Created by Alex Bîrlădeanu on 23.11.2023.
//

import Foundation

struct Location: Codable, Identifiable, Hashable {
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: String
    let accomodates: Int?
    let amenities: [String]?
    let bathrooms: Float?
    let bedrooms: Int?
    let beds: Int?
    let cancellation_policy: String? //
    let city: String?
    let cleaning_fee: Float?
    let country: String?
    let description: String? //
    let geolocation: GeographicalPosition?
    let host_about: String?
    let host_location: String?
    let host_url: String?
    let host_name: String?
    let host_picture_url: String?
    let listing_url: String?
    let xl_picture_url: String?
    let name: String?
    let neighbourhood_overview: String?
    let neighbourhood_cleansed: String? //
    let number_of_reviews: Int?
    let price: Float?
    let property_type: String?
    let review_scores_accuracy: Float?
    let review_scores_checkin: Float?
    let review_scores_cleanliness: Float?
    let review_scores_communication: Float?
    let review_scores_location: Float?
    let review_scores_rating: Float?
    let review_scores_value: Float?
    let reviews_per_month: Float?
    let space: String? //
    let street: String? //
    let summary: String? //
    let transit: String? //
}

struct GeographicalPosition: Codable, Hashable {
    let lat: Double
    let lon: Double
}

struct LocationsResponse: Codable {
    let totalCount: Int
    let results: [Location]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case results    = "results"
    }
}
