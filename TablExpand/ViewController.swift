//
//  ViewController.swift
//  TablExpand
//
//  Created by Anil Kumar on 04/09/18.
//  Copyright © 2018 Anil Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var tableview: UITableView!
    fileprivate var dataArray = Array<Any>()
    private var dataArray1 = Array<Any>()
    var data : [String] = []
    var countriesinEurope = ["France","Spain","Germany","France","Spain","Germany","France","Spain","Germany"]
    var countriesinFrance = ["Japan","China","India","Japan","China","India","Japan","China","India","Japan","China","India"]
    var countriesinArgentia = ["Argentia","Brasil","Chile","Argentia","Brasil","Chile","Argentia","Brasil","Chile","Argentia","Brasil","Chile"]
    
    override func viewDidLoad() {
        dataArray = ["Mani"]
        dataArray1 = ["Mani2"]
        tableview.delegate = self
        tableview.dataSource = self
        super.viewDidLoad()
    }
}
extension ViewController : UITableViewDelegate,UITableViewDataSource{
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return 3
      switch section {
      case 0:
         return countriesinEurope.count
      case 1:
         return countriesinFrance.count
      case 2:
        return countriesinArgentia.count
      default:
        return 0
      }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
      
      switch indexPath.section {
        case 0 :
            cell.data?.text = countriesinEurope[indexPath.row]
            return cell
        case 1 :
            cell.data?.text = countriesinFrance[indexPath.row]
            return cell
        case 2 :
            cell.data?.text = countriesinArgentia[indexPath.row]
            return cell
        default:
            cell.data?.text = "Other"
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
  
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! TableViewCell1
        headerCell.backgroundColor = UIColor.cyan
        headerCell.textLabel?.textColor = UIColor.black
        headerCell.textLabel?.textAlignment = .center
        switch (section) {
        case 0:
            headerCell.headerCell.text = "Europe";
        case 1:
            headerCell.headerCell.text = "Asia";
        case 2:
            headerCell.headerCell.text = "South America";
        default:
            headerCell.headerCell.text = "Other";
        }
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 75
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        switch indexPath.section {
        case 0:
          print(countriesinEurope[indexPath.row])
        case 1:
          print(countriesinFrance[indexPath.row])
        case 2:
          print(countriesinArgentia[indexPath.row])
        default:
          print("")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "data"{
            var vc = ViewController3()
            vc = segue.destination as! ViewController3
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
   
}
//class Test123123 : UIViewController{
//    let vc = ViewController()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        vc.dataArray
//    }
//}




