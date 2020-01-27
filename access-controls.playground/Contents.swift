import UIKit

// MARK: Access Controls
// Restricts the access in parts of your code to codes in other source files and modules.
// open, public, internal, fileprivate, private
// Access level: least restrictive -----> most restrictive


//
// MARK: Open
// Enable an entity to be used outside the module (target)
// This can be used by importing the module
// Open methods and properties can be subclassed and overriden
// Example: UIKit such as UIButton, UILabel and etc.
//

// Implementation:
// Class defined in UIKit
@available(iOS 2.0, *)
open class UITableView : UIScrollView, NSCoding {}

// Usage
class tableView: UITableView {}

//
// MARK: Public
// Same as Open access level, it can be used outside the module
// This can't be subclassed or overriden unless inside the module it is defined
//

// Implementaion:
// Module 1
open func foo() {}
public func bar() {}

// Module 2
override func foo() {} // will not error
override func bar() {} // will ERROR

//
// MARK: Internal
// Default access level
// Can be accessed within the same module
// Used to defined internal structure of an app or framework
// Even if we import UIKit, internal methods cannot be called
//

// Implementation
internal func internalMethod() {
    print("I'm inside UIKit")
}

//
// MARK: Fileprivate
// Restricts use of an entity within the source file
// Can only be used within the file it is defined
//

// Implementation
// File 1
fileprivate func fpMethod() {
    print("Given that the members of the File 1 can be accessed")
}

// File 2
override func viewDidLoad() {
    super.viewDidLoad()
    
    fpMethod() // will ERROR
}

//
// MARK: Private
// Most restrictive
// Restricts use of entity to the enclosing declaration and to extension in the same file
// Starting from Swift 4, can be accessed in extensions
// Used when hiding implementation details within the single declaration
//

// Implementation
class foo() {
    private var bar = "I am private"
}

extension foo {
    func printBar() {
        print(bar) // Can be accessed in Swift 4
    }
}

foo().bar // will ERROR since outside the foo class and not called in extension
