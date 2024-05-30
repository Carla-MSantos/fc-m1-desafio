FROM golang:1.22.3 as builder 
WORKDIR /app
COPY . .
#fazer o build da aplicação
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o fullcycle
#ENTRYPOINT [ "/app/fullcycle" ]

#a partir daqui é para diminuir o tamanho da image 
FROM scratch
COPY --from=builder /app/fullcycle /fullcycle
ENTRYPOINT [ "/fullcycle" ]
