import 'package:flutter/material.dart';
import 'package:poke_app/app/core/localization/strings.dart';
import 'package:poke_app/app/core/styles/app_colors.dart';
import 'package:poke_app/app/core/utils/utils.dart';
import 'package:poke_app/app/features/pokedex/domain/entities/pokemon.dart';
import 'package:sizer/sizer.dart';

class StatsWidget extends StatelessWidget {
  ///
  /// Build pokemon stats widget
  ///
  /// Show [weight], [height], [hp] and other stats
  ///
  const StatsWidget({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WeightAndHeightCard(
          pokemon: pokemon,
        )
      ],
    );
  }
}

class WeightAndHeightCard extends StatelessWidget {
  const WeightAndHeightCard({super.key, required this.pokemon});

  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: Utils.getColorByPokemonType(pokemon.types.first.name),
        borderRadius: BorderRadius.circular(16.sp),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            offset: Offset(0, 4),
            spreadRadius: 2,
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _Stat(
            name: Strings.weight,
            value: '${pokemon.weight} ${Strings.kg}',
          ),
          SizedBox(
            width: 2.w,
          ),
          _Stat(
            name: Strings.height,
            value: '${pokemon.height} ${Strings.m}',
          )
        ],
      ),
    );
  }
}

///
/// Build column with [name] (title) and [value]
///
class _Stat extends StatelessWidget {
  const _Stat({
    required this.name,
    required this.value,
  });

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.white,
          ),
        )
      ],
    );
  }
}
