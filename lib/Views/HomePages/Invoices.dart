import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Utils/mycustomappbar.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';

class Invoices extends StatelessWidget {
  const Invoices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppbar(title: "Daily Entry", centerTitle: true),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),

        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          DataText(text: "Invoice No.1223", fontSize: 15),
                          DataText(text: "From", fontSize: 15),
                          DataText(
                            text:
                                "Meshwo Petroleum,\n"
                                "S G Highway,\n"
                                "Near Isckon Bridge,\n"
                                "Ahmedabad - 389765",
                            fontSize: 15,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          DataText(text: "Date-23/08/2025", fontSize: 15),
                          DataText(text: "From", fontSize: 15),
                          DataText(
                            text:
                            "Meshwo Petroleum,\n"
                                "S G Highway,\n"
                                "Near Isckon Bridge,\n"
                                "Ahmedabad - 389765",
                            fontSize: 15,
                          ),
                        ],
                      ),
                    ],
                  );


                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
