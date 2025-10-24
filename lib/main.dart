import 'package:flutter/material.dart';

void main() => runApp(const NetflixCloneApp());

class NetflixCloneApp extends StatelessWidget {
  const NetflixCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix Clone',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.redAccent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  int? expandedFaqIndex;

  final List<Map<String, String>> movies = [
    {
      'title': 'La Casa de Papel',
      'image': 'https://images.unsplash.com/photo-1574267432553-4b4628081c31?w=400',
      'year': '2021',
      'rating': '16+',
      'type': 'Serie',
      'genres': 'Suspenso, Acción, Drama',
      'description': 'Un grupo de ladrones lleva a cabo el atraco perfecto a la Fábrica Nacional de Moneda y Timbre. Mientras la policía intenta detenerlos, el plan maestro del Profesor se desarrolla.'
    },
    {
      'title': 'Las Guerreras K-POP',
      'image': 'https://images.unsplash.com/photo-1611162617213-7d7a39e9b1d7?w=400',
      'year': '2025',
      'rating': '10+',
      'type': 'Película',
      'genres': 'Comedias, Acción, Infantiles, Fantasía',
      'description': 'Cuando no están llenando estadios, las superestrellas del k-pop Rumi, Mira y Zoey usan sus superpoderes secretos para proteger a sus fans de amenazas sobrenaturales.'
    },
    {
      'title': 'El Juego del Calamar',
      'image': 'https://images.unsplash.com/photo-1611162618071-b39a2ec055fb?w=400',
      'year': '2023',
      'rating': '18+',
      'type': 'Serie',
      'genres': 'Drama, Suspenso, Acción',
      'description': 'Cientos de personas sin recursos aceptan una extraña invitación a competir en juegos infantiles. Les espera un premio tentador, pero las reglas son mortales.'
    },
    {
      'title': 'Stranger Things',
      'image': 'https://images.unsplash.com/photo-1594908900066-3f47337549d8?w=400',
      'year': '2022',
      'rating': '14+',
      'type': 'Serie',
      'genres': 'Ciencia ficción, Terror, Misterio',
      'description': 'Cuando un niño desaparece, su madre, el jefe de policía y sus amigos deben enfrentarse a fuerzas aterradoras para recuperarlo.'
    },
  ];

