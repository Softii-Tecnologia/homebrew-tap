class SoftiiCli < Formula
  desc "Softii internal developer CLI — static IP proxy workflow and tooling"
  homepage "https://github.com/Softii-Tecnologia/softii-cli"
  url "https://github.com/Softii-Tecnologia/softii-cli/releases/download/v0.1.0/softii-cli-0.1.0.tgz"
  sha256 "REPLACE_WITH_SHA256_AFTER_RELEASE"
  license :cannot_represent
  head "https://github.com/Softii-Tecnologia/softii-cli.git", branch: "main"

  depends_on "node"

  def install
    # Install runtime dependencies (chalk, commander)
    system "npm", "install", "--production", "--no-audit", "--no-fund", "--ignore-scripts"
    # Move package into libexec so it doesn't conflict with other node tools
    libexec.install Dir["*"]
    # Create executable wrapper that uses Homebrew's node
    (bin/"softii").write_env_script libexec/"dist/index.js",
      PATH: "#{Formula["node"].opt_bin}:$PATH"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/softii --version")
  end
end
