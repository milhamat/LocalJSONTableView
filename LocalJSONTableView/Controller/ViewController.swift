//
//  ViewController.swift
//  LocalJSONTableView
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 01/03/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        print(dataJSON.className)
        for data in dataJSON.member {
            print(data.name)
        }
    }

}

