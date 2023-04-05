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
  private lazy var backgroundImage: UIImageView = {
    let element = UIImageView()
    element.image = UIImage(named: "GreenBackground")
    element.contentMode = .scaleAspectFill
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
  }
  
  private func setConstraints() {
    backgroundImage.snp.makeConstraints { make in
      make.edges.equalToSuperview()
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
