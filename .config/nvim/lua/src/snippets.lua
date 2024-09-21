
vim.api.nvim_set_keymap('n', 'rnfes', [[<Cmd>lua InsertRNComponent()<CR>]], { noremap = true, silent = true })

function InsertRNComponent()
    local filename = vim.fn.expand("%:t:r") -- Get the filename without extension
    local rnComponent = string.format([[
import { StyleSheet, View, Text } from "react-native";
import React from "react";

const %s = () => {
    return (
        <View>
            <Text>%s</Text>
        </View>
    )
}

export default %s;
]], filename, filename, filename)

    vim.api.nvim_put(vim.split(rnComponent, '\n'), '', true, true) -- Insert the formatted string into the buffer
end
