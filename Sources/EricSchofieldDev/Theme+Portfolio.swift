//
//  PortfolioThemeHTMLFactory.swift
//  
//
//  Created by Eric Schofield on 8/22/22.
//

import Foundation
import Plot
import Publish

extension Theme where Site == PortfolioSite {
    static var portfolioSite: Self {
        Theme(htmlFactory: PortfolioHTMLFactory())
    }
}

struct PortfolioHTMLFactory: HTMLFactory {

    func makeIndexHTML(for index: Index, context: PublishingContext<PortfolioSite>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: index, on: context.site),
            .body {
//                PortfolioHeader(context: context)
                Wrapper {
                    Wrapper(index.body)
//                    H1(index.title)
//                    Paragraph(context.site.description)
//                        .class("description")
//                    H1("Coming Soon")
//                    ItemList(
//                        items: context.allItems(
//                            sortedBy: \.date,
//                            order: .descending
//                        ),
//                        site: context.site
//                    )
                }
                PortfolioSiteFooter()
            }
        )
    }

    func makeSectionHTML(for section: Section<PortfolioSite>, context: PublishingContext<PortfolioSite>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: section, on: context.site),
            .body {
//                PortfolioHeader(context: context)
                Wrapper {
                    H1(section.title)
                    ItemList(items: section.items, site: context.site)
                }
                PortfolioSiteFooter()
            }
//                .body(
//                    .grid(
//                        .header(for: context.site),
//                        .sidebar(for: context.site),
//                        .pageContent(.h1(.text(section.title))),
//                        .footer(for: context.site)
//                    )
//                )
        )

    }

    func makeItemHTML(for item: Item<PortfolioSite>, context: PublishingContext<PortfolioSite>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: item, on: context.site),
            .body(
                .class("item-page"),
                .components {
//                    PortfolioHeader(context: context)
                    Wrapper {
                        Article {
                            Div(item.content.body)
                                .class("content")
                            Span("Tagged with: ")
                            ItemTagList(item: item, site: context.site)
                        }
                    }
                    PortfolioSiteFooter()
                }
            )
//            .body(
//                .grid(
//                    .header(for: context.site),
//                    .sidebar(for: context.site),
//                    .post(for: item, on: context.site),
//                    .footer(for: context.site)
//                )
//            )
        )
    }

    func makePageHTML(for page: Page, context: PublishingContext<PortfolioSite>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body {
//                PortfolioHeader(context: context)
                Wrapper(page.body)
                PortfolioSiteFooter()
            }
//            .body(
//                .header(for: context.site),
//                .sidebar(for: context.site),
//                .page(for: page, on: context.site),
//                .footer(for: page, on: context.site)
//            )
        )
    }

    func makeTagListHTML(for page: TagListPage, context: PublishingContext<PortfolioSite>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body {
//                PortfolioHeader(context: context)
                Wrapper {
                    H1("Browse all tags")
                    List(page.tags.sorted()) { tag in
                        ListItem {
                            Link(tag.string, url: context.site.path(for: tag).absoluteString)
                        }
                        .class("tag")
                    }
                    .class("all-tags")
                }
                PortfolioSiteFooter()
            }
//            .body(
//                .grid(
//                    .header(for: context.site),
//                    .sidebar(for: context.site),
//                    .pageContent(
//                        .tagList(for: page, on: context.site)
//                    ),
//                    .footer(for: context.site)
//                )
//            )
        )
    }

    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<PortfolioSite>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body {
//                PortfolioHeader(context: context)
                Wrapper {
                    H1 {
                        Text("Tagged with ")
                        Span(page.tag.string)
                            .class("tag")
                    }

                    Link("Browse all tags", url: context.site.tagListPath.absoluteString)
                        .class("browse-all")

                    ItemList(
                        items: context.items(
                            taggedWith: page.tag,
                            sortedBy: \.date,
                            order: .descending
                        ),
                        site: context.site
                    )
                }
                PortfolioSiteFooter()
            }
//            .body(
//                .grid(
//                    .header(for: context.site),
//                    .sidebar(for: context.site),
//                    .posts(
//                        for: context.items(
//                            taggedWith: page.tag,
//                            sortedBy: \.date,
//                            order: .descending
//                        ),
//                        on: context.site,
//                        title: "\(page.tag.string.capitalized) posts"
//                    ),
//                    .footer(for: context.site)
//                )
//            )
        )
    }

}

// MARK: - Components

private struct Wrapper: ComponentContainer {
    @ComponentBuilder var content: ContentProvider

    var body: Component {
        Div(content: content).class("wrapper")
    }
}

private struct PortfolioHeader: Component {
    var context: PublishingContext<PortfolioSite>
    var selectedSelectionID: PortfolioSite.SectionID?

    var body: Component {
        Header {
            Wrapper {
                Link(context.site.name, url: "/")
                    .class("site-header")

                if PortfolioSite.SectionID.allCases.count > 1 {
                    navigation
                }
            }
        }
        .class("pure-menu pure-menu-horizontal pure-u-1-1 top-header")
    }

    private var navigation: Component {
        Navigation {
            List(PortfolioSite.SectionID.allCases) { sectionID in
                let section = context.sections[sectionID]

                return Link("\(section.title)",
                    url: section.path.absoluteString
                )
                .class(sectionID == selectedSelectionID ? "selected" : "")
            }
        }
    }
}

//private struct Sidebar: Component {
//    var site: PortfolioSite
//
//    var body: Component {
//        Wrapper {
//            Div {
//
//            }
//            .class("sidebar-header")
//        }
//        .class("sidebar pure-u-1 pure-u-md-1-4")
//    }
//}

private struct ItemList: Component {
    var items: [Item<PortfolioSite>]
    var site: PortfolioSite

    var body: Component {
        List(items) { item in
            Article {
                H1(Link(item.title, url: item.path.absoluteString))
                ItemTagList(item: item, site: site)
                Paragraph(item.description)
            }
        }
        .class("item-list")
    }
}

private struct ItemTagList: Component {
    var item: Item<PortfolioSite>
    var site: PortfolioSite

    var body: Component {
        List(item.tags) { tag in
            Link(tag.string, url: site.path(for: tag).absoluteString)
        }
        .class("tag-list")
    }
}

private struct PortfolioSiteFooter: Component {
    var body: Component {
        Footer {
            Paragraph {
                Text("© \(Calendar.current.component(.year, from: .now)) Eric Schofield ")
            }
            Paragraph {
                Text("Built in Swift using ")
                Link("Publish", url: "https://github.com/johnsundell/publish")
            }
            // TODO: Put this back when I add blog posts
//            Paragraph {
//                Link("RSS feed", url: "/feed.rss")
//            }
        }
    }
}
