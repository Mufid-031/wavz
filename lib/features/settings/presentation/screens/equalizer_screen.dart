import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';

class EqualizerScreen extends StatefulWidget {
  const EqualizerScreen({super.key});

  @override
  State<EqualizerScreen> createState() => _EqualizerScreenState();
}

class _EqualizerScreenState extends State<EqualizerScreen> {
  final List<double> _frequencies = [0.5, 0.4, 0.7, 0.6, 0.3, 0.5];
  bool _isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(AppIcons.back, color: AppColors.textPrimary),
        ),
        title: const Text(
          'Equalizer',
          style: AppTypography.headingLG,
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: _isEnabled,
            onChanged: (value) => setState(() => _isEnabled = value),
            activeColor: AppColors.primaryEnd,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Custom Preset',
              style: AppTypography.labelLG,
            ),
            const SizedBox(height: AppSpacing.xl3),
            Expanded(
              child: Opacity(
                opacity: _isEnabled ? 1.0 : 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(_frequencies.length, (index) {
                    return _buildSlider(index);
                  }),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xl3),
            _buildPresets(),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(int index) {
    return Column(
      children: [
        Expanded(
          child: RotatedBox(
            quarterTurns: 3,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 4,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                activeTrackColor: AppColors.primaryStart,
                inactiveTrackColor: AppColors.surfaceHighest,
                thumbColor: Colors.white,
              ),
              child: Slider(
                value: _frequencies[index],
                onChanged: _isEnabled
                    ? (value) => setState(() => _frequencies[index] = value)
                    : null,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          ['60', '230', '910', '3K', '14K', '20K'][index],
          style: AppTypography.bodySM.copyWith(color: AppColors.textMuted),
        ),
      ],
    );
  }

  Widget _buildPresets() {
    final presets = ['Normal', 'Pop', 'Rock', 'Jazz', 'Classical', 'Hip-Hop'];
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: presets.length,
        separatorBuilder: (context, index) => const SizedBox(width: AppSpacing.md),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.divider),
            ),
            alignment: Alignment.center,
            child: Text(
              presets[index],
              style: AppTypography.labelSM,
            ),
          );
        },
      ),
    );
  }
}
