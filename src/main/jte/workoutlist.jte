@param String username
@param java.util.List<cs3220.ai_workout_generator.Workout> workouts

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <title>Workout List</title>
</head>
<body>
<header class="p-3 bg-lightgray">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <a class="navbar-brand fw-bold" href="/">ForgeFit</a>

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

<section class="container-lg py-4">
    <h1>Workout List Page</h1>

    @if (workouts == null || workouts.isEmpty())
        <p>No workouts available.</p>
    @else
        <div class="list-group">
            @for (var w: workouts)
            <a class="list-group-item list-group-item-action" href="/workouts/${w.getId()}">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1">${w.getTitle()}</h5>
                </div>
                <p class ="mb-1">${w.getContent()}</p>
                <small>Owner: ${w.getOwnerUsername()}</small>
            </a>
            @endfor
        </div>
    @endif
</section>

<footer class="text-center py-4 border-top">
    © ${java.time.Year.now().getValue()} AI Workout Generator
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>