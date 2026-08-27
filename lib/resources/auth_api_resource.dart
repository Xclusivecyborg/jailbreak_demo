class SampleUser {
  const SampleUser({
    required this.id,
    required this.username,
    required this.email,
  });

  final String id;
  final String username;
  final String email;
}

class AuthApiResource {
  Future<SampleUser> login({
    required String username,
    required String password,
  }) async {
    // Simulate a network request delay.
    await Future<void>.delayed(const Duration(milliseconds: 800));

    return SampleUser(
      id: 'user-001',
      username: username,
      email: '$username@example.com',
    );
  }
}
