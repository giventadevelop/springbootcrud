function submit_form() {
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		if (!username || !password) {
			document.getElementById("user_pass_rqd").style.display = 'inline';
			return;
		}
		if (username === undefined || username === null) {
			return;
		}
		if (password === undefined || password === null) {
			return;
		}
		document.getElementById("login-form").submit();
	}
	//form reset
	function login_form_reset() {
		document.getElementById("login-form").reset();
	}
	function logout_user() {
		document.getElementById("logout-form").submit();
	}