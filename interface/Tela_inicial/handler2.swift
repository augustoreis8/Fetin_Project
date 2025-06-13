import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            HomeView()
        }
    }
}

struct HomeView: View {
    var body: some View {
        VStack(spacing: 40) {
            Image("logo") // Coloque sua logo no Assets.xcassets
                .resizable()
                .frame(width: 120, height: 120)
                .aspectRatio(contentMode: .fit)

            Text("Bem-vindo ao nosso aplicativo!")
                .font(.title)
                .foregroundColor(Color.blue)
                .multilineTextAlignment(.center)

            NavigationLink(destination: LoginView()) {
                Text("Iniciar")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct LoginView: View {
    var body: some View {
        VStack(spacing: 20) {
            NavigationLink(destination: RegisterView()) {
                Text("Criar nova conta")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            FaculdadeEmailSenhaFields()
        }
        .navigationTitle("Login")
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
        .padding()
    }
}

struct FaculdadeEmailSenhaFields: View {
    @State private var faculdade: String = ""
    @State private var email: String = ""
    @State private var senha: String = ""

    var body: some View {
        VStack(spacing: 16) {
            TextField("Faculdade", text: $faculdade)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Senha", text: $senha)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(.horizontal)
    }
}

struct RegisterView: View {
    @State private var nome: String = ""
    @State private var email: String = ""
    @State private var numero: String = ""
    @State private var faculdade: String = ""
    @State private var senha: String = ""
    @State private var confirmarSenha: String = ""

    var body: some View {
        VStack(spacing: 16) {
            TextField("Nome", text: $nome)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            TextField("Número", text: $numero)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.phonePad)

            TextField("Faculdade", text: $faculdade)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Senha", text: $senha)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Confirmar senha", text: $confirmarSenha)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Spacer().frame(height: 24)

            Button(action: {
                // TODO: lógica para criar conta
            }) {
                Text("Criar conta")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
        }
        .navigationTitle("Cadastro")
        .padding()
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}
