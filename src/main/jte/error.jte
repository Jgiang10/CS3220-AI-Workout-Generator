@param int status
@param String error
@param String message
@param String path
@param String username

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Error Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
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


<section class="error d-flex justify-content-center align-items-center">
    <div class="error-content text-center">
        <h1>Error ${status} : ${error}</h1>
        <p>${message}</p>
        <p>Path: ${path}</p>
        <a href="/home" class="btn btn-primary">Back To Home Page</a>
    </div>
</section>
<footer class="text-center py-4 border-top">
    © ${java.time.Year.now().getValue()} AI Workout Generator
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>