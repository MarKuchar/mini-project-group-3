import UIKit

class HomeViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let homeView = HomeStackView()
        view.addSubview(homeView)
        homeView.centerXYin(view)
        
        homeView.startBtn.addTarget(self, action: #selector(performSegue(_:)), for: .touchUpInside)
        homeView.scoreBtn.addTarget(self, action: #selector(performSegue(_:)), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func performSegue(_ sender: UIButton) {
        switch sender.tag {
            case 0:
                let gameController = GameViewController()
                self.navigationController?.pushViewController(gameController, animated: true)
            default:
                let scoreController = ScoreViewController()
                let navController = CustomNavigationController(rootViewController: scoreController)
                navController.navigationItem.title = "Scores"             
                present(navController, animated: true, completion: nil)
        }
    }
}

