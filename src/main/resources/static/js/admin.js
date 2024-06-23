function logout() {
    fetch('/admin/logout', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        }
    }).then(response => {
        if (response.ok) {
            updateNavbar(false, '');
            window.location.href = '/admin/login'; // 重定向到主页
        } else {
            console.error('Logout failed');
        }
    }).catch(error => {
        console.error('Error:', error);
    });
}


function adminLogin() {
		    // 获取表单数据并通过 fetch 发送登录请求
		    var formData = new FormData();
		    formData.append('adminEmail', document.getElementById('email').value);
		    formData.append('adminPassword', document.getElementById('password').value);

		    fetch('/admin/login', {
		        method: 'POST',
		        body: formData
		    }).then(response => {
		        if (!response.ok) {
		            throw new Error('Network response was not ok');
		        }
		        return response.text();
		    }).then(data => {
		        if (data === 'success') {
		            // 登录成功的处理逻辑
		            updateNavbar(true, formData.get('adminEmail'));
		            window.location.href = '/backgroundCourse/bkcourse'; // 登录成功后重定向到后台页面
		        } else {
		            // 登录失败的处理逻辑
		            Swal.fire({
		                title: '登入失敗',
		                text: '請檢查帳號密碼正確無誤',
		                icon: 'error',
		                confirmButtonText: '確定'
		            });
		        }
		    }).catch(error => {
		        console.error('Error:', error);
		        Swal.fire({
		            title: '登入失敗',
		            text: '發生錯誤，請稍後再試',
		            icon: 'error',
		            confirmButtonText: '確定'
		        });
		    });
		}
		
		
		document.addEventListener("DOMContentLoaded", function() {
    checkAdminLoginStatus();
	});

	function checkAdminLoginStatus() {
   	 fetch('/admin/check-login') // 发送检查登录状态的请求
        .then(response => response.json())
        .then(data => {
            if (data.adminLogin) {
                // 管理员已登录，显示登出按钮，隐藏登录按钮
                document.getElementById('logout-btn').style.display = 'block';
                document.getElementById('login-btn').style.display = 'none';
            } else {
                // 管理员未登录，显示登录按钮，隐藏登出按钮
                document.getElementById('logout-btn').style.display = 'none';
                document.getElementById('login-btn').style.display = 'block';
            }
        })
        .catch(error => {
            console.error('Error checking admin login status:', error);
        });
}


