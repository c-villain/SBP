//
//  SwipeToBack.swift
//  Tripster
//
//  Created by exey on 01.07.2020.
//  Copyright © 2020 Exey Panteleev. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)
struct SwipeToBack: ViewModifier {
    
    var presentationMode: Binding<PresentationMode>
//    var geometry: GeometryProxy
    var onChanged: ()->Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(DragGesture()
                .onChanged { _ in
                    self.onChanged()
                }
                .onEnded { drag in
                    if -drag.predictedEndTranslation.width > UIScreen.main.bounds.width / 2 /*self.geometry.size.width / 2*/ {
//                        print("👆to Left", className: Self.self)
                    }
                    if drag.predictedEndTranslation.width > UIScreen.main.bounds.width / 2 /*self.geometry.size.width / 2*/ {
//                        print("👆to Right", className: Self.self)
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            )
    }
    
}

@available(iOS 13, *)
extension View {
    func swipeToBack(presentationMode: Binding<PresentationMode>, /*geometry: GeometryProxy,*/ onChanged: (()->Void)?  = nil) -> some View {
        ModifiedContent(
            content: self,
            modifier: SwipeToBack(presentationMode: presentationMode, /*geometry: geometry,*/ onChanged: onChanged ?? {})
        )
    }
}
