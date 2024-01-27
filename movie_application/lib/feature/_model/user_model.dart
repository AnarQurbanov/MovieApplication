class UserModel {
  final String id;
  final String email;
  //final String password;
  final String username;
  final List favoriteMovies;

  UserModel({
    required this.id,
    required this.email,
    //required this.password,
    required this.username,
    required this.favoriteMovies,
  });
}
