//
//  ViewController.swift
//  LocalJSONTableView
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 01/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var emptyList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        getData()
    }

    func getData(){
        let decoder = JSONDecoder()
        
        guard let sourceURL = Bundle.main.url(forResource: "School", withExtension: "json") else {
            fatalError("Couldn't find JSON file")
        }
        
        guard let data = try? Data(contentsOf: sourceURL) else {
            fatalError("Couldn't convert the data")
        }
        
        guard let dataJSON = try? decoder.decode(School.self, from: data) else {
            fatalError("There was a problem to decoding the data")
        }
        
        self.emptyList.removeAll()
        
        for data in dataJSON.member {
//            print(data.name)
            self.emptyList.append(data.name)
        }
        self.tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(emptyList)
        return emptyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = emptyList[indexPath.row]
        return cell!
    }
}

