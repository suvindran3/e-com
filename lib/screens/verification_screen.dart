import 'package:ecom/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key}) : super(key: key);

  final List<FocusNode> textFieldNodes = List.generate(
    4,
    (index) => FocusNode(),
  );
  final List<FocusNode> keyboardNodes = List.generate(
    4,
    (index) => FocusNode(),
  );
  final List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffFA5365),
                  Color(0xffF74462),
                  Color(0xffF7366B),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 380,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: SizedBox(
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: Text(
                                  'OTP VERIFICATION',
                                  style: GoogleFonts.nunito(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xffF94663),
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'OTP has been sent to 8668190452'.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ptSans(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 70,
                        child: Row(
                          children: List.generate(
                            4,
                            (index) => Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: RawKeyboardListener(
                                  focusNode: keyboardNodes[index],
                                  onKey: (event) {
                                    if (event is RawKeyDownEvent &&
                                        controllers[index].text.isEmpty &&
                                        event.logicalKey ==
                                            LogicalKeyboardKey.backspace &&
                                        index > 0) {
                                      textFieldNodes[index - 1].requestFocus();
                                    }
                                  },
                                  child: TextFormField(
                                    controller: controllers[index],
                                    focusNode: textFieldNodes[index],
                                    textAlign: TextAlign.center,
                                    cursorColor: Colors.grey,
                                    keyboardType: TextInputType.phone,
                                    style: GoogleFonts.ptSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    onChanged: (input) {
                                      if (index + 1 == textFieldNodes.length &&
                                          input.isNotEmpty) {
                                        textFieldNodes[index].unfocus();
                                      } else if (input.isNotEmpty) {
                                        textFieldNodes[index + 1]
                                            .requestFocus();
                                      }
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xffF5F5F7),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 0.5,
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 0.5,
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: SizedBox(
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color(0xffF7366B),
                                  ),
                                  fixedSize: MaterialStateProperty.all(
                                    const Size(250, 50),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'VERIFY OTP',
                                  style: GoogleFonts.josefinSans(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  '00:30 Resend OTP',
                                  style: GoogleFonts.ptSans(
                                    letterSpacing: 1.1,
                                    color: const Color(0xff99A1B1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
