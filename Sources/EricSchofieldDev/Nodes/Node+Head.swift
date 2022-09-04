//
//  Node+Head.swift
//  
//
//  Created by Eric Schofield on 8/22/22.
//

import Plot
import Publish

extension Node where Context == HTML.DocumentContext {

    static func head(for location: Location, on site: PortfolioSite) -> Node {
        var description = location.description

        if description.isEmpty {
            description = site.description
        }
        
        return .head(
            .encoding(.utf8),
            .siteName(site.name),
            .url(site.url(for: location)),
            .title(location.title),
            .description(description),
            .twitterCardType(location.imagePath == nil ? .summary : .summaryLargeImage),
            .link(
                .rel(.stylesheet),
                .href("https://unpkg.com/purecss@2.1.0/build/pure-min.css"),
                .init(name: "integrity", value: "sha384-yHIFVG6ClnONEA5yB5DJXfW2/KC173DIQrYoZMEtBvGzmf0PKiGyNEqe9N6BNDBH"),
                .init(name: "crossorigin", value: "anonymous")
            ),
//            .link(
//                .rel(.stylesheet),
//                .href("https://unpkg.com/purecss@2.1.0/build/grids-responsive-min.css")
//            ),
            .stylesheet("/PortfolioTheme/styles.css"),
//            .stylesheet("/Pure/styles.css"),
//            .stylesheet("/css/all.css"),
            .viewport(.accordingToDevice),
            .unwrap(site.favicon, { .favicon($0) }),
            .unwrap(location.imagePath ?? site.imagePath, { path in
                let url = site.url(for: path)
                return .socialImageLink(url)
            }),
            .meta(
                .charset(.utf8),
                .name("viewport"),
                .content("width=device-width, initial-scale=1")
            )
        )
    }
}
