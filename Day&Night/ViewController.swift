//
//  ViewController.swift
//  26.6 HW-1
//
    //  Created by family Sedykh on 07.04.2023.
    //

import UIKit

enum Theme: Int {
    case light
    case dark
    
    func getUserInterfaceStyle() -> UIUserInterfaceStyle {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}

class ViewController: UIViewController {

    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Light", "Dark"])
        segmentedControl.backgroundColor = .systemBlue
        segmentedControl.selectedSegmentTintColor = .lightGray
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = UIColor(named: "otherColor")
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
//    private let imageViewLight: UIImageView = {
//        let view = UIImageView()
//        view.layer.cornerRadius = 20
//        view.backgroundColor = .lightGray
//        view.image = UIImage(named: "light")
//        view.tintColor = .white
//        view.contentMode = .scaleAspectFit
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        view.image = UIImage(named: "light")
        view.tintColor = .white
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        updateImageView()
    }
    
//    func imageViewPic() {
//        imageViewLight.image = UIImage(named: "dark")
//        imageViewDark.image = UIImage(named: "light")
//    }
    
    private func setupView() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.addSubview(imageView)
//        view.addSubview(imageViewLight)
        view.addSubview(segmentedControl)
        segmentedControl.selectedSegmentIndex = MTUserDefaults.shared.theme.rawValue
    }
    @objc private func segmentChanged() {
        MTUserDefaults.shared.theme = Theme(rawValue: segmentedControl.selectedSegmentIndex) ?? .light
        view.window?.overrideUserInterfaceStyle = MTUserDefaults.shared.theme.getUserInterfaceStyle()
        updateImageView()
    }
    
    private func updateImageView() {
        
        switch MTUserDefaults.shared.theme.getUserInterfaceStyle() {
        case .light:
            imageView.image = UIImage(named: "light")
        case .dark:
            imageView.image = UIImage(named: "dark")
        default:
            imageView.image = UIImage(named: "light")
        }
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            imageView.widthAnchor.constraint(equalToConstant: 300)
        ])
        
//        NSLayoutConstraint.activate([
//            imageViewLight.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
//            imageViewLight.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            imageViewLight.heightAnchor.constraint(equalToConstant: 150),
//            imageViewLight.widthAnchor.constraint(equalToConstant: 300)
//        ])
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 600),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.heightAnchor.constraint(equalToConstant: 20),
            segmentedControl.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    

}
