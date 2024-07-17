//
//  PopularDestinationDetailView.swift
//  TravelDiscovery
//
//  Created by iMac on 08/11/23.
//

import SwiftUI
import MapKit

struct PopularDestinationDetailView: View {
    
    @ObservedObject var vm : DestinationDetailViewModel
    
    let destination : Destination
    let attraction : [Attraction] = [
        .init(name: Constant.eiffelTower, imageName: Constant.eiffel_tower, latitude: 48.858498772319145, longitude: 2.2947650570767477),
        .init(name: Constant.champsElysees, imageName: Constant.new_york, latitude: 48.87379991675274 , longitude: 2.294987993085469),
        .init(name: Constant.louvreMuseum, imageName: Constant.art2, latitude: 48.860731033859324, longitude: 2.337740565736484),
    ]
    
    @State var region : MKCoordinateRegion
    @State var isShowingAttraction = false
    
    init(destination: Destination) {
        self.destination = destination
        self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: destination.latitude, longitude: destination.longitude), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
        
        self.vm = .init(name: destination.name)
    }
    
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            
            if let photos = vm.destinationDetailRes?.photos {
                DestinationHeaderContainer(imageNames: photos)
                    .frame(height: 250)
            }
            
            //            Image(destination.imageName)
            //                .resizable()
            //                .scaledToFill()
            //                .clipped()
            VStack(alignment: .leading) {
                Text(destination.name)
                    .font(.system(size: 18,weight: .bold))
                Text(destination.country)
                
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: Constant.starFill)
                            .foregroundColor(.orange)
                    }
                }.padding(.top,2)
                
                Text(vm.destinationDetailRes?.description ?? "")
                    .padding(.top,4)
                
                
                HStack {
                    Spacer()
                }
            }
            .padding(.horizontal)
            
            HStack {
                Text(Constant.location)
                    .font(.system(size: 18,weight: .semibold))
                    .padding(.top,8)
                Spacer()
                
                Button {
                    isShowingAttraction.toggle()
                } label: {
                    Text("\(isShowingAttraction ? Constant.hide : Constant.show) Attraction")
                        .font(.system(size: 14,weight: .semibold))
                }
                
                Toggle("", isOn: $isShowingAttraction)
                    .labelsHidden()
                
            }
            .padding(.horizontal)
            
            //            Map(coordinateRegion: $region)
            //                .frame(height: 250)
            
            Map(coordinateRegion: $region, annotationItems: isShowingAttraction ? attraction : []) { attraction in
                // MAP MARKER SHOW
                //                MapMarker(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude),tint: .red)
                
                // MAP ANNOTATION
                
                MapAnnotation(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude)) {
                    CustomMapAnnotation(attraction: attraction)
                }
            }
            .frame(height: 300)
        }
        .navigationTitle(destination.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PopularDestinationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationDetailView(destination: Destination(name: Constant.paris, country: Constant.france, imageName: Constant.eiffel_tower,latitude: 48.86511035631639 ,longitude: 2.360781046620948))
        ContentView()
    }
}
