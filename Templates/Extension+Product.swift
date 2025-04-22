import Foundation
import ProjectDescription

extension Product {
    /// A special environment setting to configure the product type for Xcode Preview compatibility.
    /// Converts modules to dynamic frameworks (`.framework`) if `supportPreview` is set to "TRUE";
    /// otherwise, defaults to `.staticLibrary`.
    public static var previewSupportable: Self {
        let supportPreview = Environment.supportPreview.getString(default: "FALSE") == "TRUE"
        return supportPreview ? .framework : .staticLibrary
    }
    
    public static var previewSupported: Bool {
        Environment.supportPreview.getString(default: "FALSE") == "TRUE"
    }
}

/// Example usage:
/*
 .target(
     name: "YFNutrition",
     destinations: [.iPhone, .iPad],
     product: .previewSupportable, // dynamic linking
     //
 
 In Terminal:
 TUIST_SUPPORT_PREVIEW=TRUE/FALSE // dynamic linking
 tuist generate
*/
