class SoftiiCli < Formula
  desc "Softii internal developer CLI — static IP proxy workflow and tooling"
  homepage "https://github.com/Softii-Tecnologia/softii-cli"
  url "https://raw.githubusercontent.com/Softii-Tecnologia/homebrew-tap/main/vendor/softii-cli/softii-cli-0.1.14.tar.gz"
  sha256 "72d29f4bc3454ae8166cb98964e25af8e348511b442ce0bca9b85572043cfdaa"
  version "0.1.14"
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
