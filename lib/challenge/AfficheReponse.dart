import "package:flutter/material.dart";

class AfficheReponse extends StatelessWidget {
  final List<Map<String, Object>> reponse;

  const AfficheReponse(this.reponse, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Cette boîte fixe la hauteur de votre zone de défilement à 150 pixels
        SizedBox(
          height: 400,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...reponse.map((element) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            element["question_pose"] as String,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                '${(element["question_index"] as int) + 1}. ',
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  element["question_reponse"] as String,
                                  style: const TextStyle(color: Colors.white70),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }), // Fin du map
              ],
            ),
          ),
        ),

        // 2. L'espace entre la liste scrollable et votre bouton
      ],
    );
  }
}
