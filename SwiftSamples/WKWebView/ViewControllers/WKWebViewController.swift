//
//  WKWebViewController.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2018/12/28.
//  Copyright © 2018 Tsukasa Hasegawa. All rights reserved.
//

import WebKit
import UIKit

class WKWebViewController: UIViewController {
    
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    
    // サンプルとして、googleのWebページを開く
    let urlString:String = "https://www.google.co.jp/"
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        backButton.title = "◀︎"
        forwardButton.title = "▶︎"
        
        self.setupWebView(with: urlString)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupWebView(with urlString: String) {
        let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        
        let webViewHeight: CGFloat = self.view.frame.height - statusBarHeight - toolBar.frame.height
        
        self.webView.frame = CGRect(x: 0, y: statusBarHeight, width: self.view.frame.width, height: webViewHeight)
        
        self.view.addSubview(webView)
        
        // 指定のURLを表示する
        let encoded = urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        
        let url = NSURL(string: encoded!)
        let request = NSURLRequest(url: url! as URL)
        
        webView.load(request as URLRequest)
    }
    
    @IBAction func didTapBackButton(_ sender: UIBarButtonItem) {
        self.webView.goBack()
    }
    
    @IBAction func didTapForwardButton(_ sender: UIBarButtonItem) {
        self.webView.goForward()
    }
    
    @IBAction func didTapReloadButton(_ sender: UIBarButtonItem) {
        self.webView.reload()
    }
    
}

extension WKWebViewController: WKNavigationDelegate {
    // webサイトの読み込み開始時に起動
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        // インジケータ(実機の左上でグルグルするアニメーション)の表示を開始する
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        // ボタンの有効性をチェック
        self.backButton.isEnabled = self.webView.canGoBack
        self.forwardButton.isEnabled = self.webView.canGoForward
    }
    
    // webサイトの読み込み完了時に起動
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // インジケータの表示を終了する
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        // ボタンの有効性をチェック
        self.backButton.isEnabled = self.webView.canGoBack
        self.forwardButton.isEnabled = self.webView.canGoForward
    }
}

extension WKWebViewController: WKUIDelegate {
    // リンクタップ時の挙動
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        // リンクの適性をチェック
        guard let url = navigationAction.request.url else {
            return nil
        }
        // リンクがtarget="_blank"で設定されている場合
        guard let targetFrame = navigationAction.targetFrame, targetFrame.isMainFrame else {
            // Safariで開く
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            return nil
        }
        return nil
    }
}
