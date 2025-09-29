// ShopSmart minimal interactivity
(function(){
  const $ = (sel, root=document) => root.querySelector(sel);
  const $$ = (sel, root=document) => Array.from(root.querySelectorAll(sel));

  // Image enhancement: lazy-load and fallback
  function enhanceImages(root=document){
    // Category-based secondary fallbacks (Pexels CDN)
    const pexelsFallback = {
      Clothing: [
        'https://images.pexels.com/photos/1342609/pexels-photo-1342609.jpeg?auto=compress&cs=tinysrgb&w=1200',
        'https://images.pexels.com/photos/2983464/pexels-photo-2983464.jpeg?auto=compress&cs=tinysrgb&w=1200',
        'https://images.pexels.com/photos/6311656/pexels-photo-6311656.jpeg?auto=compress&cs=tinysrgb&w=1200'
      ],
      Footwear: [
        'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1200',
        'https://images.pexels.com/photos/1478442/pexels-photo-1478442.jpeg?auto=compress&cs=tinysrgb&w=1200',
        'https://images.pexels.com/photos/19090/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1200'
      ]
    };

    $$('.product-card img, .hero-art img', root).forEach(img => {
      try { img.loading = 'lazy'; } catch(e){}
      try { img.referrerPolicy = 'no-referrer'; } catch(e){}
      if (!img.dataset.fallbackBound){
        img.addEventListener('error', () => {
          const card = img.closest('.product-card');
          const cat = card?.dataset.category || 'Clothing';
          const idx = parseInt(img.dataset.retry || '0', 10);
          const srcs = pexelsFallback[cat] || pexelsFallback['Clothing'];
          if (idx < srcs.length){
            img.dataset.retry = String(idx + 1);
            img.src = srcs[idx];
          } else if (!img.src.endsWith('images/fallback.svg')) {
            img.src = 'images/fallback.svg';
          }
        }, { once: true });
      }
    });
  }

  // Unique image mapping by product name (clothing-only, all distinct)
  const imageByName = {
    'Casual T-Shirt': 'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?q=80&w=1200&auto=format&fit=crop',
    'Formal Shirt': 'https://images.unsplash.com/photo-1520975429432-7b30f6e6f927?q=80&w=1200&auto=format&fit=crop',
    
    'Denim Jeans': 'https://images.unsplash.com/photo-1503342217505-b0a15cf70489?q=80&w=1200&auto=format&fit=crop',
    'Summer Dress': 'https://images.unsplash.com/photo-1520974735194-9e0ce827c014?q=80&w=1200&auto=format&fit=crop',
    'Hoodie': 'https://images.unsplash.com/photo-1513377882215-6a5d71ed7f09?q=80&w=1200&auto=format&fit=crop',
    'Jacket': 'https://images.unsplash.com/photo-1503341455253-b2e723bb3dbb?q=80&w=1200&auto=format&fit=crop',
    'Saree': 'https://images.unsplash.com/photo-1600635926720-64318a0f9b07?q=80&w=1200&auto=format&fit=crop',
    'Kurta Set': 'https://images.unsplash.com/photo-1580654243920-61ab681f0a4b?q=80&w=1200&auto=format&fit=crop',
    'Sneakers': 'https://images.unsplash.com/photo-1519744792095-2f2205e87b6f?q=80&w=1200&auto=format&fit=crop',
    'Sandals': 'https://images.unsplash.com/photo-1520975922993-6e04a0bd0bfc?q=80&w=1200&auto=format&fit=crop',

    'Checked Shirt': 'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?q=80&w=1200&auto=format&fit=crop',
    'Casual Chinos': 'https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?q=80&w=1200&auto=format&fit=crop',
    'Graphic Tee': 'https://images.unsplash.com/photo-1554568218-0f1715e72254?q=80&w=1200&auto=format&fit=crop',
    'Bomber Jacket': 'https://images.unsplash.com/photo-1495121605193-b116b5b09a42?q=80&w=1200&auto=format&fit=crop',
    'Running Shoes': 'https://images.unsplash.com/photo-1519741497674-611481863552?q=80&w=1200&auto=format&fit=crop',
    'Slim Fit Jeans': 'https://images.unsplash.com/photo-1491553895911-0055eca6402d?q=80&w=1200&auto=format&fit=crop',
    'Polo T-Shirt': 'https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?q=80&w=1200&auto=format&fit=crop',
    'Formal Trousers': 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?q=80&w=1200&auto=format&fit=crop',
    'Leather Loafers': 'https://images.unsplash.com/photo-1580984969071-1af9da6afdd1?q=80&w=1200&auto=format&fit=crop',

    'Floral Dress': 'https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?q=80&w=1200&auto=format&fit=crop',
    'Party Heels': 'https://images.unsplash.com/photo-1520975922993-6e04a0bd0bfc?q=80&w=1200&auto=format&fit=crop',
    'Kurti Set': 'https://images.unsplash.com/photo-1580654243920-61ab681f0a4b?q=80&w=1200&auto=format&fit=crop',
    'Elegant Saree': 'https://images.unsplash.com/photo-1600635926720-64318a0f9b07?q=80&w=1200&auto=format&fit=crop',
    'Denim Skirt': 'https://images.unsplash.com/photo-1517940310602-75f38f2cc3b8?q=80&w=1200&auto=format&fit=crop',
    'Casual Top': 'https://images.unsplash.com/photo-1519744761145-3185f82466d1?q=80&w=1200&auto=format&fit=crop',
    'Ankle Boots': 'https://images.unsplash.com/photo-1517777596323-6e3c6c1f1b47?q=80&w=1200&auto=format&fit=crop',
    'Straight Jeans': 'https://images.unsplash.com/photo-1503342452485-86ff0a8e08c3?q=80&w=1200&auto=format&fit=crop',
    'Evening Gown': 'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?q=80&w=1200&auto=format&fit=crop',
    'Women Blazer': 'https://images.unsplash.com/photo-1521335629791-ce4aec67dd47?q=80&w=1200&auto=format&fit=crop',

    'Kids T-Shirt': 'https://images.unsplash.com/photo-1519235106638-30cc49f0b417?q=80&w=1200&auto=format&fit=crop',
    'Kids Dress': 'https://images.unsplash.com/photo-1530253132539-1c1df2b4d1a5?q=80&w=1200&auto=format&fit=crop',
    'Kids Sneakers': 'https://images.unsplash.com/photo-1519744346363-64bf829d3a3a?q=80&w=1200&auto=format&fit=crop',
    'Kids Hoodie': 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?q=80&w=1200&auto=format&fit=crop',
    'Kids Shorts': 'https://images.unsplash.com/photo-1520975922993-6e04a0bd0bfc?q=80&w=1200&auto=format&fit=crop',
    'Kids Sandals': 'https://images.unsplash.com/photo-1519744433309-9cb62ba364e6?q=80&w=1200&auto=format&fit=crop',
    'Kids Jacket': 'https://images.unsplash.com/photo-1618354691438-b6f1bb111f58?q=80&w=1200&auto=format&fit=crop',
    'Kids Joggers': 'https://images.unsplash.com/photo-1593032457866-4ad8eb49c1a4?q=80&w=1200&auto=format&fit=crop',
    'Kids Kurta Set': 'https://images.unsplash.com/photo-1593032457892-9f0c7d4f1c85?q=80&w=1200&auto=format&fit=crop',
    'Kids Track Shoes': 'https://images.unsplash.com/photo-1523381210434-271e8be1f52b?q=80&w=1200&auto=format&fit=crop'
  };

  function applyImageMapping(root=document){
    let i = 1;
    $$('.product-card', root).forEach(card => {
      const nameRaw = card.dataset.name || 'Fashion';
      const name = nameRaw.trim();
      const cat = (card.dataset.category || 'Clothing').trim();
      const img = $('img', card);
      if (!img) return;
      const current = (img.getAttribute('src') || '').trim();
      // If an image is already set (from HTML or DB), do not override it
      if (current) return;
      const mapped = imageByName[name];
      if (mapped) {
        img.src = mapped;
      } else {
        const keywords = encodeURIComponent(`${name}, ${cat}, clothes, apparel, fashion`);
        img.src = `https://source.unsplash.com/800x800/?${keywords}&sig=${i++}`;
      }
    });
  }

  function ensureUniqueImages(root=document){
    const seen = new Set();
    let sig = 1;
    $$('.product-card img', root).forEach(img => {
      const url = img.getAttribute('src') || '';
      if (seen.has(url)){
        // Only alter auto-generated Unsplash Source URLs to avoid touching local/DB images
        if (url.includes('source.unsplash.com')){
          img.src = `https://source.unsplash.com/1200x900/?fashion,apparel,clothes&sig=${sig++}`;
        }
      } else {
        if (url) seen.add(url);
      }
    });
  }

  // Theme
  const savedTheme = localStorage.getItem('theme');
  if (savedTheme === 'light') document.body.classList.add('light');
  $$('#settings .theme-row button');
  $$("[data-theme]").forEach(btn => {
    btn.addEventListener('click', () => {
      const theme = btn.getAttribute('data-theme');
      if (theme === 'light') { document.body.classList.add('light'); localStorage.setItem('theme','light'); }
      else { document.body.classList.remove('light'); localStorage.setItem('theme','dark'); }
    });
  });

  // Footer year
  const yearEl = $('#year');
  if (yearEl) yearEl.textContent = new Date().getFullYear();

  // Cart helpers
  function getCart(){ try { return JSON.parse(localStorage.getItem('cart')||'[]'); } catch(e){ return []; } }
  function setCart(items){ localStorage.setItem('cart', JSON.stringify(items)); }
  function addToCart(item){
    const cart = getCart();
    const idx = cart.findIndex(x => x.id === item.id);
    if (idx > -1) cart[idx].qty += item.qty || 1; else cart.push(item);
    setCart(cart);
  }
  function removeFromCart(id){ setCart(getCart().filter(x => x.id !== id)); }
  function updateQty(id, qty){
    const cart = getCart();
    const i = cart.findIndex(x => x.id === id);
    if (i>-1){ cart[i].qty = Math.max(1, qty|0); setCart(cart); }
  }

  // Add-to-cart buttons (index, products)
  $$("[data-add]").forEach(btn => {
    btn.addEventListener('click', () => {
      const card = btn.closest('.product-card');
      if (!card) return;
      const item = {
        id: card.dataset.id,
        name: card.dataset.name,
        price: parseFloat(card.dataset.price||'0'),
        qty: 1,
        image: $('img', card)?.getAttribute('src') || 'images/product1.svg'
      };
      addToCart(item);
      btn.textContent = 'Added ✓';
      setTimeout(()=> btn.textContent = '+ Add to Cart', 1000);
    });
  });

  // Render Cart (cart.html)
  const cartList = $('#cartItems');
  if (cartList){
    function renderCart(){
      const cart = getCart();
      cartList.innerHTML = '';
      let subtotal = 0;
      cart.forEach(it => {
        const line = it.price * it.qty;
        subtotal += line;
        const row = document.createElement('div');
        row.className = 'cart-item';
        row.innerHTML = `
          <img src="${it.image}" alt="${it.name}">
          <div>
            <div><strong>${it.name}</strong></div>
            <div class="muted small">₹${it.price.toFixed(2)}</div>
          </div>
          <div class="qty">
            <input type="number" min="1" value="${it.qty}" data-qty="${it.id}">
          </div>
          <div><strong>₹${line.toFixed(2)}</strong></div>
          <div class="remove" title="Remove" data-remove="${it.id}">✕</div>
        `;
        cartList.appendChild(row);
      });
      $('#subtotal') && ($('#subtotal').textContent = '₹' + subtotal.toFixed(2));
      $('#total') && ($('#total').textContent = '₹' + subtotal.toFixed(2));

      // Bind qty & remove
      $$('input[data-qty]').forEach(inp => {
        inp.addEventListener('change', () => {
          updateQty(inp.dataset.qty, parseInt(inp.value,10));
          renderCart();
        });
      });
      $$('[data-remove]').forEach(btn => {
        btn.addEventListener('click', () => { removeFromCart(btn.dataset.remove); renderCart(); });
      });
    }
    renderCart();
  }

  const grid = $('#productGrid');
  if (grid){
    const priceRange = $('#priceRange');
    const priceValue = $('#priceValue');
    const sortSel = $('#sort');
    const resetBtn = $('#resetFilters');

    function apply(){
      const maxPrice = parseFloat(priceRange?.value || '4000');
      if (priceValue) priceValue.textContent = `₹${maxPrice}`;
      const selectedCats = $$('input[name="category"]:checked').map(c=>c.value);
      const cards = $$('.product-card', grid);
      cards.forEach(card => {
        const price = parseFloat(card.dataset.price||'0');
        const cat = card.dataset.category;
        const show = price <= maxPrice && (selectedCats.length===0 || selectedCats.includes(cat));
        card.style.display = show ? '' : 'none';
      });

      // Sort visible cards
      const sort = sortSel?.value || 'popular';
      const visible = cards.filter(c => c.style.display !== 'none');
      visible.sort((a,b)=>{
        const pa = parseFloat(a.dataset.price||'0');
        const pb = parseFloat(b.dataset.price||'0');
        if (sort==='low-high') return pa - pb;
        if (sort==='high-low') return pb - pa;
        return 0;
      }).forEach(c=>grid.appendChild(c));

      applyImageMapping(grid);
      ensureUniqueImages(grid);
      enhanceImages(grid);
    }

    sortSel && sortSel.addEventListener('change', apply);
    $$('input[name="category"]').forEach(c=>c.addEventListener('change', apply));
    resetBtn && resetBtn.addEventListener('click', () => {
      $$('input[name="category"]').forEach(c=>c.checked = true);
      if (priceRange){ priceRange.value = '4000'; }
      if (sortSel){ sortSel.value = 'popular'; }
      apply();
    });
    // Category from URL (optional pre-filter)
    const params = new URLSearchParams(location.search);
    const cat = params.get('category');
    if (cat){
      $$('input[name="category"]').forEach(c=>c.checked = (c.value===cat));
    }
    enhanceImages(grid);

    apply();
  }

  // Settings actions
  const savePwd = $('#savePassword');
  if (savePwd){ savePwd.addEventListener('click', ()=> alert('Password update submitted (frontend only)')); }
  // Enhance images on initial load too
  applyImageMapping(document);
  ensureUniqueImages(document);
  enhanceImages(document);
}());
