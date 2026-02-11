//
//  ARObjectType.swift
//  SwiftARExperience
//
//  Created by swetha on 11/02/26.
//

import Foundation

enum ARObjectType: CaseIterable {
    case box
    case sphere
    case capsule
    
    var displayName: String {
        switch self {
        case .box: return "Box"
        case .sphere: return "Sphere"
        case .capsule: return "Capsule"
        }
    }
}
