//
//  LocationDetailsView.swift
//  ManchesterAirBnB
//
//  Created by Alex Bîrlădeanu on 24.11.2023.
//

import SwiftUI
import MapKit

struct LocationDetailsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var vm: LocationDetailsVM
    
    var body: some View {
        ScrollView {
            LocationImageView(imageURL: vm.location.xl_picture_url, clipCorners: false)
                .frame(maxHeight: 360)
            VStack(alignment: .leading, spacing: 8) {
                header
                Divider()
                    .padding(.vertical)
                hostInfoView
                Divider()
                    .padding(.vertical)
                roomsView
                Divider()
                    .padding(.vertical)
                featuresView
                Divider()
                    .padding(.vertical)
                mapView
            }
            .padding()
        }
        .ignoresSafeArea(edges: .top)
        .overlay(alignment: .bottom) {
            footer
        }
        .overlay(alignment: .topLeading) {
            backButton
        }
    }
}

extension LocationDetailsView {
    
    var header: some View {
        VStack(alignment: .leading) {
            Text(vm.location.name ?? "")
                .font(.title)
                .fontWeight(.semibold)
            HStack(spacing: 4) {
                Image(systemName: "star.fill")
                Text("\((vm.location.review_scores_value ?? 4.86).formatTwoDecimals())")
                Text(" - ")
                Text("\(vm.location.number_of_reviews ?? 0) reviews")
                    .underline()
                    .fontWeight(.semibold)
            }
            .font(.caption)
            Text("\(vm.location.city ?? ""), \(vm.location.country ?? "")")
                .font(.caption)
        }
    }
}

extension LocationDetailsView {
    
    var hostInfoView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(vm.location.property_type ?? "Accomodation") hosted by")
                Text("\(vm.location.host_name ?? "John Doe")")
                Text("\(vm.location.host_about ?? "Superhost")")
                    .foregroundStyle(.gray)
                    .font(.caption)
                Text("\(vm.location.accomodates ?? 2) guests - \(vm.location.bedrooms ?? 2) bedrooms - \(vm.location.beds ?? 2) beds - \(Int(vm.location.bathrooms ?? 2.0)) baths")
                    .font(.caption)
            }
            .fontWeight(.semibold)
            Spacer()
            HostImageView(imageURL: vm.location.host_picture_url)
        }
    }
}

extension LocationDetailsView {
    
    var roomsView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Where you'll sleep")
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0 ..< (vm.location.bedrooms ?? 2)) { index in
                        VStack(alignment: .leading) {
                            Image(systemName: "bed.double")
                            Text("Bedroom \(index + 1)")
                        }
                        .frame(width: 132, height: 100)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: vm.selectedRooms.contains(index) ? 3 : 1)
                                .foregroundStyle(vm.selectedRooms.contains(index) ? Color.pink : Color.gray)
                        }
                        .onTapGesture {
                            vm.toggleSelection(index)
                        }
                    }
                }
            }
        }
    }
}

extension LocationDetailsView {
    
    var featuresView: some View {
        VStack(alignment: .leading) {
            Text("What this place offers")
                .font(.headline)
                .padding(.bottom)
            if let ammenities = vm.location.amenities {
                ForEach(ammenities, id: \.self) {ammenity in
                    HStack {
                        Image(systemName: "checkmark.circle")
                            .foregroundStyle(Color(.systemGreen))
                        Text("\(ammenity)")
                    }
                    .fontWeight(.semibold)
                    .font(.caption)
                }
            }
        }
    }
}

extension LocationDetailsView {
    
    var defaultCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: vm.location.geolocation?.lat ?? 37.7749, longitude: vm.location.geolocation?.lon ?? -122.4194)
    }
    
    var mapView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Where you'll be")
                .font(.headline)
            Map(initialPosition: .region(MKCoordinateRegion(center: defaultCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)))) {
                Marker("You are here", coordinate: defaultCoordinate)
                    .tint(.red)
            }
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding(.bottom, 60)
    }
}

extension LocationDetailsView {
    
    var footer: some View {
        VStack {
            Divider()
            HStack {
                VStack {
                    Text("$\((vm.location.price ?? 100.0).formatTwoDecimals())")
                        .fontWeight(.semibold)
                    Text("cleaning fee - $\((vm.location.cleaning_fee ?? 15.0).formatTwoDecimals())")
                        .fontWeight(.semibold)
                    Text("Total before taxes")
                }
                .font(.caption)
                Spacer()
                if let url = URL(string: "https://www.airbnb.com.ro/manchester-united-kingdom/stays") {
                    Link("Reserve", destination: url)
                        .foregroundStyle(Color.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 140, height: 40)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding()
        }
        .background(colorScheme == .dark ? .black : .white)
        .shadow(color: .black.opacity(0.4),radius: 4)
    }
}

extension LocationDetailsView {
    
    var backButton: some View {
        Button {
            vm.clearSelectedRooms()
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .foregroundStyle(Color.primary)
                .background {
                    Circle()
                        .fill(colorScheme == .dark ? .black : .white)
                        .frame(width: 32, height: 32)
                }
                .padding(32)
        }
    }
}

struct LocationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailsView()
            .environmentObject(LocationDetailsVM(location: dev.testLocation))
    }
}
