class SoftiiCli < Formula
  desc "Softii internal developer CLI — static IP proxy workflow and tooling"
  homepage "https://github.com/Softii-Tecnologia/softii-cli"
  url "git@github.com:Softii-Tecnologia/softii-cli.git",
      tag:      "v0.1.2",
      revision: "e766b4fb451ff17339b7b0f0ae162114e54337b7"
  version "0.1.2"
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
