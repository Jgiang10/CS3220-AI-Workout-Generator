<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - AI Workout Generator</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">

    <style>
        body {
            background-color: #f9f9f9;
        }

        .login-box {
            background-color: #f0f0f0;
            padding: 2.5rem;
            border-radius: 1.25rem; /* 20px */
            border: 1px solid #ddd;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.05);
            max-width: 450px;
            width: 100%;
        }

        .main-header {
            background-color: #f0f0f0;
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>
<body class="d-flex flex-column vh-100">

<header class="main-header">
    <nav class="navbar">
        <div class="container-fluid mx-lg-5">
            <span class="navbar-brand mb-0 h1 fs-4 fw-bold" style="color: #333;">LOGO</span>
        </div>
    </nav>
</header>

<main class="container flex-grow-1 d-flex justify-content-center align-items-center py-5">

    <div class="login-box">
        <h2 class="text-center fw-normal" style="color: #444;">Welcome back!</h2>
        <h3 class="text-center h3 fw-semibold mb-4" style="color: #333;">Login Here</h3>

        <form action="/login" method="post">

            <div class="mb-3">
                <label for="username" class="form-label fw-semibold" style="color: #555;">Username</label>
                <input type="text" class="form-control form-control-lg" id="username" name="username" placeholder="Type your username">
            </div>

            <div class="mb-4">
                <label for="password" class="form-label fw-semibold" style="color: #555;">Password</label>
                <input type="password" class="form-control form-control-lg" id="password" name="password" placeholder="Type your password">
            </div>

            <button type="submit" class="btn btn-dark btn-lg w-100 fw-semibold mb-4">Login</button>

            <div class="text-center">
                <a href="/register" class="link-secondary fw-medium">Register Here</a>
            </div>

        </form>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

</body>
</html>