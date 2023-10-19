<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Stock Management System With Product Expiry Date Alert</title>
 	

<?php include('./header.php'); ?>
<?php include('./db_connect.php'); ?>
<?php 
session_start();
if(isset($_SESSION['login_id']))
header("location:index.php?page=home");

$query = $conn->query("SELECT * FROM system_settings limit 1")->fetch_array();
		foreach ($query as $key => $value) {
			if(!is_numeric($key))
				$_SESSION['setting_'.$key] = $value;
		}
?>

</head>
<style>
	body{
		background-image: url('./assets/img/doyinlack.jpg');
		height: 91vh;
   		 background-position: center;
    	background-repeat: no-repeat;
    	background-size: cover;
		width: 100%;
	    height: calc(100%);
	    /*background: #007bff;*/
	}
	main#main{
		width:100%;
		height: calc(100%);
		background:white;
		
	}
	#login-right{
		position: absolute;
		right:0;
		width:40%;
		height: calc(100%);
		/* background:white; */
		display: flex;
		align-items: center;
		background-image: url('./assets/img/doyinlak.jpg');
		height: 96vh;
   		 background-position: center;
    	background-repeat: no-repeat;
    	background-size: cover;
	}
	#login-left {
	    position: absolute;
	    left: 0;
	    width: 60%;
	    height: calc(100%);
	    /* background: #0097ffcf; */
	    display: flex;
	    align-items: center;
	}
	#login-right .card{
		margin: auto
	}
	.logo {
	
    margin: auto;
    font-size: 8rem;
    background-Image:url('/pharmacy/assets/img/doyinlak.jpg')
    padding: .5em 0.9em;
    color: white;
}
	/*.logo {
    margin: auto;
    font-size: 8rem;
    background: white;
    padding: .5em 0.9em;
    border-radius: 50% 50%;
    color: red;
}
*/
</style>

<body>

  <main id="main" class=" bg-dark">
  		<div id="login-left">
  			<div class="logo">
  				<h6><b>Stock Management System With Product Expiry Date Alert</b></h6>
  				<h6><b>(A case study of Doyinlat Supermarket Osogbo)</b></h6>
  				<!--<span class="fa fa-prescription-bottle-alt"></span>-->
  				<!-- <img src="/pharmacy/assets/img/doyinlak.jpg" width="20%" height="120px" alt="No Image"><br> -->
  				<div><br>
  				<h6 align="text-center"><center><b>Project developed by:<br> ALUKO AYOMIDE JOSEPH <br><br>
  						MATRIC NUMBER: HC20210204022 <br><br>	
  						PROJECT SUPERVISED BY <br>  A.O LONGE</b></center>
  				</h6>
  			</div>
  			</div>
  		</div>
  		
  		<div id="login-right">
  			<div class="card col-md-8">
  				<div class="card-body">
  					<form id="login-form" >
  						<div class="form-group">
  							<label for="username" class="control-label">Username</label>
  							<input type="text" id="username" name="username" class="form-control">
  						</div>
  						<div class="form-group">
  							<label for="password" class="control-label">Password</label>
  							<input type="password" id="password" name="password" class="form-control">
  						</div>
  						<center><button class="btn-sm btn-block btn-wave col-md-4 btn-primary">Login</button></center>
  					</form>
  				</div>
  			</div>

  		</div>
   

  </main>

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>


</body>
<script>
	$('#login-form').submit(function(e){
		e.preventDefault()
		$('#login-form button[type="button"]').attr('disabled',true).html('Logging in...');
		if($(this).find('.alert-danger').length > 0 )
			$(this).find('.alert-danger').remove();
		$.ajax({
			url:'ajax.php?action=login',
			method:'POST',
			data:$(this).serialize(),
			error:err=>{
				console.log(err)
		$('#login-form button[type="button"]').removeAttr('disabled').html('Login');

			},
			success:function(resp){
				if(resp == 1){
					location.href ='index.php?page=home';
				}else if(resp == 2){
					location.href ='voting.php';
				}else{
					$('#login-form').prepend('<div class="alert alert-danger">Username or password is incorrect.</div>')
					$('#login-form button[type="button"]').removeAttr('disabled').html('Login');
				}
			}
		})
	})
</script>	
</html>