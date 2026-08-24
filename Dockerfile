FROM node:20-slim

# better-sqlite3 (an OmniRoute dependency) compiles native bindings during
# install — the slim image needs these build tools present first, or the
# npm install fails with a gyp/node-gyp error.
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# OmniRoute installs as a global npm package
RUN npm install -g omniroute

# OmniRoute's default port
EXPOSE 20128

# Render sets $PORT — OmniRoute needs to bind to it instead of its
# hardcoded default, so we pass it through at start time.
ENV PORT=20128
CMD ["sh", "-c", "omniroute --port ${PORT:-20128}"]
