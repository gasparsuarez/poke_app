import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poke_app/app/core/styles/assets.dart';
import 'package:sizer/sizer.dart';

class PokemonImage extends StatelessWidget {
  final double width;
  final int index;
  final bool shadow;

  /// Pokemon Image
  ///
  /// [index] indicate ID of pokemon for fetch image
  const PokemonImage({
    super.key,
    this.width = 34,
    this.shadow = true,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          if (shadow)
            const BoxShadow(
              color: Colors.black26,
              spreadRadius: -12,
              blurRadius: 10,
              offset: Offset(0, 34),
            ),
        ],
      ),
      child: SvgPicture.network(
        Assets.buildPokemonSpriteUrl(index),
        placeholderBuilder: (_) {
          return SizedBox(
            width: 20.w,
            height: 8.h,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
                strokeWidth: 1,
              ),
            ),
          );
        },
        width: width.w,
      ),
    );
  }
}
