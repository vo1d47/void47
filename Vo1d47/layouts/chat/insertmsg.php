<?php 
      require_once "vendor/autoload.php";
      require_once "core/init.php";
  
      use classes\{DB, Config, Validation, Common, Session, Token, Hash, Redirect, Cookie};
      use models\{Post, UserRelation, Follow};
      use layouts\post\Post as Post_View;
      use layouts\master_right\Right as MasterRightComponents;
  
      // DONT'T FORGET $user OBJECT IS DECLARED WITHIN INIT.PHP (REALLY IMPORTANT TO SEE TO SEE [IMPORTANT#4]
      // Here we check if the user is not logged in and we redirect him to login page
      if(!$user->getPropertyValue("isLoggedIn")) {
          Redirect::to("login/login.php");
      }
      $msg = $_POST['chat-text-input'];

      if (!empty($msg)){
        $hostname = "localhost";
        $username = "root";
        $password = "";
        $dbname = "chat";
        
        $conn = new mysqli($hostname, $username, $password, $dbname);
        if(!$conn){
            echo "Database connection error".mysqli_connect_error();
          }
          else {
            $select = "INSERT Into message (message)" values(?);
 
           $stmt = $conn->prepare($select);
           $stmt->bind_param("s", $msg);
           $stmt->execute();
           
           



            

          }
      }   else {
            echo "please input msg!!";
            die();
      }

    
?>