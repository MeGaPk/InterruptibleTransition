//
//  ChildViewController.swift
//  FluidTransition
//
//  Created by Mikhail Rubanov on 07/07/2019.
//  Copyright © 2019 akaDuality. All rights reserved.
//

import UIKit
import MessageUI

class ChildViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(hue: 0.2, saturation: 0.8, brightness: 0.9, alpha: 1)
        view.layer.cornerRadius = 24

        addShareButton()
    }

    private func addShareButton() {
        let button = UIButton(type: .system)
        button.setTitle("SMS", for: .normal)
        button.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 80),
        ])
    }

    @objc func dismissSelf() {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        composeVC.recipients = ["4085551212"]
        composeVC.body = "Hello from California!"
        self.present(composeVC, animated: true, completion: nil)

    }

    func messageComposeViewController(_ controller: MFMessageComposeViewController,
                                      didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
}
