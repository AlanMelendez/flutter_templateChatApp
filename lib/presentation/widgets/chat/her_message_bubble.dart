import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.secondary,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
            child: Text(
              'I am fine, thank you!',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ),
        const SizedBox(height: 5.0), // Space between messages

        //TODO: Add image
         _ImageBubble(),
        const SizedBox(height: 10.0), // Space between messages
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        'https://picsum.photos/200/300',
        width: size.width * 0.6, // Adjust width as needed
        height: size.width * 0.6, // Adjust height as needed
        fit: BoxFit.cover, // Adjust the image to cover the container
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child; // If loading is complete, return the child
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        },
      ),
      
    );
  }
}
