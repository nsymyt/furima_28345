function calc() {
  let itemPrice = document.getElementById("item-price");
  const taxArea = document.getElementById("add-tax-price");
  const profitArea = document.getElementById("profit");
  
  itemPrice.addEventListener("keyup", () => {
    let price = document.getElementById("item-price").value;
    price = Number(price);
    let tax = price / 10;
    let profit = price - tax;

    taxArea.innerHTML = tax;
    profitArea.innerHTML = profit;

    if(price = "") {
      tax = "";
      profit = "";
    }

  })
}
window.addEventListener("load", calc);
