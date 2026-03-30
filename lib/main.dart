import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const TailorApp());
}

// ════════════════════════════════════════════════════════════════
//  COLORS
// ════════════════════════════════════════════════════════════════

class C {
  static const bg = Color(0xFF0A0A0A);
  static const surface = Color(0xFF141414);
  static const card = Color(0xFF1C1C1C);
  static const border = Color(0xFF2A2A2A);
  static const white = Color(0xFFFFFFFF);
  static const white70 = Color(0xB3FFFFFF);
  static const white40 = Color(0x66FFFFFF);
  static const white15 = Color(0x26FFFFFF);
  static const white08 = Color(0x14FFFFFF);
}

// ════════════════════════════════════════════════════════════════
//  TEXT STYLES
// ════════════════════════════════════════════════════════════════

class T {
  static const displayXL = TextStyle(
    color: C.white,
    fontSize: 40,
    fontWeight: FontWeight.w800,
    letterSpacing: -1.5,
    height: 1.1,
  );
  static const displayL = TextStyle(
    color: C.white,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.8,
    height: 1.2,
  );
  static const displayM = TextStyle(
    color: C.white,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.4,
  );
  static const title = TextStyle(
    color: C.white,
    fontSize: 17,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
  );
  static const body = TextStyle(
    color: C.white70,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
  static const caption = TextStyle(
    color: C.white40,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
  );
  static const label = TextStyle(
    color: C.white40,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  );
  static const price = TextStyle(
    color: C.white,
    fontSize: 24,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5,
  );
  static const tag = TextStyle(
    color: C.white,
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.8,
  );
}

// ════════════════════════════════════════════════════════════════
//  DATA MODELS
// ════════════════════════════════════════════════════════════════

class Design {
  final String id;
  final String tailorName;
  final String title;
  final String description;
  final double price;
  final String category;
  final String imageUrl;
  final double rating;
  final int reviews;
  final String deliveryDays;

  const Design({
    required this.id,
    required this.tailorName,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    this.rating = 4.5,
    this.reviews = 12,
    this.deliveryDays = '7–10',
  });
}

class Measurements {
  final String chest, waist, hips, shoulder, length, notes;
  Measurements({
    required this.chest,
    required this.waist,
    required this.hips,
    required this.shoulder,
    required this.length,
    required this.notes,
  });
}

class Order {
  final String id;
  final Design design;
  final String customerName;
  String status;
  final Measurements measurements;
  final DateTime placedAt;

  Order({
    required this.id,
    required this.design,
    required this.customerName,
    required this.status,
    required this.measurements,
    required this.placedAt,
  });
}

// ════════════════════════════════════════════════════════════════
//  APP DATA STORE
// ════════════════════════════════════════════════════════════════

class AppData {
  static final List<Design> designs = [
    const Design(
      id: '1',
      tailorName: 'Ravi Tailors',
      title: 'Traditional Kurta',
      description:
      'Handcrafted kurta in premium cotton with intricate hand embroidery. Each piece is made to order and tailored to your exact measurements.',
      price: 1200,
      category: 'Kurta',
      imageUrl:
      'https://images.unsplash.com/photo-1594938298603-c8148c4b4e58?w=600&q=80',
      rating: 4.8,
      reviews: 34,
      deliveryDays: '7–10',
    ),
    const Design(
      id: '2',
      tailorName: 'Meena Creations',
      title: 'Bridal Silk Blouse',
      description:
      'Luxurious silk blouse with fine zari work and hand-embellished borders. Crafted by master artisans with decades of experience.',
      price: 2500,
      category: 'Blouse',
      imageUrl:
      'https://images.unsplash.com/photo-1610030469983-98e550d6193c?w=600&q=80',
      rating: 4.9,
      reviews: 18,
      deliveryDays: '10–14',
    ),
    const Design(
      id: '3',
      tailorName: 'Style Studio',
      title: 'Premium Formal Shirt',
      description:
      'Crisp Egyptian cotton shirt tailored to your exact measurements. Clean lines, sharp collar, perfect for the modern professional.',
      price: 800,
      category: 'Shirt',
      imageUrl:
      'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?w=600&q=80',
      rating: 4.6,
      reviews: 52,
      deliveryDays: '5–7',
    ),
    const Design(
      id: '4',
      tailorName: 'Ravi Tailors',
      title: 'Anarkali Salwar Set',
      description:
      'Flowing georgette Anarkali suit with embroidered dupatta. A statement ensemble for weddings, receptions and festivities.',
      price: 3200,
      category: 'Salwar',
      imageUrl:
      'https://images.unsplash.com/photo-1583391733956-6c78276477e2?w=600&q=80',
      rating: 4.7,
      reviews: 29,
      deliveryDays: '10–12',
    ),
    const Design(
      id: '5',
      tailorName: 'Royal Stitch',
      title: 'Sherwani',
      description:
      'Regal sherwani in raw silk with fine gold threadwork. Fit for weddings, ceremonies and celebrations. A true heirloom piece.',
      price: 5500,
      category: 'Sherwani',
      imageUrl:
      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=600&q=80',
      rating: 5.0,
      reviews: 11,
      deliveryDays: '14–18',
    ),
  ];

