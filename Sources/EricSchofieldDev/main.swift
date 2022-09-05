import Foundation
import Publish

// This will generate your website using the built-in Foundation theme:
try PortfolioSite()
    .publish(using: [
        .addMarkdownFiles(),
        .copyResources(),
        .generateHTML(withTheme: .portfolioSite),
//        .generateRSSFeed(including: [.posts]),
//        .generateSiteMap(),
        .deploy(using: .gitHub("eschos24/eschos24.github.io",
                               branch: "main",
                               useSSH: true))
    ])
