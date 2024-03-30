import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Aplicación'),
        // Icono de hamburguesa en la AppBar
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Abre el Drawer
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: MyDrawer(), // Nuestro menú hamburguesa
      body: MyTestPage(), // Aquí se muestra el código de MyTestPage
    );
  }
}


class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          // Encabezado del Drawer
          UserAccountsDrawerHeader(
            accountName: Text('Nombre de Usuario'),
            accountEmail: Text('correo@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('U', style: TextStyle(fontSize: 24)),
            ),
          ),
          // Opciones del menú
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              // Navegar a la página de inicio
              Navigator.pop(context);
              // Aquí puedes agregar la lógica para navegar a la página deseada
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configuración'),
            onTap: () {
              // Navegar a la página de configuración
              Navigator.pop(context);
              // Aquí puedes agregar la lógica para navegar a la página deseada
            },
          ),
          // Agrega más opciones de menú según tus necesidades
          // ...
        ],
      ),
    );
  }
}

class MyTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Selecciona una opción:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyOptionButton(icon: Icons.alarm, label: 'Seleccionar Alarma'),
            MyOptionButton(icon: Icons.vpn_key, label: 'Seleccionar Clave'),
            MyOptionButton(icon: Icons.camera_alt, label: 'Seleccionar Cámara'),
          ],
        ),
        SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text('$index'),
                ),
                title: Text('Elemento $index'),
                subtitle: Text('Descripción del elemento $index'),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'FIN DE LA APLICACIÓN',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class MyOptionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const MyOptionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
