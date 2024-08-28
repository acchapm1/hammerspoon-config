--- === ChatGPT ===
---
--- Replace clipboard contents with ChatGPT
---
--- Place this file in the ~/.hammerspoon directory with the following structure
--- ── Spoons
---    └── ChatGPT.spoon
---        └── init.lua
---
--- To use, add the following lines to ~/.hammerspooon/init.lua. Replace with your preferred hot key.
--- The example below uses Control + Option + Command + r
--- hs.loadSpoon('ChatGPT')
--- spoon.ChatGPT:bindHotkeys({
---   replace = { {"cmd", "alt", "ctrl"}, "R" },
--- })
---
--- Code by @jcconnell, spoon by JC Connell <jc@jcconnell.com>
---
--- https://github.com/jcconnell

local obj = {}
obj.__index = obj

-- Metadata
obj.name = 'ChatGPT'
obj.version = '1.0'
obj.author = 'JC Connell <jc@jcconnell.com>'
obj.license = 'MIT - https://opensource.org/licenses/MIT'

--- ChatGPT.api_key
--- Variable
--- String api developer key. Can be found [here](https://platform.openai.com/account/api-keys)
obj.api_key = 'YOUR-API-KEY-HERE'

--- ChatGPT.model
--- Variable
--- String indicating which model should be used. Default is text-davinci-003. More models available [here](https://platform.openai.com/docs/models/overview)
obj.model = 'text-davinci-003'

--- ChatGPT.temperature
--- Variable
--- Float indicating which temperature should be used. Default is 1.
obj.temperature = 1.0

--- ChatGPT.max_tokens
--- Variable
--- Integer indicating max length of the response. Default is 4000.
obj.max_tokens = 4000

--- ChatGPT.logger
--- Variable
--- Logger object used within the Spoon. Can be accessed to set the default log level for the messages coming from the Spoon.
obj.logger = hs.logger.new('ChatGPT')

--- ChatGPT:replaceWithConfig(model, temperature, max_tokens)
--- Method
--- Sends an item to ChatGPT using the ChatGPT api
---
--- Parameters:
---  * model - String
---  * temperature - Float
---  * max_tokens - Integer
function obj:replaceWithConfig(model, temperature, max_tokens)
    model = model or obj.model
    temperature = temperature or obj.temperature
    max_tokens = max_tokens or obj.max_tokens

    assert(obj.api_key, 'API key must be provided')

    local board = hs.pasteboard.getContents()
    obj.logger.df("clipboard contents %s", board)
    obj.logger.df("obj.api_key %s", obj.api_key)
    obj.logger.df("model %s", model)
    obj.logger.df("temperature %s", temperature)
    obj.logger.df("max_tokens %s", max_tokens)

    local response =
        hs.http.asyncPost(
            'https://api.openai.com/v1/completions',
            hs.json.encode(
                {
                    ['model'] = model,
                    ['temperature'] = temperature,
                    ['max_tokens'] = max_tokens,
                    ['prompt'] = board
                }
            ),
            {
                ["Content-Type"] = "application/json",
                ["Authorization"] = string.format("Bearer %s", obj.api_key)
            },
            function(http_code, response)
                local decoded_data = hs.json.decode(response)
                if http_code == 200 then
                    local choice = decoded_data.choices[1].text
                    hs.pasteboard.setContents(choice)
                    hs.notify.new({title = 'ChatGPT Replace Successful', informativeText = choice}):send()
                    obj.logger.df("chatgpt response: %s", response)
                else
                    hs.notify.new({title = 'ChatGPT Replace Failed!', informativeText = decoded_data.error.message}):send()
                    obj.logger.df("chatgpt response: %s", response)
                end
            end
        )
end

--- ChatGPT:replace(model, temperature, max_tokens)
--- Method
--- Sends an item to ChatGPT using the ChatGPT api with defaults
function obj:replace()
    obj:replaceWithConfig('text-davinci-003', 1.0, 100)
end

--- ChatGPT:bindHotkeys(mapping)
--- Method
--- Binds hotkeys for ChatGPT
---
--- Parameters:
---  * mapping - A table containing hotkey objifier/key details for the following items:
---   * replace - replace text with ChatGPT
function obj:bindHotkeys(keys)
    assert(keys['replace'], "Hotkey variable is 'replace'")

    hs.hotkey.bindSpec(
        keys['replace'],
        'Replace an item with ChatGPT.',
        function()
            obj:replace()
        end
    )
end

return obj