import SwiftUI
import Combine

@available(iOS 13, *)
class TextFieldObserver : ObservableObject {
    @Published var debouncedText = ""
    @Published var searchText = ""
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        $searchText
            .debounce(for: .seconds(0.4), scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] t in
                self?.debouncedText = t
            } )
            .store(in: &subscriptions)
    }
}

@available(iOS 13, *)
struct SearchBar: View {
    
    @ObservedObject var textObserver: TextFieldObserver
    
    var body: some View {
        TextField(Strings.enterBankTitle, text: $textObserver.searchText)
            .font(.spb(.regular, size: 18))
            .padding(16.0)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.Background.lightFon)
            )
    }
}

@available(iOS 13, *)
#Preview {
    registerFonts()
    return SearchBar(textObserver: TextFieldObserver())
        .padding(10.0)
}
