<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
	<meta charset="UTF-8">
	<title>announcement</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/sportlayout.css">
	<link rel="icon" href="../image/Logocopy11.png">
	<style>
		main h2 {
			color: rgb(146, 99, 28);
			margin-top: 200px;
		}

		.banner {
			display: flex;
			justify-content: center;
			align-items: center;
			background-color: white;
			width: 100%;
			padding: 20px;
			box-sizing: border-box;
		}

		picture {
			display: block;
			text-align: center;
			margin-top: 150px;
		}

		img {
			display: block;
			max-width: 100%;
			height: auto;
		}

		.course-intro h3 {
			flex: 1;
			font-size: 24px;
			margin-bottom: 10px;
			color: rgb(27, 153, 173);
		}

		.course-intro .content {
			display: flex;
			align-items: flex-start;
			text-align: left;
		}

		.course-intro img {
			margin-right: 20px;
			max-width: 300px;
			height: auto;
		}

		.course-intro p {
			flex: 1;
			line-height: 1.6;
			margin: 0;
			margin-top: auto;
			margin-bottom: auto;
			font-size: 18px;
			color: #666;
		}

		.course-intro hr {
			width: 100%;
			border: 1px solid #afadad;
			margin: 20px 0;
		}

		@media (max-width : 768px) {
			.course-intro .content {
				flex-direction: column;
				align-items: center;
			}

			.course-intro img {
				margin: 0 0 20px 0;
				max-width: 100%;
			}

			.course-intro p {
				margin-top: auto;
				margin-bottom: auto;
				text-align: center;
			}
		}
	</style>
</head>

