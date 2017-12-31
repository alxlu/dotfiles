function j -d "fasd fzf search"
  cd (fasd -Rdl | fzf --no-sort -1 -0 +m)
end
