//
//  ViewController.swift
//  ModelObjectContacts
//
//  Created by sathiy on 01/04/19.
//  Copyright © 2019 sathiy. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var detailsTableView: UITableView!
    
    var contacts = [Contact]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getTheData()
    }
    func getTheData() {
        Alamofire.request("https://api.androidhive.info/contacts/").response { (response) in
            let contactData = response.data
            //print("JSON DATA",contactData as Any)
            let stringData = String(data: contactData!, encoding: String.Encoding.utf8)
            if let baseModel = BaseModel(JSONString: stringData!) {
                //print("fdgf",baseModel.contacts.toJSONString())
                self.contacts = baseModel.contacts
                self.detailsTableView.reloadData()
            }
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailsCell = tableView.dequeueReusableCell(withIdentifier: "detailsContactCell") as? DetailsContactCell
        let contact = contacts[indexPath.row]
        detailsCell?.detailsNameLb.text = contact.name
        print(detailsCell?.detailsNameLb.text)
        detailsCell?.detailsEmailLb.text = contact.phone.mobile
        detailsCell?.selectionStyle = UITableViewCell.SelectionStyle.none
        return detailsCell!
    }
}

