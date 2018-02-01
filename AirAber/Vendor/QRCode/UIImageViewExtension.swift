

import UIKit

public extension UIImageView {
    
    /// Creates a new image view with the given QRCode
    ///
    /// :param: qrCode      The QRCode to display in the image view
    public convenience init(qrCode: QRCode) {
        self.init(image: qrCode.image)
    }
    
}
