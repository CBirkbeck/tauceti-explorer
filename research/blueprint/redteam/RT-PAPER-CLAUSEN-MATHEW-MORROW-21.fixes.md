# FIX-RT-PAPER-CLAUSEN-MATHEW-MORROW-21

Complete fix by Codex, session `codex-J6LwjP`, 1 October 2026, for [issue #5530](https://github.com/CBirkbeck/tauceti-explorer/issues/5530). The bot confirmed claim comment 5942282681 before work. Read the complete issue, red-team findings/report and independent verified verdicts; all four findings are confirmed. Only the three authorized deliverables change.

## /1 — differential degree in the Hodge–Witt quotient

**Fixed.** Items 099 and 121 and route 1's Proposition 6.12 target use W_rΩ_R^m/dV^{r−1}Ω_R^{m−1}. The source issue E8 covers the preceding F̄/π definitions, equations (26)–(27) and every quotient in the proof on pp. 55–56, including relative/base-change instances. The brief explicitly requires Ω_R^{−1}=0 at m=0, the r=1 target Ω_R^m/dΩ_R^{m−1}, and F̄=C^{−1}. Arbitrary F_p-algebras remain allowed; no smoothness/regularity restriction is introduced.

Read the rendered CMM p. 55 and proof continuation p. 56. Independently read the published [Morrow source](https://www.numdam.org/item/ASENS_2019__52_6_1537_0.pdf), Corollary 4.2(ii)–(iii) and Remark 4.3, pp. 1566–1567, including rendered p. 1567. The degree check is direct: V preserves degree, while d raises it. Starting from degree m−1 is necessary for the image to lie in W_rΩ_R^m; at r=1, V^0 is the identity. This source corrects the intended formula, but I did not audit its whole proof or the whole paper.

## /2 — reuse existing nonunital algebra data

**Fixed.** Added **038-library** for the existing carrier, scalar-compatible morphisms and unitization. Kept the original **038** ID as the missing residual category, equivalence with augmented R-algebras, free polynomial ideals, limits/colimits and exact-sequence contract. Route 1 continues to route only that residual item; the library item is not routed for reconstruction. Local and henselian nonunital algebra/reflection/free-object work in 039–041 remains missing.

Read actual declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:

- `NonUnitalCommRing`, Algebra/Ring/Defs.lean:397;
- `Module`, Algebra/Module/Defs.lean:54; `SMulCommClass` and `IsScalarTower`, Algebra/Group/Action/Defs.lean:149,211;
- `NonUnitalAlgHom`, Algebra/Algebra/NonUnitalHom.lean:57;
- `Unitization`, Algebra/Algebra/Unitization.lean:68, its multiplication at 441–460, commutative-ring instance at 557, algebra instance at 631, augmentation `fstHom` at 660, inclusion `inrNonUnitalAlgHom` at 675 and universal property `lift` at 766, with the surrounding variable hypotheses.

These provide a nonunital commutative ring with R-module structure and R-bilinear multiplication, the R×I carrier, the product (r,i)(s,j)=(rs,r•j+s•i+ij), its augmentation/inclusion, and (I→ₙₐ[R]C)≃(Unitization R I→ₐ[R]C) for a unital R-algebra C. This last equivalence of map sets does not establish the augmented-category equivalence, categorical limits/colimits or henselian reflection. The reviewed GeneralAlgebraicKTheory:K.5 coverage explicitly marks unitization/universal property as existing but its K-theory as absent. Scoped searches of pinned Mathlib algebra-category files and Tau Ceti's source found no replacement supplying this residual categorical/henselian package. This is not a new exhaustive audit of all nonunital mathematics.

Route 1's block (2), library imports, reader inventory and count now express this boundary. Its design tests check square-zero unitization, augmentation/inclusion and lift/restriction compatibility. The original 122 IDs/statuses are retained, with one extra library item: **123 total = 2 library + 19 planned + 102 missing**. Current route sizes are **83,9,1,4,1,1,1,1,1**; the older reader's counts predated the Nikolaus–Scholze correction and are updated.

## /3 — almost nilpotent towers

**Fixed.** E9 records the false unqualified alternate characterization in arXiv-v2 Definition 5.14. Item 091 retains the upper-truncation definition; its note and route 2 require a common lower bound when using degreewise nilpotence as a converse. The brief includes the negative tail-tower example and preserves the connective/bounded hypotheses of the applications.

For X_i=⊕_{j≥i}Σ^{−j}HF_p, i≥1, with tail inclusions, each fixed π_{−j} tower becomes zero for i>j and is nilpotent with exponent j. Yet τ_{≤0}X_i=X_i and every X_{i+N}→X_i is nonzero on π_{−(i+N)}. Thus no uniform nilpotence exponent exists. With a uniform lower bound, each upper truncation has finitely many relevant homotopy groups; finite Postnikov dévissage through the extension-closed nilpotent towers restores the converse. This fixes Definition 5.14's general statement, without changing Theorems 5.19–5.22.

Read rendered pp. 42–43 and the connective/derived continuity statements on p. 44. The counterexample is a mathematical argument about the infinite tail, not an inference from a finite computational sample.

## /4 — finite coefficients in the two proofs

**Fixed.** E10 corrects the proof of Theorem 5.21 to K^inv(R)/p ≃ K^inv(R⊗_{HZ}HZ/p^i)/p. Item 096 and route 2 explain the connective Dundas–Goodwillie–McCarthy passage to π_0 followed by finite-coefficient rigidity of the henselian pair (π_0R,(p^i)). Its theorem statement remains unchanged.

E11 corrects the final proof paragraph of Corollary 5.33 to {K_n(R/I^s)/p}_s ≃ {K_n(R/I^s;Z/p)}_s, also recording the vanishing pro p-torsion term from the Bockstein sequence. Item 106's statement remains unchanged. For R=F_p, I=0, n=0, the printed map is Z→Z/p, so its kernel contains p and it cannot be an isomorphism. Route 1's proof-transcription instructions and the reader are synchronized. Read rendered pp. 44 and 49; these repairs concern the proofs, not the stated continuity or pro torsion-freeness theorems.

## Source scope and validation

Reacquired [CMM arXiv v2](https://arxiv.org/pdf/1803.10897v2), 59 pages, SHA-256 `ad23c1d7b818b85e1752cdc4b01ec9442a9c62c3c8e85ebd7cf6f4584c6abd9c`, and the Morrow publication, 68 PDF pages including cover material, SHA-256 `54988085dbe216661b2e3e7ff5ddc6479240f424b10a8c83727973f828ded4e2`. Both match the red-team artifacts. Selected reads are recorded above and in `sourceVersions`; original whole-paper/TeX reads remain credited to their workers.

On 2026-10-01 rechecked arXiv version history (v2 latest), [Morrow's publication page](https://www.imo.universite-paris-saclay.fr/~matthew.morrow/), a title/erratum search and [Crossref metadata](https://api.crossref.org/works/10.1090/jams/961) (empty relation object, no update-to). No correction was located. Both Crossref AMS URLs for the version of record and accepted manuscript returned HTTP 403. E8–E11 therefore concern **arXiv v2 only**; no assertion is made about the unexamined JAMS printing. The four new entries await independent fix review; E1–E7 and their original review objects are unchanged. No authors were contacted.

Validation: paper checker; source-issue and source-version schema checks; three-file intake; ID/status and route preservation; every missing item routed exactly once; all new library citation spellings checked against the read declarations; symbolic differential-degree and r=1/m=0 checks; tail-tower witness checks and the reduction Z→Z/p kernel check; `git diff --check`. No Lean deliverable is requested, no Lean compilation or library build was run, and no language server was started. Statements remain extraction/design contracts, not formalizations.
