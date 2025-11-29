class LlmLink < Formula
  desc "Universal LLM proxy exposing OpenAI/Ollama/Anthropic compatible endpoints"
  homepage "https://github.com/lipish/llm-link"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lipish/llm-link/releases/download/v#{version}/llm-link-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "6af0a90946e33b04a1ec555b00790c15496401a07590c2545923c012e8518cdc" # arm64
    else
      url "https://github.com/lipish/llm-link/releases/download/v#{version}/llm-link-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "1a908a5867fafb0396eabb418f6266a1da9bbc1d96967ac2917a5d87df8dc225" # intel
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lipish/llm-link/releases/download/v#{version}/llm-link-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "06117c03d3be6d26b10330519f53d987273d3df8b174ef85bd6050a5c2051031" # linux
    end
  end

  def install
    bin.install "llm-link"
  end

  test do
    assert_match "llm-link", shell_output("#{bin}/llm-link --help")
  end
end
