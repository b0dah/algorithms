//
//  ViewController.swift
//  UserDefaultsSaving
//
//  Created by Иван Романов on 13.07.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var cityPickerView: UIPickerView!
    @IBOutlet weak var sexSegmentedControl: UISegmentedControl!
    
    let cities = ["NY", "LA", "CA", "SF"]
    let sexArray = ["male", "female"]
    var selectedCity: String?
    var selectedSex: SexType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cityPickerView.dataSource = self
        self.cityPickerView.delegate = self
        
        let userObject = UserSettings.userModel
        nameTextField.text = userObject?.name
        surnameTextField.text = userObject?.surname
        
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        // set sex
        switch sexSegmentedControl.selectedSegmentIndex {
        case 0:
            selectedSex = .male
        case 1:
            selectedSex = .female
        default:
            break
        }
        
        // Text Fields
        let trimmedNameText = nameTextField.text!.trimmingCharacters(in: .whitespaces)
        let trimmedSurnameText = surnameTextField.text!.trimmingCharacters(in: .whitespaces)
        
        guard let selectedSex = selectedSex, let selectedCity = selectedCity else {
            print("city or gender isn't selected")
            return
        }
        
        let userObject = UserModel(name: trimmedNameText, surname: trimmedSurnameText, sex: selectedSex, city: selectedCity)
        print("Saved!")
        
        // Saving to UserDefaults
        UserSettings.name = trimmedNameText
        print(UserSettings.name)
        
        UserSettings.userModel = userObject
        print(UserSettings.userModel)
    }

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedCity = cities[row]
    }
    
}

