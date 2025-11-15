@import cs3220.ai_workout_generator.Workout
@import cs3220.ai_workout_generator.Exercise
@param Workout workout

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <title>Specific Workout Viewer for ${workout.getTitle()}</title>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Logo</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="#">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Registration/Profile</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<section class="workout rounded shadow-sm">
    <h1>${workout.getTitle()}</h1>
    <br>

    <h2>Exercises:</h2>
    <ul>
        @for (Exercise e: workout.getExercises())
            <li>
                ${e.getSets()} × ${e.getName()} (${e.getReps()} reps)
            </li>
        @endfor
    </ul>
</section>

<div class="buttons d-flex justify-content-center gap-3">
    <button type="submit" id="savebtn">Save Button</button>
    <button type="submit" id="listwrkoutbtn">List Workouts Button</button>
</div>
<footer>
    Copyright &copy;
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>