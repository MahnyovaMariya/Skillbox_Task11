import UIKit

class NewViewController: UIViewController {
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesEnded(touches, with: event)
        
        dismiss(animated: true, completion: nil)
    }
}
