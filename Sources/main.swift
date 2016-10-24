import Kitura
import KituraMustache
import Foundation

// Create a new router
let router = Router()
router.add(templateEngine: MustacheTemplateEngine())

// Handle HTTP GET requests to /
router.get("/") { request, response, next in
    defer {
        next()
    }
    
    // Let template format dates with ``
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    
    // the example from https://github.com/groue/GRMustache.swift/blob/master/README.md
    var context: [String: Any] = [
        "name": "Arthur",
        "date": Date(),
        "realDate": Date().addingTimeInterval(60*60*24*3),
        "late": true,
        "format": dateFormatter
    ]
    
    try response.render("document.mustache", context: context).end()
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8090, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()
