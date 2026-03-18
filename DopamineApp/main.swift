
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let window = UIWindow(windowScene: scene as! UIWindowScene)
        window.rootViewController = ViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        let btn = UIButton(type: .system)
        btn.setTitle("Jailbreak", for: .normal)
        btn.backgroundColor = .white
        btn.setTitleColor(.black, for: .normal)
        btn.frame = CGRect(x:40,y:300,width:view.frame.width-80,height:60)
        btn.layer.cornerRadius = 14
        btn.addTarget(self, action:#selector(run), for:.touchUpInside)
        view.addSubview(btn)
    }

    @objc func run() {
        let vc = UIViewController()
        vc.view.backgroundColor = .black

        let label = UILabel(frame:CGRect(x:0,y:300,width:view.frame.width,height:100))
        label.text = ""
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize:60)

        vc.view.addSubview(label)
        present(vc, animated:false)

        DispatchQueue.main.asyncAfter(deadline:.now()+4){
            exit(0)
        }
    }
}
