import SwiftUI

@available(iOS 13, *)
public struct AsyncImage: View {
    
    @ObservedObject private var loader: ImageLoader
    public let url: URL?
    
    private var placeholder: AnyView? = AnyView(Color.clear)
    
    private var configurations: [(Image) -> Image] = []

    public init(_ url: URL?, cache: ImageCache?) {
        self.url = url
        loader = ImageLoader(url: url, cache: cache)
        loader.load()
    }
    
    public init(_ urlString: String?, cache: ImageCache?) {
        self.url = URL(string: urlString?.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? "")
        loader = ImageLoader(url: url, cache: cache)
        loader.load()
    }
    
    public init(_ url: URL?) {
        self.url = url
        loader = ImageLoader(url: url, cache: TemporaryImageCache())
        loader.load()
    }
    
    public init(_ urlString: String?) {
        self.url = URL(string: urlString?.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? "")
        loader = ImageLoader(url: url, cache: TemporaryImageCache())
        loader.load()
    }
    
    public func configure(_ block: @escaping (Image) -> Image) -> AsyncImage {
        var result = self
        result.configurations.append(block)
        return result
    }
    
    // пример выноса часто используемых функций (можно выносить в отдельные функции чтобы не делать все в configure)
    public func resizable() -> AsyncImage {
        configure { $0.resizable() }
    }
    
    public func renderingMode(_ mode: Image.TemplateRenderingMode) -> AsyncImage {
        configure { $0.renderingMode(mode) }
    }
    
    public func placeholder<Content: View>(@ViewBuilder _ content: () -> Content) -> AsyncImage {
        let v = content()
        var result = self
        result.placeholder = AnyView(v)
        return result
    }
    
    public var body: some View {
        Group {
            if loader.image != nil {
                configurations
                    .reduce(Image(uiImage: loader.image ?? UIImage()).renderingMode(.original)) {
                        current, config in config(current)
                    }
            } else {
                placeholder
            }
        }
        .onAppear(perform: loader.load)
        .onDisappear(perform: loader.cancel)
    }

}

@available(iOS 13, *)
struct AsyncImage_Previews: PreviewProvider {
    @Environment(\.imageCache) static var cache: ImageCache
    
    static var previews: some View {
        Group {
            AsyncImage(URL(string: "https://experience-ireland.s3.amazonaws.com/thumbs2/d07258d8-4274-11e9-9c68-02b782d69cda.800x600.jpg")!, cache: Self.cache)
                .placeholder {
                    Text("Loading ...")
                }
                .resizable()
                .scaledToFill()
                .frame(width: 104, height: 144)
                .clipped()
            
            AsyncImage(URL(string: "https://experience-ireland.s3.amazonaws.com/thumbs2/d07258d8-4274-11e9-9c68-02b782d69cda.800x600.jpg")!)
                .placeholder {
                    Text("Loading ...")
                }
                .resizable()
                .scaledToFill()
                .frame(width: 104, height: 144)
                .clipped()
        }.previewLayout(.sizeThatFits)
    }
}
