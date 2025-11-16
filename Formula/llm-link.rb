class LlmLink < Formula
  desc "Universal LLM proxy exposing OpenAI/Ollama/Anthropic compatible endpoints"
  homepage "https://github.com/lipish/llm-link"
  version "0.3.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lipish/llm-link/releases/download/v#{version}/llm-link-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "18db41f331da29c1f2f1d6803dd36770dbb364f4861c7b5cd4dd40f49b910849" # arm64
    else
      url "https://github.com/lipish/llm-link/releases/download/v#{version}/llm-link-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3051e3aa2ae8f864aeb18a0c93e1d97de46ba965bc7f17b91dbf13f6be3fe1c3" # intel
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/lipish/llm-link/releases/download/v#{version}/llm-link-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "085a58e33c7e8bd37293937341e61e6618166882d7b52be6b5ae9284ef1d846e" # linux
    end
  end

  def install
    bin.install "llm-link"
  end

  test do
    assert_match "llm-link", shell_output("#{bin}/llm-link --help")
  end
end
