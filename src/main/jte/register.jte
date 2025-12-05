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

<nav class="navbar navbar-expand-lg bg-white border-bottom py-3 px-4">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold fs-4" href="/">LOGO</a>
    </div>
</nav>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm rounded-4 p-4 p-md-5">
                <h2 class="fw-bold mb-4 text-center">Create Your Profile</h2>

                @if (error != null)
                    <div class="alert alert-danger" role="alert">${error}</div>
                @endif

                <form action="/register" method="post">
                    <h5 class="mb-3 text-secondary">Account Details</h5>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Username</label>
                            <input name="username" type="text" class="form-control" required placeholder="Choose a username">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Password</label>
                            <input name="password" type="password" class="form-control" required placeholder="Create a password">
                        </div>
                    </div>

                    <hr class="my-4">
                    <h5 class="mb-3 text-secondary">Personal Stats</h5>

                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input name="name" type="text" class="form-control" required>
                    </div>

                    <div class="row g-3 mb-3">
                        <div class="col-md-4">
                            <label class="form-label">Age</label>
                            <input name="age" type="number" class="form-control" required>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Gender</label>
                            <select name="gender" class="form-select">
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Experience Level</label>
                            <select name="experienceLevel" class="form-select">
                                <option value="Beginner">Beginner</option>
                                <option value="Intermediate">Intermediate</option>
                                <option value="Advanced">Advanced</option>
                            </select>
                        </div>
                    </div>

                    <div class="row g-3 mb-3">
                        <div class="col-md-4">
                            <label class="form-label">Height (cm)</label>
                            <input name="height" type="number" step="0.1" class="form-control" required>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Weight (kg)</label>
                            <input name="weight" type="number" step="0.1" class="form-control" required>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">How many times do you workout a week?</label>
                            <input name="workoutsPerWeek" type="number" class="form-control" required>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label">Fitness Goals</label>
                        <textarea name="goals" class="form-control" rows="3" placeholder="e.g., Lose weight, Build muscle..."></textarea>
                    </div>

                    <button type="submit" class="btn btn-dark w-100 py-3 rounded-3 fw-bold">Create Account</button>
                </form>

                <div class="text-center mt-3">
                    <a href="/login" class="text-decoration-none">Already have an account? Login</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>