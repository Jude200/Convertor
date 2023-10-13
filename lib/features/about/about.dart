import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle =
        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
    TextStyle contentStyle = const TextStyle(fontSize: 18);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                    "À Propos de Notre Application de Conversion de Naira en Franc CFA",
                    style: titleStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Text(
                    "Notre mission est de simplifier et d'optimiser vos besoins de conversion de devises en vous offrant un outil convivial et fiable pour échanger rapidement entre le Naira et le Franc CFA. Que vous soyez un voyageur, un commerçant ou simplement quelqu'un qui a besoin de suivre les taux de change, notre application est conçue pour répondre à vos besoins",
                    style: contentStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text("Sécurité et Fiabilité", style: titleStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Text(
                    "La sécurité de vos données et de vos transactions est notre priorité. Notre application est conçue avec les dernières technologies de sécurité pour garantir que vos informations personnelles et financières sont protégées.",
                    style: contentStyle),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text("Assistance Client", style: titleStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Text(
                    "Nous sommes là pour vous aider. Si vous avez des questions, des préoccupations ou avez besoin d'assistance, notre équipe d'assistance client est disponible pour vous offrir un support rapide et efficace.",
                    style: contentStyle),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text("Mises à Jour et Améliorations", style: titleStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Text(
                    "Nous travaillons constamment à améliorer notre application pour vous offrir la meilleure expérience de conversion de devises possible. Restez à l'affût des mises à jour régulières pour profiter de nouvelles fonctionnalités et de meilleures performances.",
                    style: contentStyle),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text("Contactez-Nous", style: titleStyle),
              ),
              Text(
                  "Votre avis est important pour nous. Si vous avez des commentaires, des suggestions ou des questions, n'hésitez pas à nous contacter. \nMerci d'avoir choisi notre application de conversion de Naira en Franc CFA. Nous espérons qu'elle vous sera utile et qu'elle simplifiera vos besoins de conversion de devises.",
                  style: contentStyle),
              TextButton(
                  onPressed: () async {
                    await Clipboard.setData(
                            const ClipboardData(text: "judeseruch@gmail.com"))
                        .then((value) => ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                content: Text("Adresse mail copiée"))));
                  },
                  child: const Text("judeseruch@gmail.com")),
              TextButton(
                  onPressed: () async {
                    await Clipboard.setData(
                            const ClipboardData(text: "+22964821365"))
                        .then((value) => ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                content: Text("Numéro de téléphone copié"))));
                  },
                  child: const Text("+229 64 82 13 65")),
//

// ****
//

// **Contactez-Nous**

// Bien cordialement,
// L'équipe de [Nom de Votre Application]
            ],
          ),
        ),
      ),
    );
  }
}

// Bienvenue sur l'application de conversion de Naira en Franc CFA (et vice versa) ! Nous sommes ravis que vous ayez choisi notre application pour vos besoins de conversion de devises entre le Naira nigérian (NGN) et le Franc CFA de l'Afrique de l'Ouest (Franc CFA). Voici quelques informations clés sur notre application :

// **Notre Mission**
//

// **Fonctionnalités Principales**
// - Conversion Instantanée : Notre application offre des taux de change en temps réel pour que vous puissiez effectuer des conversions rapides et précises.
// - Conversion Bidirectionnelle : Vous pouvez convertir des Nairas en Franc CFA ou vice versa en quelques étapes simples.
// - Suivi des Taux de Change : Restez informé des taux de change actuels et surveillez les fluctuations du marché.
// - Calculatrice Intégrée : Utilisez notre calculatrice intégrée pour effectuer des conversions multiples rapidement.

// **Sécurité et Fiabilité**
//

// ---

// N'oubliez pas de personnaliser ce contenu en fonction de votre application, de son nom et de ses fonctionnalités spécifiques.")
