import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

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

        let button = UIButton(type: .system)
        button.setTitle("Jailbreak", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 22)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 14

        button.frame = CGRect(x: 40, y: 300, width: view.frame.width-80, height: 60)
        button.addTarget(self, action: #selector(start), for: .touchUpInside)

        view.addSubview(button)
    }

    @objc func start() {
        let vc = LogsVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}

class LogsVC: UIViewController {

    let textView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        textView.frame = view.bounds
        textView.backgroundColor = .black
        textView.textColor = .green
        textView.font = UIFont(name: "Menlo", size: 14)

        view.addSubview(textView)

        startLogs()
    }

    func startLogs() {
        let logs = [
            "[*] Initializing exploit...",
            "[*] Finding kernel base...",
            "[+] Kernel base found",
            "[*] Escaping sandbox...",
            "[+] Success",
            "[*] Patching kernel...",
            "[+] tfp0 acquired",
            "[*] Mounting rootfs...",
            "[+] Done",
            "[✓] Jailbreak complete"
        ]

        var i = 0

        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { t in
            if i < logs.count {
                self.textView.text += logs[i] + "\\n"
                self.textView.scrollRangeToVisible(NSRange(location: self.textView.text.count, length: 0))
                i += 1
            } else {
                t.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.fakeReboot()
                }
            }
        }
    }

    func fakeReboot() {
        let reboot = UIView(frame: view.bounds)
        reboot.backgroundColor = .black

        let label = UILabel(frame: CGRect(x: 0, y: 300, width: view.frame.width, height: 100))
        label.text = ""
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 60)

        reboot.addSubview(label)
        view.addSubview(reboot)

        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            exit(0)
        }
    }
}
