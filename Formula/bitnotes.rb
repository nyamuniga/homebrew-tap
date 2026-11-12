class Bitnotes < Formula
  desc "Cashu wallet and printable Bitcoin bearer notes"
  homepage "https://github.com/nyamuniga/paper-bitcoin"
  url "https://github.com/nyamuniga/paper-bitcoin/archive/refs/tags/v0.1.20.tar.gz"
  sha256 "3f25ae43650d3ef3b7ebd424090b328bdb90cf48db2ef8e9b66a5cfbbd41a40b"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install",
           *std_cargo_args(path: "crates/ecash-cli"),
           "--bin", "bitnotes"
  end

  test do
    assert_match "bitnotes #{version}",
                 shell_output("#{bin}/bitnotes --version")

    system bin/"bitnotes", "--help"
  end
end
