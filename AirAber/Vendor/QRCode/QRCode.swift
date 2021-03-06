

import UIKit

public typealias 🔳 = QRCode

/// QRCode generator
public struct QRCode {
  
  /**
  The level of error correction.
  
  - Low:      7%
  - Medium:   15%
  - Quartile: 25%
  - High:     30%
  */
  public enum ErrorCorrection: String {
    case Low = "L"
    case Medium = "M"
    case Quartile = "Q"
    case High = "H"
  }
  
  /// CIQRCodeGenerator generates 27x27px images per default
  fileprivate let DefaultQRCodeSize = CGSize(width: 27, height: 27)
  
  /// Data contained in the generated QRCode
  public let data: Data
  
  /// Foreground color of the output
  /// Defaults to black
  public var color = CIColor(red: 0, green: 0, blue: 0)
  
  /// Background color of the output
  /// Defaults to white
  public var backgroundColor = CIColor(red: 1, green: 1, blue: 1)
  
  /// Size of the output
  public var size = CGSize(width: 240, height: 240)
  
  /// The error correction. The default value is `.High.
  public var errorCorrection = ErrorCorrection.High
  
  // MARK: Init
  
  public init(_ data: Data) {
    self.data = data
  }
  
  public init?(_ string: String) {
    if let data = string.data(using: String.Encoding.isoLatin1) {
      self.data = data
    } else {
      return nil
    }
  }
  
  public init?(_ url: URL) {
    if let data = url.absoluteString.data(using: String.Encoding.isoLatin1) {
      self.data = data
    } else {
      return nil
    }
  }
  
  // MARK: Generate QRCode
  
  /// The QRCode's UIImage representation
  public var image: UIImage {
    return UIImage(ciImage: ciImage)
  }
  
  /// The QRCode's CIImage representation
  public var ciImage: CIImage {
    // Generate QRCode
    let qrFilter = CIFilter(name: "CIQRCodeGenerator")!
    qrFilter.setDefaults()
    qrFilter.setValue(data, forKey: "inputMessage")
    qrFilter.setValue(self.errorCorrection.rawValue, forKey: "inputCorrectionLevel")
    
    // Color code and background
    let colorFilter = CIFilter(name: "CIFalseColor")!
    colorFilter.setDefaults()
    colorFilter.setValue(qrFilter.outputImage, forKey: "inputImage")
    colorFilter.setValue(color, forKey: "inputColor0")
    colorFilter.setValue(backgroundColor, forKey: "inputColor1")
    
    // Size
    let sizeRatioX = size.width / DefaultQRCodeSize.width
    let sizeRatioY = size.height / DefaultQRCodeSize.height
    let transform = CGAffineTransform(scaleX: sizeRatioX, y: sizeRatioY)
    let transformedImage = colorFilter.outputImage!.transformed(by: transform)
    
    return transformedImage
  }
  
}

extension QRCode {
  
  public var PNGData: Data {
    let context = CIContext(options: nil)
    let cgImage = context.createCGImage(self.ciImage, from: self.ciImage.extent)
    let image = UIImage(cgImage: cgImage!)
    let data = UIImagePNGRepresentation(image)!
    return data
  }
}