  static final List<Order> orders = [];
}

// ════════════════════════════════════════════════════════════════
//  APP ROOT
// ════════════════════════════════════════════════════════════════

class TailorApp extends StatelessWidget {
  const TailorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tailor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: C.bg,
        colorScheme: const ColorScheme.dark(
          primary: C.white,
          surface: C.surface,
          background: C.bg,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: C.card,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: C.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: C.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: C.white, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
            const BorderSide(color: Colors.redAccent, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
            const BorderSide(color: Colors.redAccent, width: 1),
          ),
          labelStyle: T.body,
          hintStyle: const TextStyle(color: C.white40, fontSize: 15),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          prefixIconColor: C.white40,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

// ════════════════════════════════════════════════════════════════
//  SHARED WIDGETS
// ════════════════════════════════════════════════════════════════

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool filled;
  final IconData? icon;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.filled = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: Material(
        color: filled ? C.white : Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          splashColor: C.white15,
          highlightColor: C.white08,
          child: Container(
            decoration: filled
                ? null
                : BoxDecoration(
              border: Border.all(color: C.border, width: 1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon,
                      size: 18, color: filled ? C.bg : C.white70),
                  const SizedBox(width: 8),
                ],
                Text(
                  label,
                  style: TextStyle(
                    color: filled ? C.bg : C.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TagPill extends StatelessWidget {
  final String label;
  final bool filled;
  const TagPill(this.label, {super.key, this.filled = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: filled ? C.white : C.white08,
        borderRadius: BorderRadius.circular(6),
        border: filled ? null : Border.all(color: C.border, width: 1),
      ),
      child: Text(
        label.toUpperCase(),
        style: T.tag.copyWith(color: filled ? C.bg : C.white70),
      ),
    );
  }
}

class StarRow extends StatelessWidget {
  final double rating;
  final int reviews;
  const StarRow(
      {super.key, required this.rating, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(5, (i) {
          if (i < rating.floor()) {
            return const Icon(Icons.star_rounded,
                size: 14, color: C.white);
          } else if (i < rating) {
            return const Icon(Icons.star_half_rounded,
                size: 14, color: C.white70);
          } else {
            return const Icon(Icons.star_outline_rounded,
                size: 14, color: C.white40);
          }
        }),
        const SizedBox(width: 6),
        Text('$rating  ·  $reviews reviews', style: T.caption),
      ],
    );
  }
}

class SectionLabel extends StatelessWidget {
  final String text;
  const SectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Text(text.toUpperCase(), style: T.label),
    );
  }
}

class _BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.maybePop(context),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: C.card,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: C.border, width: 1),
        ),
        child: const Icon(Icons.arrow_back_ios_new_rounded,
            size: 16, color: C.white70),
      ),
    );
  }
}

