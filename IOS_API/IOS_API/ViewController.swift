//
//  ViewController.swift
//  IOS_API
//
//  Created by tuan.anhpham on 9/1/20.
//  Copyright © 2020 tuan.anhpham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var datalist = [Person]()
    
    
    @IBOutlet weak var TableViewData: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        TableViewData.register(UINib(nibName: "TableViewCell", bundle: nil),forCellReuseIdentifier: "TableViewCell")
    }
    
    func getData(){
        let myUrl = URL(string: "http://demo0737597.mockable.io/master_data")
        let url = URLSession.shared.dataTask(with: myUrl!){
                data, response, error in
                if  error == nil {
                    let decoder = JSONDecoder()
                    do{
                        let parsingJS = try JSONDecoder().decode(PersonData.self, from: data!)
                        self.datalist = parsingJS.data
                        DispatchQueue.main.sync {
                            self.TableViewData.reloadData()
                        }
                    }catch let error{
                        print(error.localizedDescription)
                    }
                }
            }.resume()
    }
}
extension ViewController : UITableViewDelegate, UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    datalist.count
}
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)as! TableViewCell
    let c = datalist[indexPath.row]
    
    
    
    cell.name.text = c.userName
    cell.location.text = c.location
    cell.age.text = "\(c.age)"
    cell.gender.text = c.gender
    let imageURL = URL(string: c.image)
    let task = URLSession.shared.dataTask(with: imageURL!) { (data, response, error) in
        if error == nil {
            guard let imgData = data else { return }
            let load = UIImage(data: imgData)
            DispatchQueue.main.async {
                cell.imageVew.image = load
            }
        }
    }.resume()
    return cell
}
}
