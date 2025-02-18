import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let url: URL
    var colorScheme: ColorScheme
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.backgroundColor = colorScheme == .dark ? .uBlack : .uWhite
        webView.isOpaque = false
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
        
    func makeCoordinator() -> Coordinator {
        Coordinator(self, colorScheme: colorScheme)
    }
    
    final class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        var colorScheme: ColorScheme
        
        init(_ parent: WebView, colorScheme: ColorScheme) {
            self.parent = parent
            self.colorScheme = colorScheme
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            
            let darkModeCSS = """
                        var css = '* { background-color: black !important; color: white !important; } a { color: #1E90FF !important; }';
                        var style = document.createElement('style');
                        style.type = 'text/css';
                        style.appendChild(document.createTextNode(css));
                        document.head.appendChild(style);
                        """
            let lightModeCSS = """
                        var css = '* { background-color: white !important; color: black !important; } a { color: #0000EE !important; }';
                        var style = document.createElement('style');
                        style.type = 'text/css';
                        style.appendChild(document.createTextNode(css));
                        document.head.appendChild(style);
                        """
            
            let script = colorScheme == .dark ? darkModeCSS : lightModeCSS
            
            webView.evaluateJavaScript(script, completionHandler: nil)
        }
    }
}
