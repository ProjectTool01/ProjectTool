document.querySelectorAll('.tabs-triggers__item').forEach((item) => 
	item.addEventListener('click', function (e) {
		e.preventDefault();
		const id = e.target.getAttribute('href').replace('#', '');

		document.querySelectorAll('.tabs-triggers__item').forEach(
			(child) => child.classList.remove('tabs-triggers__item--active')
		);

		document.querySelectorAll('.content__item').forEach(
			(child) => child.classList.remove('content__item--active')
		);

		item.classList.add('tabs-triggers__item--active');
		item.classList.add('login_tab-link--active:after');
		document.getElementById(id).classList.add('content__item--active');
	})
);

document.querySelector('.tabs-triggers__item').click();