//
//  HomeViewModel.swift
//  ManchesterAirBnB
//
//  Created by Alex Bîrlădeanu on 23.11.2023.
//

import Foundation
import Combine

class ExploreViewModel: ObservableObject {
    
    @Published var locations = [Location]()
    @Published var totalCount = 0
    private let resultsNumber = 10
    private var offset = 0
    var cancellables = Set<AnyCancellable>()
    private var url: String {
            "https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/airbnb-listings/records?limit=\(resultsNumber)&offset=\(offset)&refine=country%3A%22United%20Kingdom%22&refine=city%3A%22Manchester%22"
        }
    
    var pageIndex: Int = 0 {
        didSet {
            fetchData()
        }
    }
    
    init() {
        fetchData()
    }
    
    func onNextPageTapped() {
        pageIndex += 1
    }
    
    func onPreviousPageTapped() {
        pageIndex -= 1
    }
    
    func fetchData() {
        offset = pageIndex * resultsNumber
        guard let url = URL(string: url) else {
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .map(\.data)
            .decode(type: LocationsResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchSerialQueue.main)
            .sink { _ in} receiveValue: { [weak self] response in
                self?.locations = response.results
                self?.totalCount = response.totalCount
            }
            .store(in: &cancellables)
    }
}
