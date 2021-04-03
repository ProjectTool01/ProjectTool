console.log("Hello, world!")

document.getElementById("user1").addEventListener("click", openMenu2);

function openMenu2() {
	document.getElementById("dropdown").classList.toggle("active");
}