
function calc(){
  const price = document.getElementById('item-price')
  price.addEventListener("change", () => {
    let price = document.getElementById('item-price').value;
 
    const tax = Math.floor(price * 0.1);
    const taxelement = document.getElementById('add-tax-price')
    taxelement.innerHTML = tax;

    const profit = (price - tax);
    const profitelement = document.getElementById('profit')
    profitelement.innerHTML = profit
  });
}
  
  window.addEventListener("load", calc);