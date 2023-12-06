import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private let schoolDetails: School
    
    // MARK: - Lifecycle
    
    init(schoolDetails: School) {
        self.schoolDetails = schoolDetails
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI
    
    func setupUI() {
        view.backgroundColor = Constants.SchoolDetail.BG_COLOR
        
        let titleLabel = Constants.SchoolDetail.HEADING_LABEL()
        titleLabel.text = schoolDetails.schoolName
        navigationItem.titleView = titleLabel
        
        let mathScoreLine = ScoreLine(name: Constants.SchoolDetail.MATH_SCORE_HEADING,
                                      score: schoolDetails.averageMathScore)
        let readingScoreLine = ScoreLine(name: Constants.SchoolDetail.READING_SCORE_HEADING,
                                         score: schoolDetails.averageReadingScore)
        let writingScoreLine = ScoreLine(name: Constants.SchoolDetail.WRITING_SCORE_HEADING,
                                         score: schoolDetails.averageWritingScore)
        let numberOfTakersScoreLine = ScoreLine(name: Constants.SchoolDetail.NUM_TEST_TAKERS_HEADING,
                                                score: schoolDetails.numberOfTakers)
        
        let stackView = makeStackView(withOrientation: .vertical, spacing: Constants.SchoolDetail.ITEM_SPACING_Y)
        view.addSubview(stackView)
        [mathScoreLine, readingScoreLine, writingScoreLine, numberOfTakersScoreLine].forEach { stackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: Constants.SchoolDetail.SPACING_FROM_THE_TOP),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: Constants.SchoolDetail.MARGINS_X),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                constant: -Constants.SchoolDetail.MARGINS_X)
        ])
    }
}
