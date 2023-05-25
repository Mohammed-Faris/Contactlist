class UserModel {
  final String id;
  final String name;
  final String contacts;
  String? url;

  UserModel(
      {required this.id, required this.name, required this.contacts, this.url});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'] ?? 'First Name',
        contacts: json['Contacts'] ?? '7904696681',
        url: json['url']);
  }
}
