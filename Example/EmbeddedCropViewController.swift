//
//  EmbeddedCropViewController.swift
//  MantisExample
//
//  Created by Yingtao Guo on 11/9/18.
//  Copyright © 2018 Echo Studio. All rights reserved.
//

import Mantis
import UIKit

class EmbeddedCropViewController: UIViewController {
    var image: UIImage?
    var cropViewController: CropViewController?
    
    var didGetCroppedImage: ((UIImage) -> Void)?
    
    @IBOutlet var cancelButton: UIBarButtonItem!
    @IBOutlet var doneButton: UIBarButtonItem!
    @IBOutlet var resolutionLabel: UILabel!
    
    @IBOutlet var undoButton: UIBarButtonItem!
    @IBOutlet var redoButton: UIBarButtonItem!
    @IBOutlet var resetButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        undoButton.title = "Undo"
        redoButton.title = "Redo"
        cancelButton.title = "Cancel"
        doneButton.title = "Done"
        resetButton.title = "Revert"
        
        resolutionLabel.text = "\(getResolution(image: image) ?? "unknown")"
        
        view.backgroundColor = .black
        navigationController?.toolbar.backgroundColor = .black
        
        self.undoButton.isEnabled = false
        self.redoButton.isEnabled = false
        self.resetButton.isEnabled = false
    }
    
    @IBAction
    func undoButtonPressed(_: Any) {
        cropViewController?.didSelectUndo()
    }
    
    @IBAction
    func redoButtonPressed(_: Any) {
        cropViewController?.didSelectRedo()
    }
    
    @IBAction
    func resetButtonPressed(_: Any) {
        cropViewController?.didSelectReset()
    }
    
    @IBAction
    func cancel(_: Any) {
        dismiss(animated: true)
    }
    
    @IBAction
    func crop(_: Any) {
        cropViewController?.crop()
    }
    
    @IBAction
    func updateImage(_: Any) {
        guard let image else {
            return
        }
        
        cropViewController?.update(image.addFilter(filter: .mono))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        guard let cropViewController = segue.destination as? CropViewController, let image else {
            return
        }
        
        cropViewController.delegate = self
        
        var config = Mantis.Config()
        config.cropToolbarConfig.mode = .embedded
        config.enableUndoRedo = true
        
        config.cropToolbarConfig.toolbarButtonOptions = [
            .counterclockwiseRotate,
            .clockwiseRotate,
            .horizontallyFlip,
            .verticallyFlip
        ]
        
        Mantis.setupCropViewController(cropViewController, with: image, and: config)
        
        self.cropViewController = cropViewController
    }
    
    private func getResolution(image: UIImage?) -> String? {
        if let size = image?.size {
            return "\(Int(size.width)) x \(Int(size.height)) pixels"
        }
        return nil
    }
    
    override func canPerformAction(_ action: Selector, withSender _: Any?) -> Bool {
        if action == #selector(EmbeddedCropViewController.undoButtonPressed(_:)) ||
            action == #selector(EmbeddedCropViewController.redoButtonPressed(_:)) ||
            action == #selector(EmbeddedCropViewController.resetButtonPressed(_:))
        {
            return cropViewController!.isUndoSupported()
        }
        
        return true
    }
    
    override func validate(_ command: UICommand) {
        guard let cropViewController else { return }
        
        if cropViewController.isUndoSupported() {
            if command.action == #selector(EmbeddedCropViewController.undoButtonPressed(_:)) {
                let undoString = NSLocalizedString("Undo", comment: "Undo")
                
                command.title = self.undoButton
                    .isEnabled ? "\(undoString) \(cropViewController.undoActionName())" : undoString
                
                if !self.undoButton.isEnabled {
                    command.attributes = [.disabled]
                }
            }
            
            if command.action == #selector(EmbeddedCropViewController.redoButtonPressed(_:)) {
                let redoString = NSLocalizedString("Redo", comment: "Redo")
                
                command.title = self.redoButton
                    .isEnabled ? "\(redoString) \(cropViewController.redoActionName())" : redoString
                
                if !self.redoButton.isEnabled {
                    command.attributes = [.disabled]
                }
            }
            
            if command.action == #selector(EmbeddedCropViewController.resetButtonPressed(_:)) {
                command.title = NSLocalizedString("Revert to Original", comment: "Revert to Original")
                
                if !self.resetButton.isEnabled {
                    command.attributes = [.disabled]
                }
            }
        }
    }
}

extension EmbeddedCropViewController: CropViewControllerDelegate {
    func cropViewController(_: CropViewController, didUpdateEnableStateForUndo enable: Bool) {
        self.undoButton.isEnabled = enable
    }
    
    func cropViewController(_: CropViewController, didUpdateEnableStateForRedo enable: Bool) {
        self.redoButton.isEnabled = enable
    }
    
    func cropViewController(_: CropViewController, didUpdateEnableStateForReset enable: Bool) {
        self.resetButton.isEnabled = enable
    }
    
    func cropViewControllerDidCrop(
        _: CropViewController,
        cropped: UIImage,
        transformation _: Transformation,
        cropInfo _: CropInfo
    ) {
        self.dismiss(animated: true)
        self.didGetCroppedImage?(cropped)
    }
    
    func cropViewControllerDidCancel(_: CropViewController, original _: UIImage) {
        self.dismiss(animated: true)
    }
    
    func cropViewControllerDidBeginResize(_: CropViewController) {
        self.resolutionLabel.text = "..."
    }
    
    func cropViewControllerDidEndResize(
        _ cropViewController: CropViewController,
        original _: UIImage,
        cropInfo _: CropInfo
    ) {
        let size = cropViewController.getExpectedCropImageSize()
        self.resolutionLabel.text = "\(Int(size.width)) x \(Int(size.height)) pixels"
    }
}

enum FilterType: String {
    case chrome = "CIPhotoEffectChrome"
    case fade = "CIPhotoEffectFade"
    case instant = "CIPhotoEffectInstant"
    case mono = "CIPhotoEffectMono"
    case noir = "CIPhotoEffectNoir"
    case process = "CIPhotoEffectProcess"
    case tonal = "CIPhotoEffectTonal"
    case transfer = "CIPhotoEffectTransfer"
}

extension UIImage {
    func addFilter(filter: FilterType) -> UIImage {
        let filter = CIFilter(name: filter.rawValue)
        // Convert UIImage to CIImage and set as input
        let ciInput = CIImage(image: self)
        filter?.setValue(ciInput, forKey: "inputImage")
        // Get output CIImage, render as CGImage first to retain proper UIImage scale
        let ciOutput = filter?.outputImage
        let ciContext = CIContext()
        let cgImage = ciContext.createCGImage(ciOutput!, from: (ciOutput?.extent)!)
        // Return the image
        return UIImage(cgImage: cgImage!)
    }
}
