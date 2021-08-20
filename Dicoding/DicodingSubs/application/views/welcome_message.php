<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> Submission Belajar Dasar Pemrograman Web </title>
	<link rel="stylesheet" href="<?=base_url()?>assets/Scripts/style.css">
</head>
<body>
    <header><div class="jumbotron">
	    <h1> Shop Apaan Nih!1!1 </h1>
		<p> Disini kamu dapat mencari keperluanmu. 
		    <br> Tanpa harus ribet kesana-kemari. </p>
		</div>
		<nav>
		    <ul type=none>
			    <li><a href="#makan"> Keperluan Makan </a></li>
				<li><a href="#minum"> Keperluan Minum </a></li>
				<li><a href="#keranjang"><img src="<?=base_url()?>assets/Images/keranjang.png" alt="Keranjang" class="navImage"></a></li>
			    <li id="totalShop"> 0 </li>
			</ul>
		</nav>
	</header>
	<main>
	    <content>
		    <article id="makan">
			    <h2> Keperluan Makan </h2>
				<section><h3> Piring Sedang </h3>
				    <img src="<?=base_url()?>assets/Images/makan1.png" alt="Piring Sedang" class="artImage"></dt> 
					<p> Piring ini berukuran sedang sangat cocok <br> untuk makan dengan porsi yang sedang.</p>
					<p> Price: Rp40.000 </p>
					<button class="APS"> Pesan Sekarang </button>
				</section>
				<section><h3> Mangkok Kecil </h3>
					<img src="<?=base_url()?>assets/Images/makan2.png" alt="Mangkok Kecil" class="artImage"></dt>
				    <p> Mangkok ini sangat cocok untuk kamu yang <br> suka makan sedikit dan tidak tahan panas.</p>
					<p> Price: Rp30.000 </p>
					<button class="AMK"> Pesan Sekarang </button>
				</section>
				<section><h3> Mangkok Besar </h3>
					<img src="<?=base_url()?>assets/Images/makan3.png" alt="Mangkok Besar" class="artImage"></dt>
					<p> Mangkok ini sangat cocok untuk kamu yang <br> punya makan porsi besar dan berkuah.</p>
					<p> Price: Rp60.000 </p>
					<button class="AMB"> Pesan Sekarang </button>
				</section>
				<section><h3> Sendok Makan </h3>
					<img src="<?=base_url()?>assets/Images/makan4.png" alt="Sendok Makan" class="artImage"></dt>
					<p> Selain menggunakan tangan, kamu dapat <br> menggunakan sendok untuk mengambil kuah dari <br> makananmu.</p>
					<p> Price: Rp15.000 </p>
					<button class="ASM"> Pesan Sekarang </button>
				</section>
			</article>
			<article id="minum">
			    <h2> Keperluan Minum </h2>
				<section><h3> Teko Sedang </h3>
				    <img src="<?=base_url()?>assets/Images/minum1.png" alt="Teko Sedang" class="artImage"></dt>
					<p> Dengan desain sederhana, Teko ini sangat <br> cocok untuk kamu pakai dalam keperluan sehari-hari.</p>
					<p> Price: Rp50.000 </p>
					<button class="ITS"> Pesan Sekarang </button>
				</section>
				<section><h3> Teko Panjang </h3>
					<img src="<?=base_url()?>assets/Images/minum2.png" alt="Teko Panjang" class="artImage"></dt>
					<p> Teko dengan muatan yang banyak membuat dahaga terpuaskan. <br> Teko yang sangat cocok buatmu. </p>
					<p> Price: Rp65.000 </p>
					<button class="ITP"> Pesan Sekarang </button>
				</section>
				<section><h3> Cangkir Sedang </h3>
					<img src="<?=base_url()?>assets/Images/minum3.png" alt="Cangkir Sedang" class="artImage"></dt>
					<p> Terbuat dari plastik menjadikan cangkir ini aman <br> saat digunakan oleh anak-anak. </p>
					<p> Price: Rp15.000 </p>
					<button class="ICS"> Pesan Sekarang </button>
 				</section>
				<section><h3> Cangkir Besar </h3>
					<img src="<?=base_url()?>assets/Images/minum4.png" alt="Cangkir Besar" class="artImage"></dt>
					<p> Cangkir ini dijamin akan menghilangkan dahaga. <br> Cangkir ini juga aman digunakan anak-anak. </p>
					<p> Price: Rp30.000 </p>
					<button class="ICB"> Pesan Sekarang </button>
				</section>
				<section><h3> Gelas Sedang </h3>
					<img src="<?=base_url()?>assets/Images/minum5.png" alt="Gelas Sedang" class="artImage"></dt>
					<p> Tampilan elegan membuat kamu menikmati minumanmu. <br> Gelas sangat cocok untukmu yang suka kenikmatan. </p>
					<p> Price: Rp45.000 </p>
					<button class="IGS"> Pesan Sekarang </button>
				</section>
				<section><h3> Gelas Kecil </h3>
					<img src="<?=base_url()?>assets/Images/minum6.png" alt="Gelas Kecil" class="artImage"></dt>
					<p> Gelas ini sangat cocok buatmu yang suka menikmati minumanmu. <br> Mendalami rasa dan meluangkan waktu untuk relaksasi. </p>
					<p> Price: Rp40.000 </p>
					<button class="IGK"> Pesan Sekarang </button>
				</section>
			</article>
			<article id="keranjang">
			    <h2> Pesanan Kamu </h2>
				<table>
				    <thead>
					    <tr>
						    <th> No. </th>
							<th> Nama Barang </th>
							<th> Harga Barang </th>
							<th> Total (Akumulasi dalam ribuan Rupiah) </th>
						</tr>
					</thead>
					<tbody id="historyList"></tbody>
				</table>
				<button class="bayar"> Bayar Sekarang </button>
				<button class="clear"> Clear </button>
			</article>
		</content>
		<aside>
		    <article>
			    <header>
				    <h2> My Profile </h2>
				    <figure>
					    <img src="<?=base_url()?>assets/Images/myprofile.jpg" alt="My Photo" class="profileImage">
					</figure>
				</header>
				<section>
				    <table>
					    <tr>
						    <th> Nama </th>
							<td> Alif Almuqsit </td>
						</tr>
						<tr>
						    <th> Tanggal Lahir </th>
							<td> 10 Maret 2000 </td>
						</tr>
						<tr>
						    <th> Alamat </th>
							<td> Jl. Swadaya No.05, RT.010, RW.003 
							<br> Kel. Seterio, Kec. Banyuasin III, 
							<br> Kab.Bayuasin, Sumatera Selatan, 
							<br> Indonesia </td>
						</tr>
						<tr>
						    <th> No. Handphone </th>
							<td> +62878-8464-8992 </td>
						</tr>
					</table>
				</section>
			</article>
		</aside>
	</main>
	<footer>
	    <p> Submission Belajar Dasar Pemrograman Web </p>
    </footer>
	<script src="<?=base_url()?>assets/Scripts/ShopHistory.js"></script>
	<script src="<?=base_url()?>assets/Scripts/ShopStorage.js"></script>
</body>
</html>