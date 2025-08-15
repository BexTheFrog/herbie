import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: ProfilePage()));
}

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF9E9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Color(0xFF5D576B),
          centerTitle: true,
          title: Text('Perfil'),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),

                // Container principal do perfil com bordas arredondadas só na parte superior
                Container(
                  margin: EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    color: Color(0xFFFFFCF4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 70,
                            decoration: BoxDecoration(
                              color: Color(0xFFED6A5A),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -35,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xFFED6A5A),
                                  width: 3,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(
                                  'https://img.freepik.com/vetores-gratis/ilustracao-desenhada-a-mao-dos-desenhos-animados-do-cerebro_52683-126692.jpg?semt=ais_hybrid&w=740&q=80',
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 12,
                            top: 20,
                            child: Icon(
                              Icons.edit,
                              color: Color(0xFF5D576B),
                              size: 26,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Text(
                        "USER NAME",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF5D576B),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 2,
                        width: 60,
                        color: Color.fromARGB(255, 224, 170, 170),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildStat(
                              "REALIZOU",
                              "36",
                              "REVISÕES",
                              Color(0xFFED6A5A),
                              Color(0xFF9BC1BC),
                            ),
                            _buildStat(
                              "PULOU",
                              "15",
                              "REVISÕES",
                              Colors.orange.shade700,
                              Color(0xFF9BC1BC),
                            ),
                            _buildStat(
                              "MEMORIZOU",
                              "6",
                              "TÓPICOS",
                              Colors.orange.shade700,
                              Color(0xFF9BC1BC),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),

                // --- MEUS MÓDULOS ---
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'MEUS MÓDULOS',
                    style: TextStyle(
                      color: Color(0xFFED6A5A),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(height: 12),

                Row(
  children: [
    Flexible(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 250,
              height: 50,
              padding: EdgeInsets.all(8), // menos padding para reduzir espaço
              decoration: BoxDecoration(
                color: const Color(0xFFED6A5A),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Text(
                'Desenvolvimento Web',
                style: TextStyle(
                  color: Color(0xFFF4F1BB),
                  fontWeight: FontWeight.bold,
                  fontSize: 14, // reduzir um pouco o tamanho da fonte
                ),
              ),
            ),
            SizedBox(height: 6), // menos espaço
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Técnico em desenvolvimento Web no SENAC',
                style: TextStyle(
                  color: Color(0xFF5D576B),
                  fontSize: 11, // fonte menor
                ),
              ),
            ),
            SizedBox(height: 10), // menos espaço
          ],
        ),
      ),
    ),
    SizedBox(width: 12),
    Flexible(
      flex: 1,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Color(0xFF9BC1BC),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          Icons.add,
          size: 40,
          color: Color(0xFF5D576B),
        ),
      ),
    ),
  ],
)

              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildStat(
    String title,
    String value,
    String subtitle,
    Color titleColor,
    Color subtitleColor,
  ) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: titleColor,
            fontSize: 12,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 2),
        Text(
          subtitle,
          style: TextStyle(
            color: subtitleColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
