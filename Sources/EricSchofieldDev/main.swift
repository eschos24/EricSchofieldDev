import Foundation
import Publish

// This will generate your website using the built-in Foundation theme:
try PortfolioSite()
    .publish(using: [
        .addMarkdownFiles(),
        .copyResources(),
        .generateHTML(withTheme: .portfolioSite),
        .deploy(using: .gitHub("eschos24/eschos24.github.io",
                               branch: "main",
                               useSSH: false))
    ])
