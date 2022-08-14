<?php  

require "functionsforuse.php";

$errors = array();

if($_SERVER['REQUEST_METHOD'] == "POST")
{

	$errors = login($_POST);

	if(count($errors) == 0)
	{
		header("Location: profile.php");
		die;
	}
}

?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Login</title>
</head>
<body>
	<h1>Login</h1>

	<?php include('header.php')?>

	<div>
		<div>
			<?php if(count($errors) > 0):?>
				<?php foreach ($errors as $error):?>
					<?= $error?> <br>	
				<?php endforeach;?>
			<?php endif;?>

		</div>
		<form method="post">
			<input autocapitalize="off" autocorrect="off" maxlength="75" name="username" type="text" placeholder="username">
			<input type="password" name="password" placeholder="Password"><br>
			<br>
			<input type="submit" value="Login">
		</form>
	</div>
</body>
</html>