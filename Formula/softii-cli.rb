class SoftiiCli < Formula
  desc "Softii internal developer CLI — static IP proxy workflow and tooling"
  homepage "https://github.com/Softii-Tecnologia/softii-cli"
  url "git@github.com:Softii-Tecnologia/softii-cli.git",
      tag:      "v0.1.0",
      revision: "9f58af7a6a30d4ae6679a583de2ce0d0d463c56a"
  version "0.1.0"
  license :cannot_represent
  head "git@github.com:Softii-Tecnologia/softii-cli.git", branch: "main"

  depends_on "node"
  depends_on "yarn" => :build

  def install
    system "yarn", "install", "--frozen-lockfile"
    system "yarn", "build"

    libexec.install Dir["*"]

    (bin/"softii").write_env_script libexec/"dist/index.js",
      PATH: "#{Formula["node"].opt_bin}:$PATH"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/softii --version")
  end
end
