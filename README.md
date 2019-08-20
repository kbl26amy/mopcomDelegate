# Delegate 與 Protocol的使用

----
## 製作一個SelectionView
AmyYang

> 可以提供類似 Button 的效果，讓使用者可以與 SelectionView 互動；當點選了某一個選項的時候，底下的 IndicatorView 會移動到使用者點選的選項下方。


----
## usage
1. 總共有幾個選項，預設為兩個
2. 每個選項上面的文字
3. 底線的顏色，預設為藍色
4. 選項文字的顏色，預設為白色
5. 選項文字的 Font，預設為 UIFont.systemFont(ofSize: 18)
6. 使用者選擇了哪一個選項。
7. 控制使用者是否可以選擇某一個選項，當不能選擇的時候，IndicatorView 不會移動，使用者選擇選項的 Delegate method 也不會被觸發。

----
## protocol
# 設計內容

*可選擇button*


>SelectionViewDataSource

    public protocol SelectionViewDataSource {
    
    func itemCount(_ selectionView: UIView) -> Int
    
    func itemTitle() -> [String]
    
    func underLineColor() -> UIColor
    
    func itemTextColor() -> UIColor
    
    func textFont() -> UIFont
    
    func selectBtnIndex() -> Int}


>SelectionViewDelegate

    protocol SelectionViewDelegate {
    
    func chooseItem(_ selectionView: UIView, index: Int)
    
    func isSelected(_ selectionView: UIView, index: Int)-> Bool}


----
## changelog
* 19-Aug-2019 re-design

----
## thanks
* [Delegate](https://github.com/Wuchiwei/iOS/tree/master/Delegate)
