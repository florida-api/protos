FROM bufbuild/buf:latest
WORKDIR /workspace
COPY . .
CMD ["buf", "generate"]
