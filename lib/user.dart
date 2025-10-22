// Parent class
class User {
  String username;

  User(this.username);

  // method bisa dioverride
  String welcomeMessage() {
    return "Selamat datang, $username!";
  }
}

// Child class (extends)
class PremiumUser extends User {
  PremiumUser(super.username);

  @override
  String welcomeMessage() {
    return "Halo $username, kamu adalah Premium User 🚀";
  }
}
