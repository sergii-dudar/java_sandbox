#!/opt/homebrew/bin/bash

check_artifact_exists() {
    local lib_name=$1
    local lib_def_version=$2

    local nexus_url="https://nexus.shared.avalaunch.rbua/service/rest/v1/search?repository=maven-common-libs-releases&group=ua.raiffeisen.payments.infra&name=${lib_name}&version=${lib_def_version}"
    echo "checking existing by url: $nexus_url"

    if curl -s "$nexus_url" | grep -q "${lib_name}-${lib_def_version}"; then
        echo "Artifact ${lib_name}-${lib_def_version} exists in Nexus."
        return 0
    else
        echo "Artifact ${lib_name}-${lib_def_version} does not exist in Nexus."
        return 1
    fi
}

publish_if_not_exists() {
    local lib_name=$1
    cd "$lib_name" || exit

    local lib_def_version
    lib_def_version="$(cat VERSION)"

    if check_artifact_exists "$lib_name" "$lib_def_version"; then
        echo "Skipping deployment of the artifact $lib_name:$lib_def_version as already exists in artifactory."
    else
        echo "Start deploying the artifact $lib_name:$lib_def_version."
        #mvn -U deploy -s ../settings.xml
        mvn clean install -U
    fi

    cd ..
}

publish_if_not_exists "infra-kafka-streams"
publish_if_not_exists "infra-logging"