class _IconBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final String? badge;

  const _IconBtn(
      {required this.icon, required this.onTap, this.badge});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: C.card,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: C.border, width: 1),
            ),
            child: Icon(icon, size: 18, color: C.white70),
          ),
          if (badge != null)
            Positioned(
              right: 4,
              top: 4,
              child: Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  color: C.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(badge!,
                      style: const TextStyle(
                          color: C.bg,
                          fontSize: 9,
                          fontWeight: FontWeight.w800)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  const _EmptyState(
      {required this.icon,
        required this.title,
        required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: C.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: C.border, width: 1),
              ),
              child: Icon(icon, color: C.white40, size: 28),
            ),
            const SizedBox(height: 16),
            Text(title, style: T.title),
            const SizedBox(height: 6),
            Text(subtitle, style: T.body, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _MeasPill extends StatelessWidget {
  final String label, value;
  const _MeasPill(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: C.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: C.border, width: 1),
      ),
      child: Column(
        children: [
          Text(label, style: T.label),
          const SizedBox(height: 1),
          Text(value,
              style: T.body.copyWith(
                  color: C.white, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _TField extends StatelessWidget {
  final TextEditingController ctrl;
  final String label, hint;
  final IconData icon;
  final bool num;

  const _TField({
    required this.ctrl,
    required this.label,
    required this.hint,
    required this.icon,
    this.num = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrl,
      keyboardType: num ? TextInputType.number : TextInputType.text,
      style: T.body.copyWith(color: C.white),
      validator: (v) =>
      (v == null || v.trim().isEmpty) ? 'Required' : null,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, size: 18),
      ),
    );
  }
}

Widget _netImage(String url,
    {double? width, double? height, BoxFit fit = BoxFit.cover}) {
  return Image.network(
    url,
    width: width,
    height: height,
    fit: fit,
    loadingBuilder: (_, child, progress) {
      if (progress == null) return child;
      return Container(
        color: C.surface,
        child: const Center(
          child: SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
                strokeWidth: 1.5, color: C.white40),
          ),
        ),
      );
    },
    errorBuilder: (_, __, ___) => Container(
      color: C.surface,
      child: const Center(
        child: Icon(Icons.image_not_supported_outlined,
            color: C.white40, size: 24),
      ),
    ),
  );
}

// ════════════════════════════════════════════════════════════════
//  LOGIN SCREEN
// ════════════════════════════════════════════════════════════════

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 64),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: C.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.content_cut_rounded,
                    color: C.bg, size: 22),
              ),
              const SizedBox(height: 32),
              const Text('Tailor', style: T.displayXL),
              const SizedBox(height: 8),
              const Text(
                'Custom clothing, crafted\nto your exact measurements.',
                style: T.body,
              ),
              const Spacer(),
              PrimaryButton(
                label: 'Continue as Customer',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(
                        builder: (_) => const CustomerHomeScreen())),
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                label: 'Continue as Tailor',
                filled: false,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(
                        builder: (_) =>
                        const TailorDashboardScreen())),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'By continuing you agree to our Terms of Service',
                  style: T.caption,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════
