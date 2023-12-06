import XCTest


class school_view_model_creation: XCTestCase {
    var schoolStoreVM: SchoolStoreViewModel!
    
    override func setUp() {
        // making an instance with the default parameters will lead to a mock success fetch
        schoolStoreVM = SchoolStoreViewModel(webService: MockWebService())
    }

    func test_create_empty_school_view_model() {
        XCTAssertEqual(schoolStoreVM.schools.count, 0)
    }
}

class mock_web_service: XCTestCase {
    func test_fetching_success() {
        // making an instance with the default parameters will lead to a mock success fetch
        let schoolStoreVM = SchoolStoreViewModel(webService: MockWebService())
        schoolStoreVM.fetchSchoolsFromWeb()
        XCTAssertEqual(schoolStoreVM.schools.count, 2)
    }
    
    func test_fetching_failure() {
        // putting in an empty string is the way to force a mock failure
        let schoolStoreVM = SchoolStoreViewModel(webService: MockWebService(urlString: ""))
        schoolStoreVM.fetchSchoolsFromWeb()
        XCTAssertEqual(schoolStoreVM.schools.count, 0)
    }
}
