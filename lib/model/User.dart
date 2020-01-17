class User {
  // to delete once we have a db
  static User fakeConnectedUser() => User(
    displayName: "lucas galliot",
    uuid: "a",
    username: "galliotl",
    phone: "06.32.90.56.08",
    imagePath: "http://store.mdcgate.com/market/assets/image/icon_user_default.png",
    password: "321clucas",
  );

  String uuid;
  String username;
  String phone;
  String displayName;
  String password;
  String imagePath;

  User(
      {this.uuid,
      this.username,
      this.displayName,
      this.phone,
      this.password,
      this.imagePath});
}
