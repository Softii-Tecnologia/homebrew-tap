class SoftiiCli < Formula
  desc "Softii internal developer CLI — static IP proxy workflow and tooling"
  homepage "https://github.com/Softii-Tecnologia/softii-cli"
  url "https://raw.githubusercontent.com/Softii-Tecnologia/homebrew-tap/main/vendor/softii-cli/softii-cli-0.1.5.tar.gz"
  sha256 "2a17fd87740ff4a968f4b8d339e4bcfa665594d32baafe06dad2b394a1ae4b16"
  version "0.1.5"
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
