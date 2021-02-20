// ページ読み込み後にJavaScriptの処理が行われるようにする記述
window.addEventListener('load', function() {

// 金額を入力した数値をPriceInputという変数に格納
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);


  const profit = document.getElementById("profit");
  profit.innerHTML = Math.floor(inputValue - (inputValue * 0.1));
})

})