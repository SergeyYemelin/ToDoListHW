//
//  PersonViewController.swift
//  ToDoListHW
//
//  Created by Сергей Емелин on 11.11.2024.
//

import UIKit

class PersonViewController: UIViewController {
    
    var person: Person!
   
    var personIndex: Int!

    @IBOutlet weak var textfieldName: UITextField!
    
    @IBOutlet weak var textfieldSurname: UITextField!
    
    @IBOutlet weak var textfieldPhone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textfieldName.text! = person.name
        textfieldSurname.text! = person.surname
        textfieldPhone.text! = person.phone
        
        // Do any additional setup after loading the view.
    }
    @IBAction func ChangePerson(_ sender: Any) {
       
        let name = textfieldName.text!
        let surname = textfieldSurname.text!
        let phone = textfieldPhone.text!
        
        person.name = name
        person.surname = surname
        person.phone = phone
        
       
        do {
            if let data = UserDefaults.standard.data(forKey: "PersonArray") {
                
                var array = try JSONDecoder().decode([Person].self, from: data)
                
                array[personIndex] = person
               
                let encodedata = try JSONEncoder().encode(array)
                
                UserDefaults.standard.set(encodedata, forKey: "PersonArray")
            } else {
                
                let encodedata = try JSONEncoder().encode([person])
                
                UserDefaults.standard.set(encodedata, forKey: "PersonArray")
            }
                    
        } catch {
            print("unable to encode \(error)")
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
