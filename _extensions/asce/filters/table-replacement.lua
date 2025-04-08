function Table(el)
	-- Convert the table to LaTeX
	local latex_content = pandoc.write(pandoc.Pandoc({ el }), "latex")

	-- Replace longtable with tabular
	latex_content = latex_content:gsub("\\begin{longtable}", "\\begin{tabular}")
	latex_content = latex_content:gsub("\\end{longtable}", "\\end{tabular}")

	-- Remove all longtable-specific commands
	latex_content = latex_content:gsub("\\endfirsthead.-\\endhead", "")
	latex_content = latex_content:gsub("\\endfoot.-\\endlastfoot", "")
	latex_content = latex_content:gsub("\\endfirsthead", "")
	latex_content = latex_content:gsub("\\endhead", "")
	latex_content = latex_content:gsub("\\endfoot", "")
	latex_content = latex_content:gsub("\\endlastfoot", "")

	-- Remove column width adjustment code chunks
	latex_content = latex_content:gsub(">%b{}p%b{}", "l")
	latex_content = latex_content:gsub("\\begin{minipage}%[b%]%{\\linewidth%}\\%a+\n", "")
	latex_content = latex_content:gsub("\\end{minipage}", "")

	-- Remove any empty lines that might have been left
	latex_content = latex_content:gsub("\n+", "\n")

	-- Move \bottomrule and any following \noalign{} to the end of the table
	local bottomrule = latex_content:match("\\bottomrule.-\\noalign{.-}") or latex_content:match("\\bottomrule")
	if bottomrule then
		latex_content = latex_content:gsub(bottomrule, "")
		latex_content = latex_content:gsub("(\\end{tabular})", bottomrule .. "\n%1")
	end

	-- Check if we're in a paragraph context
	local in_para = el.parent and el.parent.t == "Para"

	-- Wrap in a table float only if we're in a paragraph context
	if in_para then
		latex_content = "\\begin{table}[htbp]\n\\centering\n" .. latex_content .. "\n\\end{table}"
	else
		-- If not in a paragraph, just center the tabular environment
		latex_content = latex_content
	end

	-- Return a raw LaTeX block
	return pandoc.RawBlock("latex", latex_content)
end
