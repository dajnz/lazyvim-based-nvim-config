---------
-- Plugin for generating fake text (lorem ipsum)
-- Usage: type loremX for X words, and loremXp for X paragraphs
---------

return {
    'derektata/lorem.nvim',

    config = function()
        require('lorem').opts {
            -- using a default configuration
            sentence_length = 'mixed',
            -- 30% chance to insert a comma
            comma_chance = 0.3,
            -- maximum 2 commas per sentence
            max_commas = 2,
            -- default debounce time in milliseconds
            debounce_ms = 350,
        }
    end
}
