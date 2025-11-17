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
    <nav class="navbar navbar-expand-lg bg-light border-bottom">
        <div class="container-lg">
            <a class="navbar-brand" href="/">LOGO</a>

            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">

                    <li class="nav-item"><a href="/about" class="nav-link">About Us</a></li>

                    <li class="nav-item">
                        <a class="nav-link" href="/profile">
                            ${username == null ? "Profile" : username}
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="${username == null ? "/login" : "/logout"}">
                            ${username == null ? "Login" : "Logout"}
                        </a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
</header>

<p>WIP Profile page</p>

<footer class="text-center py-4 border-top">
    © ${java.time.Year.now().getValue()} AI Workout Generator
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

</body>
</html>