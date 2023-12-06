import UIKit

func makeLabel(text: String, size: CGFloat, textColor: UIColor, bgColor: UIColor,
               isBold: Bool, isMultiLine: Bool, isScaling: Bool) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textColor = textColor
    label.backgroundColor = bgColor
    label.font = UIFont.systemFont(ofSize: size, weight: isBold ? UIFont.Weight.bold : UIFont.Weight.regular)
    label.numberOfLines = isMultiLine ? 0 : 1
    
    if isScaling {
        label.minimumScaleFactor = 0.2
        label.adjustsFontSizeToFitWidth = true
    }
    
    return label
}

func makeStackView(withOrientation axis: NSLayoutConstraint.Axis, spacing: CGFloat = 8.0) -> UIStackView {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = axis
    stackView.distribution = .fill
    stackView.alignment = .fill
    stackView.spacing = spacing

    return stackView
}

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.Alert.OK, style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

