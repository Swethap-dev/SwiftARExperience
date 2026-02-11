//
//  ARConfigurationProvider.swift
//  SwiftARExperience
//
//  Created by swetha on 11/02/26.
//

import ARKit

struct ARConfigurationProvider {
    
    static func makeConfiguration() -> ARWorldTrackingConfiguration {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        config.environmentTexturing = .automatic
        return config
    }
}
