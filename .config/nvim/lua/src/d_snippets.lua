-- snippets keymaps
vim.api.nvim_set_keymap(
  'n', 'rnfes', [[<Cmd>lua InsertRNComponent()<CR>]], { noremap = true, silent = true }
) -- react native functional export (w) styles
vim.api.nvim_set_keymap(
  'n', 'pfc', [[<Cmd>lua InsertPyFunc()<CR>]], { noremap = true, silent = true }
) -- python function (w) comments
vim.api.nvim_set_keymap(
  'n', 'cmo', [[<Cmd>lua InsertCFunc()<CR>]], { noremap = true, silent = true }
) -- c main function only


-- snippets full description

-- react native component with style sheet
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

  -- Insert the formatted string into the buffer
  vim.api.nvim_put(vim.split(rnComponent, '\n'), '', true, true)
end

-- python function with documentation strings
function InsertPyFunc()
  local func = string.format([[
def function_name(param1: str, param2: int) -> bool:
    """
    Brief one-line summary of the function.

    Extended description of the function. This section should provide a more detailed explanation
    of what the function does, how it behaves, and what the parameters represent.

    Args:
        param1 (str): Description of the first parameter. Explain its expected value, type, and role.
        param2 (int): Description of the second parameter. Describe any constraints on its value.

    Returns:
        bool: Description of what the function returns. Explain what True and False mean, and under
        what conditions each is returned.

    Raises:
        ValueError: Explanation of why and when this exception might be raised.
        TypeError: Explanation of why and when this exception might be raised.

    Example:
        >>> result = function_name("example", 42)
        >>> print(result)
        True
    """
    pass
]])
  vim.api.nvim_put(vim.split(func, '\n'), '', true, true)
end

-- c main function
function InsertCFunc()
  local func = [[
#include <stdio.h>

int main() {
  printf("Hello, World!\n");

  return 0;
}
]]

  -- Insert the formatted string into the buffer
  vim.api.nvim_put(vim.split(func, '\n'), '', true, true)
end

