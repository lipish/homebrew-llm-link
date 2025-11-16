class LlmLink < Formula
  desc "Universal LLM proxy exposing OpenAI/Ollama/Anthropic compatible endpoints"
  homepage "https://github.com/lipish/llm-link"
  version "0.3.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lipish/llm-link/releases/download/v#{version}/llm-link-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0e23b1d4e0c2edb5ac9bc43322713f1e9fb01a8560ed954100e54c293c0a30c9" # arm64
    else
      url "https://github.com/lipish/llm-link/releases/download/v#{version}/llm-link-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "5b39a5e5b48009e3c9b2032458940be05210f9ee273a143b3d61136ca1d7e4fd" # intel
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lipish/llm-link/releases/download/v#{version}/llm-link-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8ee440db010875fcf2cfea21c17375a73708c5f12bf817ccc56344a9a25075ef" # linux
    end
  end

  def install
    bin.install "llm-link"
  end

  test do
    assert_match "llm-link", shell_output("#{bin}/llm-link --help")
  end
end
