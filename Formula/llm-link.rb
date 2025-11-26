class LlmLink < Formula
  desc "Universal LLM proxy exposing OpenAI/Ollama/Anthropic compatible endpoints"
  homepage "https://github.com/lipish/llm-link"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lipish/llm-link/releases/download/v#{version}/llm-link-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "88362ef539669cb8c20685f1fea0fee1b06389947be29d4ddcb74b0e2f406817" # arm64
    else
      url "https://github.com/lipish/llm-link/releases/download/v#{version}/llm-link-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "bc9e3eb3bc2ba5586431eac20aa0859abe081d25be5b09823a13de82a04d1e28" # intel
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lipish/llm-link/releases/download/v#{version}/llm-link-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2ddc52d14f55770cddd3c0ead9276a6a4907893b95a24092f8d5fd155e41fa6c" # linux
    end
  end

  def install
    bin.install "llm-link"
  end

  test do
    assert_match "llm-link", shell_output("#{bin}/llm-link --help")
  end
end
