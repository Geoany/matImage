% IMFILTERS Generic filters for image processing
% Version 1.1 01-Jul-2011 .
%
%   Image enhancement, noise removal:
%   imAdjustDynamic          - Rescale gray levels of image to get better dynamic
%   imMeanFilter             - Compute mean value in the neighboorhood of each pixel
%   imMedianFilter           - Compute median value in the neighboorhood of each pixel
%   imGaussianFilter         - Apply gaussian filter to an image, using separability
%   imDirectionalFilter      - Apply and combine several directional filters
%   imNormalizeBackground    - Normalize image by removing background estimate
%
%   Gradient and Laplacian filters:
%   imGradientFilter         - Compute gradient components of a grayscale image
%   imLaplacian              - Discrete Laplacian of an image
%   imHessian                - Compute coefficients of Hessian matrix for each pixel
%   imEigenValues            - Image eigen values from second derivatives
%   imEigenValues3d          - Image eigen values from second derivatives
%   imVesselness2d           - Vesselness of cuvilinear structures from Frangi paper
%   imRobinsonFilter         - Extract image edges using Robinson directional filters
%   imKirschFilter           - Extract image edges using Kirsch directional filters
%
%   Morphological filters:
%   imMorphoGradient         - Morphological gradient of an image
%   imMorphoLaplacian        - Morphological laplacian of an image
%   imrecerode               - Perform a morphological reconstruction by erosion
%   imHConcave               - H-concave transformation of an image
%   imHConvex                - H-convex transformation of an image
%
%   Geometric filters:
%   imFlip                   - Flip an image along one of its dimensions
%   imRotate90               - Rotate a 3D image by 90 degrees around one image axis
%   imAddBorder              - Add a border around a 2D or 3D image
%   imTranspose              - Transpose an image (grayscale or RGB)
%   imCropBox                - Crop an image with a box
%   subsample                - Subsample an array by applying operation on blocs
%   subsamplergb             - Return a sub-sampled version of an rgb image.
%
%   Segmentation:
%   imOtsuThreshold          - Threshold an image using Otsu method
%   imMaxEntropyThreshold    - Compute image threshold using maximisation of entropies
%   imImposedWatershed       - Compute watershed after imposition of extended minima
%   imCannyEdgeDetector      - Edge detection using Canny-Deriche method
%
%   Color and gray-scale conversions
%   imOverlay                - Add colored markers to an image (2D or 3D, grayscale or color)
%   imSplitChannels          - Split the 3 channels of a 2D or 3D image
%   imMergeChannels          - Merge 3 channels to create a 2D or 3D color image
%   double2rgb               - Create a RGB image from double values
%   angle2rgb                - Convert an image of angles to color image
%   imGetHue                 - Extract hue of a color image, using rgb2hsv.
%   imGray12ToGray8          - Convert a 12 bits gray scale image to 8 bits gray scale
%
%   Filters for binary images:
%   imBoundary               - Compute the boundary image of a binary image
%   imFillHoles              - Fill holes in a binary image
%   imDistanceMap            - Compute chamfer distance using scanning algorithm
%   imDistanceClasses        - Converts a distance map to a label image of regions
%   imThicknessMap           - Compute thickness map of a binary image
%   imSkeleton               - Homothopic skeleton of a binary image 
%   imLabelSkeleton          - Label skeleton pixels according to local topology
%   imChainPixels            - Chain neighbor pixels in an image to form a contour
%   imConvexImage            - Compute smallest convex image containing the original pixels
%   imDistance               - Distance map computed from a set of points
%   imDistance3d             - Create distance image from a set of 3D points
%
%   Filters for binary/label images:
%   label2rgb3d              - Convert a 3D label image to a 3D RGB image
%   imLabelToValue           - Convert label image to parametric map
%   imKillBorderRegions      - Remove regions on the border of an image
%   imAreaOpening            - Remove all regions smaller than a given area
%   imAttributeOpening       - Filter regions on a size or shape criterium
%   imSeparateParticles      - Separate touching particles using watershed algorithm
%   imLargestRegion          - Keep the largest region in a binary or label image
%   imCropLabel              - Extract the portion of image that contains the specified label
%   imMergeLabels            - Merge regions in a labeled image
%   mergeRegions             - Merge regions of labeled image, using inclusion criteria
%   imBoundaryIndices        - Find indices of boundary between 2 cells
%   imLabelEdges             - Label edges between adjacent regions of labeled image.
%
%   Utilities and drawing
%   imCreate                 - Create a new image with given the size and type
%   imCheckerBoard           - Create a checkerboard image from 2 images
%   imCheckerboardLabels     - Create a checkerboard label image
%   imThumbnail              - Resize an image to bound the size in each direction
%   imDrawLine               - Draw a line between two points in the image
%   bresenhamLine            - Integer coordinates of a bresenham line
%   imDrawText               - Draw some text in an image
%   imTpsWarp                - Warp an image using Thin-Plate Splines transform
%
%   Indexed images:
%   imLUT                    - Apply a look-up table (LUT) to a gray-scale image.
%   grayFilter               - Compute configuration map of a binary image
%   grayHist                 - Compute frequencies of configurations in binary images
%   createTile               - Create a binary tile (2x2) from its index
%   tileIndex                - Return the index of a 2x2 binary tile
%   createTile3d             - Create a 3D binary tile (2x2x2) from its index
%   tileIndex3d              - Return the index of a 2x2x2 binary tile
%
%   Kernels and structuring elements:
%   ball                     - Generate a ball in a matrix in 2 or 3 dimensions
%   gaussianKernel3d         - Create a 3D Gaussian kernel for image filtering
%   orientedGaussianKernel   - Oriented Gaussian kernel for directional filtering
%   orientedLaplacianKernel  - Oriented Laplacian kernel for directional filtering
%   cross3d                  - Return a 3D structuring element with cross shape
%   intline                  - Integer-coordinate line drawing algorithm.
%   strelDisk                - Discrete disk structuring element
%   imNeighborhood           - Return the neighborhood of a given pixel
%
%
% Author: David Legland
% e-mail: david.legland@inra.fr
% http://github.com/dlegland/matImage
% Copyright 2009 INRA - Cepia Software Platform.

% display help if executed
help Contents

%   Deprecated functions
%   convexImage              - Compute smallest convex image containing the original pixels
%   imdirfilter              - Apply and combine several directional filters
%   immean                   - Compute mean value in the neighboorhood of each pixel
%   immedian                 - Compute median value in the neighboorhood of each pixel
%   imRescale                - Rescale gray levels of image to get better dynamic
%   findContour              - Chain neigbor pixels to form a contour
%   imGaussFilter            - Apply gaussian filter to an image, using separability
%   removeBorderRegions      - Remove regions on the border of an image
%   createImage              - Create a new image with given size and type
%   imMergeBands             - Merge 3 bands to create a 2D or 3D color image
%   imSplitBands             - Split the 3 bands of a 2D or 3D image
%   imGradient               - Compute gradient magnitude of a grayscale image
%   imKillBorders            - Remove regions on the border of an image

%   Not supported functions
%   imMergeCells             - merge labeled cell of an image

%   Other functions
