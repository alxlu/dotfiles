function cdg -d "fzf bookmarks"
  cd (string trim -- (cdgprint|fzf --no-sort -1 -0 +m))
end
