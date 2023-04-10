import UIKit

protocol EmployeeTypeTableViewControllerDelegate: AnyObject {
    func didSelectEmployeeType(_ type: EmployeeType)
}

class EmployeeTypeTableViewController: UITableViewController  {
    
    
    var delegate: EmployeeTypeTableViewControllerDelegate?
    
    var currentlySelectedType: EmployeeType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EmployeeType.allCases.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTypeCell", for: indexPath)
                
        let type = EmployeeType.allCases[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = type.description
        cell.contentConfiguration = content
        
        if currentlySelectedType == type {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedType = EmployeeType.allCases[indexPath.row]
        currentlySelectedType = selectedType
        tableView.reloadData()
        delegate?.didSelectEmployeeType(selectedType)
    }
    
//    @IBSegueAction func showEmployeeTypes(_ coder: NSCoder) -> EmployeeTypeTableViewController? {
//        let employeeTypeTableViewController = EmployeeTypeTableViewController(coder: coder)
//        employeeTypeTableViewController?.delegate = self
//        return employeeTypeTableViewController
//    }
}
