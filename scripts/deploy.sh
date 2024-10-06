#
# Deploys the python microservice to Kubernetes.
#
# Assumes the image has already been built and published to the container registry.
#
# Environment variables:
#
#   CONTAINER_REGISTRY - The hostname of your container registry.
#   VERSION - The version number of the image to deploy.
#
# Usage:
#
#   ./scripts/deploy.sh
#

set -u # or set -o nounset
: "$CONTAINER_REGISTRY"
: "$VERSION"
: "$DATABASE_URL"

# Retry function
function retry {
    local n=1
    local max=5
    local delay=5
    while true; do
        "$@" && return
        if [[ $n -lt $max ]]; then
            echo "Retrying in $delay seconds... ($n/$max)"
            sleep $delay
            ((n++))
        else
            echo "Command failed after $n attempts."
            return 1
        fi
    done
}

envsubst < ./scripts/kubernetes/deployment.yaml | kubectl apply -f -
envsubst < ./scripts/kubernetes/service.yaml | kubectl apply -f -
