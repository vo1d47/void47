<?php

	require "functions.php";
	check_login();
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Profile</title>
</head>
<body>

	<h1>Profile</h1>

	<div>
	<a href="index.php">Home</a>  . <a href="profile.php">Profile</a> . <a href="logout.php">Logout</a> . 
</div>
 
	<?php if(check_login(false)):?>
		Hi, <?=$_SESSION['USER']->username?>

		<br><br>
		<?php if(!check_verified()):?>
			<a href="verify.php">
				<button>Verify Profile</button>
			</a>
		<?php endif;?>
	<?php endif;?>

</body>
</html>