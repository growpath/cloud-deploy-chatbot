FROM golang:1.16

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY go.mod go.sum ./
RUN go mod download

COPY frontdoor.go ./
COPY bot/ ./

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /gcp-notification


EXPOSE 8080

# Run
CMD ["/gcp-notification"]
