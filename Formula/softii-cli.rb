class SoftiiCli < Formula
  desc "Softii internal developer CLI — static IP proxy workflow and tooling"
  homepage "https://github.com/Softii-Tecnologia/softii-cli"
  url "https://raw.githubusercontent.com/Softii-Tecnologia/homebrew-tap/main/vendor/softii-cli/softii-cli-0.1.4.tar.gz"
  sha256 "8e74af415581781ee317cf1df07f642a32c833b289de3a6b2214c81a1dfdd65e"
  version "0.1.4"
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
