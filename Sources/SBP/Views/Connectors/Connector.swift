import SwiftUI

@available(iOS 13, *)
protocol Connector: View {
    associatedtype Content: View
    func map() -> Content
}

@available(iOS 13, *)
extension Connector {
    var body: some View {
        Connected<Content>(map: map)
    }
}

@available(iOS 13, *)
fileprivate struct Connected<V: View>: View {

    let map: () -> V
    
    var body: V {
        map()
    }
}
