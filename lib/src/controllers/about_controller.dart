import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:utilidades/src/models/about_model.dart';

class AboutController {
  AboutModel getAbout() {
    return AboutModel(
      photoUrl: "https://i.redd.it/0ktogccl77861.jpg",
      aboutMe: [
        'Sou um jovem iniciando na área de programação sem experiencia.',
        'Além disso trabalho em uma agroavicola e faço esportes.',
      ],
      socialLinks: [
        SocialLink(
          name: "Github",
          icon: FontAwesomeIcons.github,
          url: "https://github.com/Bender11x",
          color: Colors.black,
        ),
        SocialLink(
          name: "Instagram",
          icon: FontAwesomeIcons.instagram,
          url: "rodrigobender88",
          color: Color(0xFFE1306C), 
        ),
      ],
    );
  }
}