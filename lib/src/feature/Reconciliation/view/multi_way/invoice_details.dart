import 'package:firestore/src/res/strings.dart';
import 'package:firestore/src/utils/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InvoiceDetails extends StatefulWidget {
  const InvoiceDetails({super.key});

  @override
  State<InvoiceDetails> createState() => _InvoiceDetailsState();
}

TextEditingController date = TextEditingController();

class _InvoiceDetailsState extends State<InvoiceDetails> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final texttheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(width: 0.0, height: height * .01),
              Center(
                child: Container(
                    height: height * .07,
                    width: width,
                    margin:
                        EdgeInsets.only(left: width * .05, right: width * .05),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(height * .02),
                        color: greencolor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width * .04),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  context.pop();
                                },
                                child: const Icon(
                                  CupertinoIcons.left_chevron,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: width * .03, height: 0.0),
                              Text(
                                'Reconciliation',
                                style: texttheme.titleMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(width: 0.0, height: height * .04),
              Padding(
                padding: EdgeInsets.only(left: width * .07),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Multi-way Reconciliation',
                    style: texttheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * .07, top: height * .03),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Step 4: Enter Invoice Details',
                    style: texttheme.labelLarge
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              // TInvoice Number*
              Padding(
                padding: EdgeInsets.only(
                    left: width * .06, right: width * .06, top: height * .02),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: width * .01),
                        child: const Row(
                          children: [
                            Text('Invoice Number'),
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),
              // Transaction ID*
              Padding(
                padding: EdgeInsets.only(
                    left: width * .06, right: width * .06, top: height * .02),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: width * .01),
                        child: const Row(
                          children: [
                            Text('Transaction ID'),
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),
              //Transaction Type*
              Padding(
                padding: EdgeInsets.only(
                    left: width * .06, right: width * .06, top: height * .02),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: width * .01),
                        child: const Row(
                          children: [
                            Text('Transaction Type'),
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),
              // Date*
              Padding(
                padding: EdgeInsets.only(
                    left: width * .06, right: width * .06, top: height * .02),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: width * .01),
                        child: const Row(
                          children: [
                            Text('Date'),
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextField(
                      controller: date,
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now()
                                    .subtract(const Duration(days: 365)),
                                lastDate: DateTime.now())
                            .then((value) {
                          if (value == null) return;
                          setState(() {
                            final String updatedate =
                                "${value.day}-${value.month}-${value.year}";
                            date.text = updatedate;
                          });
                        });
                      },
                      readOnly: true,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),
              //Amount
              Padding(
                padding: EdgeInsets.only(
                    left: width * .06, right: width * .06, top: height * .02),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: width * .01),
                        child: const Row(
                          children: [
                            Text('Amount'),
                            Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),

              //two button
              SizedBox(width: 0.0, height: height * .03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Button.button("Save", () {
                    context.pushNamed('/account_balance');
                  }, height, width * .8),
                  Button.button("Add Another", () {}, height, width * .8),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
