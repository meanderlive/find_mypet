import 'package:dio/dio.dart';
import 'package:findmypet/controllers/user_controller.dart';
import 'package:findmypet/core/constant/application_properties.dart';
import 'package:findmypet/data/pet_model.dart';
import 'package:get/get.dart';

class PetServices {
  static final user = Get.find<UserController>();
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  static Future<List<PetModel>> getAllPet() async {
    try {
      final response = await dio.get("/api/pets");
      print("Response: ${response.data}");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final List<dynamic> data = response.data;
        final List<PetModel> pets = data
            .map((pet) => PetModel.fromMap(pet))
            .toList();
        print(pets);
        return pets;
      } else {
        throw Exception('Failed to load pets');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  /// add lost pet query
  static Future<String> submitPet(Map<String, dynamic> payload) async {
    try {
      print('Authorization ${user.tokenType} ${user.token}');
      final response = await Dio(
        BaseOptions(
          baseUrl: AppConfig.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 15),
          headers: {
            'Authorization': '${user.tokenType} ${user.token}',
            'Content-Type': 'application/json',
          },
        ),
      ).post('/api/pets', data: payload);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return "Pet submitted successfully";
      } else {
        throw Exception('Failed to submit pet');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  /// my lost pet post
  static Future<List<PetModel>> mylostpet() async {
    try {
      print('Authorization ${user.tokenType} ${user.token}');
      final response = await Dio(
        BaseOptions(
          baseUrl: AppConfig.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 15),
          headers: {
            'Authorization': '${user.tokenType} ${user.token}',
            'Content-Type': 'application/json',
          },
        ),
      ).get('/api/users/me/pets');
      print(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final List<dynamic> data = response.data;
        final List<PetModel> pets = data
            .map((pet) => PetModel.fromMap(pet))
            .toList();
        return pets;
      } else {
        throw Exception('Failed to submit pet');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
