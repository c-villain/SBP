import SwiftUI

protocol Connector: View {
    associatedtype Content: View
    func map() -> Content
}

extension Connector {
    var body: some View {
        Connected<Content>(map: map)
    }
}

fileprivate struct Connected<V: View>: View {

    let map: () -> V
    
    var body: V {
        map()
    }
}
