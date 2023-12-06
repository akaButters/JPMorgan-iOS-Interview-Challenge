import UIKit

struct Constants {
    
    
    struct TableViewCell {
        struct School {
            static let REUSE_ID = "SchoolCell"
            static let HEIGHT = 50.0
        }
    }

    struct Alert {
        static let TITLE = "Error"
        static let MESSAGE_START = "Could Not Fetch Data: \n"
        static let OK = "Ok"
    }
    
    struct WebService {
        static let FETCH_TIMEOUT = 15.0
        static let URL_STRING = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
        static let FATAL_ERROR_URL = "FATAL ERROR: URL could not be created"
    }
    
    struct ListView {
        struct NavBar {
            static let TITLE = "NYC Schools"
        }
    }
    
    struct SchoolDetail {
        struct ScoreLine {
            static let INTRINSIC_WIDTH = 200.0
            static let INTRINSIC_HEIGHT = 21.0
        }
        
        static let FONT_SIZE = 16.0
        static let FONT_COLOR: UIColor = .black
        static let BG_COLOR: UIColor = .white
        
        static let SPACING_FROM_THE_TOP = 175.0
        static let ITEM_SPACING_Y = 16.0
        static let MARGINS_X = 20.0
        
        static let MATH_SCORE_HEADING = "SAT Math Average"
        static let WRITING_SCORE_HEADING = "SAT Writing Average"
        static let READING_SCORE_HEADING = "SAT Reading Average"
        static let NUM_TEST_TAKERS_HEADING = "Number of Test Takers"
        
        static let HEADING_LABEL = { makeLabel(text: "placeholder", size: Constants.SchoolDetail.FONT_SIZE,
                                              textColor: Constants.SchoolDetail.FONT_COLOR,
                                              bgColor: Constants.SchoolDetail.BG_COLOR,
                                              isBold: true, isMultiLine: true, isScaling: true) }
        
        static let NUMBER_LABEL = { makeLabel(text: "placeholder", size: Constants.SchoolDetail.FONT_SIZE,
                                              textColor: Constants.SchoolDetail.FONT_COLOR,
                                              bgColor: Constants.SchoolDetail.BG_COLOR,
                                              isBold: false, isMultiLine: true, isScaling: true) }
    }
}
