document.addEventListener("DOMContentLoaded", function() {
    fetch('/api/check-login')
        .then(response => response.json())
        .then(data => {
            updateNavbar(data.loggedIn, data.email);
        });

    const loginForm = document.getElementById('login-form');
    if (loginForm) {
        loginForm.addEventListener('submit', function(event) {
            event.preventDefault();
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            login(email, password);
        });
    }
});

function updateNavbar(isLoggedIn, userEmail) {
    const loginBtn = document.getElementById('login-btn');
    const logoutBtn = document.getElementById('logout-btn');
    const userGreeting = document.getElementById('user-greeting');

    if (isLoggedIn) {
        if (loginBtn) loginBtn.style.display = 'none';
        if (logoutBtn) logoutBtn.style.display = 'block';
        if (userGreeting) userGreeting.textContent = `Welcome, ${userEmail}!`;
    } else {
        if (loginBtn) loginBtn.style.display = 'block';
        if (logoutBtn) logoutBtn.style.display = 'none';
        if (userGreeting) userGreeting.textContent = 'Please log in.';
    }
}

function showLoginForm() {
    document.getElementById('login-form-container').style.display = 'block';
}

function login() {
	var formData = new FormData();
	formData.append('email', document.getElementById('email').value);
	formData.append('password', document.getElementById('password').value);

    fetch('/user/login', {
        method: 'POST',
        body: formData
    }).then(response => response.text())
      .then(data => {
          if (data === 'success') {
              updateNavbar(true, email);
              window.location.href = '/myCenter'; // 登录成功后重定向到 myCenter.jsp
          } else {
              Swal.fire({
                  title: '登入失敗',
                  text: '請檢查帳號密碼正確無誤',
                  icon: 'error',
                  confirmButtonText: '確定'
              });
          }
      }).catch(error => {
          console.error('Error:', error);
      });
      }

function logout() {
    fetch('/user/logout', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        }
    }).then(response => {
        if (response.ok) {
            updateNavbar(false, '');
            window.location.href = '/index'; // 重定向到主页
        } else {
            console.error('Logout failed');
        }
    }).catch(error => {
        console.error('Error:', error);
    });
}


