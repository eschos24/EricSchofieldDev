//
//  Node+Header.swift
//  
//
//  Created by Eric Schofield on 8/22/22.
//

import Plot

extension Node where Context == HTML.BodyContext {
    
    private static let sections: [PortfolioSite.SectionID] = [.posts, .about, .apps]
    
    static func header(for site: PortfolioSite) -> Node {
        return .div(
            .class("pure-menu pure-menu-horizontal pure-u-1-1 top-header"),
            .a(
                .class("pure-menu-heading"),
                .text(site.name),
                .href("/")
            ),
            .ul(
                .class("pure-menu-list"),
                .forEach(sections, { section in
                        .li(
                            .class("pure-menu-item"),
                            .a(
                                .class("pure-menu-link"),
                                .text(section.rawValue.capitalized),
                                .href(site.path(for: section))
                            )
                        )
                })
            )
        )
    }
}
