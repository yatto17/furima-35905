function commission (){
  const itemPrice = document.getElementById("item-price");
  
  itemPrice.addEventListener('keyup', () => {
    const taxPrice = parseInt(itemPrice.value / 10, 10);
    const addTaxPrice = document.getElementById("add-tax-price");
    const profitValue = parseInt(itemPrice.value - taxPrice);
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = (`${taxPrice}`);
    profit.innerHTML = (`${profitValue}`);
  });
}

window.addEventListener('load', commission);