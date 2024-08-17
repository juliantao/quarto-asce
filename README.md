> **Warning**

> There are many rough edges in this extension, especially on the handling of the `authors and affiliations` in the title block. 
> Use with caution.
> Contribution welcomed!


# ASCE Quarto Template

This is a Quarto template that assists you in creating a manuscript for American Society of Civil Engineers journals and conference proceedings. You can learn more about the format requirements on the [ASCE website](https://ascelibrary.org/page/authorservicesjournals) and the [Overleaf template](https://www.overleaf.com/latex/templates/template-for-preparing-your-submission-to-the-american-society-of-civil-engineers-asce/pbwcqsvndpty), which this Quarto template was based off.

This template and class file "`asce-quarto.cls`" produce manuscripts that comply with the guidelines of the American Society of Civil Engineers (ASCE). 

The "`asce-quarto.cls`" used in this template is modified based on the original "`ascelike-new.cls`" class, which has been produced by [Overleaf](https://www.overleaf.com) in conjunction with the "`ascelike-new.bst`" citation style developed by Matthew R. Kuhn.
It differs from "`ascelike-new.cls`" in that, the citation and bibliography related contents in the latter have been removed. Citation and bibliography styles are now handled using citation language style "`ascelike.cls`" with Pandoc's `citproc` via Quarto.

## Creating a New Article

You can use this as a template to create an article for an AFT journal. To do this, use the following command:

```bash
quarto use template juliantao/quarto-asce
```

This will install the extension and create an example qmd file and bibiography that you can use as a starting place for your article.

## Installation For Existing Document

You may also use this format with an existing Quarto project or document. From the quarto project or document directory, run the following command to install this format:

```bash
quarto install extension juliantao/quarto-asce
```

## Usage

To use the format, you can use the format names `asce-pdf`. For example:

```bash
quarto render article.qmd --to asce-pdf
```

or in your document yaml

```yaml
format:
  pdf: default
  asce-pdf:
    keep-tex: true    
```

You can view a preview of the rendered template at <https://github.com/juliantao/quarto-asce/blob/main/style-guide/asce-template.pdf>.

## Format Options

The title block, document classes, and other document options can be set in the `yaml` header.

For example, to generate the example PDF file, the following `yaml` header is used

```{.yaml} 
title: | 
  Template for Preparing Your Submission to the 
  American Society Of Civil Engineers (ASCE) 

author:
  - name: Author One, S.M. ASCE
    affiliations: Graduate Research Associate, First affiliation address
    email: author.one@email.com
  - name: Author Two, M. ASCE
    affiliations: Assistant Professor, Second affiliation address
    email: author.two@email.com
  - name: Author three, A.M. ASCE
    affiliations: Associate Professor, Third affiliation address
    email: author.three@email.com
    corresponding: true
abstract: |
  The abstract should be a single paragraph (150-175 words long) written
  in plain language and include a summary of the key conclusions of the
  manuscript. It should clearly state the purpose of the work, the scope
  of the effort, the procedures used to execute the work, and major
  findings. The abstract is the second most important online search
  discovery element, after the title. Authors should review the abstract
  to ensure that it accurately reflects the revised paper and should
  strive to include any applicable keywords that would likely be used
  during an online search. Mathematics and references are not permitted
  in the abstract and will be removed by the copyeditors.
keywords: template, quarto, asce
bibliography: references.bib
format: 
  asce-pdf:
    keep-tex: true
    publication-type: NewProceedings
    footer-lastname: Author1
    classoption: [InsideFigs, LineNumbers]
```

## Authors and affiliations

For now, I prefer to use a simplified way to define the authors and affiliations: just use `name`, `affiliations`, `email` and `corresponding` fields. See above `yaml` header. 
I may change this in the future.

For more detailed setups, see [quarto document](https://quarto.org/docs/journals/authors.html).

## Format options

The document class `ascelike-new.cls` provides several options given
below. 

### Publication types

The `Proceedings|Journal|NewProceedings` option is the most
important; the other options are largely incidental.

In a quarto document, use `publication-type` to specify the overall format.

1.  Options `Journal|Proceedings|NewProceedings` specify the overall
    format of the output manuscript.

    `Journal` produces double-spaced manuscripts for ASCE journals. As
    default settings, it places tables and figures at the end of the
    manuscript and produces lists of tables and figures. It places line
    numbers within the left margin.

    `Proceedings` produces older-style camera-ready single-spaced
    manuscripts for ASCE conference proceedings. The newer ASCE style is
    enacted with the `NewProceedings` option.

    `NewProceedings` produces newer-style single-spaced manuscripts for
    ASCE conference proceedings, as shown on the ASCE website (*ca.*
    2013). As default settings, `NewProceedings` places figures and
    tables within the text. It does not place line numbers within the
    left margin.

    If desired, the bottom right corner can be "tagged" with the
    author's name (this can be done by inserting the command
    `\NameTag{<`*your name*`>}` within the preamble of your document).
    All of the default settings can be altered with the options that are
    described below.

### Fine-tuning options

Use `classoption` to specify the following options.

2.  Options `BackFigs|InsideFigs` can be used to override the default
    placement of tables and figures in the `Journal`, `Proceedings`, and
    `NewProceedings` formats.

3.  Options `SingleSpace|DoubleSpace` can be used to override the
    default text spacing in the `Journal`, `Proceedings`, and
    `NewProceedings` formats.

4.  Options `10pt|11pt|12pt` can be used to override the default text
    size (12pt).

5.  The option `NoLists` suppresses inclusion of lists of tables and
    figures that would normally be included in the `Journal` format.

6.  The option `NoPageNumbers` suppresses the printing of page numbers.

7.  The option `SectionNumbers` produces an automatic numbering of
    sections. Without the `SectionNumbers` option, sections will *not*
    be numbered, as this seems to be the usual formatting in ASCE
    journals (note that the Appendixes will, however, be automatically
    "numbered" with Roman numerals). With the `SectionNumbers` option,
    sections and subsections are numbered with Arabic numerals (e.g. 2,
    2.1, etc.), but subsubsection headings will not be numbered.

8.  The options `NoLineNumbers|LineNumbers` can be used to override the
    default use (or absence) of line numbers in the `Journal`,
    `Proceedings`, and `NewProceedings` formats.
