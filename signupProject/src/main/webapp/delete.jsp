<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Delete Account</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Style for the Previous Page button */
        .previous-button {
            position: absolute;
            top: 20px; 
            right: 20px;
            padding: 5px 10px;
            font-size: 12px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 3px;
        }
    </style>
</head>
<body>
    <!-- Status hidden input -->
    <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

    <!-- Main container -->
    <div class="main">
        <!-- Previous Page Button -->
        <a href="registration.jsp" class="previous-button">Previous Page</a>

        <!-- Delete Form -->
        <section class="Delete">
            <div class="container">
                <div class="delete-content">
                    <div class="signin-image">
                        <figure></figure>
                        <a href="delete.jsp" class="signup-image-link"></a>
                    </div>

                    <div class="delete-form">
                        <h2 class="form-title" style="text-align: center;">Delete Account</h2>
                        <form method="POST" action="delete" class="delete-form" id="delete-form">
                            <div class="form-group">
                                <label for="username">
                                    <i class="zmdi zmdi-account material-icons-name" style="padding-left: 10px;"></i>
                                </label>
                                <input type="text" name="username" id="username" placeholder="Your Email" required="required" />
                            </div>  
                            <div class="form-group">
                                <label for="password">
                                    <i class="zmdi zmdi-lock" style="padding-left: 10px;"></i>
                                </label>
                                <input type="password" name="password" id="password" placeholder="Password" required="required" />
                            </div>  

                            <div class="form-group" style="padding: 8px 410px">
                                <label class="label-agree-term">Take Care!!!</label>
                            </div>

                            <div class="form-group form-button" style="padding: 10px 390px">
                                <input type="submit" name="delete" id="delete" class="form-submit" value="Delete" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <!-- JS scripts -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <script type="text/javascript">
        // Get the status value passed from the servlet
        var status = document.getElementById("status").value;

        if (status === "failed") {
            swal("Sorry", "Wrong Username or Password", "error");
        } else if (status === "invalidEmail") {
            swal("Sorry", "Please Enter Username", "error");
        } else if (status === "invalidUpwd") {
            swal("Sorry", "Please Enter Password", "error");
        } else if (status === "success") {
            swal("Success", "Account deleted successfully", "success");
        }
    </script>
</body>
</html>
