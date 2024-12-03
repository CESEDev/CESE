<?php
// Simular las credenciales válidas (esto debería ser reemplazado por una consulta a la base de datos)
$valid_user = "admin";
$valid_password = "12345"; // En un entorno real, nunca se debe almacenar la contraseña en texto plano.

$error = ''; // Inicializamos la variable de error.

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usuario = $_POST["usuario"];
    $contrasena = $_POST["contrasena"];

    if ($usuario == $valid_user && $contrasena == $valid_password) {
        // Redirigir al panel de administrador si las credenciales son correctas
        header("Location: admin_dashboard.php");
        exit;
    } else {
        // Si las credenciales no son correctas, establecer un mensaje de error
        $error = "Usuario o contraseña incorrectos.";
    }
}
?>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Administrador</title>
</head>
<body>
    <h2>Login de Administrador</h2>
    <form method="post" action="login.php">
        <label for="usuario">Usuario:</label>
        <input type="text" id="usuario" name="usuario" required><br><br>

        <label for="contrasena">Contraseña:</label>
        <input type="password" id="contrasena" name="contrasena" required><br><br>

        <input type="submit" value="Iniciar sesión"><br><br>
        
        <!-- Mostrar el error si existe -->
        <?php if (!empty($error)) echo "<p style='color:red;'>$error</p>"; ?>
    </form>
</body>
</html>
