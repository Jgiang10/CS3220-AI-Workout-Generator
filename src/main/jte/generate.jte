@param cs3220.ai_workout_generator.User bodyInfo
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
    <link rel="stylesheet" href="/style.css">
</head>

<body>

<nav class="navbar navbar-expand-lg bg-light border-bottom">
    <div class="container-lg">
        <a class="navbar-brand" href="/">LOGO</a>

        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">

                <li class="nav-item"><a href="/about" class="nav-link">About Us</a></li>

                <li class="nav-item">
                    <a class="nav-link" href="/profile">
                        ${bodyInfo == null ? "Profile" : bodyInfo.getName()}
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="${bodyInfo == null ? "/login" : "/logout"}">
                        ${bodyInfo == null ? "Login" : "Logout"}
                    </a>
                </li>

            </ul>
        </div>
    </div>
</nav>


<header class="container-lg py-5 text-center">
    <h1 class="display-5 hero-title">What are you looking to work on today?</h1>
</header>


<section class="container-lg pb-4">

    <div class="card card-soft rounded-3xl info-card">
        <div class="card-body text-center">
            <h3>Your Profile</h3>
            <p>
                Logged in as:
                <strong>${bodyInfo == null ? "Guest" : bodyInfo.getName()}</strong>
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

</body>
</html>
