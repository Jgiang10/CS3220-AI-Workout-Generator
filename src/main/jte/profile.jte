@param String username

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
    <title>Profile</title>
</head>
<body>
<header class="p-3 bg-lightgray">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <a class="navbar-brand fw-bold fs-4" href="/">LOGO</a>

        <nav class="nav">
            <a class="nav-link link" href="/about">About Us</a>

            <a class="nav-link link" href="/profile">
                ${username == null ? "Profile" : username}
            </a>

            <a class="nav-link link" href="${username == null ? "/login" : "/logout"}">
                ${username == null ? "Login" : "Logout"}
            </a>
        </nav>
    </div>
</header>

<p>WIP Profile page</p>

<footer class="text-center py-4 border-top">
    © ${java.time.Year.now().getValue()} AI Workout Generator
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

</body>
</html>