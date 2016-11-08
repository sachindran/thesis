//
//  PopUpViewController.swift
//  Maps
//
//  Created by Sachin Selvaraj on 10/31/16.
//  Copyright © 2016 sachin. All rights reserved.
//

import UIKit

protocol PopUpCompletionDelegate {
    func rowSelected(at:Int)
}

class PopUpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let unoBuildings = UNOBuilidings()
    var delegate:PopUpCompletionDelegate?

    @IBOutlet weak var tableCell: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return unoBuildings.buildings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "buildingCell", for: indexPath as IndexPath) as! BuildingsTableViewCell
    
        cell.nameLabel.text = unoBuildings.buildings[indexPath.row].Name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        dismiss(animated: true, completion: {
            self.delegate?.rowSelected(at: indexPath.row)
            })
        print("Row selected")
    }


}
