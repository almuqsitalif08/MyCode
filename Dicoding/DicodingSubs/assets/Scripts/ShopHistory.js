const shop = {
	nomor: 0,
	namaBarang: "",
	hargaBarang: "",
	total: 0};

function ubahNilai (a, b, c) {
	shop.nomor = shop.nomor + 1;
	shop.namaBarang = a;
	shop.hargaBarang = b;
	shop.total = shop.total + c;
	updateNilai();
	shopStorage();}
	
function updateNilai(){
    document.querySelector("#totalShop").innerText = shop.nomor;
}

function clear(){
	shop.nomor = 0;
	shop.total = 0;
	localStorage.clear();
	updateNilai();
	renderHistory();
}

function shopStorage(){
	const shopHistory = {
		nomor: shop.nomor,
		namaBarang: shop.namaBarang,
		hargaBarang: shop.hargaBarang,
		total: shop.total
	}
	putHistory(shopHistory);
	renderHistory();
}

const buttons = document.querySelectorAll("Button");
for (let button of buttons) {
	button.addEventListener('click', function(event) {
	    const target = event.target;
        if(target.classList.contains("APS")) {
		    ubahNilai("Piring Sedang", "Rp40.000", 40);
	        return;
		}
		if(target.classList.contains("AMK")) {
			ubahNilai("Mangkok Kecil", "Rp30.000", 30);
		    return;
		}
		if(target.classList.contains("AMB")) {
			ubahNilai("Mangkok Besar", "Rp60.000", 60);
		    return;
		}
		if(target.classList.contains("ASM")) {
			ubahNilai("Sendok Makan", "Rp15.000", 15);
		    return;
		}
		if(target.classList.contains("ITS")) {
			ubahNilai("Teko Sedang", "Rp50.000", 50);
		    return;
		}
		if(target.classList.contains("ITP")) {
			ubahNilai("Teko Panjang", "Rp65.000", 65);
		    return;
		}
		if(target.classList.contains("ICS")) {
			ubahNilai("Cangkir Sedang", "Rp15.000", 15);
		    return;
		}
		if(target.classList.contains("ICB")) {
			ubahNilai("Cangkir Besar", "Rp30.000", 30);
		    return;
		}
		if(target.classList.contains("IGS")) {
			ubahNilai("Gelas Sedang", "Rp45.000", 45);
		    return;
		}
		if(target.classList.contains("IGK")) {
			ubahNilai("Gelas Kecil", "Rp40.000", 40);
		    return;
		}
		if(target.classList.contains("bayar")) {
		    const conf = confirm("Total Belanja yang harus Kamu Bayar sebesar Rp" + shop.total.toString() 
			    + ".000 \n Happy a nice day. :) ");
			if (conf == true){
				clear();
			}
			return;
		}
		if(target.classList.contains("clear")){
			clear();
			return;
		}
    });
}