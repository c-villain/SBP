import SwiftUI

@available(iOS 13, *)
struct Skeleton: View {
    
    var body: some View {
        VStack(spacing: 15) {
            Rectangle()
                .fill(Color.Background.lightFon)
                .frame(height: 25)
                .frame(maxWidth: .infinity)
                .cornerRadius(Constants.Images.small)
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 8) {
                    ForEach(0...10, id: \.self) { _ in
                        HStack(spacing: 10) {
                            Rectangle()
                                .fill(Color.Background.secondary)
                                .frame(width: 50, height: 50)
                                .cornerRadius(Constants.Images.defaults)
                            
                            Rectangle()
                                .fill(Color.Background.secondary)
                                .frame(width: 150, height: 18)
                            Spacer()
                        }
                        .padding(.horizontal, 10)
                        .frame(height: Constants.Buttons.height)
                        .background(Color.Background.lightFon)
                        .cornerRadius(Constants.Images.defaults)
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 48)
    }
}

@available(iOS 13, *)
struct Skeleton_preview: PreviewProvider {
    static var previews: some View {
        Group {
            Skeleton()
            
            Skeleton()
                .preferredColorScheme(.dark)
        }
    }
}
