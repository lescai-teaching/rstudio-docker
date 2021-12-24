apt-get -y install \
  ant \
  bzip2 \
  clang \
  clang-6.0 \
  cmake \
  debsigs \
  dpkg-sig \
  expect \
  fakeroot \
  gcc \
  gnupg1 \
  libacl*-dev \
  libacl*-dev \
  libattr1-dev \
  libboost-all-dev \
  libcap-dev \
  libcap-dev \
  libcurl4-openssl-dev \
  libffi-dev \
  libglib2.0-dev \
  libpam0g-dev \
  libpango-1.0-0 \
  libpq-dev \
  libsqlite-dev \
  libssl*-dev \
  libuser1-dev \
  libxml-commons-external-java \
  lsof \
  make \
  mesa-common-dev \
  openjdk-*-jdk  \
  patchelf \
  python \
  r-base \
  rrdtool \
  uuid-dev \
  wget \
  zlib1g

update-alternatives --install /usr/bin/clang clang /usr/bin/clang-6.0 100
update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-6.0 100