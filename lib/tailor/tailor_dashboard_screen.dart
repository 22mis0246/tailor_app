import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/app_data.dart';
import '../../widgets/common_widgets.dart';
import 'add_design_screen.dart';

class TailorDashboardScreen extends StatefulWidget {
  const TailorDashboardScreen({super.key});

  @override
  State<TailorDashboardScreen> createState() => _TailorDashboardScreenState();
}

class _TailorDashboardScreenState extends State<TailorDashboardScreen> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    final myDesigns =
    AppData.designs.where((d) => d.tailorName == 'Ravi Tailors').toList();

    return Scaffold(
      backgroundColor: AppColors.deepNavy,
      body: CustomScrollView(
        slivers: [
          // ── Header ──
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: AppColors.royalIndigo,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new,
                  color: AppColors.textLight, size: 18),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              if (_tab == 0)
                GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const AddDesignScreen()),
                    );
                    setState(() {});
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.gold, AppColors.goldLight],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.add, color: AppColors.deepNavy, size: 16),
                        SizedBox(width: 4),
                        Text('Add',
                            style: TextStyle(
                                color: AppColors.deepNavy,
                                fontWeight: FontWeight.w700,
                                fontSize: 13)),
                      ],
                    ),
                  ),
                ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.royalIndigo, AppColors.deepNavy],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 48, 20, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppColors.gold.withOpacity(0.15),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.gold.withOpacity(0.3)),
                              ),
                              child: const Center(
                                  child: Text('🧵',
                                      style: TextStyle(fontSize: 22))),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Ravi Tailors',
                                    style: TextStyle(
                                        color: AppColors.textLight,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800)),
                                const Text('Master Tailor · Chennai',
                                    style: TextStyle(
                                        color: AppColors.textMuted,
                                        fontSize: 13)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            StatCard(
                              value: '${myDesigns.length}',
                              label: 'Designs',
                              icon: Icons.design_services,
                              color: AppColors.gold,
                            ),
                            const SizedBox(width: 12),
                            StatCard(
                              value: '${AppData.orders.length}',
                              label: 'Orders',
                              icon: Icons.receipt_long,
                              color: AppColors.emeraldLight,
                            ),
                            const SizedBox(width: 12),
                            StatCard(
                              value: '4.8★',
                              label: 'Rating',
                              icon: Icons.star,
                              color: AppColors.roseGold,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ── Tab Switcher ──
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.royalIndigo,
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    _TabBtn(
                        label: 'My Designs',
                        icon: Icons.design_services,
                        selected: _tab == 0,
                        onTap: () => setState(() => _tab = 0)),
                    _TabBtn(
                        label: 'Orders',
                        icon: Icons.receipt_long,
                        selected: _tab == 1,
                        onTap: () => setState(() => _tab = 1)),
                  ],
                ),
              ),
            ),
          ),

          // ── Content ──
          if (_tab == 0) ..._buildDesigns(myDesigns),
          if (_tab == 1) ..._buildOrders(),
        ],
      ),
    );
  }

  List<Widget> _buildDesigns(List<Design> designs) => [
    SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: designs.isEmpty
          ? const SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Text('No designs yet. Tap + Add to start!',
                style: TextStyle(color: AppColors.textMuted)),
          ),
        ),
      )
          : SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) => _DesignTile(design: designs[index]),
          childCount: designs.length,
        ),
      ),
    ),
  ];

  List<Widget> _buildOrders() => [
    SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: AppData.orders.isEmpty
          ? const SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              children: [
                Text('📋',
                    style: TextStyle(fontSize: 48)),
                SizedBox(height: 12),
                Text('No orders received yet.',
                    style: TextStyle(color: AppColors.textMuted)),
              ],
            ),
          ),
        ),
      )
          : SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) =>
              _OrderTile(order: AppData.orders[index]),
          childCount: AppData.orders.length,
        ),
      ),
    ),
  ];
}

// ── Tab Button ────────────────────────────────────────────────────────────────

class _TabBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _TabBtn(
      {required this.label,
        required this.icon,
        required this.selected,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            gradient: selected
                ? const LinearGradient(
                colors: [AppColors.gold, AppColors.goldLight])
                : null,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  size: 16,
                  color: selected
                      ? AppColors.deepNavy
                      : AppColors.textMuted),
              const SizedBox(width: 6),
              Text(label,
                  style: TextStyle(
                      color: selected
                          ? AppColors.deepNavy
                          : AppColors.textMuted,
                      fontWeight: FontWeight.w600,
                      fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Design Tile ───────────────────────────────────────────────────────────────

class _DesignTile extends StatelessWidget {
  final Design design;
  const _DesignTile({required this.design});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.royalIndigo,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
                child: Text(design.emoji,
                    style: const TextStyle(fontSize: 24))),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(design.title,
                    style: const TextStyle(
                        color: AppColors.textLight,
                        fontWeight: FontWeight.w700)),
                Text(design.category,
                    style: const TextStyle(
                        color: AppColors.textMuted, fontSize: 12)),
              ],
            ),
          ),
          Text('₹${design.price.toStringAsFixed(0)}',
              style: const TextStyle(
                  color: AppColors.gold,
                  fontWeight: FontWeight.w800,
                  fontSize: 16)),
        ],
      ),
    );
  }
}

// ── Order Tile ────────────────────────────────────────────────────────────────

class _OrderTile extends StatelessWidget {
  final Order order;
  const _OrderTile({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          title: Text(order.design.title,
              style: const TextStyle(
                  color: AppColors.textLight, fontWeight: FontWeight.w700)),
          subtitle: Text('Customer: ${order.customerName}',
              style:
              const TextStyle(color: AppColors.textMuted, fontSize: 12)),
          trailing: Text('₹${order.design.price.toStringAsFixed(0)}',
              style: const TextStyle(
                  color: AppColors.gold, fontWeight: FontWeight.w800)),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(color: AppColors.divider),
                  const SizedBox(height: 8),
                  const Text('Measurements',
                      style: TextStyle(
                          color: AppColors.gold,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          letterSpacing: 0.8)),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: [
                      _Meas('Chest', '${order.measurements.chest}"'),
                      _Meas('Waist', '${order.measurements.waist}"'),
                      _Meas('Hips', '${order.measurements.hips}"'),
                      _Meas('Shoulder', '${order.measurements.shoulder}"'),
                      _Meas('Length', '${order.measurements.length}"'),
                    ],
                  ),
                  if (order.measurements.notes.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.royalIndigo,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.notes,
                              size: 14, color: AppColors.textMuted),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(order.measurements.notes,
                                style: const TextStyle(
                                    color: AppColors.textMuted,
                                    fontSize: 13)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Meas extends StatelessWidget {
  final String label;
  final String value;
  const _Meas(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.royalIndigo,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: [
          Text(label,
              style: const TextStyle(
                  color: AppColors.textMuted, fontSize: 10)),
          Text(value,
              style: const TextStyle(
                  color: AppColors.textLight,
                  fontWeight: FontWeight.w700,
                  fontSize: 14)),
        ],
      ),
    );
  }
}
