//
//  LocationViewModel.swift
//  ManchesterAirBnB
//
//  Created by Alex Bîrlădeanu on 25.11.2023.
//

import Foundation

class LocationDetailsVM: ObservableObject {
    
    @Published var location: Location
    @Published var selectedRooms = Set<Int>()
    
    init(location: Location) {
        self.location = location
    }
    
    func toggleSelection(_ index: Int) {
            if selectedRooms.contains(index) {
                selectedRooms.remove(index)
            } else {
                selectedRooms.insert(index)
            }
        }
    
    func clearSelectedRooms() {
        selectedRooms.removeAll()
    }
}
