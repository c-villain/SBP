import SwiftUI

@available(iOS 13, *)
struct SearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        TextField("Введите название банка", text: $text)
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
    return SearchBar(text: .constant(""))
        .padding(10.0)
}
