import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/app_data.dart';
import '../../widgets/common_widgets.dart';

class AddDesignScreen extends StatefulWidget {
  const AddDesignScreen({super.key});

  @override
  State<AddDesignScreen> createState() => _AddDesignScreenState();
}

class _AddDesignScreenState extends State<AddDesignScreen> {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _desc = TextEditingController();
  final _price = TextEditingController();
  String _category = 'Kurta';

  final List<String> _categories = [
    'Kurta', 'Blouse', 'Shirt', 'Salwar', 'Saree', 'Sherwani', 'Suit'
  ];

  final List<String> _emojis = ['👘', '👗', '👔', '🥻', '🎩', '🧥', '👚'];
  int _selectedEmoji = 0;

  void _save() {
    if (_formKey.currentState!.validate()) {
      AppData.designs.add(Design(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        tailorName: 'Ravi Tailors',
        title: _title.text,
        description: _desc.text,
        price: double.parse(_price.text),
        category: _category,
        emoji: _emojis[_selectedEmoji],
        rating: 0,
        reviews: 0,
      ));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.emerald,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          behavior: SnackBarBehavior.floating,
          content: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 8),
              Text('Design added successfully!',
                  style: TextStyle(fontWeight: FontWeight.w600)),
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
      backgroundColor: AppColors.deepNavy,
      appBar: AppBar(
        title: const Text('Add New Design'),
        backgroundColor: AppColors.royalIndigo,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // ── Emoji picker ──
            const Text('Choose Icon',
                style: TextStyle(
                    color: AppColors.gold,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                _emojis.length,
                    (i) => GestureDetector(
                  onTap: () => setState(() => _selectedEmoji = i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: _selectedEmoji == i
                          ? AppColors.gold.withOpacity(0.2)
                          : AppColors.royalIndigo,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _selectedEmoji == i
                            ? AppColors.gold
                            : AppColors.divider,
                        width: _selectedEmoji == i ? 1.5 : 1,
                      ),
                    ),
                    child: Center(
                      child: Text(_emojis[i],
                          style: const TextStyle(fontSize: 22)),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ── Upload placeholder ──
            Container(
              height: 130,
              decoration: BoxDecoration(
                color: AppColors.royalIndigo,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: AppColors.divider,
                    width: 1.5,
                    style: BorderStyle.solid),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.gold.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add_photo_alternate_outlined,
                        color: AppColors.gold, size: 22),
                  ),
                  const SizedBox(height: 8),
                  const Text('Upload Design Photo',
                      style: TextStyle(
                          color: AppColors.textMuted, fontSize: 14)),
                  const Text('(Coming soon — Firebase Storage)',
                      style: TextStyle(
                          color: AppColors.textMuted, fontSize: 11)),
                ],
              ),
            ),

            const SizedBox(height: 24),

            _label('Design Title'),
            TextFormField(
              controller: _title,
              style: const TextStyle(color: AppColors.textLight),
              validator: (v) =>
              (v == null || v.isEmpty) ? 'Required' : null,
              decoration: const InputDecoration(
                hintText: 'e.g. Traditional Kurta',
                prefixIcon:
                Icon(Icons.title, color: AppColors.gold, size: 20),
              ),
            ),

            const SizedBox(height: 14),
            _label('Category'),
            DropdownButtonFormField<String>(
              value: _category,
              dropdownColor: AppColors.cardDark,
              style: const TextStyle(color: AppColors.textLight),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.category_outlined,
                    color: AppColors.gold, size: 20),
              ),
              items: _categories
                  .map((c) => DropdownMenuItem(
                value: c,
                child: Text(c,
                    style: const TextStyle(
                        color: AppColors.textLight)),
              ))
                  .toList(),
              onChanged: (v) => setState(() => _category = v!),
            ),

            const SizedBox(height: 14),
            _label('Price (₹)'),
            TextFormField(
              controller: _price,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: AppColors.textLight),
              validator: (v) =>
              (v == null || v.isEmpty) ? 'Required' : null,
              decoration: const InputDecoration(
                hintText: 'e.g. 1200',
                prefixIcon: Icon(Icons.currency_rupee,
                    color: AppColors.gold, size: 20),
              ),
            ),

            const SizedBox(height: 14),
            _label('Description'),
            TextFormField(
              controller: _desc,
              maxLines: 4,
              style: const TextStyle(color: AppColors.textLight),
              validator: (v) =>
              (v == null || v.isEmpty) ? 'Required' : null,
              decoration: const InputDecoration(
                hintText:
                'Describe the design, fabric, occasion, special features...',
                alignLabelWithHint: true,
              ),
            ),

            const SizedBox(height: 32),
            GoldButton(
                label: 'Save Design', icon: Icons.save, onTap: _save),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(text,
        style: const TextStyle(
            color: AppColors.gold,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1)),
  );
}
