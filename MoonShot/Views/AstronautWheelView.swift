//
//  AstronautWheelView.swift
//  MoonShot
//
//  Created by Dara Adekore on 2023-06-03.
//

import SwiftUI

struct AstronautWheelView: View {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }

    let crew: [CrewMember]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(
                                            .white,
                                            lineWidth: 1
                                        )
                                )
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)

                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
    init(mission: Mission) {
        self.crew = mission.crew.map { member in
            if let astronaut = AstronautWheelView.astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct AstronautWheelView_Previews: PreviewProvider {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    let crew: [CrewMember]
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautWheelView(mission: missions[1])
    }
}
