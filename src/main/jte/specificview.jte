@import cs3220.ai_workout_generator.Workout
@import cs3220.ai_workout_generator.Exercise
@param Workout workout
@param String username

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
    <title>Specific Workout Viewer</title>
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

<section class="container-lg py-5">
    <div class="card mb-4">
        <div class="card-body">
            <h1 class="card-title">${workout.getTitle()}</h1>

            <p class="text-muted mb-2">
                Prompt:
                ${workout.getContent() == null ? "" : (workout.getContent().contains("Prompt:") ? workout.getContent().substring(workout.getContent().lastIndexOf("Prompt:") + 7).trim() : "")}
            </p>

            <div class="mt-3">
                <h3>Your AI-Generated Workout</h3>
                <pre class="bg-light p-3 rounded">${workout.getContent() == null ? "" : workout.getContent()}</pre>
            </div>

            <hr>

            <div class="d-flex gap-2 mt-3">
                <a class="btn btn-outline-dark" href="/workouts">Back to Workouts</a>
            </div>
        </div>
    </div>
</section>

<footer class="text-center py-4 border-top">
    © ${java.time.Year.now().getValue()} AI Workout Generator
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
