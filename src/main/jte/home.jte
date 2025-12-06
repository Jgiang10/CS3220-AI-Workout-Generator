@param String username

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>AI Workout Generator</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
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

<main class="container text-center py-5">

    <h1 class="display-4 fw-bold mt-4">ForgeFit</h1>
    <h2 class="display-4">Your AI Workout Generator</h2>

    <p class="lead mt-3">
        Create personalized workouts instantly based on your goals, equipment, and experience level.
    </p>

    <div class="mt-4">
        <a href="/generate" class="btn btn-dark btn-lg px-4 py-2">
            Generate Workout
        </a>
    </div>

</main>

<footer class="text-center py-4 border-top">
    <div class="small">
        © ${java.time.Year.now().getValue()} AI Workout Generator
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
