window.addEventListener('load', function(){

  const price = document.getElementById("item-price")
  const fee =document.getElementById("add-tax-price")
  const profit =document.getElementById("profit")
  
  price.addEventListener('keyup', function(){
    const value = price.value

    if (value >= 300 && value <= 9999999){
      let add_tax = value * 0.1
      let income = value - add_tax
      fee.textContent = add_tax
      profit.textContent = income
    } else {
      let add_tax = "-"
      let income = "-"
      fee.textContent = add_tax
      profit.textContent = income
    }
  })
})