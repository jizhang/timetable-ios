//
//  Home.swift
//  Timetable
//
//  Created by Ji ZHANG on 2020/10/4.
//

import SwiftUI

struct CategoryHome: View {
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarkData,
            by: { $0.category.rawValue }
        )
    }

    @State var showingProfile = false
    @EnvironmentObject var userData: UserData

    var profileButton: some View {
        Button(action: { showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }

    var body: some View {
        NavigationView {
            List {
                let featureCards = features.map { FeatureCard(landmark: $0) }
                FeaturedLandmarks(featureCards)
                    .aspectRatio(3 / 2, contentMode: .fill)
                    .listRowInsets(EdgeInsets())

                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: categories[key]!)
                }
                .listRowInsets(EdgeInsets())

                NavigationLink(destination: LandmarkList()) {
                    Text("See All")
                }
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(userData)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(UserData())
    }
}
