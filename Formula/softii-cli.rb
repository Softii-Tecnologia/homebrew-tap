class SoftiiCli < Formula
  desc "Softii internal developer CLI — static IP proxy workflow and tooling"
  homepage "https://github.com/Softii-Tecnologia/softii-cli"
  url "https://raw.githubusercontent.com/Softii-Tecnologia/homebrew-tap/main/vendor/softii-cli/softii-cli-0.1.8.tar.gz"
  sha256 "05c1f0590122dc61da762cb7fb3b83633cb9178756d02b40c9531443eaee1e3c"
  version "0.1.8"
  license :cannot_represent

  depends_on "node"

  def install
    libexec.install "dist/index.js"

    (bin/"softii").write_env_script libexec/"index.js",
      PATH: "#{Formula["node"].opt_bin}:$PATH"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/softii --version")
  end
end
