document.addEventListener("DOMContentLoaded", function(){
	if(isStorageExist()){
        loadDataFromStorage();
    }
	
	document.getElementById("form").addEventListener("submit", function(){
		event.preventDefault();
		addTodo();
	});
});

document.addEventListener("ondatasaved", () => {
    console.log("Data berhasil disimpan.");
});

document.addEventListener("ondataloaded", () => {
    refreshDataFromTodos();
});
