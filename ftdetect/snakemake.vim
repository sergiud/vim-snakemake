augroup VimSnakemake
  autocmd!
  autocmd BufNewFile,BufRead Snakefile,*.snakefile,*.snake,*.smk,*.snakemake setlocal filetype=snakemake
augroup END
