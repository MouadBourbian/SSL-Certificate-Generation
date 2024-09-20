$imageName = "openssl-ubuntu"
$containerName = "openssl-container"
$SSLPath = (Get-Location).Path

docker build -t $imageName .
docker run --rm -it --name $containerName -v "${SSLPath}/SSL-Output:/SSL-Output" $imageName