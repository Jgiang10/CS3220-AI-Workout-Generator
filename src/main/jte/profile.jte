@import cs3220.ai_workout_generator.User
@import cs3220.ai_workout_generator.UserProfile
@param User user
@param UserProfile profile
@param boolean editMode

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f4;
        }
        .profile-card {
            background-color: #e9ecef;
            border-radius: 15px;
            border: 1px solid #dee2e6;
        }
        .info-label {
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #6c757d;
            font-weight: 700;
            margin-bottom: 4px;
        }
        .info-value {
            font-size: 1.1rem;
            font-weight: 600;
            color: #212529;
            margin-bottom: 0;
        }
        .btn-custom {
            background-color: #8c9eff;
            color: #000;
            font-weight: 600;
            border: none;
            transition: all 0.2s;
        }
        .btn-custom:hover {
            background-color: #7084eb;
            color: #fff;
        }
        .section-spacer {
            margin-bottom: 1.5rem;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg bg-white border-bottom shadow-sm sticky-top">
    <div class="container-lg">
        <a class="navbar-brand fw-bold fs-4" href="/">LOGO</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item"><a href="/about" class="nav-link px-3 text-dark">About Us</a></li>
                <li class="nav-item"><a href="/profile" class="nav-link px-3 text-primary fw-bold">Profile</a></li>
                <li class="nav-item"><a href="/logout" class="nav-link px-3 text-danger">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container py-5 d-flex justify-content-center align-items-center" style="min-height: 85vh;">

    <div class="card profile-card shadow-lg w-100" style="max-width: 800px;">
        <div class="card-body p-4 p-md-5">

            <h2 class="text-center fw-bold mb-5">About Me</h2>

            @if(!editMode)
                <div class="row">
                    <div class="col-md-6 border-end-md border-secondary-subtle">
                        <div class="section-spacer">
                            <div class="info-label">Full Name</div>
                            <div class="info-value">${profile.getName()}</div>
                        </div>
                        <div class="section-spacer">
                            <div class="info-label">Username</div>
                            <div class="info-value">${user.getUsername()}</div>
                        </div>

                        <div class="d-flex gap-5 section-spacer">
                            <div>
                                <div class="info-label">Age</div>
                                <div class="info-value">${profile.getAge()}</div>
                            </div>
                            <div>
                                <div class="info-label">Gender</div>
                                <div class="info-value">${profile.getGender()}</div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 ps-md-5">
                        <div class="d-flex gap-5 section-spacer">
                            <div>
                                <div class="info-label">Height</div>
                                <div class="info-value">${profile.getHeight()} cm</div>
                            </div>
                            <div>
                                <div class="info-label">Weight</div>
                                <div class="info-value">${profile.getWeight()} kg</div>
                            </div>
                        </div>
                        <div class="section-spacer">
                            <div class="info-label">Experience Level</div>
                            <span class="badge bg-secondary fs-6 fw-normal mt-1">${profile.getExperienceLevel()}</span>
                        </div>
                        <div class="section-spacer">
                            <div class="info-label">Workouts Per Week</div>
                            <div class="info-value">${profile.getWorkoutsPerWeek()} Days</div>
                        </div>
                    </div>
                </div>

                <hr class="my-4 text-secondary opacity-25">

                <div class="mb-5 text-center">
                    <div class="info-label mb-2">Workout Goals</div>
                    <div class="info-value fs-5 fst-italic">"${profile.getGoals()}"</div>
                </div>

                <div class="d-flex flex-column align-items-center gap-3">
                    <a href="/profile?edit=true" class="btn btn-custom rounded-pill shadow-sm px-5 py-2">
                        Edit Personal Info
                    </a>
                    <a href="/generate" class="btn btn-outline-dark rounded-pill px-4 border-0 text-decoration-underline">
                        Back to Generator
                    </a>
                </div>

            @else
                <form action="/updateProfile" method="post">
                    <div class="row g-4">
                        <div class="col-md-6">
                            <h5 class="mb-3 text-secondary">Basic Info</h5>

                            <label for="inputName" class="form-label fw-bold small">Full Name</label>
                            <input id="inputName" name="name" type="text" class="form-control mb-3" value="${profile.getName()}">

                            <div class="row">
                                <div class="col-6">
                                    <label for="inputAge" class="form-label fw-bold small">Age</label>
                                    <input id="inputAge" name="age" type="number" class="form-control mb-3" value="${profile.getAge()}">
                                </div>
                                <div class="col-6">
                                    <label for="selectGender" class="form-label fw-bold small">Gender</label>
                                    <select id="selectGender" name="gender" class="form-select mb-3">
                                        <option value="Male" selected="${profile.getGender().equals("Male")}">Male</option>
                                        <option value="Female" selected="${profile.getGender().equals("Female")}">Female</option>
                                        <option value="Other" selected="${profile.getGender().equals("Other")}">Other</option>
                                    </select>
                                </div>
                            </div>

                            <label for="selectExperience" class="form-label fw-bold small">Experience Level</label>
                            <select id="selectExperience" name="experienceLevel" class="form-select mb-3">
                                <option value="Beginner" selected="${profile.getExperienceLevel().equals("Beginner")}">Beginner</option>
                                <option value="Intermediate" selected="${profile.getExperienceLevel().equals("Intermediate")}">Intermediate</option>
                                <option value="Advanced" selected="${profile.getExperienceLevel().equals("Advanced")}">Advanced</option>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <h5 class="mb-3 text-secondary">Body Stats</h5>

                            <div class="row">
                                <div class="col-6">
                                    <label for="inputHeight" class="form-label fw-bold small">Height (cm)</label>
                                    <input id="inputHeight" name="height" type="number" step="0.1" class="form-control mb-3" value="${profile.getHeight()}">
                                </div>
                                <div class="col-6">
                                    <label for="inputWeight" class="form-label fw-bold small">Weight (kg)</label>
                                    <input id="inputWeight" name="weight" type="number" step="0.1" class="form-control mb-3" value="${profile.getWeight()}">
                                </div>
                            </div>

                            <label for="inputWorkouts" class="form-label fw-bold small">Workouts / Week</label>
                            <input id="inputWorkouts" name="workoutsPerWeek" type="number" class="form-control mb-3" value="${profile.getWorkoutsPerWeek()}">
                        </div>
                    </div>

                    <div class="mt-3">
                        <label for="inputGoals" class="form-label fw-bold small">Workout Goals</label>
                        <textarea id="inputGoals" name="goals" class="form-control" rows="3">${profile.getGoals()}</textarea>
                    </div>

                    <div class="text-center mt-5 d-flex justify-content-center gap-3">
                        <button type="submit" class="btn btn-success px-4 rounded-pill fw-bold">Save Changes</button>
                        <a href="/profile" class="btn btn-outline-secondary px-4 rounded-pill">Cancel</a>
                    </div>
                </form>
            @endif

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>