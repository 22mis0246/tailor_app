import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/app_data.dart';
import '../../widgets/common_widgets.dart';
import 'measurement_form_screen.dart';

class DesignDetailScreen extends StatelessWidget {
  final Design design;
  const DesignDetailScreen({super.key, required this.design});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepNavy,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            backgroundColor: AppColors.royalIndigo,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.deepNavy.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back_ios_new,
                    color: AppColors.textLight, size: 18),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.royalIndigo, Color(0xFF0D1235)],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: AppColors.deepNavy,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                            color: AppColors.gold.withOpacity(0.3), width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.gold.withOpacity(0.2),
                            blurRadius: 30,
                          ),
                        ],
                      ),
                      child: Center(
                        child:
                        Text(design.emoji, style: const TextStyle(fontSize: 60)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    RatingStars(rating: design.rating, reviews: design.reviews),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + Price
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(design.title,
                                style: const TextStyle(
                                  color: AppColors.textLight,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                )),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.store_outlined,
                                    size: 14, color: AppColors.textMuted),
                                const SizedBox(width: 4),
                                Text(design.tailorName,
                                    style: const TextStyle(
                                        color: AppColors.textMuted,
                                        fontSize: 13)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '₹${design.price.toStringAsFixed(0)}',
                            style: const TextStyle(
                              color: AppColors.gold,
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.emerald.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(design.category,
                                style: const TextStyle(
                                    color: AppColors.emeraldLight,
                                    fontSize: 11)),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Description
                  const Text('About this Design',
                      style: TextStyle(
                          color: AppColors.gold,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1)),
                  const SizedBox(height: 8),
                  Text(design.description,
                      style: const TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 15,
                          height: 1.6)),

                  const SizedBox(height: 24),

                  // Includes
                  const Text('What\'s Included',
                      style: TextStyle(
                          color: AppColors.gold,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1)),
                  const SizedBox(height: 12),
                  ...[
                    ['Custom stitching', Icons.checkroom],
                    ['Delivery in 7–10 days', Icons.local_shipping],
                    ['Free alterations (30 days)', Icons.loop],
                    ['Quality fabric guarantee', Icons.verified],
                  ].map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: AppColors.emerald.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(item[1] as IconData,
                              color: AppColors.emeraldLight, size: 16),
                        ),
                        const SizedBox(width: 12),
                        Text(item[0] as String,
                            style: const TextStyle(
                                color: AppColors.textLight, fontSize: 14)),
                      ],
                    ),
                  )),

                  const SizedBox(height: 32),

                  // CTA Button
                  GoldButton(
                    label: 'Order Now — Enter Measurements',
                    icon: Icons.straighten,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            MeasurementFormScreen(design: design),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
