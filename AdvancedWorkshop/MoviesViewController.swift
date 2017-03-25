//
//  MoviesViewController.swift
//  AdvancedWorkshop
//
//  Created by Siraj Zaneer on 3/24/17.
//  Copyright © 2017 sirajzaneer.com. All rights reserved.
//

import UIKit

class MoviesViewController: UITableViewController {

    var movies: [Movie] = []
    let url = URL(string: "https://itunes.apple.com/us/rss/topmovies/limit=25/json")
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //tableView.rowHeight = UITableViewAutomaticDimension
        let logo = UIImage(named: "MakeSchool_Diamond_RGB.png")
        let imageView = UIImageView(image:logo)
        imageView.frame = CGRect(x: 0, y: 0, width: 55, height: 55)
         imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        self.tableView.estimatedRowHeight = 150
        self.tableView.rowHeight = UITableViewAutomaticDimension
        loadMovies()
    }
    
    func loadMovies() {
        
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data {
                if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    let feed = dataDictionary["feed"] as! NSDictionary
                    let entrys = feed["entry"] as! NSArray
                    for entry in entrys {
                        let movie = Movie(info: entry as! NSDictionary)
                        self.movies.append(movie)
                    }
                    self.tableView.reloadData()
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell

        let movie = movies[indexPath.row]
        
        cell.nameLabel.text = movie.name
        // Configure the cell...
        cell.priceLabel.text = movie.price
        cell.summaryLabel.text = movie.summary
        cell.summaryLabel.sizeToFit()
        print(movie.url)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: movie.imageURL) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                cell.posterView.image = UIImage(data: data!)
            }
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let cell = sender as! MovieCell
        let indexPath = tableView.indexPath(for: cell)
        let movie = movies[(indexPath?.row)!]
        let destination = segue.destination as! ViewController
        destination.movie = movie
        destination.image = cell.posterView.image
    }
    

}
