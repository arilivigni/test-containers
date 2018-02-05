FROM fedora:26
LABEL maintainer="Ari LiVigni" \
      description="This container is meant to \
      build a container that will fail building sometimes. \
      It will leverage a script called opt-test.sh"

# Install all package requirements
RUN for i in {1..5} ; do dnf -y install ansible \
        curl \
        dnf-plugins-core \
        file \
        findutils \
        git \
        libselinux-python \
        python2-dnf \
        rsync \
        standard-test-roles \
        sudo \
        wget \
        && dnf clean all \
        && break || sleep 10 ; done

# Copy the build script to the container
COPY opt-test.sh /tmp/opt-test.sh

# Fail image build if FAIL_IT = true
RUN if [ "${FAIL_IT}" == "true" ]; then
        echo "FAIL_IT: true";
        exit 1;
    else
        echo "FAIL_IT: false";
    fi

# Run the build script
ENTRYPOINT ["bash", "/tmp/opt-test.sh"]

