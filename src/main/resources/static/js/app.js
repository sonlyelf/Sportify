// app.js
document.addEventListener("DOMContentLoaded", function() {
    // 假设通过某种方式从后端获取用户登录状态
    var userLoggedIn = false; // 示例变量，实际情况中应通过后端获取

    // 这里可以使用fetch API从后端获取登录状态
    fetch('/api/check-login')
        .then(response => response.json())
        .then(data => {
            userLoggedIn = data.loggedIn;
            updateNavbar(userLoggedIn, data.username);
        });

    function updateNavbar(isLoggedIn, userId) {
        const loginBtn = document.getElementById('login-btn');
        const logoutBtn = document.getElementById('logout-btn');
        const userGreeting = document.getElementById('user-greeting');

        if (isLoggedIn) {
            loginBtn.style.display = 'none';
            logoutBtn.style.display = 'block';
            userGreeting.textContent = `Welcome, ${userId}}!`;
        } else {
            loginBtn.style.display = 'block';
            logoutBtn.style.display = 'none';
            userGreeting.textContent = 'Please log in.';
        }
    }
});