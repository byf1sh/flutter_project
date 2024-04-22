import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/features/auth/screens/message_screen.dart';
import 'package:flutter_project/features/auth/screens/profile_setting.dart';
import 'package:flutter_project/features/auth/screens/transaction_screen.dart';
import 'package:flutter_project/features/auth/screens/wishlist_screen.dart';
import 'package:flutter_project/features/auth/services/google_auth_service.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatefulWidget {
  static const String routeName = '/setting-page';
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String? firstname;
  String? lastname;
  String? email;
  final GoogleAuthService authService = GoogleAuthService();

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    await fetchUserData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Center(child: Text('Settings')),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                color: Color(0x00ffffff),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 220, 237, 255)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ProfileSetting.routeName);
                          },
                          child: Container(
                              margin: const EdgeInsets.only(left: 24),
                              height: 124,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF8F8F8),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  bottomLeft: Radius.circular(40),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: const AspectRatio(
                                        aspectRatio:
                                            1.0, // Mengatur aspect ratio menjadi 1:1 (persegi)
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/john.jpg'),
                                          fit: BoxFit
                                              .cover, // Atur agar gambar memenuhi ukuran persegi
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 18.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${firstname ?? 'Loading...'}',
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                              fontSize: 24,
                                              color: Colors.lightBlue[500],
                                              fontWeight: FontWeight.w800,
                                            )),
                                          ),
                                          Text(
                                            '${email ?? 'Loading...'}',
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                              fontSize: 14,
                                              color: Colors.lightBlue[400],
                                              fontWeight: FontWeight.w600,
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 32,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.lightBlue[500],
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Account',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        )),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 12),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, WishlistScreen.routeName);
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/images/wishlist.png'),
                              const SizedBox(width: 20),
                              Text(
                                'Wishlist',
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                )),
                              ),
                              Expanded(
                                  child: Container(
                                color: Colors.white10,
                              )),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black45,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 4, bottom: 12),
                        child: InkWell(
                          onTap: () {
                            //
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/images/wallet.png'),
                              const SizedBox(width: 20),
                              Text(
                                'Pay Account',
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                )),
                              ),
                              Expanded(
                                  child: Container(
                                color: Colors.white10,
                              )),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black45,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 4, bottom: 12),
                        child: InkWell(
                          onTap: () {
                            //
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/images/workcase.png'),
                              const SizedBox(width: 20),
                              Text(
                                'Change to Business Account',
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                )),
                              ),
                              Expanded(
                                  child: Container(
                                color: Colors.white10,
                              )),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black45,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 4, bottom: 12),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, MessageScreen.routeName);
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/images/inbox.png'),
                              const SizedBox(width: 20),
                              Text(
                                'Inbox',
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                )),
                              ),
                              Expanded(
                                  child: Container(
                                color: Colors.white10,
                              )),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black45,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 4, bottom: 12),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, TransactionScreen.routeName);
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/images/transaction.png'),
                              const SizedBox(width: 20),
                              Text(
                                'Transaction',
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                )),
                              ),
                              Expanded(
                                  child: Container(
                                color: Colors.white10,
                              )),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black45,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 6,
                  color: Colors.black12,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Settings',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        )),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 12),
                        child: InkWell(
                          onTap: () {
                            //
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/images/language.png'),
                              const SizedBox(width: 20),
                              Text(
                                'Language',
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                )),
                              ),
                              Expanded(
                                  child: Container(
                                color: Colors.white10,
                              )),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black45,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 4, bottom: 12),
                        child: InkWell(
                          onTap: () {
                            //
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/images/lock.png'),
                              const SizedBox(width: 20),
                              Text(
                                'Change Password',
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                )),
                              ),
                              Expanded(
                                  child: Container(
                                color: Colors.white10,
                              )),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black45,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 6,
                  color: Colors.black12,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Support',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        )),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 12),
                        child: InkWell(
                          onTap: () {
                            //
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/images/contact_us.png'),
                              const SizedBox(width: 20),
                              Text(
                                'Contact Us',
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                )),
                              ),
                              Expanded(
                                  child: Container(
                                color: Colors.white10,
                              )),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black45,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 4, bottom: 12),
                        child: InkWell(
                          onTap: () {
                            //
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/images/faq.png'),
                              const SizedBox(width: 20),
                              Text(
                                'FAQ',
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                )),
                              ),
                              Expanded(
                                  child: Container(
                                color: Colors.white10,
                              )),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black45,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 6,
                  color: Colors.black12,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 12),
                        child: InkWell(
                          onTap: () {
                            authService.signOut(context);
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/images/logout.png'),
                              const SizedBox(width: 20),
                              Text(
                                'Logout',
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF6B0B0B),
                                  fontWeight: FontWeight.w700,
                                )),
                              ),
                              Expanded(
                                  child: Container(
                                color: Colors.white10,
                              )),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black45,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 6,
                  color: Colors.black12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchUserData() async {
    var user = FirebaseAuth.instance.currentUser;

    // Pastikan user sudah login
    if (user == null) {
      // Jika user belum login, tampilkan pesan
      print("Silakan login terlebih dahulu");
      return; // Keluar dari metode fetchUserData
    }

    var url =
        Uri.parse("http://172.19.144.1/ta_projek/crudtaprojek/view_data.php");
    String uid = user.uid;

    var response = await http.post(url, body: {
      "uid": uid,
    });

    var data = json.decode(response.body);
    if (data != null) {
      // Data berhasil diterima, tampilkan firstname dan lastname
      firstname = data['firstname'];
      lastname = data['lastname'];
      email = data['email'];
      print('Firstname: $firstname, Lastname: $lastname');
      // Lakukan apapun yang Anda ingin lakukan dengan data ini
    } else {
      print("Gagal mendapatkan data pengguna");
    }
  }
}
