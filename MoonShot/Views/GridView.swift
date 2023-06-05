//
//  GridView.swift
//  MoonShot
//
//  Created by Dara Adekore on 2023-06-04.
//

import SwiftUI

struct GridView: View, DataView {
    var astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    var missions: [Mission] = Bundle.main.decode("missions.json")
    var columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) {mission in
                    NavigationLink {
                        MissionView(mission: mission)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }

                }
            }
            .padding([.horizontal, .vertical])
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
