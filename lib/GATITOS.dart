// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  await fetchCatData();
  print('¡GATITOSSSSS GATITOS DEL API ATRAPADOS CORRECTAMENTE!.');
}

Future<void> fetchCatData() async {
  const apiKey =
      'live_Wq534oyC4L5FDzIXfAkYvywRR5m6RAHyNS6lB2RW0uhrRtIVxAzbLGmo4sazZBS6';
  const apiUrl = 'https://api.thecatapi.com/v1/breeds';

  final response = await http.get(Uri.parse(apiUrl), headers: {
    'x-api-key': apiKey,
  });

  /// const apiKey,apiUrl = almacena  la clave api y la otra contiene el url por el cual se realiza la solicitud
  /// await htttp.get,headers = el primero realiza la solicitud get usando el url y el api/ el segundo tiene que ver con el formato de autenticacion

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    for (var cat in jsonData) {
      print('Nombre: ${cat['name']}');
      print('Origen: ${cat['origin']}');
      print('Descripción: ${cat['description']}');
      print('-----------------------------------');
    }
  } else {
    print('Error al consultar los datos de gatos.');
  }
}
