//
//  ProfileHost.swift
//  Timetable
//
//  Created by Ji ZHANG on 2020/10/5.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if mode?.wrappedValue == .active {
                    Button("Cancel") {
                        draftProfile = userData.profile
                        mode?.animation().wrappedValue = .inactive
                    }
                }

                Spacer()
                EditButton()
            }

            if mode?.wrappedValue == .inactive {
                ProfileSummary(profile: userData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = userData.profile
                    }
                    .onDisappear {
                        userData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(UserData())
    }
}
