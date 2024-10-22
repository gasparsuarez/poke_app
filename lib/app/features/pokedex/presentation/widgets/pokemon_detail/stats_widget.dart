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
        ),
        SizedBox(
          height: 2.h,
        ),
        BaseStats(
          stats: pokemon.stats,
        )
      ],
    );
  }
}

class BaseStats extends StatelessWidget {
  final List<Stat> stats;
  const BaseStats({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    Color getBaseColor(double base) {
      if (base > 0.70) {
        return AppColors.lightGreen;
      } else if (base > 0.45) {
        return AppColors.orange;
      }
      return AppColors.yellow;
    }

    return Container(
      constraints: BoxConstraints(maxHeight: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: stats.length,
        itemBuilder: (context, index) {
          final stat = stats[index];
          final interpolation = '0.${stat.base}';
          final basePercent = double.tryParse(interpolation);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Text(
                    stat.name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(16.sp),
                    value: basePercent,
                    backgroundColor: AppColors.lightGrey,
                    color: getBaseColor(basePercent!),
                    minHeight: 2.h,
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      stat.base.toString(),
                      style: const TextStyle(
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
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
