import Foundation

protocol NetworkService {
    func fetchSchools(completion: @escaping (Result<[School], Error>) -> Void)
}

class WebService: NetworkService {
    
    // the url to fetch from, shouldn't be changed but can be changed if you
    // want to see or test the Failure Alert on the ListViewController view.
    private let urlString: String
    
    // initialized with the preset NYC school url,
    // or can be changed if you want to test the error Alert on the ListViewController view.
    init(urlString: String = Constants.WebService.URL_STRING) {
        self.urlString = urlString
    }
    
    // checks that JSON data exists and processes it via parsing,
    // or returns a failure result with an error if unsuccessful
    private func processJSON(data: Data?, error: Error?) -> Result<[School], Error> {
        guard let jsonData = data else {
            return .failure(error!)
        }
        
        do {
            let decodedData = try JSONDecoder().decode([School].self, from: jsonData)
            return .success(decodedData)
        } catch {
            return .failure(error)
        }
    }
    
    // fetches the schools from the web, and runs the completion closure with
    // either the successful results of the School array being populated,
    // or returns a failure result with an error if unsuccessful
    func fetchSchools(completion: @escaping (Result<[School], Error>) -> Void) {
        if let url = URL(string: self.urlString) {
            let request = URLRequest(url: url)
            
            let sessionConfig = URLSessionConfiguration.default
            sessionConfig.timeoutIntervalForRequest = Constants.WebService.FETCH_TIMEOUT
            
            let session = URLSession(configuration: sessionConfig)
            session.dataTask(with: request) { data, response, error in
                let result = self.processJSON(data: data, error: error)
                
                // dispatch the results onto the main thread
                DispatchQueue.main.async {
                    completion(result)
                }
            }.resume()
        } else {
            // end the program because continuation without a URL is impossible
            preconditionFailure(Constants.WebService.FATAL_ERROR_URL)
        }
    }
}
