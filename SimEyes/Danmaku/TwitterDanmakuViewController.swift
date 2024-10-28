//
//  TwitterDanmakuViewController.swift
//  SimEyes
//
//  Created by akidon0000 on 2024/10/28.
//

import SwiftUI
import WebKit
import SwiftSoup

struct TwitterDanmakuView: View {
//    @State var danmakuText = "lllllpppppp"
    @State var tweetDanmakus = [TweetInfo]()
    
    var body: some View {
        ZStack {
            // `danmakuText`が変わるたびに新しい`DanmakuText`を追加
            ForEach(tweetDanmakus, id: \.self) { tweet in
                DanmakuText(text: tweet.text)
            }
            
            // WebViewWrapperを非表示で使用 since:2024-10-28_10:00:00_JST until:2024-10-28_20:00:00_JST
            if let url = convertToURL(query: "#TheNekoNomad since:2024-10-28_10:00:00_JST until:2024-10-28_20:00:00_JST") {
                WebViewWrapper(url: url, tweetDanmakus: $tweetDanmakus)
                    .opacity(0)
            }
        }
//        .onChange(of: danmakuText) { newText in
//            displayedDanmaku.append(newText)
//        }
    }
}


struct WebViewWrapper: NSViewRepresentable {
    
    let url: URL
    
    @Binding var tweetDanmakus: [TweetInfo]
    
    @State private var timer: Timer?
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeNSView(context: Context) -> WKWebView {
        
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.configuration.defaultWebpagePreferences.preferredContentMode = .mobile
        
        // MacOSのブラウザをiOSとして動かす(MacOSのブラウザはXではサポート外のため)
        webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148"
        
        let request = URLRequest(url: url)
        webView.load(request)
    
        timer = Timer.scheduledTimer(withTimeInterval: 15.0, repeats: true) { _ in
            DispatchQueue.main.async {
                print("webView")
                webView.reload()
            }
        }
        return webView
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        // 更新は不要
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebViewWrapper
        
        init(_ parent: WebViewWrapper) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("リロード")
            // 表示に時間がかかるため、3秒待機
            DispatchQueue.main.asyncAfter(deadline: .now() + 13.0) {
                webView.evaluateJavaScript("document.documentElement.outerHTML.toString()") { html, error in
                    if let htmlString = html as? String {
                        self.parseHTML(htmlString)
                    } else if let error = error {
                        print("HTML取得エラー: \(error.localizedDescription)")
                    }
                }
            }
        }
        
        // HTMLをSwiftSoupで解析するメソッド
        private func parseHTML(_ html: String) {
            do {
                var tweetInfos: [TweetInfo] = []
                
                let document = try SwiftSoup.parse(html)
                print(document)
                // 各ツイート要素を取得
//                let tweetElements = try document.select("dev.css-175oi2r")
//                print("tweetElements", tweetElements.count)
                
                let userName = try document.select("[data-testid=User-Name]").text()
                let accountName = try document.select("span:contains(@)").text()
                let tweetText = try document.select("[data-testid=tweetText]").text()
                let tweetTime = try document.select("time").attr("datetime")
                print("info", userName, tweetText)
//                for tweetElement in tweetElements {
//                    // 各要素から必要な情報を取得
//                    let userName = try tweetElement.select("[data-testid=User-Name]").text()
//                    let accountName = try tweetElement.select("span:contains(@)").text()
//                    let tweetText = try tweetElement.select("[data-testid=tweetText]").text()
//                    let tweetTime = try tweetElement.select("time").attr("datetime")
//                    
//                    // TweetInfo構造体にデータを格納して配列に追加
//                    let tweetInfo = TweetInfo(userName: userName, accountName: accountName, text: tweetText, time: tweetTime)
//                    tweetInfos.append(tweetInfo)
//                }
                print("tweetInfos", tweetInfos)
                parent.tweetDanmakus = tweetInfos
            } catch {
                print("エラー: \(error)")
            }
        }
    }
}


func convertToURL(query: String) -> URL? {
    let baseURL = "https://x.com/search?src=recent_search_click&f=live&q="
    guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
        return nil
    }
    let fullURL = baseURL + encodedQuery + "&src=savs"
    return URL(string: fullURL)
}

struct DanmakuText: View {
    let text: String
    
    @State private var xPosition: CGFloat = 3000
    @State private var yPosition = CGFloat.random(in: 10..<150)
    @State private var speed = CGFloat.random(in: 10..<15)
    @State private var delay = CGFloat.random(in: 0..<8)
    
    var body: some View {
        ZStack {
            // 背景のテキスト (縁取り部分)
            Text(text)
                .font(.system(size: 40))
                .foregroundColor(.white)
                .offset(x: 2, y: 2)
            Text(text)
                .font(.system(size: 40))
                .foregroundColor(.white)
                .offset(x: -2, y: -2)
            Text(text)
                .font(.system(size: 40))
                .foregroundColor(.white)
                .offset(x: 2, y: -2)
            Text(text)
                .font(.system(size: 40))
                .foregroundColor(.white)
                .offset(x: -2, y: 2)


            Text(text)
                .font(.system(size: 40))
                .foregroundColor(.black)
        }
        .position(x: xPosition, y: yPosition)
        .onAppear {
            withAnimation(.easeInOut(duration: speed)) {
                xPosition = -1000
            }
        }
    }
}
