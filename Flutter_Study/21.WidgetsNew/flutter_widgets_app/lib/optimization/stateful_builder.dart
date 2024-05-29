import 'package:flutter/material.dart';



//Используйте StatefulBuilder, когда вам нужен доступ к setState этого поддерева.
// Это перестроит только StatefulBuilder с его поддеревом.



// StatelessWidget is used here
class StBuilder extends StatelessWidget {
  const StBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This is the number shown in the red circle
    // It represents state and stays outside the builder function
    int count = 0;
    return Scaffold(
      appBar: AppBar(title: const Text('KindaCode.com')),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          // Implement StatefulBuilder
          child: StatefulBuilder(
            builder: (context, setInnerState) => Column(
              children: [
                Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  child: Center(
                    // Display the number
                    child: Text(
                      count.toString(),
                      style: const TextStyle(fontSize: 80, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // This button is used to crease the number
                ElevatedButton.icon(
                    onPressed: () {
                      // Call setInnerState function
                      setInnerState(() => count++);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Increase By One')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}