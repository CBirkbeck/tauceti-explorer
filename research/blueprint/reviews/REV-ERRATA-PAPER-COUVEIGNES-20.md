# Independent errata review: Couveignes, Enumerating number fields

Job REV-ERRATA-PAPER-COUVEIGNES-20; issue #1710. Reviewer: Codex, session `codex-hjdg0j`, 23 September 2026. The original errata file was written by Claude Code, session `cc-fb70e5`. This reviewer wrote neither it nor the paper extraction. Status: complete for the one recorded finding and the four auxiliary checks in the companion report.

## Source verification

The public sources were freshly downloaded into worker scratch space. Access date for all entries: 23 September 2026. The JSON contains the complete URL/hash manifest, including correction-search metadata.

| Source | SHA-256 | Passages read |
| --- | --- | --- |
| [Publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf) | `8d63bd3a14f0d61f421695f1d93559d18fb674240c6dee872c23bf5902e1a104` | p.489 and pp.491–494; images of pp.489,493 |
| [arXiv v1](https://arxiv.org/pdf/1907.13617v1) | `37051ff131ffa877ab5ce6ced00e40e96de28fdcfcda17fedbe7194919f9c1ea` | volume formula p.2; lattice passage p.5 |
| [arXiv v2](https://arxiv.org/pdf/1907.13617v2) | `d09ef83ea26abcaf43a2bfc582811373ac1066a417349740c194508d6272735a` | volume formula p.2; lattice passage p.5 |
| [arXiv v2 TeX](https://arxiv.org/src/1907.13617v2) | `7af74d0f43dfb1a6ca6e9add0b00c26a7b5c073551c2996e27c7b320cfcb7243` | nf.tex lines 431–432,564–589 |
| [HAL v1 PDF](https://hal.science/hal-02375397v1/file/nf.pdf) | `a0e0bd390b817228ec897aa53fb01bbf33bdf8a1676f9779e6c5e825d065d04b` | PDF p.7, manuscript p.6 |

## E1: confirmed; correction and reach retained

The real vector space is obtained from the relation lattice by tensoring over Z. The published Q subscript is also present in both arXiv versions, explicitly in the v2 TeX, and in the later HAL deposit.

The numerical hypotheses in §3 imply positive lattice rank: C(d+r,d) − n ≥ nr ≥ 1. Multiplication by 2 is not surjective on a nonzero finite free abelian group, whereas it must be surjective on a Q-vector space. Hence the literal tensor product has no compatible input Q-module.

Choose integral bases of the polynomial module and of O_K. Polynomial evaluation is then an integral matrix A. Tensoring its kernel with the flat Z-module R gives ker(A_R), the real span used in the source. Rationalising first gives the same space by associativity of scalar extension. This proves the proposed correction independently of the typography. It also identifies the space used in the immediately following orthogonal-lattice and Minkowski arguments; no change to those intended objects is needed. The classification remains **misprint**, affecting **nothing** in the protocol's sense.

The source quote was shortened; version-specific locators and the mathematical reason were made explicit. The original correction was not changed.

## Companion-report checks

The source's volume formula is **2^r(2π)^s ≥ 2^n**, not the strict inequality transcribed in the earlier report. The canonical metric on a complex coordinate is twice the Euclidean metric, giving measure 2π to its unit disk; real factors contribute 2. Since n = r + 2s, the ratio is (π/2)^s, with equality for totally real fields. The paper and v2 TeX are correct. The report is now corrected without adding a spurious source finding.

The other three checks withstand inspection. A nonzero algebraic integer has nonzero integral norm, so the product of its conjugate absolute values is at least 1; they cannot all be less than 1. Monomials in r variables of total degree at most d correspond to weak compositions of d into r+1 parts, giving C(d+r,d). Finally each entry of the interpolation matrix has degree at most d in the integer parameters, and a maximal determinant has n(r+1) factors, giving the stated bound in each variable. Repeated univariate interpolation on a grid of dn(r+1)+1 distinct values in every coordinate proves that a nonzero such determinant cannot vanish on the whole grid.

## Correction search and limits

The [Annals article page](https://annals.math.princeton.edu/2020/192-2/p04) has no correction link. The [arXiv history](https://arxiv.org/abs/1907.13617) ends at v2, 29 August 2019. The [author's page](https://www.math.u-bordeaux.fr/~jcouveig/) links a [HAL publication list](https://cv.hal.science/jean-marc-couveignes) without a correction entry. The linked [HAL record](https://hal.science/hal-02375397v1), read from its downloaded HTML, lists version 1 dated 16 February 2021; its PDF was checked rather than assuming this later deposit corrects the typo. [Crossref](https://api.crossref.org/works/10.4007/annals.2020.192.2.4) has no update-to/updated-by fields and an empty relation object. Exact-title/author searches with correction, erratum and corrigendum, including an Annals-domain query, located no relevant correction.

“New” is limited to this search, with no assertion of discovery priority. No new full-paper census, independent validation of all cited external theorems, or formalisation is claimed.

## Validation

`python3 scripts/check_errata.py research/blueprint/errata/PAPER-COUVEIGNES-20.json`, the four-file intake check, and `git diff --check` pass. This job has no suggested Lean deliverable; no Lean compilation was run.
