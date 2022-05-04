import 'package:flutter/material.dart';
import 'charging_result.dart';
import 'component.dart';

class ChargingScreen extends StatefulWidget {
  const ChargingScreen({Key? key}) : super(key: key);
  @override
  _ChargingScreenState createState() => _ChargingScreenState();
}

class _ChargingScreenState extends State<ChargingScreen> {
  TextEditingController amountController = TextEditingController();
  var value;
  late double charge;
  late double pound;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أشحن بكام؟'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'أدخل قيمة الشحن',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultFormField(
                  suffixIcon: Icons.mobile_friendly_outlined,
                  controller: amountController,
                  type: const TextInputType.numberWithOptions(decimal: true),
                  label: 'القيمة',
                  validator: null,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 200,
                  color: Colors.blue,
                  child: TextButton(
                      onPressed: () {
                        value = amountController.text;
                        value = double.parse(value);
                        charge = value * (70 / 100);
                        pound = value * 100 / 70;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChargingResult(
                                value: value.toString(),
                                pound: pound,
                                charge: charge),
                          ),
                        );
                        //amountController.text=charge.toString();
                      },
                      child: const Text(
                        'احسب',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
