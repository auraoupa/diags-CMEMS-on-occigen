montage vertical_noise_iceland-ireland_NATL60-CJM165.png vertical_noise_iceland-ireland_EU36.L75.png vertical_noise_iceland-ireland_NACHOS12-MAA4001.png -geometry 2048x1024 -tile 1x3 -quality 100 vertical_noise_iceland-ireland.png
convert vertical_noise_iceland-ireland.png -trim -bordercolor White -border 20x10 +repage vertical_noise_iceland-ireland.png

montage vertical_noise_ireland-spain_NATL60-CJM165.png vertical_noise_ireland-spain_EU36.L75.png vertical_noise_ireland-spain_NACHOS12-MAA4001.png -geometry 2048x1024 -tile 1x3 -quality 100 vertical_noise_ireland-spain.png
convert vertical_noise_ireland-spain.png -trim -bordercolor White -border 20x10 +repage vertical_noise_ireland-spain.png

montage vertical_diffusivity_iceland-ireland_NATL60-CJM165.png vertical_diffusivity_iceland-ireland_EU36.L75.png vertical_diffusivity_iceland-ireland_NACHOS12-MAA4001.png -geometry 2048x1024 -tile 1x3 -quality 100 vertical_diffusivity_iceland-ireland.png
convert vertical_diffusivity_iceland-ireland.png -trim -bordercolor White -border 20x10 +repage vertical_diffusivity_iceland-ireland.png

montage vertical_diffusivity_ireland-spain_NATL60-CJM165.png vertical_diffusivity_ireland-spain_EU36.L75.png vertical_diffusivity_ireland-spain_NACHOS12-MAA4001.png -geometry 2048x1024 -tile 1x3 -quality 100 vertical_diffusivity_ireland-spain.png
convert vertical_diffusivity_ireland-spain.png -trim -bordercolor White -border 20x10 +repage vertical_diffusivity_ireland-spain.png

montage vertical_velocity_iceland-ireland_NATL60-CJM165.png vertical_velocity_iceland-ireland_EU36.L75.png vertical_velocity_iceland-ireland_NACHOS12-MAA4001.png -geometry 2048x1024 -tile 1x3 -quality 100 vertical_velocity_iceland-ireland.png
convert vertical_velocity_iceland-ireland.png -trim -bordercolor White -border 20x10 +repage vertical_velocity_iceland-ireland.png

montage vertical_velocity_ireland-spain_NATL60-CJM165.png vertical_velocity_ireland-spain_EU36.L75.png vertical_velocity_ireland-spain_NACHOS12-MAA4001.png -geometry 2048x1024 -tile 1x3 -quality 100 vertical_velocity_ireland-spain.png
convert vertical_velocity_ireland-spain.png -trim -bordercolor White -border 20x10 +repage vertical_velocity_ireland-spain.png