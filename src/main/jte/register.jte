@param String error

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register for an Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg bg-white border-bottom py-3 px-4 sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold fs-4" href="/">LOGO</a>
    </div>
</nav>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card border-0 shadow-lg rounded-4 overflow-hidden">
                <div class="card-body p-4 p-md-5">

                    <h2 class="fw-bold mb-4 text-center">Create Your Profile</h2>

                    @if (error != null)
                        <div class="alert alert-danger" role="alert">
                            ${error}
                        </div>
                    @endif

                    <form action="/register" method="post">

                        <h5 class="mb-3 text-secondary fw-semibold">Account Details</h5>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="username" class="form-label">Username</label>
                                <input name="username" type="text" class="form-control" id="username" placeholder="Choose a username" required>
                            </div>
                            <div class="col-md-6">
                                <label for="password" class="form-label">Password</label>
                                <input name="password" type="password" class="form-control" id="password" placeholder="Create a password" required>
                            </div>
                        </div>

                        <hr class="my-4 text-secondary opacity-25">

                        <h5 class="mb-3 text-secondary fw-semibold">Personal Stats</h5>

                        <div class="mb-3">
                            <label for="name" class="form-label">Full Name</label>
                            <input name="name" type="text" class="form-control" id="name" placeholder="John Doe" required>
                        </div>

                        <div class="row g-3 mb-3">
                            <div class="col-md-4">
                                <label for="age" class="form-label">Age</label>
                                <input name="age" type="number" class="form-control" id="age" placeholder="25" required>
                            </div>
                            <div class="col-md-4">
                                <label for="gender" class="form-label">Gender</label>
                                <select name="gender" class="form-select" id="gender">
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="experience" class="form-label">Experience</label>
                                <select name="experienceLevel" class="form-select" id="experience">
                                    <option value="Beginner">Beginner</option>
                                    <option value="Intermediate">Intermediate</option>
                                    <option value="Advanced">Advanced</option>
                                </select>
                            </div>
                        </div>

                        <div class="row g-3 mb-3">
                            <div class="col-md-4">
                                <label for="height" class="form-label">Height (cm)</label>
                                <input name="height" type="number" step="0.1" class="form-control" id="height" placeholder="175.5" required>
                            </div>
                            <div class="col-md-4">
                                <label for="weight" class="form-label">Weight (kg)</label>
                                <input name="weight" type="number" step="0.1" class="form-control" id="weight" placeholder="70.5" required>
                            </div>
                            <div class="col-md-4">
                                <label for="workouts" class="form-label">Workouts / Week</label>
                                <input name="workoutsPerWeek" type="number" class="form-control" id="workouts" placeholder="3" required>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="goals" class="form-label">Fitness Goals</label>
                            <textarea name="goals" class="form-control" id="goals" rows="3" placeholder="e.g., Lose 5kg, Build muscle, Run a marathon..."></textarea>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-dark btn-lg py-3 rounded-3 fw-bold">Create Account</button>
                        </div>
                    </form>

                    <div class="text-center mt-4">
                        <p class="mb-0 text-muted">Already have an account? <a href="/login" class="text-decoration-none fw-bold text-dark">Login</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>