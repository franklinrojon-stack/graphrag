# LLM Configuration Placeholder

The repository does not ship with a large language model provider configured. When you are ready to use DeepSeek R1:

1. Create an API key in your DeepSeek console.
2. Update `.env` with
   ```env
   DEEPSEEK_API_KEY=sk-...
   DEEPSEEK_BASE_URL=https://api.deepseek.com
   DEEPSEEK_MODEL=deepseek-reasoner
   ```
3. Expose the key to your runtime by exporting the environment variables or using `python-dotenv` in your entrypoint scripts.

If you intend to abstract the LLM client, consider wrapping the API in a module (e.g. `src/llm/client.py`) that reads from these environment variables so you can swap providers easily later.
