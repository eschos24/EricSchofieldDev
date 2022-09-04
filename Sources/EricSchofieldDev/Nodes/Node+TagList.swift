//
//  Node+TagList.swift
//  
//
//  Created by Eric Schofield on 8/22/22.
//

import Plot
import Publish

extension Node where Context == HTML.BodyContext {

    static func tagList(for tags: [Tag], on site: PortfolioSite) -> Node {
        .div(
            .class("post-tags"),
            .forEach(tags, { tag in
                    .a(
                        .class("post-category post-category-\(tag.string.lowercased())"),
                        .href(site.path(for: tag)),
                        .text(tag.string)
                    )
            })
        )
    }

    static func tagList(for item: Item<PortfolioSite>, on site: PortfolioSite) -> Node {
        .tagList(for: item.tags, on: site)
    }

    static func tagList(for page: TagListPage, on site: PortfolioSite) -> Node {
        .tagList(for: Array(page.tags), on: site)
    }
}
