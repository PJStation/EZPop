import UIKit

let screenSize = UIScreen.main.bounds.size
let screenWidth = screenSize.width
let screenHeight = screenSize.height

public enum EZPopViewStopPosition: Int {
    case top
    case center
    case bottom
}

enum EZPopViewAppearType: Int {
    case present
    case show
    case dropDown
}

enum EZPopViewDisAppearType: Int {
    case dismiss
    case hidden
    case up
}
