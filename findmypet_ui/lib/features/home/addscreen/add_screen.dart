import 'package:findmypet/controllers/pet_controller.dart';
import 'package:findmypet/core/appcolor/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({super.key});

  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(LostPetController());

  String name = '';
  String species = '';
  String breed = '';
  String color = '';
  String gender = '';
  String lastSeenLocation = '';
  String lastSeenDate = '';
  String photoUrl = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.12),
                    Text(
                      "Add Lost Pet",
                      style: TextStyle(
                        fontSize: size.width * 0.07,
                        color: CAppColors.primaryColor,
                        fontFamily: "almendra",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          buildInput("Name", (val) => name = val),
                          buildInput("Species", (val) => species = val),
                          buildInput("Breed", (val) => breed = val),
                          buildInput("Color", (val) => color = val),
                          buildInput("Gender", (val) => gender = val),
                          buildInput(
                            "Last Seen Location",
                            (val) => lastSeenLocation = val,
                          ),
                          buildInput(
                            "Last Seen Date (YYYY-MM-DD)",
                            (val) => lastSeenDate = val,
                          ),
                          buildInput("Photo URL", (val) => photoUrl = val),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: CAppColors.buttonColor,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  try {
                                    controller.addlostpet({
                                      "name": name,
                                      "species": species,
                                      "breed": breed,
                                      "color": color,
                                      "gender": gender,
                                      "lastSeenLocation": lastSeenLocation,
                                      "lastSeenDate": lastSeenDate,
                                      "photoUrl": photoUrl,
                                    });
                                    Get.snackbar(
                                      "Successfull",
                                      controller.message ??
                                          "Pet submitted successfully",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.green,
                                      colorText: Colors.white,
                                    );
                                  } catch (e) {
                                    print(e);
                                    Get.snackbar(
                                      "failed",
                                      controller.message ??
                                          "Pet submittion failed",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                    );
                                  }
                                }
                              },

                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  fontSize: size.width * 0.04,
                                  fontFamily: "almendra",
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }

  Widget buildInput(String label, Function(String) onSaved) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: TextStyle(
                fontSize: size.width * 0.04,
                color: CAppColors.buttonColor,
                fontFamily: "almendra",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 6),
          TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: CAppColors.buttonColor),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: CAppColors.buttonColor),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: CAppColors.buttonColor),
              ),
              hintText: label,
              hintStyle: TextStyle(fontSize: size.width * 0.035),
            ),
            validator: (value) =>
                value == null || value.isEmpty ? "Enter $label" : null,
            onSaved: (value) => onSaved(value!),
          ),
        ],
      ),
    );
  }
}
