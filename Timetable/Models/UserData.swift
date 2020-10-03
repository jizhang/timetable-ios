//
//  UserData.swift
//  Timetable
//
//  Created by Ji ZHANG on 2020/10/3.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
