import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey
                    .shade600, // Color.fromARGB(159, 249, 239, 239).withOpacity(0.04),
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
              height: MediaQuery.of(context).size.height * 0.6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: AspectRatio(
                      aspectRatio: 2 / 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          color: Colors.grey.shade600,
                        ),
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: AspectRatio(
                      aspectRatio: 2 / 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          color: Colors.grey.shade600,
                        ),
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
