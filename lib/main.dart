import 'package:chapa_unofficial/chapa_unofficial.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());

  // setup chapa
  Chapa.configure(privateKey: "CHAPUBK_TEST-XSyCaIYmnk5OgBsanzIAgUAlbT4pCQkz");
  // Chapa.configure(privateKey: "CHAPUBK_TEST-GzbYVqxNhbsNxR2dMpdzAQQZDw4GLccC");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Payment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final int _counter = 0;

  // Future<void> verify() async {
  //   Map<String, dynamic> verificationResult =
  //       await Chapa.getInstance.verifyPayment(
  //     txRef: TxRefRandomGenerator.gettxRef,
  //   );
  //   if (kDebugMode) {
  //     print(verificationResult);
  //   }
  // }

  // Future<void> pay() async {
  //   try {
  //     // Generate a random transaction reference with a custom prefix
  //     String txRef = TxRefRandomGenerator.generate(prefix: 'linat');

  //     // Access the generated transaction reference
  //     String storedTxRef = TxRefRandomGenerator.gettxRef;

  //     // Print the generated transaction reference and the stored transaction reference
  //     if (kDebugMode) {
  //       print('Generated TxRef: $txRef');
  //       print('Stored TxRef: $storedTxRef');
  //     }
  //     await Chapa.getInstance.startPayment(
  //       context: context,
  //       onInAppPaymentSuccess: (successMsg) {
  //         // Handle success events
  //       },
  //       onInAppPaymentError: (errorMsg) {
  //         // Handle error
  //       },
  //       amount: '1000',
  //       currency: 'ETB',
  //       txRef: storedTxRef,
  //     );
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }
  // }

  Future<void> payOne() async {
    String? paymentUrl = await Chapa.getInstance.startPayment(
      // enableInAppPayment: false,
      context: context,
      onInAppPaymentSuccess: (successMsg) {
        // handle success events
      },
      onInAppPaymentError: (errorMsg) {
        //handle error
      },
      amount: '1000',
      currency: 'ETB',
      txRef: 'GENERATED_TRANSACTION_REFERENCE',
    );
    print(paymentUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Linat's payment"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'pay to linat416',
            ),
            TextButton(
                onPressed: () async {
                  await payOne();
                },
                child: const Text("Pay")),
            // TextButton(
            //     onPressed: () async {
            //       await verify();
            //     },
            //     child: const Text("Verify")),
          ],
        ),
      ),
    );
  }
}
