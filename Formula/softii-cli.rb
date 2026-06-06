class SoftiiCli < Formula
  desc "Softii internal developer CLI — static IP proxy workflow and tooling"
  homepage "https://github.com/Softii-Tecnologia/softii-cli"
  url "https://raw.githubusercontent.com/Softii-Tecnologia/homebrew-tap/main/vendor/softii-cli/softii-cli-0.1.12.tar.gz"
  sha256 "1d0354e377d16f918a1f8099665b5f1ac669811cdb8685591bb7ecf2e4c33aa0"
  version "0.1.12"
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
