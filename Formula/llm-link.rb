class LlmLink < Formula
  desc "Universal LLM proxy exposing OpenAI/Ollama/Anthropic compatible endpoints"
  homepage "https://github.com/lipish/llm-link"
  version "0.3.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lipish/llm-link/releases/download/v#{version}/llm-link-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2befe06c3a6fa331fa4b5424f1f2c4f6e9e2cd377191a8924d12667a759e6415" # arm64
    else
      url "https://github.com/lipish/llm-link/releases/download/v#{version}/llm-link-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "39f92795c8483fe5bb313eceb98dd2524445d95be6dae2a9add91a904ecaeca8" # intel
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lipish/llm-link/releases/download/v#{version}/llm-link-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e2883058aeb00e869a45afb657d19340ac8b1eb8625a372817896bcb99ff4c3" # linux
    end
  end

  def install
    bin.install "llm-link"
  end

  test do
    assert_match "llm-link", shell_output("#{bin}/llm-link --help")
  end
end
