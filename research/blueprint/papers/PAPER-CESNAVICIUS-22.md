# Česnavičius (2022): extraction and routing

Status: **partial**, following independent review [REV-PAPER-CESNAVICIUS-22](../reviews/REV-PAPER-CESNAVICIUS-22.md), issue [#1390](https://github.com/CBirkbeck/tauceti-explorer/issues/1390). The extraction contains **150 items: 9 library, 10 planned, 131 missing**. Each missing item has exactly one route. The six source routes are accepted; the two proposed Part II design routes require revision.

The extraction originated with Codex session codex-a71f92 and was continued by Claude Code session cc-442dc5. Codex session codex-c83e7a independently reviewed it on 23 September 2026. The independent review supersedes the continuation’s completeness claim and erroneous proof details. No formalization or Lean compilation is claimed.

## Mathematical scope

For a Dedekind ring O and a regular semilocal flat O-algebra R with geometrically regular fibers, Theorem 9.1 gives trivial kernel for H¹(R,G)→H¹(Frac R,G) when G is quasi-split reductive. Here Frac R is the total ring of fractions. The local unramified theorem and principal-completion factorization are separate consequences. Generic splitness descends for arbitrary reductive G in this ring setting.

Theorem 9.5 has a separate hypothesis: H¹ injectivity for every R-form of G_ad. Its equicharacteristic consequence imports the full Fedorov–Panin/Panin theorem. It cannot be deduced just by declaring every inner form quasi-split. The orthogonal consequences require 2 invertible and use twists by SO_n-torsors, not an identification of every inner form with a quadratic-space group. Conjectures 1.1 and 9.4 remain conjectures.

The proof passes through simply connected reduction, prescribed-locus Bertini and weighted projections, a relative curve carrying the torsor, finite étale equating, a cartesian affine-line presentation, excision and patching, and a projective-line/Whitehead argument. The extraction preserves the distinctions between total and fiberwise codimension, weak and strong regular sequences, simple and separable residue extensions, and loop-coset versus loop-group surjectivity.

## Corrections incorporated

The independent reviewer read all 32 pages of the [author’s November 2022 PDF](https://www.imo.universite-paris-saclay.fr/~kestutis.cesnavicius/split-unramified.pdf), including proofs and references. Its SHA-256 is `984748e90f36730ddf4295176ca4b12e6aa7235c141461c0354e40320ef7476a`. Relevant passages were compared with the [published article](https://doi.org/10.1017/fmp.2022.5); a full second reading of all published pages is not claimed.

The JSON records **13 independently confirmed source findings**. E1–E4 have known corrections; the bounded searches located no correction for E5–E13.

| Findings | Correction and reach |
| --- | --- |
| E1 | The first-order Cohen isomorphism in Lemma 6.3 need not be linear over an imperfect residue base. Use the author’s later geometric-presentation correction. |
| E2–E3 | Apply Gille’s 2005 parabolic-type repair and his later anisotropy/integral-points repair, including the corrected Borel–Tits reference. |
| E4 | Local total isotropy does not supply a global proper parabolic over a semilocal base. The author later strengthens the hypothesis. The extraction also gives a repaired local loop-lifting argument. |
| E5–E6 | Restore k_m in the residue Laurent-series product and Aut(G,B) as the twisting target. |
| E7 | Replace arbitrary orthogonal inner forms by pure inner twists coming from SO_n-torsors. This correction is now present in the item itself. |
| E8 | Remark 3.3’s dimension equality needs purity of Y_j minus Z, or a surviving maximal-dimensional component. The unrestricted upper bound in Lemma 3.2 remains valid. |
| E9 | Correct two projection labels and the cited list of conditions used to shrink inside W. |
| E10 | Add finite presentation of C/R to Lemma 6.3. The smooth affine curve used in the main application already satisfies it. |
| E11–E13 | In the author-hosted CTHK97 proof, correct the parameter-space exponent, use a surjective residue coordinate map, and require étaleness along the retained section. The geometric-presentation theorem survives these repairs. |

For E8, take X=P³_Q, Y=V(x₃)∪V(x₀,x₁), Z=V(x₂,x₃), and H=V(x₂ᴺ+x₃ᴺ), N≥1. The plane component of Y meets H only inside Z; the line contributes a nonempty finite scheme outside Z. Thus dim(Y minus Z)=2 but the nonempty cut has dimension 0, not 1. This works in arbitrarily large degree and meets Lemma 3.2’s smoothness requirement off Z.

For E10, take R=Q, C=Spec Q[[t]], Y=V(t), and Z empty. Any open containing Y is C. A quasi-finite C→A¹_Q would make Q[[t]] a finitely generated Q-algebra, contrary to cardinality. The printed hypotheses allow this example; finite presentation excludes it.

The extraction’s earlier local-loop repair also needed correction. Multiplying a nonzerodivisor by a spreading denominator can destroy the localization injectivity used in that proof. The revised argument lifts a pointed polynomial map after scaling its variables, then kills the finitely many residual equation coefficients by a further scaling. It proves the desired lift directly over R, including when the chosen denominator is a zero divisor. This is an extraction correction, separately attributed, not another published-source finding.

## Library reuse and ownership

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewer read the actual cited definitions and theorems and checked their source-file blobs at those pins. Existing regular-local, weak-regular-sequence, absolute Proj, henselian, abelian sheaf-cohomology, and field reductive/simply-connected/Borel interfaces remain imports.

**Semilocal Picard vanishing was incorrectly marked missing.** Mathlib’s `Module.nonempty_basis_of_flat_of_finrank_eq` supplies rank-one freeness, and `RingTheory/PicardGroup.lean` already has the semilocal `Subsingleton (Pic R)` instance. The item is now `library` and removed from the SF.1 source route. The separate comparison with H¹(G_m) still belongs to the torsor interface.

All 132 originally missing items were searched independently by item-specific and mathematical terminology across both pinned source trees and the atlas. The reviewed SF.0/SF.1/SF.2/SF.4, R03.3 and LPV.3 audit entries were read. Upstream ReductiveGroups Layer 8 owns relative group foundations; StableReduction Layer 2 owns the relative Proj and proper-curve coherent base-change inputs; RG2.0a owns affine finite-locally-free Weil restriction.

| Route | Owner and retained scope | Review |
| --- | --- | --- |
| 1 | SchemeAndStackFoundations:SF.0 — regular morphisms, components, approximation and affine-target interfaces | Accept |
| 2 | SchemeAndStackFoundations:SF.1 — torsor descent, twisting, purity and patching; excluding existing semilocal Picard vanishing | Accept |
| 3 | SchemeAndStackFoundations:SF.2 — supported/coherent cohomology, excision and multiplicative-type H² | Accept |
| 4 | SchemeAndStackFoundations:SF.4 — the general formal torsor-gluing contract | Accept |
| 5 | DeformationAndDerivedPatchingAlgebra:R03.3 — regular-local and Cohen–Macaulay algebra | Accept |
| 6 | ReductiveGroupsPartII:RG2.0a — Weil restriction and its Shapiro interface | Accept |
| 7 | SchemeAndStackFoundationsPartIIArithmeticPresentation — finite/imperfect-field and semilocal presentation beyond the existing foundations | Revise before design |
| 8 | ReductiveGroupsPartIIGrothendieckSerre — regular semilocal torsor theorems beyond upstream group foundations | Revise before design |

The Part II directions are justified, but their design briefs are not yet ready for intake. General henselian-DVR Bruhat–Tits scope must be assigned through the existing building supplier. Fargues–Fontaine gluing and semiglobal flag results are distinct specialized interfaces, not replacements for the general statements here.

## Remaining work

The JSON retains 27 gap records, of which 25 are open. A cited supplier theorem is not a substitute for extracting the definitions and nonroutine intermediate statements its proof uses. Resume with the explicit GLL/Gabber/Jouanolou and CTHK projection decomposition; then the CTS purity, SGA relative-group, formal gluing, linearity/quotient, general henselian Bruhat–Tits, Popescu, equicharacteristic GS and quadratic-cancellation chains.

All 29 definitions/constructions have API and test outlines, but many entries still use placeholder names and unspecified comparisons. Replace them with exact mathematical signatures, hypotheses, maps and equations, and promote nonroutine API prerequisites to items. The twisting API has been made precise in this review. Lack of a Lean compile is not itself a paper-extraction gap; mathematical specification and source closure are the outstanding work.

The [independent review report](../reviews/REV-PAPER-CESNAVICIUS-22.md) records validation, source-reading limits and the route decisions. Only the four issue-authorized files are changed.
