//
//  ViewController.swift
//  Dices
//
//  Created by Леонид Турко on 05.04.2023.
//

import UIKit
import SwiftUI
import SnapKit

class DiceViewController: UIViewController {
  
  //  MARK: - Private Properties
  private let dices = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
  
  private lazy var backgroundImage: UIImageView = {
    let element = UIImageView()
    element.image = UIImage(named: "GreenBackground")
    element.contentMode = .scaleAspectFill
    return element
  }()
  
  private lazy var logoImage: UIImageView = {
    let element = UIImageView()
    element.image = UIImage(named: "DiceeLogo")
    element.contentMode = .scaleAspectFill
    return element
  }()
  
  private lazy var stackView: UIStackView = {
    let element = UIStackView()
    element.axis = .horizontal
    element.spacing = 60
    element.distribution = .fillEqually
    return element
  }()
  
  private lazy var diceOne: UIImageView = {
    let element = UIImageView()
    element.image = UIImage(named: "DiceFour")
    element.contentMode = .scaleAspectFill
    return element
  }()
  
  private lazy var diceTwo: UIImageView = {
    let element = UIImageView()
    element.image = UIImage(named: "DiceFour")
    element.contentMode = .scaleAspectFill
    return element
  }()
  
  private lazy var rollDice: UIButton = {
    let element = UIButton(type: .system)
    element.tintColor = .white
    element.setTitle("Roll", for: .normal)
    element.backgroundColor = #colorLiteral(red: 0.6068438888, green: 0.1102350578, blue: 0.1197155192, alpha: 1)
    return element
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    addViews()
    setConstraints()
  }
}

//  MARK: -  Private Methods
extension DiceViewController {
  private func addViews() {
    view.addSubview(backgroundImage)
    view.addSubview(logoImage)
    view.addSubview(stackView)
    stackView.addArrangedSubview(diceOne)
    stackView.addArrangedSubview(diceTwo)
    view.addSubview(rollDice)
  }
  
  private func setConstraints() {
    backgroundImage.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    logoImage.snp.makeConstraints { make in
      make.top.equalTo(120)
      make.centerX.equalToSuperview()
    }
    
    stackView.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
    
    diceOne.snp.makeConstraints { make in
      make.height.width.equalTo(120)
    }
    
    rollDice.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.bottom.equalToSuperview().inset(120)
      make.width.equalTo(diceOne.snp.width).dividedBy(2)
    }
  }
}

struct ContentViewController: UIViewControllerRepresentable {

    typealias UIViewControllerType = DiceViewController

    func makeUIViewController(context: Context) -> UIViewControllerType {
        return DiceViewController()
    }

    func updateUIViewController(_ uiViewController: DiceViewController, context: Context) {}
}

struct ContentViewController_Previews: PreviewProvider {
    static var previews: some View {
      ContentViewController()
        .previewDevice("iPhone 12 Pro Max")
            .edgesIgnoringSafeArea(.all)
            .colorScheme(.light) // or .dark
    }
}
