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
    private var activityIndicator: UIActivityIndicatorView?
    
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
        configureActivityIndicator()
    }
    
    private func configureWebView() {
        let webview = WKWebView()
        webview.translatesAutoresizingMaskIntoConstraints = false
        webview.navigationDelegate = self
        view.addSubview(webview)
        webview.pin(to: view)
        self.webView = webview
    }
    
    private func configureActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.frame = CGRect(x: 0, y: 0,
                                         width: CGFloat(SystemConstants.WebViewer.progressViewWidth),
                                         height: CGFloat(SystemConstants.WebViewer.progressViewHeight))
        activityIndicator.hidesWhenStopped = true
        let refreshBarButton: UIBarButtonItem = UIBarButtonItem(customView: activityIndicator)
        self.navigationItem.rightBarButtonItem = refreshBarButton
        self.activityIndicator = activityIndicator
    }
}

// MARK: WKNavigationDelegate IMPLEMENTATION
extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activityIndicator?.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator?.stopAnimating()
    }
}
