import 'package:flutter/material.dart';
import 'package:theme_yes_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key, required this.message});

  final Message message;

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
            child: Text(
              message.text,
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ),
        const SizedBox(height: 5.0), // Space between messages

        //TODO: Add image
        if (message.imageUrl != null && message.imageUrl!.isNotEmpty) ...[
          _ImageBubble(imageUrl: message.imageUrl!),

        ]else ...[
          // If no image, just show a placeholder or nothing
          const SizedBox.shrink(),
        ],
        // const SizedBox(height: 10.0), // Space between messages
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;


      //receive the imageUrl from the message
  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    

    final size = MediaQuery.of(context).size;


    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        imageUrl,
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
