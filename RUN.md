# Running the Script
This guide explains how to make your script executable and run it with a `BASE_URL` parameter.

---
## 1. Make the script executable

Run the following command to give execute permission to the script:
```bash
chmod +x ./script
```
## 2.  Run the script with the `BASE_URL` argument
Execute the script by passing the desired base URL as a parameter:
```bash
./script $BASE_URL
```
Replace `$BASE_URL` with your actual URL.

### Example: 
```bash
./script https://devurl/bhupin444/adk-ui/
```

Now run Dockerfile
```bash
GIT_HASH=$(git rev-parse --short HEAD)
## or
GIT_HASH=$(git rev-parse HEAD)
docker build -t adk-web:latest -t adk-web:$GIT_HASH .
```