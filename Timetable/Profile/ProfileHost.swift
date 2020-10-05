//
//  ProfileHost.swift
//  Timetable
//
//  Created by Ji ZHANG on 2020/10/5.
//

import SwiftUI

struct ProfileHost: View {
    @EnvironmentObject var userData: UserData
    @State var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
