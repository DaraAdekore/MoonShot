//
//  MissionView.swift
//  MoonShot
//
//  Created by Dara Adekore on 2023-05-30.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }

    let mission: Mission

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Crew")
                                .font(.title.bold())
                                .padding(.bottom, 5)
                            Spacer()
                            Text(mission.formattedLaunchDate)
                        }
                        DividerView()
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        Text(mission.description)
                        DividerView()
                    }
                    .padding(.horizontal)
                    AstronautWheelView(mission: mission)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }

    init(mission: Mission) {
        self.mission = mission
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        MissionView(mission: missions[0])
            .preferredColorScheme(.dark)
    }
}
