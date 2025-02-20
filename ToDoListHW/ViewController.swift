//
//  ViewController.swift
//  ToDoListHW
//
//  Created by Сергей Емелин on 06.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textfieldName: UITextField!
    
    @IBOutlet weak var textfieldSurname: UITextField!
    
    @IBOutlet weak var textfieldPhone: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPerson(_ sender: Any) {
        
        let name = textfieldName.text!
        let surname = textfieldSurname.text!
        let phone = textfieldPhone.text!
        
        
        var newPerson = Person(name: name, surname: surname, phone: phone)
        
        do {
            if let data = UserDefaults.standard.data(forKey: "PersonArray") {
                
                var array = try JSONDecoder().decode([Person].self, from: data)
                
                array.append(newPerson)
                
                let encodedata = try JSONEncoder().encode(array)
                
                UserDefaults.standard.set(encodedata, forKey: "PersonArray")
            } else {
                
                let encodedata = try JSONEncoder().encode([newPerson])
                
                UserDefaults.standard.set(encodedata, forKey: "PersonArray")
            }
            
        } catch {
            print("unable to encode \(error)")
        }
        
        textfieldName.text! = ""
        textfieldSurname.text! = ""
        textfieldPhone.text! = ""
        
    }
    
}
    
