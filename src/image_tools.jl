"""TODO
1. Watershed algorithm
    a. convert to grayscale
    b. Find local minima
    c. Flood colors at local minima
    d. Generate grains

2. Other similar algorithms

"""

using Images, ImageSegmentation

img = load(download("http://docs.opencv.org/3.1.0/water_coins.jpg"));
bw = Gray.(img) .> 0.5;
dist = 1 .- distance_transform(feature_transform(bw));
markers = label_components(dist .< -15);
segments = watershed(dist, markers)
imshow(map(ColorTypes.RGB(rand,rand,rand), labels_map(segments)) .* (1 .-bw))       #shows segmented image
