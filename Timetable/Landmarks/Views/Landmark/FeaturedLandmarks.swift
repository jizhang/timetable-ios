//
//  FeaturedLandmarks.swift
//  Timetable
//
//  Created by Ji ZHANG on 2020/10/7.
//

import SwiftUI

struct FeaturedLandmarks<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0

    init(_ views: [Page]) {
        viewControllers = views.map { UIHostingController(rootView: $0) }
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            FeaturedLandmarksViewController(controllers: viewControllers, currentPage: $currentPage)
            FeaturedLandmarksPageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                .frame(width: 80)
        }
    }
}

struct FeaturedLandmarks_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedLandmarks(features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
