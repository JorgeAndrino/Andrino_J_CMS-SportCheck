<?php
    session_start();

    //Checking if the user is properly logged in and if he is, send him to the welcome page
    if(isset($_SESSION["loggedin"]) &&
    $_SESSION["loggenin"] === true){
        header("location: index.php");
        exit;
    }

    // config.php file included
    require_once 'scripts/connect.php';

    $user_name = $user_password = "";
    $username_err = $password_err = "";
 
    if($_SERVER["REQUEST_METHOD"] == "POST"){
 
        // Check if the username is empty
        if(empty(trim($_POST["username"]))){
            $username_err = "Please enter your username.";
        } else{
            $user_name = trim($_POST["username"]);
        }
    
        // Check if password is empty
        if(empty(trim($_POST["password"]))){
            $password_err = "Please enter your password.";
        } else{
            $user_password = trim($_POST["password"]);
        }
    
        // Validate info
        if(empty($username_err) && empty($password_err)){
            // Prepare a select statement
            $sql = "SELECT user_id, user_name, user_password FROM tbl_users WHERE user_name = :username";
        
            if($stmt = $pdo->prepare($sql)){
                $stmt->bindParam(":username", $param_username, PDO::PARAM_STR);
            
                $param_username = trim($_POST["username"]);
            
                if($stmt->execute()){
                    // Checking if the username exists, if it does then verify the password
                    if($stmt->rowCount() == 1){
                        if($row = $stmt->fetch()){
                            $user_id = $row["user_id"];
                            $user_name = $row["user_name"];
                            $hashed_password = $row["user_password"];
                            if(password_verify($user_password, $hashed_password)){
                                // If password is correct, start a new session
                                session_start();
                            
                                $_SESSION["loggedin"] = true;
                                $_SESSION["user_id"] = $user_id;
                                $_SESSION["user_name"] = $user_name;                            
                            
                                // Redirect user to welcome page
                                header("location: admin/index.php");
                            } else{
                                // Display an error message if the password is not valid
                                $password_err = "The password you entered was not valid.";
                            }
                        }
                    } else{
                        // Display an error message if the username doesn't exist
                        $username_err = "No account with that username.";
                    }
                } else{
                    echo "Doh! Something went bad. Please try again later.";
                }
            }
        
            unset($stmt);
        }
    
        unset($pdo);
}

?>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
</head>
<body>
    <div class="mainContent">
        <h2>Login Here</h2>
        <p>Please fill the information to login.</p>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="formInfo <?php echo (!empty($username_err)) ? 'has-error' : ''; ?>">
                <label>Username</label>
                <input type="text" name="username" class="form-control" value="<?php echo $user_name; ?>">
                <span class="help-block"><?php echo $username_err; ?></span>
            </div>    
            <div class="formInfo <?php echo (!empty($password_err)) ? 'has-error' : ''; ?>">
                <label>Password</label>
                <input type="password" name="password" class="form-control">
                <span class="help-block"><?php echo $password_err; ?></span>
            </div>
            <div class="formInfo">
                <input type="submit" class="btn btn-primary" value="Login">
            </div>
        </form>
    </div>
</body>
</html>

