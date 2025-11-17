<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
</head>
<body class="d-flex flex-column vh-100 bg-white">

<!-- This is the login/registration page -->


<!-- Nav bar for every website -->
<nav class="navbar navbar-expand-lg bg-light border-bottom py-3 px-4">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold fs-4" href="#">LOGO</a>
    </div>
</nav>

<div class="main-container d-flex align-items-center justify-content-center flex-grow-1 py-5">

    <div class="login-card bg-body-secondary border rounded-4 p-5 text-center w-100" style="max-width: 440px;">
        <p class="text-muted">Welcome back!</p>
        <h2 class="fw-bold mb-4">Login Here</h2>

        <form action="login" method="post" class="text-start">

            <div class="mb-3">
                <label for="emailInput" class="form-label fw-medium mb-2">Username</label>
                <input name="email" type="text" class="form-control form-control-lg" id="emailInput" placeholder="Type your username">
            </div>

<form action="login" method="post">
    Email: <input name="email" type="text"><br>
    Password: <input name="password" type="text"><br>
    <input type="submit" value="Login">
</form>
</body>
</html>