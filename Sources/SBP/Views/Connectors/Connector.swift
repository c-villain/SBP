import SwiftUI

@available(iOS 13, *)
public protocol Connector: View {
    associatedtype Content: View
    func map() -> Content
}

@available(iOS 13, *)
extension Connector {
    public var body: some View {
        Connected<Content>(map: map)
    }
}

@available(iOS 13, *)
fileprivate struct Connected<V: View>: View {

    let map: () -> V
    
    public var body: V {
        map()
    }
}