//  CUSTOMER HOME
// ════════════════════════════════════════════════════════════════

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  String _cat = 'All';
  final _cats = [
    'All', 'Kurta', 'Blouse', 'Shirt', 'Salwar', 'Sherwani'
  ];

  List<Design> get _list => _cat == 'All'
      ? AppData.designs
      : AppData.designs.where((d) => d.category == _cat).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      body: NestedScrollView(
        headerSliverBuilder: (ctx, _) => [
          SliverAppBar(
            backgroundColor: C.bg,
            elevation: 0,
            pinned: true,
            expandedHeight: 130,
            leading: _BackButton(),
            actions: [
              _IconBtn(
                icon: Icons.shopping_bag_outlined,
                badge: AppData.orders.isNotEmpty
                    ? '${AppData.orders.length}'
                    : null,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(
                        builder: (_) => const MyOrdersScreen())),
              ),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
              const EdgeInsets.fromLTRB(20, 0, 20, 16),
              title: const Text('Browse', style: T.displayM),
              background: Container(color: C.bg),
            ),
          ),
        ],
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 44,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: _cats.length,
                  separatorBuilder: (_, __) =>
                  const SizedBox(width: 8),
                  itemBuilder: (_, i) {
                    final sel = _cats[i] == _cat;
                    return GestureDetector(
                      onTap: () =>
                          setState(() => _cat = _cats[i]),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 9),
                        decoration: BoxDecoration(
                          color: sel ? C.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: sel ? C.white : C.border,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          _cats[i],
                          style: TextStyle(
                            color: sel ? C.bg : C.white70,
                            fontSize: 13,
                            fontWeight: sel
                                ? FontWeight.w700
                                : FontWeight.w400,
                            letterSpacing: -0.1,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
              sliver: _list.isEmpty
                  ? const SliverToBoxAdapter(
                  child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(48),
                        child: Text(
                            'No designs in this category.',
                            style: T.body),
                      )))
                  : SliverList(
                delegate: SliverChildBuilderDelegate(
                      (_, i) => _DesignCard(design: _list[i]),
                  childCount: _list.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DesignCard extends StatelessWidget {
  final Design design;
  const _DesignCard({required this.design});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  DesignDetailScreen(design: design))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: C.card,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: C.border, width: 1),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: _netImage(design.imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(design.title, style: T.title),
                            const SizedBox(height: 3),
                            Text(design.tailorName,
                                style: T.caption),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      TagPill(design.category),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      StarRow(
                          rating: design.rating,
                          reviews: design.reviews),
                      const Spacer(),
                      Text(
                          '₹${design.price.toStringAsFixed(0)}',
                          style: T.price),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════
//  DESIGN DETAIL
// ════════════════════════════════════════════════════════════════

class DesignDetailScreen extends StatelessWidget {
  final Design design;
  const DesignDetailScreen({super.key, required this.design});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: C.bg,
            elevation: 0,
            pinned: true,
            expandedHeight: 300,
            leading: _BackButton(),
            flexibleSpace: FlexibleSpaceBar(
              background: _netImage(design.imageUrl),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TagPill(design.category),
                  const SizedBox(height: 14),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child:
                          Text(design.title, style: T.displayL)),
                      const SizedBox(width: 16),
                      Text(
                          '₹${design.price.toStringAsFixed(0)}',
                          style: T.price),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(design.tailorName, style: T.caption),
                  const SizedBox(height: 12),
                  StarRow(
                      rating: design.rating,
                      reviews: design.reviews),
                  const SizedBox(height: 28),
                  const Divider(color: C.border, thickness: 1),
                  const SizedBox(height: 24),
                  const SectionLabel('About'),
                  Text(design.description, style: T.body),
                  const SizedBox(height: 28),
                  const Divider(color: C.border, thickness: 1),
                  const SizedBox(height: 24),
                  const SectionLabel('Details'),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 2.8,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      ['Delivery', '${design.deliveryDays} days'],
                      ['Alterations', 'Free / 30 days'],
                      ['Fabric', 'Premium quality'],
                      ['Fit', 'Custom to you'],
                    ]
                        .map((item) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: C.card,
                        borderRadius:
                        BorderRadius.circular(10),
                        border: Border.all(
                            color: C.border, width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text(item[0], style: T.label),
                          const SizedBox(height: 2),
                          Text(item[1],
                              style: T.body.copyWith(
                                  fontSize: 13,
                                  fontWeight:
                                  FontWeight.w600,
                                  color: C.white)),
                        ],
                      ),
                    ))
                        .toList(),
                  ),
                  const SizedBox(height: 36),
                  PrimaryButton(
                    label: 'Order — Enter Measurements',
                    icon: Icons.straighten_rounded,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => MeasurementFormScreen(
                                design: design))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════
//  MEASUREMENT FORM
// ════════════════════════════════════════════════════════════════

class MeasurementFormScreen extends StatefulWidget {
  final Design design;
  const MeasurementFormScreen({super.key, required this.design});

  @override
  State<MeasurementFormScreen> createState() =>
      _MeasurementFormScreenState();
}

