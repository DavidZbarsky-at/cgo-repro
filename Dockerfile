FROM ubuntu
RUN apt-get update && apt-get install -y vim ca-certificates curl hyperfine git libncurses6
RUN curl -L https://github.com/bazelbuild/bazelisk/releases/download/v1.18.0/bazelisk-linux-arm64 -o /usr/bin/bazel && chmod +x /usr/bin/bazel

RUN adduser fakeuser
USER fakeuser

WORKDIR /hyperbase
COPY .bazelversion .
RUN touch ./WORKSPACE

RUN curl -fsSL https://raw.githubusercontent.com/bazelbuild/bazel/$(cat .bazelversion)/scripts/bazel-complete-header.bash >> ~/.bashrc
RUN curl -fsSL https://raw.githubusercontent.com/bazelbuild/bazel/$(cat .bazelversion)/scripts/bazel-complete-template.bash >> ~/.bashrc
RUN bazel help completion >> ~/.bashrc
