<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
    <meta charset="UTF-8">
    <title>register</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/sportlayout.css">
    <link rel="icon" href="../image/Logocopy11.png">
    <style>
        main {
            margin-top: 80px;
        }

        h2 {
            color: rgb(146, 99, 28);
            margin-top: 200px;
        }

        .no-underline {
            text-decoration: none;
        }

        .container {
            max-width: 900px;
            margin: auto;
        }

        .form-container {
            max-width: 600px;
            margin: 100px auto 20px auto;
            /* This will put some space below the header */
            padding: 20px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .text-center {
            text-align: center;
        }

        .text-right {
            text-align: right;
        }

        .placeholder-text {
            color: rgb(154, 150, 150);
        }
    </style>
</head>

<body>
    <header>
    
  <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-md navbar-dark fixed-top">
                        <div class="container-xl">
                            <a class="navbar-brand d-flex align-items-center" href="/index">
                                <img src="../image/Logocopy.png" width="100" alt="">
                                <h1 class="m-0 ms-1">SPORTIFy</h1>
                            </a>
                            <button class="navbar-toggler ctr-collapse" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <div class="navbar-nav ms-auto">
                                    <li class="nav-item"><a class="nav-link" href="/index">訊息公告</a></li>
                                    <li class="nav-item"><a class="nav-link" href="/announcement">課程介紹</a></li>
                                    <li class="nav-item"><a class="nav-link" href="/backgroundCourse/course">課程報名</a></li>
                                    <li class="nav-item"> <a class="nav-link" href="/myCenter">會員中心</a></li>
                                    <li class="nav-item"><a class="nav-link" href="/information">交通資訊</a></li>
									<li class="nav-item"><a id="logout-btn" class="nav-link" href="#" style="display:none;" onclick="logout()">登出</a></li>
									<li class="nav-item"><a id="login-btn" class="nav-link " href="/member" onclick="showLoginForm()">登入</a></li>
                                    <li class="nav-item"><a class="nav-link" href="/trade/userTrades"><span><img src="../image/shopping-cart111.png" height="30px" width="30px"></span></a></li>
                                </div>
                            </div>
                            <span id="user-greeting" style="display: none;"></span>
                        </div>
                    </nav>
                </div>
            </div>
        </div> 
    </header>

    <main>
        <form id="registerfrom" method="post" action="/regist">
            <div class="container form-container" id="from-register">
                <input name="_method" type="hidden" value="POST" />
                <div class="row">
                    <div class="col-12">
                        <h2 class="my-4 text-center">註冊會員</h2>
                    </div>
                </div>
                <div class="form-group">
                    <label for="name">姓名</label>
                    <input type="text" id="name" name="name" class="form-control" required="required"/>
                </div>
                <div class="form-group">
                    <label for="birthday">出生日期</label>
                    <input type="date" id="birthday" name="birthday" class="form-control" required="required"/>
                </div>
                <div class="form-group">
                    <label for="phone">手機</label>
                    <input type="number" id="phone" name="phone" class="form-control" required="required"/>
                </div>
                <div class="form-group">
                    <label for="email">電子信箱 </label>
                    <span style="color: red">${error1}</span>
                    <input type="email" id="email" name="email" class="form-control" required="required"/>
                </div>
                <div class="form-group">
                    <label for="password">密碼</label>
                    <span style="color: red">${error2}</span>
                    <input type="password" id="password" name="password" class="form-control" required="required"/>
                </div>
                <div class="form-group">
                    <label for="confirm_password">確認密碼</label>
                    <input type="password" id="confirm_password" name="confirm_password" class="form-control" required="required"/>
                </div>
                <div class="form-check mb-3">
                    <input type="checkbox" class="form-check-input" id="terms" disabled="disabled" />
                    <label class="form-check-label" for="terms">我同意會員條款</label>
                    <button type="button" class="btn btn-link no-underline" data-bs-toggle="modal" data-bs-target="#termsModal">會員須知</button>
                </div>
                <div class="text-right">
                    <button type="submit" class="btn btn-primary" id="submitBtn" disabled="disabled">註冊</button>
                </div>
            </div>
        </form>
        <!-- 會員須知模態對話框 -->
        <div class="modal fade" id="termsModal" tabindex="-1" aria-labelledby="termsModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="termsModalLabel">會員須知</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <class="modal-body">
                        <p>這裡是會員須知的內容。在此列出所有相關的條款和條件，並確保用戶在勾選同意之前閱讀完這些內容。</p>
                        <p>會員條款</p>
                        <p>
                        	為保障合法使用「法令訂閱服務」網站（以下簡稱本網站）的權益，
                        	敬請詳閱並遵守下列「會員條款」（以下簡稱本條款）。
                        	使用本網站之服務者（不論是否加入會員），
                        	視為已閱讀、知悉並同意本條款。
                        </p>
                        <p>壹：會員權益</p>
                        <p>
                        	註冊加入會員享有「法令訂閱服務」，相關權益、使用期限，以註冊為會員時之規定為準。
                        </p>
                        <p>貳：會員授權</p>
                        <p>
                        	申請註冊加入會員，本網站有審核是否准允加入之權利。
                       	</p>
                        <p>參：會員資料</p>
                        <p>
                        	會員應填寫真實的資料，如資料有變更，應至「會員資料修改」功能進行修改，如因未修改而致權益受損，由會員自行負責。
                        </p>
                        <p>肆：會員密碼</p>
                        <p>
                        	會員對於帳號、密碼應負保密之責，如未保密造成無法使用、資料被篡改及本網站之損失等情形，由會員自行承擔，並負損害賠償責任。
                        </p>
                        <p>伍：隱私權保護</p>
                        <p>
                        	<p>一：會員資料之保護</p>
                        	<p>本網站對於會員之資料，在未經會員同意前，不會任意將其透露、租借或轉售給第三人，並嚴禁內部人員私自利用。</p>
                        </p>
	                    <p>
	                    	<p>二：會員資料之處理</p>
	                    	<p>（一）統計及分析</p>
	                    	<p>本網站伺服器會記錄會員曾瀏覽之網頁、連線之位址，但僅供作網站流量分析及網路行為調查之用，作為日後改善網站內容及服務品質之依據。</p>
	                    	<p>（二）活動及服務之通知</p>
	                    	<p>本網站如舉辦任何活動，或增減、變更任何服務業務，將使用會員資料通知。</p>
                        </p>
                        <p>
                        	<p>三：資料保護之例外</p>
                        	<p>在下列幾種情況下，將會使用或透露會員資料：</p>
                        	<p>（一）司法機關或其他機關符合法定程序提出要求時。</p>
                        	<p>（二）經會員同意。</p>
                        	<p>（三）本網站於行銷或提供服務時。</p>
                        </p>
                        <p>陸：使用規範</p>
                        <p>一：一般聲明</p>
                        <p>（一）本網站資料係自各級政府機關蒐集而來，若與各主管機關公布之文字有所不同，仍以各主管機關公布之資料為準。</p>
                        <p>（二）非經本公司正式書面同意，不得下載、重製本網站之內容他用。</p>
                        <p>二：權利聲明</p>
                        
                        <p>
                        	<p>（一）標的</p>
                        	<p>「法令訂閱服務」之內容，包括（但不限於）本網站內所有之影像、圖片、動畫、視訊、音效、音樂、文字、資料以及全部應用程式...等。</p>
                        </p>
                        <p>
                        	<p>（二）權利保護</p>
                        	<p>「法令訂閱服務」之著作權及其他權利，均受著作權法、公平交易法或其他法令，和國際著作權條約及其他相關法令與條約之保護。</p>
                        </p>
                        <p>
                        	<p>（三）使用權限</p>
                        	<p>
                        		<p>「法令訂閱服務」僅限於在電腦、手機、平板...等載具，利用瀏覽器使用本網站所提供之功能查詢、檢閱、下載或列印在紙上，但不包括以下權限：</p>
                        		<p>1. 將「法令訂閱服務」之內容列印、存檔、下載、複製、剪貼，不論是否經過編輯，進一步利用於其他印刷物或電子媒體。但僅引用為論文、文件之內容或為該等文件附件之一部分，以作為說明者，不在此限。</p>
                        		<p>2. 將「法令訂閱服務」之內容，重製於磁碟、光碟、硬碟、電子儲存媒體或其他載體，有償或無償提供自己或他人使用。</p>
                        		<p>3. 以程式或自動化方式執行查詢、下載、擷取內容…等方式，使用本網站。</p>
                        		<p>4. 將「法令訂閱服務」之內容，載入自行或他人開發之系統中，充作資料庫之部分或全部。</p>
                        	</p>
                        </p>
                        <p>（四）使用授權</p>
                        <p>
                        	<p>1.</p>
                        	<p>除非經「法源資訊股份有限公司」以正式書面同意，否則禁止對「法令訂閱服務」所提供之資料重製、販售、出租、互易、出借、散布、出版、改作、改篡割裂、公開展示、公開傳輸及其他方式對外公佈其內容或為其他足以侵害「法源資訊股份有限公司」權益之行為。</p>
                        	<p>2. 使用者若要求下載、重製或其他使用授權，請洽法源資訊股份有限公司。</p>
                        	<p>柒：終止服務</p>
                        	<p>會員若違反本條款或其他相關規定，本網站有權暫時停止或終止會員權利，前述情形，會員不得要求退還相關費用。如會員有事證證明未違規者，可向本網站提出要求重新處理。</p>
                        	<p>捌：修改會員條款之權利</p>
                        	<p>本網站得因應需要修正本條款之內容，並自公布之日起即時生效，將不對會員進行個別通知，請會員自行留意。</p>
                        </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"  id="disagreeBtn">不同意</button>
                    <button type="button" class="btn btn-primary" id="agreeBtn">同意</button>
                </div>
            </div>
        </div>
        </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/app.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        // 確保桌機版滾動時固定 header
        if ($('.navbar-toggler').is(':hidden')) {
            $(window).on('scroll', function () {
                if ($('html').scrollTop() > $('header').innerHeight()) {
                    $('header').addClass('fixed');
                } else {
                    $('header').removeClass('fixed');
                }
            });
        }

        // 重置表單當模態框顯示時
        $('#termsModal').on('click.bs.modal', function () {
            $('#terms').prop('checked', true);
            $('#submitBtn').prop('disabled', false);
        });

        // 當用戶點擊同意時，自動勾選條款和啟用提交按鈕
        $('#agreeBtn').on('click', function () {
            $('#terms').prop('checked', true);
            $('#submitBtn').prop('disabled', false);
        });

        // 啟用或禁用提交按鈕根據是否同意條款
        $('#terms').on('change', function () {
            if ($(this).is(':checked')) {
                $('#submitBtn').prop('disabled', false); // 如果勾選了條款，啟用提交按鈕
            } else {
                $('#submitBtn').prop('disabled', true); // 如果未勾選條款，禁用提交按鈕
            }
        });

        // 自動填充範例數據
        $(document).ready(function () {
            $('#name').val('範例姓名').addClass('placeholder-text');;
            $('#birthdate').val('1990-01-01').addClass('placeholder-text');;
            $('#phone').val('0912345678').addClass('placeholder-text');;
            $('#email').val('example@example.com').addClass('placeholder-text');;
            $('#password').val('password').addClass('placeholder-text');;
            $('#confirm_password').val('password').addClass('placeholder-text');;
        });

        document.getElementById("registerfrom").addEventListener("submit", function (event) {
            event.preventDefault(); // 阻止表單的默認提交行為

            Swal.fire({
                icon: 'success',
                title: '註冊成功',
                showConfirmButton: false,
                timer: 2000 // 延長通知顯示時間到 2 秒
            }).then(() => {
                // 當 SweetAlert 關閉後，提交表單
                document.getElementById("registerfrom").submit();
            });

            // 3 秒後執行跳轉
            setTimeout(function() {
                window.location.href = "/member"; // 重定向到 member 頁面
            }, 3000); // 這裡的時間要比通知顯示時間長
        });
    </script>
</body>

</html>