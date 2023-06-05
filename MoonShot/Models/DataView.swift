//
//  DataView.swift
//  MoonShot
//
//  Created by Dara Adekore on 2023-06-04.
//

import Foundation
import SwiftUI

protocol DataView {
    var astronauts: [String: Astronaut] { get set }
    var missions: [Mission] { get set}
    var columns: [GridItem] {get set}
}
