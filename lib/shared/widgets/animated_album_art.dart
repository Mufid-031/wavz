import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import '../../core/constants/app_colors.dart';

class AnimatedAlbumArt extends StatefulWidget {
  const AnimatedAlbumArt({
    super.key,
    required this.imageUrl,
    this.size,
  });

  final String imageUrl;
  final double? size;

  @override
  State<AnimatedAlbumArt> createState() => _AnimatedAlbumArtState();
}

class _AnimatedAlbumArtState extends State<AnimatedAlbumArt> {
  Color _dominantColor = AppColors.primaryStart;

  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  @override
  void didUpdateWidget(AnimatedAlbumArt oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUrl != widget.imageUrl) {
      _updatePalette();
    }
  }

  Future<void> _updatePalette() async {
    final imageProvider = NetworkImage(widget.imageUrl);
    final palette = await PaletteGenerator.fromImageProvider(imageProvider);
    if (mounted) {
      setState(() {
        _dominantColor = palette.dominantColor?.color ?? AppColors.primaryStart;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size ?? MediaQuery.of(context).size.width * 0.8;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Bloom Effect
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            width: size * 0.9,
            height: size * 0.9,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: _dominantColor.withOpacity(0.4),
                  blurRadius: 80,
                  spreadRadius: 20,
                ),
              ],
            ),
          ),
          // Album Art
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              widget.imageUrl,
              width: size,
              height: size,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