class _MeasurementFormScreenState
    extends State<MeasurementFormScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _chest = TextEditingController();
  final _waist = TextEditingController();
  final _hips = TextEditingController();
  final _shoulder = TextEditingController();
  final _length = TextEditingController();
  final _notes = TextEditingController();

  void _submit() {
    if (_form.currentState!.validate()) {
      AppData.orders.add(Order(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        design: widget.design,
        customerName: _name.text.trim(),
        status: 'Pending',
        placedAt: DateTime.now(),
        measurements: Measurements(
          chest: _chest.text,
          waist: _waist.text,
          hips: _hips.text,
          shoulder: _shoulder.text,
          length: _length.text,
          notes: _notes.text,
        ),
      ));
      _showSuccess();
    }
  }

  void _showSuccess() {
    showModalBottomSheet(
      context: context,
      backgroundColor: C.card,
      shape: const RoundedRectangleBorder(
        borderRadius:
        BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isDismissible: false,
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(28, 32, 28, 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: C.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.check_rounded,
                  color: C.bg, size: 26),
            ),
            const SizedBox(height: 20),
            const Text('Order Confirmed', style: T.displayM),
            const SizedBox(height: 8),
            Text(
              'Your order for "${widget.design.title}" has been placed. The tailor will confirm within 24 hours.',
              style: T.body,
            ),
            const SizedBox(height: 28),
            PrimaryButton(
              label: 'Back to Home',
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      appBar: AppBar(
        backgroundColor: C.bg,
        elevation: 0,
        leading: _BackButton(),
        title: const Text('Measurements', style: T.title),
        centerTitle: true,
      ),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 40),
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: C.card,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: C.border, width: 1),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: _netImage(widget.design.imageUrl,
                        width: 52, height: 52),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(widget.design.title,
                            style: T.title),
                        const SizedBox(height: 2),
                        Text(widget.design.tailorName,
                            style: T.caption),
                      ],
                    ),
                  ),
                  Text(
                      '₹${widget.design.price.toStringAsFixed(0)}',
                      style: T.title),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const SectionLabel('Your Details'),
            _TField(
                ctrl: _name,
                label: 'Full Name',
                hint: 'Priya Sharma',
                icon: Icons.person_outline_rounded),
            const SizedBox(height: 28),
            const SectionLabel('Body Measurements (inches)'),
            Row(
              children: [
                Expanded(
                  child: _TField(
                      ctrl: _chest,
                      label: 'Chest',
                      hint: '36',
                      icon: Icons.straighten_rounded,
                      num: true),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _TField(
                      ctrl: _waist,
                      label: 'Waist',
                      hint: '30',
                      icon: Icons.straighten_rounded,
                      num: true),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _TField(
                      ctrl: _hips,
                      label: 'Hips',
                      hint: '38',
                      icon: Icons.straighten_rounded,
                      num: true),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _TField(
                      ctrl: _shoulder,
                      label: 'Shoulder',
                      hint: '14',
                      icon: Icons.width_normal_rounded,
                      num: true),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _TField(
                ctrl: _length,
                label: 'Length',
                hint: '42',
                icon: Icons.height_rounded,
                num: true),
            const SizedBox(height: 28),
            const SectionLabel('Special Instructions'),
            TextFormField(
              controller: _notes,
              maxLines: 3,
              style: T.body.copyWith(color: C.white),
              decoration: const InputDecoration(
                hintText:
                'e.g. Add pockets, prefer loose fit, specific fabric color...',
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 36),
            PrimaryButton(
              label: 'Place Order',
              icon: Icons.check_rounded,
              onTap: _submit,
            ),
          ],
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════
//  MY ORDERS (Customer)
// ════════════════════════════════════════════════════════════════

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      appBar: AppBar(
        backgroundColor: C.bg,
        elevation: 0,
        leading: _BackButton(),
        title: const Text('My Orders', style: T.title),
        centerTitle: true,
      ),
      body: AppData.orders.isEmpty
          ? _EmptyState(
        icon: Icons.shopping_bag_outlined,
        title: 'No orders yet',
        subtitle: 'Your confirmed orders will appear here.',
      )
          : ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
        itemCount: AppData.orders.length,
        separatorBuilder: (_, __) =>
        const SizedBox(height: 12),
        itemBuilder: (_, i) =>
            _OrderTile(order: AppData.orders[i]),
      ),
    );
  }
}

class _OrderTile extends StatelessWidget {
  final Order order;
  const _OrderTile({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: C.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: C.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: _netImage(order.design.imageUrl,
                    width: 52, height: 52),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order.design.title, style: T.title),
                    const SizedBox(height: 3),
                    Text(order.design.tailorName,
                        style: T.caption),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                      '₹${order.design.price.toStringAsFixed(0)}',
                      style: T.title),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: C.white08,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: C.border, width: 1),
                    ),
                    child: Text(order.status,
                        style: T.caption.copyWith(
                            color: C.white70)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(color: C.border, thickness: 1, height: 1),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _MeasPill('Chest', '${order.measurements.chest}"'),
              _MeasPill('Waist', '${order.measurements.waist}"'),
              _MeasPill('Hips', '${order.measurements.hips}"'),
              _MeasPill(
                  'Shoulder', '${order.measurements.shoulder}"'),
              _MeasPill('Length', '${order.measurements.length}"'),
            ],
          ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════
