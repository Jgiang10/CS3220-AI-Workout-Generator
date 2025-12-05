@param String error

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex flex-column vh-100 bg-white">

<nav class="navbar navbar-expand-lg bg-light border-bottom py-3 px-4">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold fs-4" href="/">LOGO</a>
    </div>
</nav>

<div class="main-container d-flex align-items-center justify-content-center flex-grow-1 py-5">
    <div class="login-card bg-body-secondary border rounded-4 p-5 text-center w-100" style="max-width: 440px;">
        <p class="text-muted">Welcome back!</p>
        <h2 class="fw-bold mb-4">Login Here</h2>

        @if (error != null)
            <div class="alert alert-danger" role="alert">${error}</div>
        @endif

        <form action="/login" method="post" class="text-start">
            <div class="mb-3">
                <label for="userInput" class="form-label fw-medium mb-2">Username</label>
                <input name="username" type="text" class="form-control form-control-lg" id="userInput" placeholder="Type your username" required>
            </div>

            <div class="mb-4">
                <label for="passInput" class="form-label fw-medium mb-2">Password</label>
                <input name="password" type="password" class="form-control form-control-lg" id="passInput" placeholder="Type your password" required>
            </div>

            <button type="submit" class="btn btn-dark w-100 py-3 rounded-2">Login</button>
        </form>

        <a href="/register" class="d-block mt-4 fw-medium text-dark text-decoration-none">Register Here</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>