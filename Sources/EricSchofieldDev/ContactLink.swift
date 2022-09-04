//
//  ContactLink.swift
//  
//
//  Created by Eric Schofield on 8/22/22.
//

import Foundation

struct ContactLink {
    let title: String
    let url: String
    let icon: String
}

extension ContactLink {
    static var myLocation: ContactLink {
        return ContactLink(
            title: "Saratoga Springs, UT",
            url: "https://www.google.com/maps/place/Saratoga+Springs,+UT/@40.3442899,-111.9101301,12z/data=!3m1!4b1!4m5!3m4!1s0x874d7ec978bb7a97:0xc5493ac704ae8275!8m2!3d40.3301898!4d-111.9044877",
            icon: "fas fa-map-marker-alt")
    }


    //This is your email info
    static var email: ContactLink {
        return ContactLink(
            title: "Email",
            url: "mailto:contact@ericschofield.dev",
            icon: "fas fa-envelope-open-text")
    }

    //This is your LinkedIn page info
    static var linkedIn: ContactLink {
        return ContactLink(
            title: "LinkedIn",
            url: "https://www.linkedin.com/in/eric-schofield/",
            icon: "fab fa-linkedin"
        )
    }

    //This is your Twitter page info
    static var twitter: ContactLink {
        return ContactLink(
            title: "Twitter",
            url: "https://twitter.com/eschos24",
            icon: "fab fa-twitter-square"
        )
    }

    //This is your GitHub page info
    static var gitHub: ContactLink {
        return ContactLink(
            title: "GitHub",
            url: "https://github.com/eschos24/",
            icon: "fa-brands fa-square-github"
        )
    }
}
