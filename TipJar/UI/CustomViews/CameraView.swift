//
//  CameraView.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/7/22.
//

import UIKit
import SwiftUI

struct CameraView: UIViewControllerRepresentable {

    @Binding var isShowing: Bool
    @Binding var selectedImage: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(isShowing: $isShowing, camera: self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding private var isShowing: Bool
        var camera: CameraView
        
        init(isShowing: Binding<Bool>, camera: CameraView) {
            self._isShowing = isShowing
            self.camera = camera
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            defer {
                self.isShowing = false
            }

            guard let selectedImage = info[.originalImage] as? UIImage else { return }
            self.camera.selectedImage = selectedImage
        }
    }
}
