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
        preferredSize: Size.fromHeight(75),
        child: AppBar(
          backgroundColor: Color(0xFF5D576B),
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo.png',
            height: 50,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),

                // Container do perfil
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
                          // Barra colorida topo
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
                          // Avatar circular
                          Positioned(
                            top: -35,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xFFED6A5A),
                                  width: 10,
                                ),
                              ),
                              child: Semantics(
                                label: 'User avatar',
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage("assets/images/avatar.png"),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                          // Ícone de editar clicável
                          Positioned(
                            right: 12,
                            top: 20,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(4),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Editar perfil clicado!'),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.edit_square,
                                color: Colors.white,
                                size: 26,
                              ),
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
                        width: 350,
                        color: Color.fromARGB(255, 255, 255, 255),
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

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'MEUS MÓDULOS',
                    style: TextStyle(
                      color: Color(0xFFED6A5A),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
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
                              width: 160 ,
                              height: 60,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFED6A5A),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Desenvolvimento Web',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFF4F1BB),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 80),
                              child: Text(
                                'Técnico em desenvolvimento Web no SENAC',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF5D576B),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Adicionar novo módulo clicado!'),
                            ),
                          );
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color(0xFF9BC1BC),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          
                        ),
                      ),
                    ),
                  ],
                ),
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
