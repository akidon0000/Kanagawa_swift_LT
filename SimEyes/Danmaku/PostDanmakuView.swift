//
//  PostDanmakuView.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/28.
//

//import SwiftSoup
//import SwiftUI
//import WebKit
//
//struct PostDanmakuView: View {
//    @State var postDanmakus = [String]()
//    
//    var body: some View {
//        ZStack {
//            // Postの情報を拝借してくる(注: スクレイピングではない。拝借してくるだけ。)
//            WebViewWrapper(postDanmakuInfos: $postDanmakus)
////                .opacity(0) // WebViewは非表示
//            
//            
//            ForEach(postDanmakus.indices, id: \.self) { index in
//                DanmakuText(text: postDanmakus[index])
//            }
//            
//        }
//    }
//}
//
//
//struct WebViewWrapper: NSViewRepresentable {
//    
//    @Binding var postDanmakuInfos: [String]
//    
//    @State private var timer: Timer?
//    @State private var postSearchUrlAndQuery: URL?
//    
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(self)
//    }
//    
//    func makeNSView(context: Context) -> WKWebView {
//        
//        let webView = WKWebView()
//        webView.navigationDelegate = context.coordinator
//        webView.configuration.defaultWebpagePreferences.preferredContentMode = .mobile
//        
//        // MacOSのブラウザをiOSとして動かす(MacOSのブラウザはXではサポート外のため)
//        webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148"
//    
//        timer = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: true) { _ in
//            DispatchQueue.main.async {
//                if let url = createUrl() {
//                    webView.load(URLRequest(url: url))
//                }
//            }
//        }
//        
//        return webView
//    }
//
//    func updateNSView(_ nsView: WKWebView, context: Context) {
//    }
//
//    class Coordinator: NSObject, WKNavigationDelegate {
//        var parent: WebViewWrapper
//        
//        init(_ parent: WebViewWrapper) {
//            self.parent = parent
//        }
//        
//        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//            // 読み込み可能な画面取得に時間がかかるため、5秒待機
//            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
//                webView.evaluateJavaScript("document.documentElement.outerHTML.toString()") { html, error in
//                    if let htmlString = html as? String {
//                        do {
//                            let document = try SwiftSoup.parse(htmlString)
//                            
//                            let postTexts: Elements = try document.select("[data-testid=tweetText]")
//            //                let userName = try document.select("[data-testid=User-Name]")
//            //                let accountName = try document.select("span:contains(@)")
//            //                let tweetTime = try document.select("time").attr("datetime")
//                            
//                            var danmakuInfos: [String] = []
//                            for post in postTexts {
//                                let str = try post.text()
//                                danmakuInfos.append(str)
//                            }
//                            print("danmakuInfos:", danmakuInfos)
//                            
//                            self.parent.postDanmakuInfos = danmakuInfos
//                        } catch {
//                            print("エラー: \(error)")
//                        }
//                    } else if let error = error {
//                        print("HTML取得エラー: \(error.localizedDescription)")
//                    }
//                }
//            }
//        }
//    }
//    
//    private func createUrl() -> URL? {
//        let startTime = Date()
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd_HH:mm:ss"
//        formatter.dateFormat = "mm:ss"
//        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
//        
//        let startString = formatter.string(from: startTime)
//        let endTime = startTime.addingTimeInterval(300)
//        let endString = formatter.string(from: endTime)
//        let query = "#macosnative since:2024-11-02_14:\(startString)_JST until:2024-11-02_14:\(endString)_JST"
//        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        
//        return URL(string: "https://x.com/search?src=recent_search_click&f=live&q=\(encodedQuery ?? "")&src=savs")
//    }
//}
//
//struct DanmakuText: View {
//    let text: String
////    let delay: Double
//
//    @State private var xPosition: CGFloat = 3000
//    @State private var yPosition = CGFloat.random(in: 10..<150)
//    @State private var speed = CGFloat.random(in: 10..<15)
//
//    var body: some View {
//        ZStack {
//            // 背景のテキスト (縁取り部分)
//            Text(text)
//                .font(.system(size: 40))
//                .foregroundColor(.white)
//                .offset(x: 2, y: 2)
//            Text(text)
//                .font(.system(size: 40))
//                .foregroundColor(.white)
//                .offset(x: -2, y: -2)
//            Text(text)
//                .font(.system(size: 40))
//                .foregroundColor(.white)
//                .offset(x: 2, y: -2)
//            Text(text)
//                .font(.system(size: 40))
//                .foregroundColor(.white)
//                .offset(x: -2, y: 2)
//
//            Text(text)
//                .font(.system(size: 40))
//                .foregroundColor(.black)
//        }
//        .position(x: xPosition, y: yPosition)
//        .onAppear {
//            // 各テキストの表示をdelay時間後に開始
//            let randomDelay = Double.random(in: 0..<30)
//            DispatchQueue.main.asyncAfter(deadline: .now()) {
//                withAnimation(.easeInOut(duration: speed).delay(randomDelay)) {
//                    xPosition = -10
//                }
//            }
//        }
//    }
//}
