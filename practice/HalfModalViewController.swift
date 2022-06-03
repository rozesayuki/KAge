//
//  HalfModalViewController.swift
//  practice
//
//  Created by SayukiYamada on 2022/06/02.
//

import UIKit

class HalfModalViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    //UIPickerViewDataSoureのためのメソッド
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    //UIPickerViewDataSoureのためのメソッド
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component{
        case 0:
            return yearPicker.count
        case 1:
            return monthPicker.count
        case 2:
            return dayPicker.count
        default:
            return 0
        }
        //return monthPicker.count
    }
//pickerviewdeligateのためのメソッド
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component{
        case 0:
            return yearPicker[row]
        case 1:
            return monthPicker[row]
        case 2:
            return dayPicker[row]
        default:
            return "error"
        }
        //return monthPicker[row]
    }
//pickerの幅を決めるメソッド
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {

        return 75
    }
    //pickerviewdeligateのためのメソッド
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component{
        case 0:
            yearResultLabel.text = yearPicker[row]
        case 1:
            monthResultLabel.text = monthPicker[row]
        case 2:
            dayResultLabel.text = dayPicker[row]
        default:
            break
        }
       // monthResultLabel.text = monthPicker[row]
    }
    
   
    
   
    let monthPicker = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    
    let dayPicker = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    
    let yearPicker = ["1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008"]
    

     let monthResultLabel = UILabel()
     let dayResultLabel = UILabel()
     let yearResultLabel = UILabel()

    //誕生日を算出するメソッド
    @objc func birthday(didSelectRow row: Int) -> Int{
        let birthday = DateComponents(year: Int(yearPicker[row])!,month: Int(monthPicker[row])!,day: Int(dayPicker[row])!)
        var age: Int
        let thisYearBirthday = DateComponents(year: 2022,month: Int(monthPicker[row])!,day: Int(dayPicker[row])!)
        let calender = Calendar.current
       // let newYearsday = DateComponents(year: (calender.dateComponents([.year],from: Date())).year,month: 1,day: 1)
        let today = calender.dateComponents([.year,.month,.day], from: Date())
        let ageComponents = calender.dateComponents([.year], from: birthday,to: today)
        //if today
        age = ageComponents.year!
        
        let differnt = calender.dateComponents([.day], from: thisYearBirthday,to: today)
        if Int(differnt.day!) > 0{
           age += 2
        }
        else{
            age += 1
        }
        //if Int(calender.dateComponents([.day], from: thisYearBirthday,to: today))! > 0
        //print(age)
        return age
        
    }
   //年齢を表示するラベル
    let lable = UILabel()
    
    
    
    
    func calage(){
       // age = birthday - today
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
      
        let button = UIButton()
        button.frame = CGRect(x:view.frame.minX * 0.3, y: 100,
                               width:300, height:50)
        button.setTitle("決定", for:UIControl.State.normal)
        // タイトルの色
 //        button.setTitleColor(UIColor.white, for: .normal)
         
         // ボタンのフォントサイズ
         button.titleLabel?.font =  UIFont.systemFont(ofSize: 36)
         
         // 背景色
         button.backgroundColor = UIColor.init(
                                  red:0.9, green: 0.9, blue: 0.9, alpha: 1)
     
        button.addTarget(self, action: #selector(HalfModalViewController.birthday(didSelectRow:)), for: .touchUpInside)
        self.view.addSubview(button)

      //yは上からの距離?
        //xは中心からの距離
        monthResultLabel.frame = CGRect(x: view.frame.minX * 0.3, y:70, width:400, height: view.frame.size.height / 5)
        monthResultLabel.textColor = .black
        view.addSubview(monthResultLabel)

        let pickerView = {() -> UIPickerView in

            let picker = UIPickerView(frame: CGRect(x: view.frame.minX * 0.3, y: 200, width: 400, height: self.view.frame.size.height / 10))
            monthResultLabel.textAlignment = .center
            picker.backgroundColor = .lightGray

            return picker
        }()

        view.addSubview(pickerView)

        pickerView.delegate = self
        pickerView.dataSource = self
        //ここまでがmonth
        
        dayResultLabel.frame = CGRect(x: 130/*(view.frame.minX * 0.3)+400*/, y:70, width:400, height: view.frame.size.height / 5)
        dayResultLabel.textColor = .black
        view.addSubview(dayResultLabel)

        let pickerView2 = {() -> UIPickerView in

            let picker2 = UIPickerView(frame: CGRect(x: (view.frame.minX * 0.3)+400, y: 200, width: 400, height: self.view.frame.size.height / 10))
            dayResultLabel.textAlignment = .center
            picker2.backgroundColor = .lightGray

            return picker2
        }()

        view.addSubview(pickerView2)

        pickerView.delegate = self
        pickerView.dataSource = self
        //ここまでがday
        
        yearResultLabel.frame = CGRect(x: -130/*(view.frame.minX * 0.3)+800*/, y:70, width:400, height: view.frame.size.height / 5)
        yearResultLabel.textColor = .black
        view.addSubview(yearResultLabel)

        let pickerView3 = {() -> UIPickerView in

            let picker3 = UIPickerView(frame: CGRect(x: (view.frame.minX * 0.3)+800, y: 200, width: 400, height: self.view.frame.size.height / 10))
            yearResultLabel.textAlignment = .center
            picker3.backgroundColor = .lightGray

            return picker3
        }()

        view.addSubview(pickerView3)

        pickerView.delegate = self
        pickerView.dataSource = self
    
        
    }//さわらない
        // Do any additional setup after loading the view.
    }//最後


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



