//
//  WebViewController.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 16/3/2023.
//

import UIKit
import WebKit

final class WebViewController: UIViewController {
    private let url: URL!
    private var webView: WKWebView?
    
    // MARK: UIViewController Lifecycle
    init(withURL url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    // Even though this is considered unsafe, there is no chance of
    // Storyboard instantiation in this projects
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInterface()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadURL()
    }
    
    private func loadURL() {
        let request = URLRequest(url: url)
        webView?.load(request)
    }
}

// MARK: CONFIGURE LAYOUT
extension WebViewController {
    
    private func configureInterface() {
        view.backgroundColor = .white
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        configureWebView()
    }
    
    private func configureWebView() {
        let webview = WKWebView()
        webview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webview)
        webview.pin(to: view)
        self.webView = webview
    }
}
