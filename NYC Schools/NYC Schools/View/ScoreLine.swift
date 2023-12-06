import UIKit

class ScoreLine: UIView {
    
    // MARK: - Properties
    
    private var name: String
    private var score: String
    
    // MARK: - Lifecycle
    init(name: String, score: String) {
        self.name = name
        self.score = score
        
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    func setupUI() {
        let headingLabel = Constants.SchoolDetail.HEADING_LABEL()
        headingLabel.text = name
        
        let scoreLabel = Constants.SchoolDetail.NUMBER_LABEL()
        scoreLabel.text = score
        
        [headingLabel, scoreLabel].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            headingLabel.topAnchor.constraint(equalTo: topAnchor),
            headingLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            scoreLabel.topAnchor.constraint(equalTo: topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: Constants.SchoolDetail.ScoreLine.INTRINSIC_WIDTH, 
                      height: Constants.SchoolDetail.ScoreLine.INTRINSIC_HEIGHT)
    }
    
}