<body data-bs-spy="scroll" data-bs-target="#navbarSupportedContent" data-bs-offset="200">
	<header>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="navbar navbar-expand-md navbar-dark fixed-top">
						<!-- 設定區域範圍 -->
						<div class="container-xl">
							<!-- 表現LOGO連結的區域，可以加上LOGO圖片 -->
							<a class="navbar-brand d-flex align-items-center" href="/index">
								<img src="../image/Logocopy.png" width="100" alt="">
								<h1 class="m-0 ms-1">SPORTIFy</h1>
							</a>
							<!-- 以下是手機版才出現的按鈕，負責控制顯示導覽選單 -->
							<!-- 注意：data-bs-target的名字必須與可收合部份的ID相同 -->
							<button class="navbar-toggler ctr-collapse" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
							<!-- 以下區域是在手機版會收合的選單部份 -->
							<div class="collapse navbar-collapse" id="navbarSupportedContent">
								<!-- 這是一組選單，me-auto負責margin都在右邊，ms-auto負責margin都在左邊 -->
								<div class="navbar-nav ms-auto">
									<li class="nav-item"><a class="nav-link" href="/index">訊息公告</a></li>
									<li class="nav-item"><a class="nav-link active" href="/announcement">課程介紹</a></li>
									<li class="nav-item"><a class="nav-link" href="/backgroundCourse/course">課程報名</a></li>
									<li class="nav-item"><a class="nav-link" href="/myCenter">會員中心</a></li>
									<li class="nav-item"><a class="nav-link" href="/information">交通資訊</a></li>
									<li class="nav-item"><a id="logout-btn" class="nav-link" href="#" style="display:none;" onclick="logout()">登出</a></li>
									<li class="nav-item"><a id="login-btn" class="nav-link" href="/member" onclick="showLoginForm()">登入</a></li>
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

	<div class="col-12 banner">
		<picture>
			<source srcset="../image/ToDaybig.png" media="(max-width: 300px)">
			<source srcset="../image/ToDaybig.png" media="(min-width: 768px)">
			<img src="../image/ToDaybig.png" alt="...">
		</picture>
	</div>

	<main class="mb-5">
		<div class="container mb-5 mt-3">
			<div class="row">
				<h2 class="text-center " style="font-size: 36px">課程介紹</h2>
				<hr style="border: 1px solid #afadad">
				<section id="course-intro" class="course-intro">
					<div class="content">
						<img src="../image/yogacircle.jpeg" width="300px" height="auto" alt="Yoga Circle">
						<h3>Yoga Wheel瑜珈輪</h3>
						<p>
							透過圓形中空輔具的幫助，保持瑜伽練習時後彎等動作的穩定度， 藉由和緩地滾動來深度拓展肩背部的肌肉，以及按摩骨盆、大腿，
							促進血液循環之餘也能訓練平衡感，鍛鍊腹部核心，在安全穩定中 暢快放鬆，不論是對入門的瑜伽初學者，或是想進階練習瑜伽的
							同學都非常有幫助。
						</p>
					</div>
					<hr>
					<div class="content">
						<img src="../image/gettyimages-1663038026.jpg" width="300px" height="auto" alt="YinYoga">
						<h3>YinYoga 陰瑜珈</h3>
						<p>
							陰瑜珈Yin Yoga也適宜瑜伽初學者、工作壓力大的人和身體有傷之人練習。 練習陰瑜珈Yin
							Yoga能夠幫助這些人放鬆身心、治癒創傷和打開身體。 陰瑜珈還適合上半身力量欠缺的人或者不經常練習瑜珈的人。 陰瑜珈Yin
							Yoga能使任何練習的人感到青春煥發、神清氣爽、美麗倍增。
							在練習其它瑜伽(流瑜珈或熱瑜珈)的同時穿插練習陰瑜珈能使你的瑜珈練習達到一個平衡狀態。
						</p>
					</div>
					<hr>
					<div class="content">
						<img src="../image/pexels-ketut-subiyanto-4999475.jpg" width="300px" height="auto"
							alt="YinYoga">
						<h3>空中舒緩瑜珈</h3>
						<p>
							空中舒緩基礎的瑜珈動作在騰空時練習，會有全然不同的感受，舒緩瑜珈的好處多，因為藉由地心引力的向下拉伸，
							可以深~深~地幫助各個部位順利延展，給肢體更大的活動空間，鬆開肩頸的緊繃，緩解背部和脊椎長期累積的壓力，
							拉拉腿部筋，舒緩肌肉的痠痛不適，暢通呼吸、放大感官神經，讓上下半身重新找回靈活舒暢。
						</p>
					</div>
					<hr>
					<div class="content">
						<img src="../image/FunctionalTraining.jpg" width="300px" height="auto" alt="YinYoga">
						<h3>肌力循環式訓練</h3>
						<p>
							循環式訓練（Circuit training）是一種使用肌力訓練來挑戰能量代謝系統的訓練，
							其中包含了許多訓練動作，從自由重量到機械式阻力訓練和徒手肌力訓練都能夠拿來設計成課表，
							簡單來說就是在許多的訓練動作中進行連續的訓練，每個訓練之間都夾雜短暫的休息， 由這些的訓練所組成的就稱為循環訓練。
						</p>
					</div>
					<hr>
					<div class="content">
						<img src="../image/b_ow0l3HccEXONmgGWflO9.webp" width="300px" height="auto" alt="YinYoga">
						<h3>BODY COMBAT拳擊有氧</h3>
						<p>
							BODY COMBAT又稱為「拳擊有氧、戰鬥有氧」，通過上半身打拳、下半身踢腿動作進行鍛煉，
							訓練到你的腿部、手臂、背部和肩膀，對核心部位有顯著效果。
							在課程中讓你能快速消耗卡路里、提高協調性、敏捷性和速度，提升肌耐力,全程可以燃燒高達740卡路里的熱量。
							此項課程受武術動作啟發，是完全非接觸性、簡單易學的大運動量訓練課程。
						</p>
					</div>
					<hr>
					<div class="content">
						<img src="../image/ZumbaDanceWorkout.jpeg" width="300px" height="auto" alt="YinYoga">
						<h3>ZUMBA</h3>
						<p>
							Zumba來自拉丁美洲，是一種結合舞蹈和有氧的運動，動作配合音樂節奏的快慢，也可以看成是間歇訓練，
							能鍛鍊到肌耐力、身體協調性、平衡感…等，燃脂以外還有雕塑線條的效果。
							不需要擔心自己沒有舞蹈基礎，因為融合了森巴、探戈、佛朗明哥…等多種舞蹈，舞步變得更自由，
							不用記太多繁瑣的動作，如果你是這種無法記住舞步的人，放心，跟著音樂動滋動就對了!
						</p>
					</div>
					<hr>
					<div class="content">
						<img src="../image/rtx.jpg" width="300px" height="auto" alt="YinYoga">
						<h3>TRX 循環式訓練</h3>
						<p>
							TRX循環式訓練是利用懸吊式全身阻力運動的原理，在一次訓練中同時讓多組懸吊肌力動作輪替，進行高效率的運動練習，
							一次鍛鍊多處部位，幫助全身肌肉平均精實，以個人的體重為阻力，利用懸吊帶的角度及彈力或站姿來控制強度，
							不用擔心擔心練完變成厚片大肌肉。
						</p>
					</div>
					<hr>
					<div class="content">
						<img src="../image/kettle-belljpg.jpeg" width="300px" height="auto" alt="YinYoga">
						<h3>Kettlebell 壺鈴</h3>
						<p>
							近年來壺鈴訓練廣受歡迎，越來越多人開始嚐試，並愛上它帶來的運動效能！是一種拿來訓練全身力量及體能的工具。
							效率高、體積小，在更短的時間內即達到全身運動的高效能是非常實用的訓練器材。
							壺鈴訓練透過各種深蹲、硬舉、擺盪、上搏、挺舉、划船...等訓練模式，結合有氧和阻力訓練，
							可以促使身體力量的產生，激發耐力與爆發力。
						</p>
					</div>
					<hr>
					<div class="content">
						<img src="../image/UBOUND.JPG" width="300px" height="auto" alt="YinYoga">
						<h3>UBOUND®活力躍蹦</h3>
						<p>
							UBOUND®是一項前所未有、跨時代，利用在彈簧床上的跳躍動作組成的有氧運動課程。
							利用不穩定的彈簧床面，增加核心肌群的使用，達到心肺耐力、與下半身的肌力訓練。簡單而紮實的動作，
							有氧和無氧運動的組合，既零衝擊、無損傷参與者的膝蓋，又具有顯著的運動強度；對淋巴系統亦有所助益，有利於毒素釋放。
							簡單易上手、有效且相當有趣的訓練課程，是Sportify最特別的項目之一。
						</p>
					</div>
				</section>
			</div>
		</div>
	</main>

	<footer class="w-100">
		<div class="container">
			<div class="row">
				<div class="col-12 col-md-4 d-flex flex-column">
					<p class="footer-title " style="font-size: 26px;">SPORTIFy</p>
					<p>地址：302 新竹縣竹北市十興ＸＸ街25號</p>
					<p>電話：(03)3456700</p>
					<p>電子信箱：sportify@gmail.com</p>
					<p>營業時間：1000-2200</p>
				</div>
				<div class="link-comm">
					<a href="https://line.me/tw/"> <img src="../image/line4.png" width="50" height="auto" alt=""></a>
				</div>
				<div class="link-comm1">
					<a href="https://www.instagram.com/"> <img src="../image/instagram4.png" width="50" height="auto" alt=""></a>
				</div>
			</div>
		</div>
	</footer>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/js/app.js"></script>
	<script>
		//header============
		//當桌機版時....那麼進行以下工作
		//當window視窗scroll捲動時
		//if判斷捲出的範圍是否大於header的高度
		//如果是，則header應該......addClass('fixed')
		//安排 .fixed得樣式設定 for CSS 提示：position
		if ($('.navbar-toggler').is(':hidden')) {
			$(window).on('scroll', function () {
				if ($('html').scrollTop() > $('header').innerHeight()) {
					// console.log('yes');
					$('header').addClass('fixed');
				}
				if ($('html').scrollTop() == 0) {
					$('header').removeClass('fixed');
				}
			});
		}

		// if ($('.navbar-toggler').is(':visible')) {
		//   $('.navbar-collapse .nav-link').on('click', function () {
		//     //原來滑動效果依舊，再執行 .ctr-collapse自動觸發click
		//     $('.ctr-collapse').trigger('click');
		//   });
		// }
	</script>
</body>

</html>