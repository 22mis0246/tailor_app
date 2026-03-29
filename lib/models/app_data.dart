// ─── Models ───────────────────────────────────────────────────────────────────

class Design {
  final String id;
  final String tailorName;
  final String title;
  final String description;
  final double price;
  final String category;
  final String emoji;
  final double rating;
  final int reviews;

  Design({
    required this.id,
    required this.tailorName,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.emoji,
    this.rating = 4.5,
    this.reviews = 12,
  });
}

class Measurements {
  final String chest;
  final String waist;
  final String hips;
  final String shoulder;
  final String length;
  final String notes;

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

// ─── In-Memory Store ──────────────────────────────────────────────────────────

class AppData {
  static final List<Design> designs = [
    Design(
      id: '1',
      tailorName: 'Ravi Tailors',
      title: 'Traditional Kurta',
      description:
      'Handcrafted cotton kurta with intricate embroidery. Perfect for festivals and celebrations.',
      price: 1200,
      category: 'Kurta',
      emoji: '👘',
      rating: 4.8,
      reviews: 34,
    ),
    Design(
      id: '2',
      tailorName: 'Meena Creations',
      title: 'Bridal Silk Blouse',
      description:
      'Luxurious silk blouse with zari work and hand-embellished borders. Made to order.',
      price: 2500,
      category: 'Blouse',
      emoji: '👗',
      rating: 4.9,
      reviews: 18,
    ),
    Design(
      id: '3',
      tailorName: 'Style Studio',
      title: 'Premium Formal Shirt',
      description:
      'Crisp Egyptian cotton shirt tailored to your exact measurements. Office perfection.',
      price: 800,
      category: 'Shirt',
      emoji: '👔',
      rating: 4.6,
      reviews: 52,
    ),
    Design(
      id: '4',
      tailorName: 'Ravi Tailors',
      title: 'Anarkali Salwar',
      description:
      'Flowing Anarkali suit in georgette with embroidered dupatta. Statement party wear.',
      price: 3200,
      category: 'Salwar',
      emoji: '🥻',
      rating: 4.7,
      reviews: 29,
    ),
    Design(
      id: '5',
      tailorName: 'Royal Stitch',
      title: 'Sherwani',
      description:
      'Regal sherwani in raw silk with gold threadwork. Fit for weddings and ceremonies.',
      price: 5500,
      category: 'Sherwani',
      emoji: '🎩',
      rating: 5.0,
      reviews: 11,
    ),
  ];

  static final List<Order> orders = [];
}