//  TAILOR DASHBOARD
// ════════════════════════════════════════════════════════════════

class TailorDashboardScreen extends StatefulWidget {
  const TailorDashboardScreen({super.key});

  @override
  State<TailorDashboardScreen> createState() =>
      _TailorDashboardScreenState();
}

class _TailorDashboardScreenState extends State<TailorDashboardScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 2, vsync: this);
    _tabs.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  List<Design> get _myDesigns => AppData.designs
      .where((d) => d.tailorName == 'Ravi Tailors')
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      body: NestedScrollView(
        headerSliverBuilder: (ctx, _) => [
          SliverAppBar(
            backgroundColor: C.bg,
            elevation: 0,
            pinned: true,
            expandedHeight: 200,
            leading: _BackButton(),
            actions: [
              _IconBtn(
                icon: Icons.add,
                onTap: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                          const AddDesignScreen()));
                  setState(() {});
                },
              ),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: C.bg,
                padding:
                const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80),
                    const Text('Dashboard', style: T.displayL),
                    const SizedBox(height: 4),
                    const Text('Ravi Tailors · Chennai',
                        style: T.caption),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        _StatBox(
                            value: '${_myDesigns.length}',
                            label: 'Designs'),
                        const SizedBox(width: 10),
                        _StatBox(
                            value: '${AppData.orders.length}',
                            label: 'Orders'),
                        const SizedBox(width: 10),
                        const _StatBox(
                            value: '4.8', label: 'Rating'),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(44),
              child: Container(
                color: C.bg,
                child: TabBar(
                  controller: _tabs,
                  indicatorColor: C.white,
                  indicatorWeight: 2,
                  labelColor: C.white,
                  unselectedLabelColor: C.white40,
                  labelStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                  unselectedLabelStyle:
                  const TextStyle(fontSize: 14),
                  tabs: const [
                    Tab(text: 'My Designs'),
                    Tab(text: 'Orders'),
                  ],
                ),
              ),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabs,
          children: [
            _myDesigns.isEmpty
                ? _EmptyState(
              icon: Icons.design_services_outlined,
              title: 'No designs yet',
              subtitle: 'Tap + to add your first design.',
            )
                : ListView.separated(
              padding: const EdgeInsets.fromLTRB(
                  20, 20, 20, 40),
              itemCount: _myDesigns.length,
              separatorBuilder: (_, __) =>
              const SizedBox(height: 10),
              itemBuilder: (_, i) =>
                  _TailorDesignTile(design: _myDesigns[i]),
            ),
            AppData.orders.isEmpty
                ? _EmptyState(
              icon: Icons.receipt_long_outlined,
              title: 'No orders yet',
              subtitle:
              'Orders from customers will appear here.',
            )
                : ListView.separated(
              padding: const EdgeInsets.fromLTRB(
                  20, 20, 20, 40),
              itemCount: AppData.orders.length,
              separatorBuilder: (_, __) =>
              const SizedBox(height: 10),
              itemBuilder: (_, i) =>
                  _TailorOrderTile(
                      order: AppData.orders[i]),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String value, label;
  const _StatBox({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: C.card,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: C.border, width: 1),
        ),
        child: Column(
          children: [
            Text(value,
                style: T.title.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w800)),
            const SizedBox(height: 2),
            Text(label, style: T.label),
          ],
        ),
      ),
    );
  }
}

class _TailorDesignTile extends StatelessWidget {
  final Design design;
  const _TailorDesignTile({required this.design});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: C.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: C.border, width: 1),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: _netImage(design.imageUrl,
                width: 52, height: 52),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(design.title, style: T.title),
                const SizedBox(height: 4),
                TagPill(design.category),
              ],
            ),
          ),
          Text('₹${design.price.toStringAsFixed(0)}',
              style: T.title),
        ],
      ),
    );
  }
}

