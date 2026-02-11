//
//  ARViewModel.swift
//  SwiftARExperience
//
//  Created by swetha on 11/02/26.
//

import SwiftUI
import RealityKit

final class ARViewModel: ObservableObject {
    
    @Published var selectedObject: ARObjectType = .box
    
    private let placeObjectUseCase: PlaceObjectUseCase
    
    init(placeObjectUseCase: PlaceObjectUseCase) {
        self.placeObjectUseCase = placeObjectUseCase
    }
    
    func createEntity() -> ModelEntity {
        return placeObjectUseCase.makeEntity(for: selectedObject)
    }
}
