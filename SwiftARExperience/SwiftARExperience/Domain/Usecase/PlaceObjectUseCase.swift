//
//  PlaceObjectUseCase.swift
//  SwiftARExperience
//
//  Created by swetha on 11/02/26.
//

import RealityKit
import ARKit

import RealityKit
import ARKit

protocol PlaceObjectUseCase {
    func makeEntity(for type: ARObjectType) -> ModelEntity
}

final class DefaultPlaceObjectUseCase: PlaceObjectUseCase {
    
    func makeEntity(for type: ARObjectType) -> ModelEntity {
        let mesh: MeshResource
        
        switch type {
        case .box:
            mesh = MeshResource.generateBox(size: 0.1)
            
        case .sphere:
            mesh = MeshResource.generateSphere(radius: 0.07)
            
        case .capsule:
            mesh = MeshResource.generateCylinder(height: 0.2, radius: 0.05)
        }
        
        let material = SimpleMaterial(color: .blue, isMetallic: true)
        let entity = ModelEntity(mesh: mesh, materials: [material])
        entity.generateCollisionShapes(recursive: true)
        
        return entity
    }
}
