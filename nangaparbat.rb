# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Nangaparbat < Formula
  desc "Nanga Parbat: a fitting framework for the determination of the non-perturbative component of TMD distributions"
  homepage "https://github.com/MapCollaboration/NangaParbat"
  url "https://github.com/MapCollaboration/NangaParbat/archive/refs/tags/v1.5.0.zip"
  sha256 "cdf397e9a2d40a18e07a37f9b7d9f639735d3cf5a9ee86158c00fdb795e08964"
  license "GPL-3.0"

  depends_on "cmake" => :build
  depends_on "yaml-cpp"
  depends_on "eigen"
  depends_on "ceres-solver"
  depends_on "gsl"
  depends_on "root"
  depends_on "lhapdf"
  depends_on "apfel++"

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "install"

    prefix.install "tests/dglap_test.cc"
  end

  test do
    system "make test"
  end
end
