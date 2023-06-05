//
//  ListView.swift
//  MoonShot
//
//  Created by Dara Adekore on 2023-06-04.
//

import SwiftUI

struct ListView: View, DataView {
    var astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    var missions: [Mission] = Bundle.main.decode("missions.json")
    var columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        List {
            ForEach(missions.indices, id: \.self) { index in
                let mission = missions[index]

                NavigationLink {
                    MissionView(mission: mission)
                } label: {
                    HStack {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()

                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .frame(width: 100, height: 100)
                        .padding()
                        Spacer()
                        Text(mission.formattedLaunchDate)
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.5))
                        Spacer()
                    }
                }
            }

        }
        .listStyle(PlainListStyle())
        .listRowBackground(Color.darkBackground)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
