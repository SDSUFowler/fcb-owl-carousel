function rebuildCarousel() {
var owl= $('.news-slider-full-width');
owl.owlCarousel({
	autoplay: false,
	lazyLoad: true,
	loop: true,
	margin: 25,
	stagePadding: 30,
	animateOut: 'fadeOut',
	animateIn: 'fadeIn',
	responsiveClass: true,
	smartSpeed: 400,
	nav: true,
	dots: false,
	navText: ['<i class="fa fa-caret-left"></i>','<i class="fa fa-caret-right"></i>'],
	responsive: {
		0: {
			items: 1
		},
		600: {
			items: 2
		},
		850: {
			items: 3
		},
		1100: {
			items: 4
		},
		1350: {
			items: 5
		},
		1600: {
			items: 6
		}
	}
});		
}
