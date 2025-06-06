import 'package:flutter/material.dart';
import '../models/models.dart';

final List<ShoeModel> availableShoes = [
  ShoeModel(
      name: "NIKE",
      model: "AIR-MAX",
      price: 130.00,
      imgAddress: "assets/images/nike1.png",
      modelColor: const Color(0xFFDE0106)),
  ShoeModel(
      name: "NIKE",
      model: "AIR-JORDAN MID",
      price: 190.00,
      imgAddress: "assets/images/nike8.png",
      modelColor: const Color(0xFF3F7943)),
  ShoeModel(
      name: "NIKE",
      model: "ZOOM",
      price: 160.00,
      imgAddress: "assets/images/nike2.png",
      modelColor: const Color(0xFFE66863)),
  ShoeModel(
      name: "NIKE",
      model: "AIR-FORCE",
      price: 110.00,
      imgAddress: "assets/images/nike3.png",
      modelColor: const Color(0xFFD7DBDC)),
  ShoeModel(
      name: "NIKE",
      model: "AIR-JORDAN LOW",
      price: 150.00,
      imgAddress: "assets/images/nike5.png",
      modelColor: const Color(0xFF373768)),
  ShoeModel(
      name: "Nike",
      model: "ZOOM",
      price: 115.00,
      imgAddress: "assets/images/nike5.png",
      modelColor: const Color(0xFFE4E3E8)),
  ShoeModel(
      name: "NIKE",
      model: "AIR-JORDAN LOW",
      price: 150.00,
      imgAddress: "assets/images/nike7.png",
      modelColor: const Color(0xFFD68043)),
  ShoeModel(
      name: "NIKE",
      model: "AIR-JORDAN LOW",
      price: 150.00,
      imgAddress: "assets/images/nike6.png",
      modelColor: const Color(0xFFE2E2E5)),
];

List<ShoeModel> itemsOnBag = [];

final List<UserStatus> userStatus = [
  UserStatus(
    emoji: '😴',
    txt: "Away",
    selectColor: const Color(0xff121212),
    unSelectColor: const Color(0xffbfbfbf),
  ),
  UserStatus(
    emoji: '💻',
    txt: "At Work",
    selectColor: const Color(0xff05a35c),
    unSelectColor: const Color(0xffCEEBD9),
  ),
  UserStatus(
    emoji: '🎮',
    txt: "Gaming",
    selectColor: const Color(0xffFFD237),
    unSelectColor: const Color(0xffFDDFBB),
  ),
  UserStatus(
    emoji: '🤫',
    txt: "Busy",
    selectColor: const Color(0xffba3a3a),
    unSelectColor: const Color(0xffdb9797),
  ),
];

final List categories = ['Nike', 'Adidas', 'Puma', 'Gucci', 'Koio', 'Tom Ford'];
final List featured = ['New', 'Featured', 'Upcoming'];
final List<double> sizes = [6, 7.5, 8, 9.5];
