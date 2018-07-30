//
//  TripDetailViewController.swift
//  johnny.portfolio.tripplanner
//
//  Created by Johnny on 5/14/15.
//  Copyright (c) 2015 JoJoStudio. All rights reserved.
//

import UIKit

class TripDetailViewController: UITableViewController {

    var trip: Trip?
    var viewTitle: String?
    
    @IBOutlet var textFields: [UITextField]!
    
    @IBOutlet weak var navigationTitle: UINavigationItem!
    @IBOutlet weak var imageCity: UIImageView!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var btnFrom: UIButton!
    @IBOutlet weak var btnTo: UIButton!
    @IBOutlet weak var txtFlight1: UITextField!
    @IBOutlet weak var txtFlight2: UITextField!
    @IBOutlet weak var txtHotel: UITextField!
    @IBOutlet weak var txtSight1: UITextField!
    @IBOutlet weak var txtSight2: UITextField!
    @IBOutlet weak var txtSight3: UITextField!
    @IBOutlet weak var txtSight4: UITextField!
    @IBOutlet weak var txtSight5: UITextField!
    @IBOutlet weak var textviewNote: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //self.tabBarController?.tabBar.hidden = true
        
        navigationTitle.title = viewTitle
        btnFrom.titleLabel?.textAlignment = .right
        btnTo.titleLabel?.textAlignment = .right
        textviewNote!.layer.borderWidth = 1
        textviewNote!.layer.borderColor = UIColor.gray.cgColor
        
        if trip == nil {
            btnFrom.setTitle(NSDate().formatted, for: .normal)
            btnTo.setTitle(NSDate().formatted, for: .normal)
        }
        
        if let t = trip {
            imageCity.image = getImage(imagename: t.destination)
            txtCity.text = t.destination
            txtCountry.text = t.country
            btnFrom.setTitle(t.from.formatted, for: .normal)
            btnTo.setTitle(t.to.formatted, for: .normal)
            txtFlight1.text = t.flight1
            txtFlight2.text = t.flight2
            txtHotel.text = t.hotel
            txtSight1.text = t.sights[0]
            txtSight2.text = t.sights[1]
            txtSight3.text = t.sights[2]
            txtSight4.text = t.sights[3]
            txtSight5.text = t.sights[4]
            textviewNote.text = t.note
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func shareTrip(_ sender: UIButton) {
        var textToShare = "Hi, \n\nbelow are the trip details!\n\n"
        textToShare += "City: \(trip!.destination)\n"
        textToShare += "Country: \(trip!.country)\n"
        textToShare += "From: \(trip!.from.formatted)\n"
        textToShare += "To: \(trip!.to.formatted)\n"
        textToShare += "Departure Flight: \(trip!.flight1)\n"
        textToShare += "Return Flight: \(trip!.flight2)\n"
        textToShare += "Hotel: \(trip!.hotel)\n"
        textToShare += "Note: \(trip!.note)\n"
        let objectsToShare = [textToShare, []] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare as [AnyObject], applicationActivities: nil)
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func saveTrip(_ sender: UIBarButtonItem) {
    
        if txtCity.text!.isEmpty{
            let title = "Error"
            let alertController = UIAlertController(title: title, message: "City can't be empty!", preferredStyle: .alert)
            
            // Create the action.
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        let fromdate: NSDate = convertDate(datestr: btnFrom.titleLabel?.text)
        let todate: NSDate = convertDate(datestr: btnTo.titleLabel?.text)
        if fromdate.compare(todate as Date) == ComparisonResult.orderedDescending {
            let title = "Error"
            let alertController = UIAlertController(title: title, message: "From date can't be larger than To date!", preferredStyle: .alert)
            
            // Create the action.
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        if trip == nil {
            let newTrip = Trip()
            newTrip.destination = txtCity.text!
            newTrip.country = txtCountry.text!
            newTrip.from = fromdate
            newTrip.to = todate
            newTrip.flight1 = txtFlight1.text!
            newTrip.flight2 = txtFlight2.text!
            newTrip.hotel = txtHotel.text!
            newTrip.sights[0] = txtSight1.text!
            newTrip.sights[1] = txtSight2.text!
            newTrip.sights[2] = txtSight3.text!
            newTrip.sights[3] = txtSight4.text!
            newTrip.sights[4] = txtSight5.text!
            newTrip.note = textviewNote.text
            addNewTrip(trip: newTrip)
        }
        else {
            trip!.destination = txtCity.text!
            trip!.country = txtCountry.text!
            trip!.from = fromdate
            trip!.to = todate
            trip!.flight1 = txtFlight1.text!
            trip!.flight2 = txtFlight2.text!
            trip!.hotel = txtHotel.text!
            trip!.sights[0] = txtSight1.text!
            trip!.sights[1] = txtSight2.text!
            trip!.sights[2] = txtSight3.text!
            trip!.sights[3] = txtSight4.text!
            trip!.sights[4] = txtSight5.text!
            trip!.note = textviewNote.text
            //tableView.reloadData()
        }
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func editEnded(_ sender: UITextField) {
        sender.resignFirstResponder()
    }    
    @IBAction func fromDateChange(_ sender: UIButton) {
        popDatePicker(dateno: "1")
    }
    @IBAction func toDateChange(_ sender: UIButton) {
        popDatePicker(dateno: "2")
    }
    func popDatePicker(dateno: String) {
        let title = "Select Date"
        let message = "\n\n\n\n\n\n\n\n\n\n\n\n\n";
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.actionSheet);
        alert.isModalInPopover = true;
        
        var pickerFrame: CGRect
        if deviceOrientation == true {
            pickerFrame = CGRect(x: -130, y: 30, width: self.view.frame.width-17, height: 100); //landscape
        }
        else {
            pickerFrame = CGRect(x: 0, y: 30, width: self.view.frame.width-17, height: 100); //portrait
        }
        let datePicker: UIDatePicker = UIDatePicker(frame: pickerFrame);
        datePicker.datePickerMode = .dateAndTime
        datePicker.locale = NSLocale(localeIdentifier: "en_US") as Locale

        if dateno=="1" {
            datePicker.setDate(convertDate(datestr: self.btnFrom.titleLabel?.text) as Date, animated: true)
        }
        else if dateno=="2" {
            datePicker.setDate(convertDate(datestr: self.btnTo.titleLabel?.text) as Date, animated: true)
        }

        alert.view.addSubview(datePicker);
        
        // Create the action.
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        let okayAction = UIAlertAction(title: "Confirm", style: .default) {
            action in self.updateDate(dateno: dateno, newdate: datePicker.date as NSDate)
        }
        alert.addAction(okayAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)

    }
    
    func updateDate(dateno: String, newdate: NSDate) {
        if dateno=="1" {
            btnFrom.setTitle(newdate.formatted, for: .normal)
            if let t = trip {
                t.from = newdate
            }
        }
        else if dateno=="2" {
            btnTo.setTitle(newdate.formatted, for: .normal)
            if let t = trip {
                t.to = newdate
            }
        }
    }
    
    // MARK: - Table view data source

    /*override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }*/
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    }*/

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0 && indexPath.section == 0 && trip == nil)
        {
            imageCity.isHidden = true
            btnShare.isHidden = true
            return 0.0
        }
        else {
            return super.tableView(tableView, heightForRowAt: indexPath as IndexPath)
            //return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
        }
    }

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.    
    }
   */

}
