<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About You - AI Workout Generator</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">

    <style>
        body {
            background-color: #f9f9f9;
        }


        .main-header {
            background-color: #f0f0f0;
            border-bottom: 1px solid #ddd;
        }


        .form-box {
            background-color: #f0f0f0;
            padding: 2.5rem 3rem;
            border-radius: 1.25rem; /* 20px */
            border: 1px solid #ddd;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.05);
            max-width: 700px; /* A bit wider to fit labels and inputs */
            width: 100%;
        }


        .form-label {
            font-weight: 600;
            color: #333;
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

<header class="main-header">
    <nav class="navbar navbar-expand">
        <div class="container-fluid mx-lg-5">
            <span class="navbar-brand mb-0 h1 fs-4 fw-bold" style="color: #333;">LOGO</span>

            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="/about-us">About Us</a>
                <a class="nav-link" href="/profile">Profile</a>
            </div>
        </div>
    </nav>
</header>

<main class="container flex-grow-1 d-flex justify-content-center align-items-center py-5">

    <div class="w-100">
        <h1 class="text-center h2 fw-semibold mb-4" style="color: #333;">Now tell us about yourself</h1>

        <div class="form-box mx-auto">

            <form action="/form" method="post">

                <div class="row mb-3 align-items-center">
                    <label for="height" class="col-md-3 col-form-label form-label">Height</label>
                    <div class="col-md-9">
                        <input type="text" class="form-control form-control-lg" id="height" name="height" placeholder="Enter Height">
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label for="age" class="col-md-3 col-form-label form-label">Age</label>
                    <div class="col-md-9">
                        <input type="text" class="form-control form-control-lg" id="age" name="age" placeholder="Enter Age">
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label class="col-md-3 col-form-label form-label">Gender</label>
                    <div class="col-md-9 d-flex align-items-center" style="min-height: 58px;"> <div class="form-check form-check-inline me-4">
                            <input class="form-check-input" type="radio" name="gender" id="male" value="male">
                            <label class="form-check-label" for="male">Male</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="female" value="female">
                            <label class="form-check-label" for="female">Female</label>
                        </div>
                    </div>
                </div>

                <div class="row mb-3 align-items-center">
                    <label for="weight" class="col-md-3 col-form-label form-label">Weight</label>
                    <div class="col-md-9">
                        <input type="text" class="form-control form-control-lg" id="weight" name="weight" placeholder="Enter weight">
                    </div>
                </div>

                <div class="row mb-4">
                    <label for="goals" class="col-md-3 col-form-label form-label pt-0">What are your goals?</label>
                    <div class="col-md-9">
                        <textarea class="form-control" id="goals" name="goals" rows="5" placeholder="Type your goals...."></textarea>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <button type="submit" class="btn btn-dark btn-lg w-100 fw-semibold" style="background-color: #555;">Submit</button>
                    </div>
                </div>

            </form>
        </div>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

</body>
</html>