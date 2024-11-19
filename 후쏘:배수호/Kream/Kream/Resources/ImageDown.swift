import UIKit
import ImageIO

extension UIImage {
    /// - Parameter scale: 원본 크기 = 1
    ///                     ex) 절반 = 0.5
    /// - Returns: 스케일을 통해 리사이징된 이미지 반환
    func downSample(scale: CGFloat) -> UIImage {
        _ = [kCGImageSourceShouldCache: false] as CFDictionary
        let data = self.pngData()! as CFData
        let imageSource = CGImageSourceCreateWithData(data, nil)!
        let maxPixel = max(self.size.width, self.size.height) * scale
        let downSampleOptions = [
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceShouldCacheImmediately: true,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceThumbnailMaxPixelSize: maxPixel
        ] as CFDictionary
        
        let downSampledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downSampleOptions)!
        
        let newImage = UIImage(cgImage: downSampledImage)
        
        return newImage
        
    }
}
