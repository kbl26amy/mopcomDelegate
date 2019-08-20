
import Foundation
import UIKit

public protocol SelectionViewDataSource {
    
    func itemCount(_ selectionView: UIView) -> Int
    
    func itemTitle() -> [String]
    
    func underLineColor() -> UIColor
    
    func itemTextColor() -> UIColor
    
    func textFont() -> UIFont
    
    func selectBtnIndex() -> Int
}

extension SelectionViewDataSource {
    func itemCount(_ selectionView: UIView) -> Int {
        return 2
    }
    
    func itemTitle() -> [String] {
        return []
    }
    
    func underLineColor() -> UIColor {
        return .blue
    }
    
    func itemTextColor() -> UIColor {
        return .white
    }
    
    func textFont() -> UIFont {
        return UIFont.systemFont(ofSize: 18)
    }
    
    func selectBtnIndex() -> Int{
        return 1
    }
}

protocol SelectionViewDelegate {
    
    func chooseItem(_ selectionView: UIView, index: Int)
    
    func isSelected(_ selectionView: UIView, index: Int)-> Bool
}


extension SelectionViewDelegate {
    
    func chooseItem(_ selectionView: UIView, index: Int){
    }
  
    func isSelected(_ selectionView: UIView, index: Int) -> Bool {
        return true
    }
}

open class SelectionView: UIView {
    
    var indicatorView = UIView()

    var dataSource: SelectionViewDataSource?{
        didSet{
          addButton()
        }
    }
    
    var delegate: SelectionViewDelegate?
    
    var index: Int?
    
    @objc func click(sender:UIButton){
        guard delegate?.isSelected(self, index: sender.tag) == true else {
            return }
        moveIndicatorView(reference: sender)
        delegate?.chooseItem(self, index: sender.tag)
        self.index = sender.tag
//        delegate?.isSelected(self, index: sender.tag)
    }
    
    func moveIndicatorView(reference: UIButton) {
        
        UIView.animate(withDuration: 0.1, animations: { [weak self] in
            self!.indicatorView.center.x = reference.center.x
            self?.indicatorView.layoutIfNeeded()
        })
    }
    
  
    var colorView =  UIView()
    var clickButton = UIButton()
    
    func addButton() {
        
        guard let dataSource = dataSource else {return }

        let btnWidth = (UIScreen.main.bounds.width) / CGFloat(dataSource.itemCount(self))
        
        for number in 0..<dataSource.itemCount(self) {
            self.clickButton = UIButton(frame: CGRect(x: btnWidth * CGFloat(number) , y: 0, width: btnWidth , height: 80))
  
               self.clickButton.setTitle(self.dataSource?.itemTitle()[number], for: .normal)
           
                self.clickButton.titleLabel?.textColor = self.dataSource?.itemTextColor()
                self.clickButton.titleLabel?.font = self.dataSource?.textFont()
 
            self.addSubview(self.clickButton)
            self.indicatorView = UIView(frame: CGRect(x: 0, y: 80, width: btnWidth, height: 5))
            indicatorView.backgroundColor = self.dataSource?.underLineColor()
            
            clickButton.tag = number
            
           self.clickButton.addTarget(self, action: #selector(click(sender:)), for: .touchUpInside)
        }
          self.addSubview(indicatorView)
    }
  
}

