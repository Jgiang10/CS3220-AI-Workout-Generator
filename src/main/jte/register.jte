@param String error

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Register for an Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body class="d-flex flex-column vh-100 bg-white">

<nav class="navbar navbar-expand-lg bg-light border-bottom py-3 px-4">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold fs-4" href="/">LOGO</a>
    </div>
</nav>

<div class="main-container d-flex align-items-center justify-content-center flex-grow-1 py-5">

    <div class="login-card bg-body-secondary border rounded-4 p-5 text-center w-100" style="max-width: 440px;">
        <h2 class="fw-bold mb-4">Create an Account</h2>

        @if (error != null)
            <div class="alert alert-danger" role="alert">
                ${error}
            </div>
        @endif

        <form action="/register" method="post" class="text-start">

            <div class="mb-3">
                <label for="emailInput" class="form-label fw-medium mb-2">Email (as Username)</label>
                <input name="email" type="email" class="form-control form-control-lg" id="emailInput" placeholder="Type your email" required>
            </div>

            <div class="mb-4">
                <label for="passInput" class="form-label fw-medium mb-2">Password</label>
                <input name="password" type="password" class="form-control form-control-lg" id="passInput" placeholder="Type your password" required>
            </div>

            <button type="submit" class="btn btn-dark w-100 py-3 rounded-2">Register</button>
        </form>

        <a href="/login" class="d-block mt-4 fw-medium text-dark text-decoration-none">Already have an account? Login</a>

    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>