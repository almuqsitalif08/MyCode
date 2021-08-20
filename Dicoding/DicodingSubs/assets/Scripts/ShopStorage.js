const CACHE_KEY = "SHOP_STORAGE";

function checkForStorage() {
    return typeof(Storage) !== "undefined";}

function putHistory(data) {
    if (checkForStorage()) {
        let historyData = null;
        if (localStorage.getItem(CACHE_KEY) === null) {
            historyData = [];
		} else {
            historyData = JSON.parse(localStorage.getItem(CACHE_KEY));
		}
        historyData.unshift(data);
        localStorage.setItem(CACHE_KEY, JSON.stringify(historyData));
	}
}

function showHistory() {
    if (checkForStorage) {
        return JSON.parse(localStorage.getItem(CACHE_KEY));}
    else { 
        return [];
	}
}

function toShop(){
	const hist = showHistory();
	if(hist == []){
		return;
	} else {
		shop.nomor = histor.nomor;
	    shop.total = histor.total;
	}
	updateNilai();
}

function renderHistory() {
    const historyData = showHistory();
    let historyList = document.querySelector("#historyList");
    historyList.innerHTML = " ";
    for (let history of historyData.reverse()) {
        let row = document.createElement('tr');
        row.innerHTML = "<td>" + history.nomor + "</td>";
        row.innerHTML += "<td>" + history.namaBarang + "</td>";
        row.innerHTML += "<td>" + history.hargaBarang + "</td>";
        row.innerHTML += "<td>" + history.total + "</td>";
        historyList.appendChild(row);
	}
}

toShop();
renderHistory();