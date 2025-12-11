import 'package:findmypet/data/pet_model.dart';
import 'package:findmypet/domain/pet_services.dart';
import 'package:get/get.dart';

class LostPetController extends GetxController {
  var pets = <PetModel>[].obs;
  final isLoading = false.obs;
  String? message;

  /// ADD THE LOST PET
  void addlostpet(Map<String, dynamic> payload) async {
    isLoading.value = true;
    update();
    try {
      final response = await PetServices.submitPet(payload);
      message = response;
      update();
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Failed to load pets");
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
