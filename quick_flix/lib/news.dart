import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class News extends StatelessWidget {
  final String value;
  final String summarized;
  final String source;
  final image;

  const News({
    Key? key,
    required this.value,
    required this.summarized,
    required this.source,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void launchURL() async {
      var uri = Uri.parse(source);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $source';
      }
    }

    Widget selectImage() {
      if (image == null) {
        return Image.asset('assets/news1.jpg');
      } else {
        return Image.network(image);
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(
              height: 30,
            ),
            selectImage(),
            const SizedBox(
              height: 30,
            ),
            Text(
              summarized,
              textAlign: TextAlign.justify,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: launchURL,
        child: const Text("Source"),
      ),
    );
  }
}
