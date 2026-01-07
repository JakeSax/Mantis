//
//  FakeCropView.swift
//  Mantis
//
//  Created by Yingtao Guo on 2/2/23.
//

@testable import Mantis
import UIKit

class FakeCropView: UIView, CropViewProtocol {
    func applyCropState(with _: Mantis.CropState) { }
    
    func makeCropState() -> Mantis.CropState {
        CropState(
            rotationType: .none,
            degrees: 0.0,
            aspectRatioLockEnabled: false,
            aspectRato: 0.0,
            flipOddTimes: false,
            transformation: makeTransformation()
        )
    }
    
    var image = UIImage()
    
    var aspectRatioLockEnabled = false
    
    var delegate: CropViewDelegate?
    
    func initialSetup(delegate _: CropViewDelegate, presetFixedRatioType _: PresetFixedRatioType) { }
    
    func getRatioType(byImageIsOriginalHorizontal _: Bool) -> RatioType {
        .horizontal
    }
    
    func getImageHorizontalToVerticalRatio() -> Double {
        0
    }
    
    func resetComponents() { }
    
    func prepareForViewWillTransition() { }
    
    func handleViewWillTransition() { }

    func setFixedRatio(_: Double, zoom _: Bool, presetFixedRatioType _: PresetFixedRatioType) { }
    
    func rotateBy90(withRotateType _: RotateBy90DegreeType, completion _: @escaping () -> Void) { }
    
    func handleAlterCropper90Degree() { }
    
    func setFreeCrop() { }
    
    func handlePresetFixedRatio(_: Double, transformation _: Transformation) { }
    
    func transform(byTransformInfo _: Transformation, isUpdateRotationControlView _: Bool) { }
    
    func getTransformInfo(byTransformInfo _: Transformation) -> Transformation {
        Transformation(
            offset: .zero,
            rotation: .zero,
            scale: .zero,
            isManuallyZoomed: false,
            initialMaskFrame: .zero,
            maskFrame: .zero,
            cropWorkbenchViewBounds: .zero,
            horizontallyFlipped: false,
            verticallyFlipped: false
        )
    }
    
    func getTransformInfo(byNormalizedInfo _: CGRect) -> Transformation {
        Transformation(
            offset: .zero,
            rotation: .zero,
            scale: .zero,
            isManuallyZoomed: false,
            initialMaskFrame: .zero,
            maskFrame: .zero,
            cropWorkbenchViewBounds: .zero,
            horizontallyFlipped: false,
            verticallyFlipped: false
        )
    }
    
    func processPresetTransformation(completion _: (Transformation) -> Void) { }
    
    func horizontallyFlip() { }
    
    func verticallyFlip() { }
    
    func reset() { }
    
    func makeTransformation() -> Mantis.Transformation {
        Transformation(
            offset: .zero,
            rotation: .zero,
            scale: .zero,
            isManuallyZoomed: false,
            initialMaskFrame: .zero,
            maskFrame: .zero,
            cropWorkbenchViewBounds: .zero,
            horizontallyFlipped: false,
            verticallyFlipped: false
        )
    }
    
    func crop() -> CropOutput {
        CropOutput(
            nil,
            Transformation(
                offset: .zero,
                rotation: .zero,
                scale: .zero,
                isManuallyZoomed: false,
                initialMaskFrame: .zero,
                maskFrame: .zero,
                cropWorkbenchViewBounds: .zero,
                horizontallyFlipped: false,
                verticallyFlipped: false
            ),
            CropInfo(
                .zero,
                .zero,
                .zero,
                .zero,
                .zero,
                .zero,
                CropRegion(
                    topLeft: .zero,
                    topRight: .zero,
                    bottomLeft: .zero,
                    bottomRight: .zero
                )
            )
        )
    }
    
    func crop(_: UIImage) -> CropOutput {
        CropOutput(
            nil,
            Transformation(
                offset: .zero,
                rotation: .zero,
                scale: .zero,
                isManuallyZoomed: false,
                initialMaskFrame: .zero,
                maskFrame: .zero,
                cropWorkbenchViewBounds: .zero,
                horizontallyFlipped: false,
                verticallyFlipped: false
            ),
            CropInfo(
                .zero,
                .zero,
                .zero,
                .zero,
                .zero,
                .zero,
                CropRegion(
                    topLeft: .zero,
                    topRight: .zero,
                    bottomLeft: .zero,
                    bottomRight: .zero
                )
            )
        )
    }
    
    func asyncCrop(completion _: @escaping (CropOutput) -> Void) { }
    
    func getCropInfo() -> CropInfo {
        CropInfo(
            .zero,
            .zero,
            .zero,
            .zero,
            .zero,
            .zero,
            CropRegion(topLeft: .zero, topRight: .zero, bottomLeft: .zero, bottomRight: .zero)
        )
    }
    
    func getExpectedCropImageSize() -> CGSize {
        .zero
    }
}
