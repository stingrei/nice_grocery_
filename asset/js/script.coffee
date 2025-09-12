breakpoint = 980
isSp = false
timer = null
initNum = 0
position = 0

if window.innerWidth < breakpoint
  isSp = true


window.addEventListener "load", ()=>
  console.log('load')
  winH = window.innerHeight
  winW = window.innerWidth
  current_pos = window.scrollY
  current_btm = current_pos + winH
  checkOrientation()
  
  
    
document.addEventListener 'DOMContentLoaded', ()=>
  winH = window.innerHeight
  winW = window.innerWidth
  current_pos = window.scrollY
  current_btm = current_pos + winH
  

  
  




window.addEventListener "resize", (event) =>
  if window.innerWidth < breakpoint
    isSp = true
  else
    isSp = false
  checkOrientation()

window.addEventListener "orientationchange", (event) =>
  if window.innerWidth < breakpoint
    isSp = true
  else
    isSp = false
  checkOrientation()



window.addEventListener "scroll", (event) =>
  scrollFunction()

# スクロール時の処理
scrollFunction = ()->
  winH = window.innerHeight
  winW = window.innerWidth
  current_pos = window.scrollY
  current_btm = current_pos + winH
  
  scrollObjects = document.querySelectorAll('.scroll-in')
  scrollObjects.forEach (scrollObject)=>
    if scrollObject.getBoundingClientRect().top < 5*(winH/6)
      scrollObject.classList.add('show')

  toggleObjects = document.querySelectorAll('.scroll-toggle')
  toggleObjects.forEach (toggleObject)=>
    if toggleObject.getBoundingClientRect().top < 3*(winH/6)
      toggleObject.classList.add('on')
    else
      toggleObject.classList.remove('on')

  toggleObjects = document.querySelectorAll('.scroll-toggle-bottom')
  toggleObjects.forEach (toggleObject)=>
    if toggleObject.getBoundingClientRect().top < 6*(winH/6)
      toggleObject.classList.add('bottom')
    else
      toggleObject.classList.remove('bottom')


# アンカーリンク登録
anchorLink = ()->
  anchorLinks = document.querySelectorAll('a[href^="#"]')
  anchorLinksArr = Array.prototype.slice.call(anchorLinks)

  anchorLinksArr.forEach (link)=>
    link.addEventListener 'click', (e)=> 
      e.preventDefault()
      targetId = link.hash
      targetElement = document.querySelector(targetId)
      gap = 0 
      if !isSp
        gap = 56
      targetOffsetTop = window.pageYOffset + targetElement.getBoundingClientRect().top - gap
      window.scrollTo({
        top: targetOffsetTop,
        behavior: "smooth"
      })


