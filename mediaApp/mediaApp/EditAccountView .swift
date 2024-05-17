//
//  EditAccountView .swift
//  mediaApp
//
//  Created by StudentAM on 5/15/24.
//

import SwiftUI

struct EditAccountView: View {
    @Binding var isEditAccountPresented: Bool
    @ObservedObject var profileModel: ProfileModel
    @State private var showImagePicker: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Username", text: $profileModel.username)
                    TextField("Display Name", text: $profileModel.displayName)
                    TextField("Nickname", text: $profileModel.nickname)
                }

                Section {
                    if let profileImage = profileModel.profileImage {
                        Image(uiImage: profileImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding()
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding()
                    }

                    Button("Change Profile Picture") {
                        showImagePicker = true
                    }
                }

                Section {
                    Button("Save Changes") {
                        isEditAccountPresented = false
                    }
                    .foregroundColor(.blue)
                }
            }
            .navigationBarTitle("Edit Account", displayMode: .inline)
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $profileModel.profileImage)
            }
        }
    }
}




#Preview {
    ContentView()
}
