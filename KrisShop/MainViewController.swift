//
//  MainViewController.swift
//  KrisShop
//
//  Created by Cult Lee on 4/13/22.
//

import UIKit
import WebKit

class MainViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var imagView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://ospwxwlw.com")
        let req = URLRequest(url: url!)
        webView.load(req)
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: [.new], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let progress = webView.estimatedProgress
        if progress >= 1.0 {
            UIView.animate(withDuration: 1.75, delay: 0, options: .curveEaseOut) { [weak self] in
                self?.imagView.alpha = 0
            } completion: { [weak self] _ in
                self?.imagView.isHidden = true
            }
        }
    }
}
