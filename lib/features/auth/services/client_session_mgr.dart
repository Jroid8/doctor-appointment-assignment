import 'package:doctor_appointment/common/models/active_session.dart';
import 'package:doctor_appointment/common/repos/localdb.dart';
import 'package:doctor_appointment/features/auth/repos/server.dart';
import 'package:drift/drift.dart';

class ClientSessionManager {
  final LocalDB _localdb;
  final AuthServerRepo authServer;

  ActiveSession? _session;
  bool localLoaded = false;

  ClientSessionManager(this._localdb, this.authServer);

  Future<ActiveSession?> loadLocal() async {
    if (!localLoaded) {
      List<ClientSessionTblData> query = await _localdb.clientSessionTbl
          .select()
          .get();
      if (query.isNotEmpty) {
        ActiveSession cachedSession = ActiveSession.fromLocalTable(query.first);
        if (await authServer.isValid(cachedSession.token)) {
          _session = cachedSession;
        }
      }
      localLoaded = true;
    }
    return _session;
  }

  Future<void> _saveLocal() async {
    if (_session != null) {
      await _localdb.clientSessionTbl.delete().go();
      await _localdb.clientSessionTbl.insertOne(_session!.toLocalTable());
    }
  }

  Future<ActiveSession?> login({
    required String email,
    required String password,
  }) async {
    _session = await authServer.login(email, password);
    _saveLocal();
    return _session;
  }

  Future<ActiveSession> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    _session = await authServer.signup(
      name: name,
      email: email,
      password: password,
    );
    _saveLocal();
    return _session!;
  }

  Future<void> logout() async {
    if (_session != null) {
      await authServer.logout(_session!.token);
			_session = null;
    }
		await _localdb.clientSessionTbl.delete().go();
  }

  ActiveSession? get session => _session;
}
