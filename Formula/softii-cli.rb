class SoftiiCli < Formula
  desc "Softii internal developer CLI — static IP proxy workflow and tooling"
  homepage "https://github.com/Softii-Tecnologia/softii-cli"
  url "ssh://git@github.com/Softii-Tecnologia/softii-cli.git",
      using:    GitDownloadStrategy,
      tag:      "v0.1.3",
      revision: "c55edc8e031b85d9c7968533c11e0ed8bc331da7"
  version "0.1.3"
  license :cannot_represent
  head "git@github.com:Softii-Tecnologia/softii-cli.git", branch: "main"

  depends_on "node"

  def install
    # dist/index.js is a prebuilt bundle committed to the release tag.
    # No yarn install or build step needed — all deps are inlined.
    libexec.install "dist/index.js"

    (bin/"softii").write_env_script libexec/"dist/index.js",
      PATH: "#{Formula["node"].opt_bin}:$PATH"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/softii --version")
  end
end
