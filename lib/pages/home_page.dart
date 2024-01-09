import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(counter.toString(), style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: (){},
                  child: const Text('+'),
              ),
              ElevatedButton(
                  onPressed: (){},
                  child:  const Text('Clear'),
              ),
              ElevatedButton(
                onPressed: (){},
                child:  const Text('-'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
