import UIKit

class ListViewController: UITableViewController {
    
    // MARK: - Properties
    
    private let schoolStore = SchoolStoreViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schoolStore.delegate = self
        setupUI()
        fetchSchools()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = Constants.ListView.NavBar.TITLE
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationItem.title = ""
    }
    
    // MARK: - API
    
    func fetchSchools() {
        schoolStore.fetchSchoolsFromWeb()
    }
    
    // MARK: - UI
    
    func setupUI() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.TableViewCell.School.REUSE_ID)
        tableView.rowHeight = Constants.TableViewCell.School.HEIGHT
    }
    
    // MARK: - TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolStore.schools.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCell.School.REUSE_ID, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1)
        cell.textLabel?.text = schoolStore.schools[indexPath.row].schoolName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let schoolDetails = schoolStore.schools[indexPath.row]
        navigationController?.pushViewController(DetailViewController(schoolDetails: schoolDetails), animated: true)
    }
}

// MARK: - SchoolStoreDelegate

extension ListViewController: SchoolStoreDelegate {
    func didFetchSchools(_ result: Result<[School], Error>) {
        switch result {
        case .success(_): tableView.reloadData()
        case let .failure(error): showAlert(title: Constants.Alert.TITLE, 
                                            message: Constants.Alert.MESSAGE_START + error.localizedDescription)
        }
    }
}

