import 'package:flutter/material.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';
import 'package:fruitify/core/widgets/custom_appbar.dart';

class WhoAreWeView extends StatelessWidget {
  const WhoAreWeView({super.key});

  static const routeName = 'who-are-we';

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor = isDarkMode
        ? const Color(0xFF121212)
        : const Color(0xFFF8F9F9);

    final cardColor = isDarkMode ? const Color(0xFF2A2A2A) : Colors.white;

    final primaryColor = isDarkMode ? Colors.white : const Color(0xff252B2D);

    final secondaryColor = isDarkMode
        ? Colors.grey[300]
        : const Color(0xff5F686A);

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: customAppBar(context, title: 'من نحن', showNotification: false),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),

        child: Card(
          elevation: 3,
          color: cardColor,
          shadowColor: isDarkMode ? Colors.black54 : Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Colors.green.withOpacity(.15)
                          : Colors.green.withOpacity(.08),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.eco_rounded,
                      size: 38,
                      color: Colors.green.shade600,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Center(
                  child: Text(
                    'عن فروتيز',
                    style: TextStyles.bold16.copyWith(
                      color: primaryColor,
                      fontSize: 20,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Center(
                  child: Text(
                    'تجربة أسهل لشراء الفواكه الطازجة',
                    textAlign: TextAlign.center,
                    style: TextStyles.semiBold13.copyWith(
                      color: secondaryColor,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                _InfoSection(
                  title: 'من نحن؟',
                  icon: Icons.groups_rounded,
                  color: primaryColor,
                  textColor: secondaryColor,
                  text:
                      'تطبيق "فروتيز" يقدّم لك تجربة فريدة لاختيار وطلب أفضل الفواكه الطازجة والعصائر الطبيعية. يمكنك تصفح مجموعتنا الكبيرة من الفواكه المحلية والمستوردة، واختيار ما يناسب ذوقك.',
                ),

                const SizedBox(height: 18),

                _InfoSection(
                  title: 'جودة المنتجات',
                  icon: Icons.verified_rounded,
                  color: primaryColor,
                  textColor: secondaryColor,
                  text:
                      'نحن نحرص على تقديم منتجات ذات جودة عالية، مع إمكانية متابعة حالة الطلب حتى باب منزلك. كما يوفّر التطبيق عروضًا مميزة يوميًا على تشكيلة واسعة من الفواكه الموسمية والعصائر الطازجة.',
                ),

                const SizedBox(height: 18),

                _InfoSection(
                  title: 'تجربة التسوق',
                  icon: Icons.shopping_basket_rounded,
                  color: primaryColor,
                  textColor: secondaryColor,
                  text:
                      'تطبيق "فروتيز" يسهل عليك اختيار الفواكه حسب الفئة أو النوع، ويوفّر توصيات يومية حسب اختياراتك السابقة. سواء كنت تبحث عن الفواكه الطازجة أو العصائر الطبيعية، ستجد كل ما تحتاجه هنا.',
                ),

                const SizedBox(height: 18),

                _InfoSection(
                  title: 'شارك واستمتع',
                  icon: Icons.favorite_rounded,
                  color: primaryColor,
                  textColor: secondaryColor,
                  text:
                      'يمكنك مشاركة طلباتك مع الأصدقاء والعائلة، والاستمتاع بالعروض الموسمية الحصرية. نحن نهتم بتجربة المستخدم ونسعى لجعل عملية التسوّق سهلة وسريعة.',
                ),

                const SizedBox(height: 18),

                _InfoSection(
                  title: 'ابدأ الآن',
                  icon: Icons.local_shipping_rounded,
                  color: primaryColor,
                  textColor: secondaryColor,
                  text:
                      'ابدأ اليوم واستمتع بأفضل مجموعة فواكه وعصائر طازجة يتم توصيلها مباشرة إلى منزلك بأعلى جودة وسرعة.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  const _InfoSection({
    required this.title,
    required this.icon,
    required this.color,
    required this.textColor,
    required this.text,
  });

  final String title;
  final IconData icon;
  final Color color;
  final Color? textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 22, color: Colors.green.shade600),
            const SizedBox(width: 8),
            Text(title, style: TextStyles.bold16.copyWith(color: color)),
          ],
        ),

        const SizedBox(height: 8),

        Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyles.semiBold13.copyWith(color: textColor, height: 1.7),
        ),
      ],
    );
  }
}
