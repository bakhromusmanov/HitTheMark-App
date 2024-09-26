//
//  AboutViewController.swift
//  HitTheMark
//
//  Created by Bakhrom Usmanov on 25/09/24.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebViewContent()
    }
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func closeButtonPressed(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    
}
extension AboutViewController {
    func loadWebViewContent() {
        if let url = Bundle.main.url(
            forResource: "HitTheMark", withExtension: "html") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
