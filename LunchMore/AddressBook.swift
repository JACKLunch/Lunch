//
//  AddressBook.swift
//  LunchMore
//
//  Created by Alonzo Trove on 6/5/15.
//  Copyright (c) 2015 Alonzo Trove. All rights reserved.
//

import Foundation
import AddressBook
import UIKit
//import Parse


class AddressViewController: UIViewController, UITableViewDelegate {
   
    lazy var addressBook: ABAddressBookRef = {
        var error: Unmanaged<CFError>?
        return ABAddressBookCreateWithOptions(nil,
            &error).takeRetainedValue() as ABAddressBookRef
        }()
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get authorization to use access AddressBook
        
        switch ABAddressBookGetAuthorizationStatus(){
        case .Authorized:
            println("Already authorized")
            readAllPeopleInAddressBook(addressBook)
        case .Denied:
            println("You are denied access to address book")
            
        case .NotDetermined:
            ABAddressBookRequestAccessWithCompletion(addressBook,
                {[weak self] (granted: Bool, error: CFError!) in
                    
                    if granted{
                        let strongSelf = self!
                        println("Access is granted")
                        strongSelf.readAllPeopleInAddressBook(strongSelf.addressBook)
                    } else {
                        println("Access is not granted")
                    }
                    
            })
        case .Restricted:
            println("Access is restricted")
            
        default:
            println("Unhandled")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
 
    func readEmailsForPerson(person: ABRecordRef){
        var allEmails:Array = [""]
        let emails: ABMultiValueRef = ABRecordCopyValue(person,
            kABPersonEmailProperty).takeRetainedValue()
        
        for counter in 0..<ABMultiValueGetCount(emails){
            
            let email = ABMultiValueCopyValueAtIndex(emails,
            counter).takeRetainedValue() as! String
            
            println(email)
            println("adsfas")
            allEmails.append(email)
            //println(allEmails)
            
        }
        
    }
    
    func readAllPeopleInAddressBook(addressBook: ABAddressBookRef){
        
        /* Get all the people in the address book */
        let allPeople = ABAddressBookCopyArrayOfAllPeople(
            addressBook).takeRetainedValue() as NSArray
        
        for person: ABRecordRef in allPeople{
            
            let firstName = ABRecordCopyValue(person,
            kABPersonFirstNameProperty).takeRetainedValue() as! String
            let lastName = ABRecordCopyValue(person,
            kABPersonLastNameProperty).takeRetainedValue() as! String
            
            println("First name = \(firstName)")
            println("Last name = \(lastName)")
            
            readEmailsForPerson(person)
        }
    }
    

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.rowHeight = 44.0
        println("#rows")
        return 5
        //return self.contacts.count
        
        
    }
    
    //Function to use HEX Codes to create colors of the rows
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(100)
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println("hi")
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "NewCell")
        cell.textLabel?.text = "hi"
        cell.textLabel?.textColor = UIColor.redColor()
        cell.textLabel?.font = UIFont(name: "Avenir", size: 44.0)
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        
        return cell
    }
}