  final List<Map<String, String>> faqs = [
    {
      'question': '¿Qué es Netflix?',
      'answer': 'Netflix es un servicio de streaming que ofrece una gran variedad de películas, series y documentales premiados en casi cualquier pantalla conectada a Internet.\n\nTodo lo que quieras ver, sin límites ni comerciales, a un coato muy accesible. Siempre hay algo nuevo por descubrir, ¡y todas las semanas se agregan más películas y series!'
    },
    {
      'question': '¿Cuánto cuesta Netflix?',
      'answer': 'Disfruta Netflix en tu smartphone, tablet, smart TV, laptop o dispositivo de streaming, todo por una tarifa plana mensual. Planes desde S/ 28.90 hasta S/ 52.90 al mes. Sin costos adicionales ni contratos.'
    },
    {
      'question': '¿Dónde puedo ver Netflix?',
      'answer': 'Disfruta donde quieras, cuando quieras. Inicia sesión en tu cuenta de Netflix para ver contenido al instante a través de netflix.com desde tu computadora personal o en cualquier dispositivo con conexión a Internet que ofrezca la app de Netflix, como smart TV, smartphones, tablets, reproductores multimedia y consolas de juegos.\n\nAdemás, puedes descargar tus series favoritas con la app para iOS o Android. Con la función de descarga, puedes ver contenido donde vayas y sin conexión a Internet. Lleva Netflix contigo adonde sea.'
    },
    {
      'question': '¿Cómo cancelo?',
      'answer': 'Netflix es flexible. Sin contratos molestos ni compromisos. Cancela la membresía online con solo dos clics. No hay cargos por cancelación. Empieza y termina cuando quieras.'
    },
    {
      'question': '¿Qué puedo ver en Netflix?',
      'answer': 'Netflix tiene un amplio catálogo de películas, series, documentales, animes, originales premiados y más. Todo lo que quieras ver, cuando quieras.'
    },
    {
      'question': '¿Es bueno Netflix para los niños?',
      'answer': 'La experiencia de Netflix para niños está incluida en la membresía para que los padres tengan el control mientras los peques disfrutan series y películas familiares en su propio espacio.\n\nLos perfiles para niños incluyen controles parentales protegidos por PIN que te permiten restringir el contenido que pueden ver los niños en función de la clasificación por edad y bloquear determinados títulos que no quieras que los niños vean.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // --- Hero Section ---
          Stack(
            children: [
              // Imagen de fondo
              Image.network(
                'https://images.unsplash.com/photo-1574375927938-d5a98e8ffe85?w=1200',
                width: double.infinity,
                height: 600,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 600,
                    color: Colors.grey[900],
                  );
                },
              ),
              // Gradiente oscuro
              Container(
                height: 600,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.9),
                    ],
                  ),
                ),
              ),
              // Contenido del Hero
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    // AppBar personalizado
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Logo Netflix
                          const Text(
                            'NETFLIX',
                            style: TextStyle(
                              color: Color(0xFFE50914),
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              letterSpacing: 2,
                            ),
                          ),
                          Row(
                            children: [
                              // Selector de idioma
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white70),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  children: const [
                                    Icon(Icons.language, color: Colors.white, size: 18),
                                    SizedBox(width: 5),
                                    Text('Español', style: TextStyle(color: Colors.white)),
                                    SizedBox(width: 5),
                                    Icon(Icons.arrow_drop_down, color: Colors.white, size: 20),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 15),
                              // Botón Iniciar sesión
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE50914),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  'Iniciar sesión',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Contenido central
                    const SizedBox(height: 80),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Películas y series ilimitadas\ny mucho más',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'A partir de 5/28.90. Cancela cuando quieras.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        '¿Quieres ver Netflix ya? Ingresa tu email para crear una\ncuenta o reiniciar tu membresía de Netflix.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Campo de email y botón
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 55,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Colors.grey[700]!),
                              ),
                              child: const TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 55,
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE50914),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Comenzar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.chevron_right, color: Colors.white, size: 24),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // --- Sección Tendencias con números ---
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Tendencias',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return GestureDetector(
                        onTap: () {
                          _showMovieDialog(context, movie);
                        },
                        child: Container(
                          width: 140,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Stack(
                            children: [
                              // Número grande
                              Positioned(
                                bottom: 0,
                                left: -10,
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    fontSize: 120,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[900],
                                    height: 1,
                                    shadows: [
                                      Shadow(
                                        color: Colors.white.withOpacity(0.3),
                                        offset: const Offset(-2, -2),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Imagen
                              Positioned(
                                top: 0,
                                right: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    movie['image']!,
                                    width: 110,
                                    height: 160,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 110,
                                        height: 160,
                                        color: Colors.grey[800],
                                        child: const Icon(Icons.movie, color: Colors.grey),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // --- Más motivos para unirte ---
          Container(
            color: Colors.black,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Más motivos para unirte',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                // Card 1: Disfruta en tu TV
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF192247),
                        Color(0xFF0F1835),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Disfruta en tu TV',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Ve en smart TV, PlayStation, Xbox, Chromecast, Apple TV, reproductores de Blu-ray y más.',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.pink.withOpacity(0.3),
                              Colors.purple.withOpacity(0.3),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.tv, size: 50, color: Colors.pink[300]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                // Card 2: Descarga tus series
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF192247),
                        Color(0xFF0F1835),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Descarga tus series para verlas offline',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Guarda tu contenido favorito y siempre tendrás algo para ver.',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.pink.withOpacity(0.3),
                              Colors.purple.withOpacity(0.3),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.download_rounded, size: 50, color: Colors.pink[300]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                // Card 3: Disfruta donde quieras
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF192247),
                        Color(0xFF0F1835),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Disfruta donde quieras',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Películas y series ilimitadas en tu teléfono, tablet, laptop y TV.',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.pink.withOpacity(0.3),
                              Colors.purple.withOpacity(0.3),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.devices, size: 50, color: Colors.pink[300]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                // Card 4: Crea perfiles para niños
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF192247),
                        Color(0xFF0F1835),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Crea perfiles para niños',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Los niños vivirán aventuras con sus personajes favoritos en un espacio diseñado exclusivamente para ellos, gratis con tu membresía.',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.pink.withOpacity(0.3),
                              Colors.purple.withOpacity(0.3),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.child_care, size: 50, color: Colors.pink[300]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // --- Sección Series Populares ---
          sectionTitle('Series populares'),
          movieCarousel(movies),

          // --- Sección Series Populares ---
          sectionTitle('Series populares'),
          movieCarousel(movies),

          // --- Sección Recomendadas ---
          sectionTitle('Recomendadas para ti'),
          movieCarousel(movies),

          // --- Preguntas frecuentes ---
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Preguntas frecuentes',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                // Lista de FAQs
                ...faqs.asMap().entries.map((entry) {
                  final index = entry.key;
                  final faq = entry.value;
                  final isExpanded = expandedFaqIndex == index;
                  
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2D2D2D),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              expandedFaqIndex = isExpanded ? null : index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    faq['question']!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Icon(
                                  isExpanded ? Icons.close : Icons.add,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (isExpanded)
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: Text(
                              faq['answer']!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                height: 1.5,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 40),
                // Texto y campo de email al final
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '¿Quieres ver Netflix ya? Ingresa tu email para crear una cuenta o reiniciar tu membresía de Netflix.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Campo de email y botón
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.grey[700]!),
                        ),
                        child: const TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 55,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE50914),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Comenzar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.chevron_right, color: Colors.white, size: 24),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // --- Footer ---
          Container(
            color: Colors.black,
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Texto y teléfono
                const Text(
                  '¿Preguntas? Llama al 0 800 55821',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 30),
                // Links en columnas
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          footerLink('Preguntas frecuentes'),
                          footerLink('Cuenta'),
                          footerLink('Relaciones con inversionistas'),
                          footerLink('Canjear tarjetas de regalo'),
                          footerLink('Formas de ver'),
                          footerLink('Privacidad'),
                          footerLink('Información corporativa'),
                          footerLink('Prueba de velocidad'),
                          footerLink('Solo en Netflix'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          footerLink('Centro de ayuda'),
                          footerLink('Prensa'),
                          footerLink('Empleo'),
                          footerLink('Comprar tarjetas de regalo'),
                          footerLink('Términos de uso'),
                          footerLink('Preferencias de cookies'),
                          footerLink('Contáctanos'),
                          footerLink('Avisos legales'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // Selector de idioma
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.language, color: Colors.grey, size: 18),
                      SizedBox(width: 10),
                      Text(
                        'Español',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_drop_down, color: Colors.grey, size: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // País
                const Text(
                  'Netflix Perú',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 20),
                // Texto legal
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Esta página está protegida por Google reCAPTCHA para comprobar que no eres un robot. ',
                      ),
                      TextSpan(
                        text: 'Más info.',
                        style: TextStyle(
                          color: Colors.blue[700],
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Widgets auxiliares ---
  Widget footerLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 13,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Widget movieCarousel(List<Map<String, String>> list) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final movie = list[index];
          return GestureDetector(
            onTap: () {
              _showMovieDialog(context, movie);
            },
            child: Container(
              width: 130,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        movie['image']!, 
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[800],
                            child: const Icon(Icons.movie, color: Colors.grey),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    movie['title']!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showMovieDialog(BuildContext context, Map<String, String> movie) {
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 700, maxHeight: 600),
            decoration: BoxDecoration(
              color: const Color(0xFF181818),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Imagen de portada
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            child: Image.network(
                              movie['image']!,
                              width: double.infinity,
                              height: 300,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 300,
                                  color: Colors.grey[800],
                                  child: const Icon(Icons.movie, size: 100, color: Colors.grey),
                                );
                              },
                            ),
                          ),
                          // Gradiente
                          Container(
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  const Color(0xFF181818).withOpacity(0.9),
                                ],
                              ),
                            ),
                          ),
                          // Título sobre la imagen
                          Positioned(
                            bottom: 20,
                            left: 20,
                            right: 20,
                            child: Text(
                              movie['title']!.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 2,
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(0, 2),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Contenido
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Etiquetas (año, rating, tipo, géneros)
                            Wrap(
                              spacing: 10,
                              runSpacing: 8,
                              children: [
                                _buildTag(movie['year'] ?? '2025'),
                                _buildTag(movie['rating'] ?? '13+'),
                                _buildTag(movie['type'] ?? 'Película'),
                                ...movie['genres']!.split(', ').map((genre) => _buildTag(genre)),
                              ],
                            ),
                            const SizedBox(height: 20),
                            // Descripción
                            Text(
                              movie['description'] ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 30),
                            // Botón Comienza ya
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE50914),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Comienza ya',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(Icons.chevron_right, color: Colors.white),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Botón cerrar
                Positioned(
                  top: 15,
                  right: 15,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey[700]!),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
      ),
    );
  }
}

// ===================================================
// Pantalla de detalles (mantenida por compatibilidad)
// ===================================================
class MovieDetails extends StatelessWidget {
  final Map<String, String> movie;
  const MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie['title']!)),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.network(movie['image']!, height: 400, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(movie['title']!, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
