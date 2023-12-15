//
//  ExploreView.swift
//  ManchesterAirBnB
//
//  Created by Alex Bîrlădeanu on 23.11.2023.
//

import SwiftUI

struct ExploreView: View {
    
    @EnvironmentObject private var vm: ExploreViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                SearchBarView()
                HStack {
                    Text("\(vm.totalCount) results found")
                        .foregroundStyle(.gray)
                    Spacer()
                }
                .padding(.horizontal, 32)
                LazyVStack(spacing: 32) {
                    ForEach(vm.locations) {location in
                        NavigationLink(value: location) {
                            LocationListItemView(location: location)
                        }
                    }
                }
                .padding()
                HStack {
                    Button {
                        vm.onPreviousPageTapped()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Previous")
                        }
                    }
                    .disabled(vm.pageIndex == 0)
                    Spacer()
                    Button {
                        vm.onNextPageTapped()
                    } label: {
                        HStack {
                            Text("Next")
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .overlay(alignment: .center) {
                    Text("Page \(vm.pageIndex + 1)")
                }
                .padding(.horizontal, 32)
            }
            .navigationDestination(for: Location.self) { location in
                LocationDetailsView()
                    .environmentObject(LocationDetailsVM(location: location))
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .environmentObject(ExploreViewModel())
    }
}
