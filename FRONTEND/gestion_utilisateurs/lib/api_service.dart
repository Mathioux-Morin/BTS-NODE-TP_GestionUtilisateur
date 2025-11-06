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
Future<void> addUtilisateur(String nom, String email, int telephone) async {
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

	if (response.statusCode == 200 || response.statusCode == 201) {
		return;
	} else {
		// Try to include server message if present
		String message = '';
		try {
			final decoded = json.decode(response.body);
			if (decoded is Map && decoded.containsKey('message')) message = ': ${decoded['message']}';
		} catch (_) {}
		throw Exception('Échec de l\'ajout de l\'utilisateur (${response.statusCode})$message');
	}
}

}