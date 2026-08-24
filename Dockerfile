FROM node:20-slim

# OmniRoute installs as a global npm package
RUN npm install -g omniroute

# OmniRoute's default port
EXPOSE 20128

# Render sets $PORT — OmniRoute needs to bind to it instead of its
# hardcoded default, so we pass it through at start time.
ENV PORT=20128
CMD ["sh", "-c", "omniroute --port ${PORT:-20128}"]
