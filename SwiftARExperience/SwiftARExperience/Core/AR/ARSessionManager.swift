//
//  ARSessionManager.swift
//  SwiftARExperience
//
//  Created by swetha on 11/02/26.
//

import RealityKit
import ARKit

final class ARSessionManager {

    func runSession(on arView: ARView) {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        config.environmentTexturing = .automatic
        
        arView.session.run(config)
    }
}
