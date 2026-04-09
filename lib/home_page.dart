import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Color _alpha(Color color, double opacity) => color.withValues(alpha: opacity);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final Uri _mineGarageUrl = Uri.parse('https://minegarage.com/');
  static final Uri _contactUrl = Uri.parse('mailto:contact@dansplab.com');

  Future<void> _launchUrl(Uri url) async {
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        debugPrint('Could not launch $url');
      }
    } catch (e) {
      debugPrint('Error launching $url: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF05110E),
                    Color(0xFF0A2018),
                    Color(0xFF123629),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            top: -120,
            right: -40,
            child: _GlowOrb(
              size: 320,
              color: Color(0xFF2CB67D),
              opacity: 0.22,
            ),
          ),
          const Positioned(
            left: -100,
            top: 220,
            child: _GlowOrb(
              size: 240,
              color: Color(0xFFF7C66F),
              opacity: 0.14,
            ),
          ),
          const Positioned(
            bottom: -120,
            right: 90,
            child: _GlowOrb(
              size: 260,
              color: Color(0xFF7EE2B8),
              opacity: 0.12,
            ),
          ),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final bool isCompact = constraints.maxWidth < 760;
                final bool isMedium = constraints.maxWidth < 1080;
                final double horizontalPadding = isCompact
                    ? 20
                    : isMedium
                        ? 32
                        : 56;

                return SelectionArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      isCompact ? 24 : 34,
                      horizontalPadding,
                      28,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1180),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeroSection(theme, isCompact, isMedium),
                            const SizedBox(height: 28),
                            _buildFeatureStrip(theme, isCompact),
                            const SizedBox(height: 28),
                            _buildShowcaseSection(theme, isCompact, isMedium),
                            const SizedBox(height: 28),
                            _buildFooter(theme, isCompact),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(
    ThemeData theme,
    bool isCompact,
    bool isMedium,
  ) {
    final TextTheme textTheme = theme.textTheme;
    final Widget intro = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: _alpha(Colors.white, 0.05),
            border: Border.all(color: _alpha(Colors.white, 0.08)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.asset(
              'assets/logo/Original_small.png',
              width: isCompact ? 180 : 220,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: _alpha(Colors.white, 0.08),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: _alpha(Colors.white, 0.08)),
          ),
          child: Text(
            'Consulting studio  •  Product design, apps, and custom software',
            style: textTheme.bodyMedium!.copyWith(
              color: _alpha(Colors.white, 0.85),
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
            ),
          ),
        ),
        const SizedBox(height: 22),
        Text(
          'Dansp Lab builds digital products for companies, teams, and founders.',
          style: (isCompact ? textTheme.displaySmall : textTheme.displayLarge)
              ?.copyWith(
            color: Colors.white,
            fontSize: isCompact ? 40 : null,
          ),
        ),
        const SizedBox(height: 18),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Text(
            'Dansp Lab helps clients turn ideas into polished apps, websites, and tailored software with a clean build process and strong visual finish.',
            style: textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            FilledButton.icon(
              onPressed: () => _launchUrl(_contactUrl),
              icon: const Icon(Icons.chat_bubble_outline_rounded),
              label: const Text('Start a Project'),
            ),
            FilledButton.icon(
              onPressed: () => _launchUrl(_mineGarageUrl),
              icon: const Icon(Icons.open_in_new_rounded),
              label: const Text('View Mine Garage'),
            ),
          ],
        ),
        const SizedBox(height: 28),
        const Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            _InfoPill(
              label: 'What we do',
              value: 'Apps, web, software',
            ),
            _InfoPill(
              label: 'How we work',
              value: 'Consulting and delivery',
            ),
            _InfoPill(
              label: 'Showcase',
              value: 'Mine Garage',
            ),
          ],
        ),
      ],
    );

    final Widget spotlight = Container(
      padding: EdgeInsets.all(isCompact ? 22 : 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: _alpha(Colors.white, 0.12)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _alpha(Colors.white, 0.14),
            _alpha(Colors.white, 0.05),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: _alpha(Colors.black, 0.18),
            blurRadius: 30,
            offset: const Offset(0, 24),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color(0xFF7EE2B8),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'What clients can expect',
                style: textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: isCompact ? 24 : 36),
          Text(
            'A studio brand first, with product work showcased clearly underneath.',
            style: textTheme.headlineMedium?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            'The page now gives Dansp Lab the lead position while leaving room to present shipped work in a more premium and structured way.',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 22),
          const _ChecklistItem(text: 'Studio identity is now the main focus'),
          const SizedBox(height: 10),
          const _ChecklistItem(text: 'Mine Garage remains a polished showcase'),
          const SizedBox(height: 10),
          const _ChecklistItem(text: 'Clear path for new client inquiries'),
        ],
      ),
    );

    return Container(
      padding: EdgeInsets.all(isCompact ? 22 : 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        border: Border.all(color: _alpha(Colors.white, 0.08)),
        color: _alpha(Colors.white, 0.04),
      ),
      child: isMedium
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                intro,
                const SizedBox(height: 28),
                spotlight,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 12, child: intro),
                const SizedBox(width: 28),
                Expanded(flex: 9, child: spotlight),
              ],
            ),
    );
  }

  Widget _buildFeatureStrip(ThemeData theme, bool isCompact) {
    const List<Widget> cards = [
      _FeatureCard(
        icon: Icons.grid_view_rounded,
        title: 'Consulting first',
        description:
            'The site now introduces Dansp Lab as a service business before moving into showcase work.',
      ),
      _FeatureCard(
        icon: Icons.phone_iphone_rounded,
        title: 'Responsive behavior',
        description:
            'Layouts stack naturally on small screens and expand gracefully on wider displays.',
      ),
      _FeatureCard(
        icon: Icons.auto_awesome_rounded,
        title: 'Premium presentation',
        description:
            'Layered gradients, glass panels, and stronger typography make the consultancy feel more established.',
      ),
    ];

    if (isCompact) {
      return const Column(
        children: [
          _FeatureCard(
            icon: Icons.grid_view_rounded,
            title: 'Consulting first',
            description:
                'The site now introduces Dansp Lab as a service business before moving into showcase work.',
          ),
          SizedBox(height: 18),
          _FeatureCard(
            icon: Icons.phone_iphone_rounded,
            title: 'Responsive behavior',
            description:
                'Layouts stack naturally on small screens and expand gracefully on wider displays.',
          ),
          SizedBox(height: 18),
          _FeatureCard(
            icon: Icons.auto_awesome_rounded,
            title: 'Premium presentation',
            description:
                'Layered gradients, glass panels, and stronger typography make the consultancy feel more established.',
          ),
        ],
      );
    }

    return const Wrap(
      spacing: 18,
      runSpacing: 18,
      children: cards,
    );
  }

  Widget _buildShowcaseSection(
    ThemeData theme,
    bool isCompact,
    bool isMedium,
  ) {
    final TextTheme textTheme = theme.textTheme;

    return Container(
      padding: EdgeInsets.all(isCompact ? 22 : 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: _alpha(Colors.black, 0.16),
        border: Border.all(color: _alpha(Colors.white, 0.08)),
      ),
      child: isMedium
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildShowcaseCopy(textTheme, isCompact),
                const SizedBox(height: 24),
                _buildShowcaseCard(textTheme, isCompact),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 8,
                  child: _buildShowcaseCopy(textTheme, isCompact),
                ),
                const SizedBox(width: 24),
                Expanded(
                  flex: 7,
                  child: _buildShowcaseCard(textTheme, isCompact),
                ),
              ],
            ),
    );
  }

  Widget _buildShowcaseCopy(TextTheme textTheme, bool isCompact) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Showcase Project',
          style: textTheme.bodyMedium!.copyWith(
            color: const Color(0xFFF7C66F),
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Mine Garage - Your smart garage',
          style: textTheme.displaySmall?.copyWith(
            color: Colors.white,
            fontSize: isCompact ? 34 : 40,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Project make in Flutter and disponable for Android and iOS. Using most modern tools and techniques.',
          style: textTheme.bodyLarge,
        ),
     
        const SizedBox(height: 22),
        const Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _TagChip(label: 'Firebase'),
            _TagChip(label: 'Git'),
            _TagChip(label: 'Flutter'),
            _TagChip(label: 'Riverpod'),
            _TagChip(label: 'Provider'),
            _TagChip(label: 'Clean Architecture'),
            _TagChip(label: 'S.O.L.I.D'),
            _TagChip(label: 'Unit Test'),
            _TagChip(label: 'CI/CD'),
            _TagChip(label: 'PushNotifiation'),
            _TagChip(label: 'GeoLocation'),
            _TagChip(label: 'RestAPI'),
          ],
        ),
      ],
    );
  }

  Widget _buildShowcaseCard(TextTheme textTheme, bool isCompact) {
    return InkWell(
      onTap: () => _launchUrl(_mineGarageUrl),
      borderRadius: BorderRadius.circular(32),
      child: Container(
        padding: EdgeInsets.all(isCompact ? 20 : 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _alpha(Colors.white, 0.13),
              _alpha(Colors.white, 0.05),
            ],
          ),
          border: Border.all(color: _alpha(Colors.white, 0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: isCompact ? 116 : 132,
                height: isCompact ? 116 : 132,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: _alpha(Colors.white, 0.12),
                  boxShadow: [
                    BoxShadow(
                      color: _alpha(Colors.black, 0.18),
                      blurRadius: 24,
                      offset: const Offset(0, 18),
                    ),
                  ],
                  border: Border.all(color: _alpha(Colors.white, 0.18)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Image.asset(
                    'assets/logo/mine_garage.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Selected case study',
              style: textTheme.bodyMedium?.copyWith(
                color: const Color(0xFFF7C66F),
                fontWeight: FontWeight.w700,
                letterSpacing: 0.4,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Mine Garage',
              style: textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Mine garage is ideal app to help you keep your vehicles always up to date, simple, purely, and modernly.',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: _alpha(Colors.black, 0.16),
                border: Border.all(
                  color: _alpha(Colors.white, 0.08),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.language_rounded,
                    color: Color(0xFF7EE2B8),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'minegarage.com',
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_outward_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(ThemeData theme, bool isCompact) {
    final TextTheme textTheme = theme.textTheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isCompact ? 22 : 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: _alpha(Colors.white, 0.05),
        border: Border.all(color: _alpha(Colors.white, 0.08)),
      ),
      child: Flex(
        direction: isCompact ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
            isCompact ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Dansp Lab',
                style: textTheme.titleLarge?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                'Available for custom projects, product consulting, and software delivery.',
                style: textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(
            width: isCompact ? 0 : 20,
            height: isCompact ? 18 : 0,
          ),
          TextButton.icon(
            onPressed: () => _launchUrl(_contactUrl),
            icon: const Icon(Icons.mail_outline_rounded),
            label: const Text('contact@dansplab.com'),
          ),
        ],
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  final double size;
  final Color color;
  final double opacity;

  const _GlowOrb({
    Key? key,
    required this.size,
    required this.color,
    required this.opacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              _alpha(color, opacity),
              _alpha(color, 0),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  final String label;
  final String value;

  const _InfoPill({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: _alpha(Colors.white, 0.06),
        border: Border.all(color: _alpha(Colors.white, 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: textTheme.bodyMedium?.copyWith(
              color: _alpha(Colors.white, 0.68),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 360),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: _alpha(Colors.white, 0.05),
          border: Border.all(color: _alpha(Colors.white, 0.08)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: _alpha(Colors.white, 0.08),
              ),
              child: Icon(icon, color: const Color(0xFFF7C66F)),
            ),
            const SizedBox(height: 18),
            Text(
              title,
              style: textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(description, style: textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class _ChecklistItem extends StatelessWidget {
  final String text;

  const _ChecklistItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 3),
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _alpha(const Color(0xFF7EE2B8), 0.18),
          ),
          child: const Icon(
            Icons.check_rounded,
            size: 14,
            color: Color(0xFF7EE2B8),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: textTheme.bodyMedium?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;

  const _TagChip({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: _alpha(Colors.white, 0.06),
        border: Border.all(color: _alpha(Colors.white, 0.08)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
