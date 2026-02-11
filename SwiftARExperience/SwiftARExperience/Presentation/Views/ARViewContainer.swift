//
//  ARViewContainer.swift
//  SwiftARExperience
//
//  Created by swetha on 11/02/26.
//
import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    
    @ObservedObject var viewModel: ARViewModel
    private let sessionManager = ARSessionManager()
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        sessionManager.runSession(on: arView)
        
        let tapGesture = UITapGestureRecognizer(
            target: context.coordinator,
            action: #selector(Coordinator.handleTap(_:))
        )
        arView.addGestureRecognizer(tapGesture)
        arView.debugOptions = [.showFeaturePoints, .showAnchorOrigins]

        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(viewModel: viewModel)
    }
    
    class Coordinator: NSObject {
        
        let viewModel: ARViewModel
        
        init(viewModel: ARViewModel) {
            self.viewModel = viewModel
        }
        
        @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
            print("Tapped")
            guard let arView = recognizer.view as? ARView else { return }
            
            let location = recognizer.location(in: arView)
            
            if let result = arView.raycast(
                from: location,
                allowing: .estimatedPlane,
                alignment: .horizontal
            ).first {


                let anchor = AnchorEntity(world: result.worldTransform)
                let entity = viewModel.createEntity()

                arView.installGestures([.rotation, .scale], for: entity)

                anchor.addChild(entity)
                arView.scene.addAnchor(anchor)
            }

        }
    }
}
