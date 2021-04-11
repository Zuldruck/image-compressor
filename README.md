# image-compressor

## What is it ?

**image-compressor** is a program written in Haskell to compress the colors in an image.
To do so it uses the clustering algorithm K-Means.

## Example

A landscape with in order : no compression, 2, 4, and 8 clusters of compression.
<div style="flex-direction=row">
	<img src="https://github.com/Zuldruck/image-compressor/blob/main/img/no_clustering.jpeg?raw=true" height=300 />
    <img src="https://github.com/Zuldruck/image-compressor/blob/main/img/two_clusters.png?raw=true" height=300 />
</div>
<div style="flex-direction=row">
	<img src="https://github.com/Zuldruck/image-compressor/blob/main/img/four_clusters.png?raw=true" height=300 />
    <img src="https://github.com/Zuldruck/image-compressor/blob/main/img/eight_clusters.png?raw=true" height=300 />
</div>


A fox logo with in order : no compression, 2, 4, and 8 clusters of compression.
<div style="flex-direction=row">
	<img src="https://github.com/Zuldruck/image-compressor/blob/main/img/fox.png?raw=true" height=300 />
    <img src="https://github.com/Zuldruck/image-compressor/blob/main/img/fox_2.png?raw=true" height=300 />
</div>
<div style="flex-direction=row">
	<img src="https://github.com/Zuldruck/image-compressor/blob/main/img/fox_4.png?raw=true" height=300 />
    <img src="https://github.com/Zuldruck/image-compressor/blob/main/img/fox_8.png?raw=true" height=300 />
</div>

## How to run it ?

    stack build
    stack exec ImageCompressor-exe -n cluster_nb -f file_path

## File Format

Files passed to the program must be formatted following this grammar :

    IN    ::= POINT ' ' COLOR ('\n' POINT ' ' COLOR)*
    POINT ::= '('int','int')'
    COLOR ::= '('SHORT','SHORT','SHORT')'
    SHORT ::= '0'..'255'
