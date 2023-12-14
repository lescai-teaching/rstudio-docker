# docker buildx create --platform "linux/amd64,linux/arm64" --name buildermulti --use
docker buildx build \
--label org.opencontainers.image.title=rstudio-docker \
--label org.opencontainers.image.description='container running RStudio Server on multiplatform to be used with UniPV course' \
--label org.opencontainers.image.url=https://github.com/lescai-teaching/rstudio-docker \
--label org.opencontainers.image.source=https://github.com/lescai-teaching/rstudio-docker --label org.opencontainers.image.version=5.0.2 \
--label org.opencontainers.image.created=2023-07-19T12:39:11.393Z \
--label org.opencontainers.image.licenses=MIT \
--platform linux/amd64,linux/arm64 \
--tag ghcr.io/lescai-teaching/rstudio-docker:5.0.2 \
--tag ghcr.io/lescai-teaching/rstudio-docker:latest \
--push .