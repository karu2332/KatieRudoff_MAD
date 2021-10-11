import UIKit

@IBAction func clearAll(_ sender: UIButton) {
    print("clearAll was called!")
    sender.superview?.subviews.compactMap { $0 as? UILabel }.filter { $0 != self }.forEach { label in label.text = "$0.00" }
}
