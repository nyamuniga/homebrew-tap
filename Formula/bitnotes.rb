class Bitnotes < Formula
  desc "Cashu wallet and printable Bitcoin bearer notes"
  homepage "https://github.com/nyamuniga/paper-bitcoin"
  url "https://github.com/nyamuniga/paper-bitcoin/archive/refs/tags/v0.1.19.tar.gz"
  sha256 "e9207cb0f4573dc06771aeaf2abf5d0493b5d9b5098cebfdd6e3fc1f408878b0"
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
