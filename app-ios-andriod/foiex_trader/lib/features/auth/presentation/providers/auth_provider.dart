import 'package:flutter/foundation.dart';
import '../../data/models/auth_models.dart';
import '../../data/repositories/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepository _authRepository;
  UserProfile? _user;
  bool _isAuthenticated = false;

  AuthProvider(this._authRepository);

  bool get isAuthenticated => _isAuthenticated;
  UserProfile? get user => _user;

  Future<void> login(LoginDto loginDto) async {
    try {
      final response = await _authRepository.login(loginDto);
      _user = response.user;
      _isAuthenticated = true;
      notifyListeners();
    } catch (e) {
      _isAuthenticated = false;
      _user = null;
      rethrow;
    }
  }

  Future<void> register(RegisterDto registerDto) async {
    try {
      final response = await _authRepository.register(registerDto);
      _user = response.user;
      _isAuthenticated = true;
      notifyListeners();
    } catch (e) {
      _isAuthenticated = false;
      _user = null;
      rethrow;
    }
  }

  Future<void> logout() async {
    await _authRepository.logout();
    _user = null;
    _isAuthenticated = false;
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    try {
      _user = await _authRepository.getUserProfile();
      _isAuthenticated = true;
      notifyListeners();
    } catch (e) {
      _isAuthenticated = false;
      _user = null;
      notifyListeners();
    }
  }
}
