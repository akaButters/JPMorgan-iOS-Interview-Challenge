import UIKit

protocol SchoolStoreDelegate: AnyObject {
    func didFetchSchools(_: Result<[School], Error>)
}

class SchoolStoreViewModel {
    // an empty array of Schools that will be populated from the web
    var schools = [School]()
        
    // a NetworkService type that will be used to fetch the data from the web
    // or a MockWebService
    private let webService: NetworkService
    
    init(webService: NetworkService = WebService()) {
        self.webService = webService
    }
    
    weak var delegate: SchoolStoreDelegate?
    
    // fetches the school data from the web via the NetworkService, which can be a WebService
    // for a real fetch or a MockWebService if you would like to see mock results outside of
    // a mock unit test
    func fetchSchoolsFromWeb() {
        webService.fetchSchools { result in
            if case let .success(schools) = result {
                // sorts the fetched schools in alphabetical order
                self.schools = schools.sorted { $0.schoolName < $1.schoolName }
                self.delegate?.didFetchSchools(.success(self.schools))
            } else {
                self.delegate?.didFetchSchools(result)
            }
        }
    }
}

