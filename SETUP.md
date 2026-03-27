# DroidProxy Setup

## 1. Launch & Authenticate

1. Open DroidProxy from your Applications folder
2. Click the menu bar icon and select "Open Settings"
3. Click "Connect" next to Claude Code and complete the OAuth flow in your browser

## 2. Configure Factory

Open `~/.factory/settings.json` and add the following to the `customModels` array:

```json
"customModels": [
    {
      "model": "claude-opus-4-6-thinking-128000",
      "id": "custom:CC:-Opus-4.6-(Max)-0",
      "index": 0,
      "baseUrl": "http://localhost:8417",
      "apiKey": "dummy-not-used",
      "displayName": "CC: Opus 4.6 (Max)",
      "maxOutputTokens": 128000,
      "noImageSupport": false,
      "provider": "anthropic"
    }
]
```

## 3. Enable Thinking Output

1. Start Factory
2. Run `/settings`
3. Set **Show thinking in main view: On**
