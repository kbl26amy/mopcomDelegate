
import UIKit
import Foundation

class ViewController: UIViewController, SelectionViewDataSource, SelectionViewDelegate {
  
    func itemCount(_ selectionView: UIView) -> Int {
        if selectionView == self.selectedView {
            return 2
        } else if selectionView == self.secSelectedView{
            return 3
        }else {
           return 1
        }
    }
    
    func itemTitle() -> [String] {
        
        if view == self.selectedView {
            return buttonText
        } else {
            return decButtonText
        }
        
    }
    
    func underLineColor() -> UIColor {
        return .yellow
    }
    
    func itemTextColor() -> UIColor {
        return .white
    }
    
    func textFont() -> UIFont {
        return UIFont.systemFont(ofSize: 18)
    }
    
    func chooseItem(_ selectionView: UIView, index: Int) {
        
        if selectionView == self.selectedView{
            self.colorView.backgroundColor = buttonColor[index]
        } else {
            self.secColorView.backgroundColor = secButtonColor[index]
        }
    }
    
    func isSelected(_ selectionView: UIView, index: Int) ->Bool {
        if selectionView == self.selectedView {
            return true
        }else{
            if self.selectedView.index == buttonText.count - 1{
            return false
        }else {
            return true
            }
        }
    }
    

    var colorView =  UIView(frame: CGRect(x: 0, y: 130, width: Int(UIScreen.main.bounds.width), height: 80))
    var secColorView = UIView(frame: CGRect(x: 0, y: 330, width: Int(UIScreen.main.bounds.width), height: 80))
    var buttonColor = [UIColor.red, UIColor.yellow]
    var secButtonColor = [UIColor.red, UIColor.yellow, UIColor.blue]
    var buttonText = ["red", "yellow"]
    var decButtonText = ["red", "yellow", "blue"]
    
    var selectedView = SelectionView(frame: CGRect(x: 0, y: 50, width: Int(UIScreen.main.bounds.width), height: 80))
    
    var secSelectedView = SelectionView(frame: CGRect(x: 0, y: 250, width: Int(UIScreen.main.bounds.width), height: 80))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.colorView.backgroundColor = buttonColor[0]
        self.secColorView.backgroundColor = secButtonColor[0]
        
        selectedView.delegate = self
        selectedView.dataSource = self
        
        secSelectedView.delegate = self
        secSelectedView.dataSource = self
        
        self.view.addSubview(colorView)
        self.view.addSubview(secColorView)
        self.view.addSubview(selectedView)
        self.view.addSubview(secSelectedView)
     
    }
   
}


