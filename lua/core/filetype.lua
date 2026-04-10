vim.filetype.add({
  pattern = { ['.*/hypr/.*%.conf'] = 'hyprlang' },
})

vim.filetype.add({
  pattern = {
    ['%.gitlab%-ci%.ya?ml'] = 'yaml.gitlab',
  },
})