class _TailorOrderTile extends StatelessWidget {
  final Order order;
  const _TailorOrderTile({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: C.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: C.border, width: 1),
      ),
      clipBehavior: Clip.hardEdge,
      child: Theme(
        data: Theme.of(context)
            .copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 4),
          title: Text(order.design.title, style: T.title),
          subtitle:
          Text(order.customerName, style: T.caption),
          trailing: Text(
              '₹${order.design.price.toStringAsFixed(0)}',
              style: T.title),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(color: C.border, height: 1),
                  const SizedBox(height: 14),
                  const SectionLabel('Measurements'),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _MeasPill('Chest',
                          '${order.measurements.chest}"'),
                      _MeasPill('Waist',
                          '${order.measurements.waist}"'),
                      _MeasPill(
                          'Hips', '${order.measurements.hips}"'),
                      _MeasPill('Shoulder',
                          '${order.measurements.shoulder}"'),
                      _MeasPill('Length',
                          '${order.measurements.length}"'),
                    ],
                  ),
                  if (order.measurements.notes.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: C.surface,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: C.border, width: 1),
                      ),
                      child: Text(order.measurements.notes,
                          style: T.body),
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

// ════════════════════════════════════════════════════════════════
//  ADD DESIGN
// ════════════════════════════════════════════════════════════════

class AddDesignScreen extends StatefulWidget {
  const AddDesignScreen({super.key});

  @override
  State<AddDesignScreen> createState() => _AddDesignScreenState();
}

class _AddDesignScreenState extends State<AddDesignScreen> {
  final _form = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _desc = TextEditingController();
  final _price = TextEditingController();
  String _cat = 'Kurta';

  final _cats = [
    'Kurta', 'Blouse', 'Shirt', 'Salwar', 'Saree', 'Sherwani', 'Suit'
  ];

  void _save() {
    if (_form.currentState!.validate()) {
      AppData.designs.add(Design(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        tailorName: 'Ravi Tailors',
        title: _title.text.trim(),
        description: _desc.text.trim(),
        price: double.parse(_price.text),
        category: _cat,
        imageUrl:
        'https://images.unsplash.com/photo-1594938298603-c8148c4b4e58?w=600&q=80',
        rating: 0,
        reviews: 0,
      ));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: C.card,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: C.border, width: 1),
          ),
          content: const Row(
            children: [
              Icon(Icons.check_rounded, color: C.white, size: 18),
              SizedBox(width: 10),
              Text('Design published successfully.', style: T.body),
            ],
          ),
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      appBar: AppBar(
        backgroundColor: C.bg,
        elevation: 0,
        leading: _BackButton(),
        title: const Text('Add Design', style: T.title),
        centerTitle: true,
      ),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 40),
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: C.card,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: C.border, width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: C.white15,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                        Icons.add_photo_alternate_outlined,
                        color: C.white70,
                        size: 22),
                  ),
                  const SizedBox(height: 10),
                  const Text('Upload Photo', style: T.body),
                  const SizedBox(height: 4),
                  const Text('Firebase Storage — coming soon',
                      style: T.caption),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const SectionLabel('Design Info'),
            _TField(
                ctrl: _title,
                label: 'Title',
                hint: 'Traditional Kurta',
                icon: Icons.drive_file_rename_outline_rounded),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _cat,
              dropdownColor: C.card,
              style: T.body.copyWith(color: C.white),
              decoration: const InputDecoration(
                labelText: 'Category',
                prefixIcon:
                Icon(Icons.category_outlined, size: 18),
              ),
              items: _cats
                  .map((c) => DropdownMenuItem(
                value: c,
                child: Text(c,
                    style: T.body.copyWith(
                        color: C.white)),
              ))
                  .toList(),
              onChanged: (v) => setState(() => _cat = v!),
            ),
            const SizedBox(height: 12),
            _TField(
                ctrl: _price,
                label: 'Price (₹)',
                hint: '1200',
                icon: Icons.currency_rupee_rounded,
                num: true),
            const SizedBox(height: 12),
            TextFormField(
              controller: _desc,
              maxLines: 4,
              style: T.body.copyWith(color: C.white),
              validator: (v) =>
              (v == null || v.trim().isEmpty) ? 'Required' : null,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText:
                'Describe the fabric, occasion, craftsmanship...',
                alignLabelWithHint: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(bottom: 64),
                  child:
                  Icon(Icons.notes_rounded, size: 18),
                ),
              ),
            ),
            const SizedBox(height: 36),
            PrimaryButton(
              label: 'Publish Design',
              icon: Icons.upload_rounded,
              onTap: _save,
            ),
          ],
        ),
      ),
    );
  }
}