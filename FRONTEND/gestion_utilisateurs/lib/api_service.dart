import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiService {
final String baseUrl = 'http://172.16.198.254:3000/api'; // A configurer
Future<List<dynamic>> fetchUtilisateurs() async {
	final url = Uri.parse('$baseUrl/utilisateurs');
	final response = await http.get(url);

	if (response.statusCode == 200) {
		// Parse JSON and return list
		final decoded = json.decode(response.body);
		if (decoded is List) {
			return decoded;
		} else if (decoded is Map && decoded.containsKey('data')) {
			// Accept responses wrapped in { data: [...] }
			return decoded['data'] as List<dynamic>;
		} else {
			// If the API returns a single object, wrap it
			return [decoded];
		}
	} else {
		throw Exception('Échec du chargement des utilisateurs: ${response.statusCode}');
	}
}
Future<Map<String, dynamic>> addUtilisateur(String nom, String email, int telephone) async {
	final url = Uri.parse('$baseUrl/utilisateurs');
	final body = json.encode({
		'nom': nom,
		'email': email,
		'telephone': telephone.toString()
	});
	final response = await http.post(
		url,
		headers: {'Content-Type': 'application/json'},
		body: body,
	);

	final Map<String, dynamic> decoded = json.decode(response.body);
	
	if (response.statusCode == 200 || response.statusCode == 201) {
		return {'success': true, 'data': decoded};
	} else {
		return {
			'success': false,
			'status': decoded['status'],
			'messages': decoded['messages'] as List<dynamic>,
			'notification': decoded['notification'] ?? false
		};
	}
}

}