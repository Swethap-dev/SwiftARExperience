//
//  ObjectPickerView.swift
//  SwiftARExperience
//
//  Created by swetha on 11/02/26.
//

import SwiftUI

struct ObjectPickerView: View {
    
    @Binding var selected: ARObjectType
    
    var body: some View {
        HStack {
            ForEach(ARObjectType.allCases, id: \.self) { type in
                Button(type.displayName) {
                    selected = type
                }
                .padding()
                .background(selected == type ? Color.blue : Color.white.opacity(0.8))
                .foregroundColor(selected == type ? .white : .black)
                .cornerRadius(10)
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(15)
    }
}


struct ARScreen: View {
    
    @StateObject private var viewModel =
        ARViewModel(placeObjectUseCase: DefaultPlaceObjectUseCase())
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            ARViewContainer(viewModel: viewModel)
                .ignoresSafeArea()
            
            ObjectPickerView(selected: $viewModel.selectedObject)
                .padding(.bottom, 30)
        }
    }
}
