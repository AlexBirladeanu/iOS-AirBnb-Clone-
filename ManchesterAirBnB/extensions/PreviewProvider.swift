//
//  PreviewProvider.swift
//  ManchesterAirBnB
//
//  Created by Alex Bîrlădeanu on 24.11.2023.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    private init() {}
    
    let testLocation = Location(
        id: "1092794",
        accomodates: nil,
        amenities: ["Internet", "Wireless Internet", "Wheelchair Accessible", "Kitchen", "Elevator in Building", "Buzzer/Wireless Intercom", "Heating", "Washer", "Dryer", "Essentials", "Shampoo"],
        bathrooms: 1.0,
        bedrooms: 1,
        beds: 1,
        cancellation_policy: "strict",
        city: "Manchester",
        cleaning_fee: 10.0,
        country: "United Kingdom",
        description: "Large beautiful two floor apartment all to yourself right in the heart of Manchester city centre, ten minutes walk from the train station. I offer a Money Back Guarantee so if you are not completely happy with the room, let me know and I will compensate you in cash. • Five minutes away from Picadilly train station, the coach station, The Gay Village, Deansgate Locks, Chinatown, The University of Manchester, Manchester Metropolitan University and the shopping centre. • Twenty minutes away from Manchester United stadium, Manchester city stadium and Manchester airport. Travelling around Manchester is very easy from the apartment as there is a bus stop right outside the building. • I offer instant booking, so if the dates are shown as available click INSTANT BOOK at the top of the page to confirm a booking straight away. • There is a shop very close to the apartment where you can buy food, drink, alcohol, cooking ingredients and most other things you will need. • Free unlimited wi-fi inter",
        geolocation: GeographicalPosition(lat: 53.476413724378084, lon: -2.238773940418399),
        host_about: "Vedevo, Volevo, Vivevo.",
        host_location: "Manchester, England, United Kingdom",
        host_url: "https://www.airbnb.com/users/show/5987426",
        host_name: "James",
        host_picture_url: "https://a2.muscache.com/im/users/5987426/profile_pic/1405292495/original.jpg?aki_policy=profile_x_medium",
        listing_url: "https://www.airbnb.com.ro/manchester-united-kingdom/stays",
        xl_picture_url: "https://a2.muscache.com/im/pictures/78142862/3bd644ed_original.jpg?aki_policy=x_large",
        name: "Entire Large Apartment in Centre",
        neighbourhood_overview: nil,
        neighbourhood_cleansed: "City Centre",
        number_of_reviews: 223,
        price: 70.0,
        property_type: "Apartment",
        review_scores_accuracy: 9.0,
        review_scores_checkin: 9.0,
        review_scores_cleanliness: 8.0,
        review_scores_communication: 9.0,
        review_scores_location: 10.0,
        review_scores_rating: 87.0,
        review_scores_value: 9.0,
        reviews_per_month: 6.29,
        space: "Large beautiful two floor apartment all to yourself right in the heart of Manchester city centre, ten minutes walk from the train station. I offer a Money Back Guarantee so if you are not completely happy with the room, let me know and I will compensate you in cash. • Five minutes away from Picadilly train station, the coach station, The Gay Village, Deansgate Locks, Chinatown, The University of Manchester, Manchester Metropolitan University and the shopping centre. • Twenty minutes away from Manchester United stadium, Manchester city stadium and Manchester airport. Travelling around Manchester is very easy from the apartment as there is a bus stop right outside the building. • I offer instant booking, so if the dates are shown as available click INSTANT BOOK at the top of the page to confirm a booking straight away. • There is a shop very close to the apartment where you can buy food, drink, alcohol, cooking ingredients and most other things you will need. • Free unlimited wi-fi inter",
        street: "Princess Street, Manchester, M1 6HR, United Kingdom",
        summary: nil,
        transit: nil
    )
}
