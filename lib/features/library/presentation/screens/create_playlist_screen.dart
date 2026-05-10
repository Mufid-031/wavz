import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../shared/widgets/wavz_button.dart';
import '../../../../shared/widgets/wavz_text_field.dart';

class CreatePlaylistScreen extends StatefulWidget {
  const CreatePlaylistScreen({super.key});

  @override
  State<CreatePlaylistScreen> createState() => _CreatePlaylistScreenState();
}

class _CreatePlaylistScreenState extends State<CreatePlaylistScreen> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(AppIcons.close, color: AppColors.textPrimary),
        ),
        title: const Text(
          'Create Playlist',
          style: AppTypography.headingLG,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          children: [
            const SizedBox(height: AppSpacing.xl2),
            
            // Playlist Cover Placeholder
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.add_a_photo_rounded,
                size: 48,
                color: AppColors.textMuted,
              ),
            ),
            
            const SizedBox(height: AppSpacing.xl4),
            
            WavzTextField(
              controller: _nameController,
              label: 'Playlist Name',
              hintText: 'My Awesome Playlist',
            ),
            
            const SizedBox(height: AppSpacing.xl),
            
            WavzTextField(
              controller: _descController,
              label: 'Description (Optional)',
              hintText: 'Songs for my morning run...',
            ),
            
            const Spacer(),
            
            WavzButton(
              label: 'CREATE PLAYLIST',
              onPressed: () => context.pop(),
            ),
            
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }
}
