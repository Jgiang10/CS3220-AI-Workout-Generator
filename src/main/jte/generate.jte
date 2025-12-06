@param cs3220.ai_workout_generator.Controller.User bodyInfo
@param String username
@param String prompt
@param String result
@param Long workoutId

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Generate Workout</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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

<header class="container-lg py-5 text-center">
    <h1 class="display-5 hero-title">What are you looking to work on today?</h1>
</header>


<section class="container-lg pb-4">

    <div class="card card-soft rounded-3xl info-card">
        <div class="card-body text-center">
            <h3>Your Profile</h3>
            <p>
                Logged in as:
                <strong>${username == null ? "Guest" : username}</strong>
            </p>
        </div>
    </div>

</section>


<section class="container-lg pb-5">
    <div class="card">
        <div class="card-body">

            <form method="post" action="/generate">
                <label class="form-label fw-bold">Prompt</label>

                <div class="input-group">
                    <input name="prompt" class="form-control form-control-lg"
                           value="${prompt == null ? "" : prompt}"
                           placeholder="e.g. 30-minute dumbbell push workout">

                    <button class="btn btn-dark btn-lg" type="submit">Generate</button>
                </div>
            </form>

        </div>
    </div>
</section>


<section class="container-lg pb-5"
         style="${result == null ? "display:none" : ""}">
    <div class="card card-soft rounded-3xl">
        <div class="card-header bg-transparent">
            <h3>Your AI-Generated Workout</h3>
        </div>

        <div class="card-body">
            <pre>${result == null ? "" : result}</pre>
        </div>

        <div class="card-footer d-flex justify-content-between">

            <a class="btn btn-outline-dark"
               href="${workoutId == null ? "/workouts" : ("/workouts/" + workoutId)}">
                Open Saved Workout
            </a>

            <a class="btn btn-outline-dark" href="/workouts">View All Workouts</a>

        </div>
    </div>
</section>


<footer class="text-center py-4 border-top">
    © ${java.time.Year.now().getValue()} AI Workout Generator
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

</body>
</html>
