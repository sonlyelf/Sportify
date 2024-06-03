document.addEventListener("DOMContentLoaded", function() {
    // 假設通過某種方式從後端獲取用戶登錄狀態
    var userLoggedIn = false; // 示例變量，實際情況中應通過後端獲取

    // 使用 fetch API 從後端獲取登錄狀態
    fetch('/api/check-login')
        .then(response => response.json())
        .then(data => {
            userLoggedIn = data.loggedIn;
            updateNavbar(userLoggedIn, data.email);
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

    // 表單提交時處理登錄邏輯
    const loginForm = document.getElementById('login-form');
    if (loginForm) {
        loginForm.addEventListener('submit', function(event) {
            event.preventDefault(); // 防止表單提交，模擬登入邏輯
            const email = document.getElementById('email').value;
            login(email);
        });
    }
});

// 設置 userEmail
function setUserEmail(userEmail) {
    document.getElementById("userId").innerText = userEmail;
}

// 處理登出操作
   function logout() {
            fetch('/user/logout', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            }).then(response => {
                if (response.ok) {
                    window.location.href = '/index'; // 重定向到主页
                } else {
                    console.error('Logout failed');
                }
            }).catch(error => {
                console.error('Error:', error);
            });
        }

// 處理登錄操作
function login(email) {
    // 模擬登錄邏輯，可以根據實際需求進行修改
    setUserEmail(email);
    updateNavbar(true, email);
}