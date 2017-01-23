
import UIKit

class ViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var botaoProcessar: UIButton!
    
    //MARK: Propriedades

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: Actions
    @IBAction func processar(_ sender: UIButton) {
        
        executar {
            self.botaoProcessar.isEnabled = true
        }
        
    }
    
    
    //MARK: Métodos Personalizados
    func executar(callback : @escaping () -> Void){
        self.botaoProcessar.isEnabled = false
        
        DispatchQueue.global().async {
            for processo in 1...5{
                if processo == 5 {
                    DispatchQueue.main.async {
                        callback()
                    }
                }
                
                print("Processo GCD: \(processo)")
                Thread.sleep(forTimeInterval: 1.0)
            }
        }
    }

}

