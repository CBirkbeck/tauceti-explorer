# DeMarco–Krieger–Ye: confirmed red-team fixes

Codex, session `codex-rtOQ9t`, 30 September 2026. Refs #4981. Base `0b5f88cc68996efce62a7369086c324d570cea78`.

**All eight confirmed findings are applied to the authorized extraction files.** The earlier independent verification was also by this session; the fix job does not require another fixer. The original extraction and its review were by other sessions. No prior review verdict is rewritten or manufactured.

## /1 — reuse the existing absolute scalar height

Added DKY item /54, status `library`, citing `NumberField.absLogHeight₁` and `NumberField.absMulHeight₁`. It states the algebraic-number construction through ℚ(x) and the convention h(∞)=0. Restricted /10 to the absolute tuple-height comparison and the weighted scalar identity, with an explicit import of /54. It remains planned at RP.0, reusing the DY.4 standard-adelic-height comparison and its DT.0 field-extension prerequisite.

Corrected DeMarco–Mavraki–Ye /7 to the same scalar construction and library status. Its note explicitly leaves the projective/adelic and extension-field comparison with the existing DY.4/DT.0 owners. No route contains that formerly planned item, so this status change leaves route membership intact. Corrected the DKY report's library description and post-review paragraph.

Mathlib's fixed-field projective height alone is not the needed absolute height, but that does not imply absence of the scalar absolute definition. The reviewed RP.0 audit already distinguishes those facts. The accepted ArithmeticDynamics packet has the relevant comparison nodes with `implementationStatus: unchecked`; this fix does not mark them implemented.

## /2 — cite the division-polynomial results actually used

Item /44 now cites the univariate `ΨSq`, its coordinate-ring square relation, both Tau Ceti vanishing/annihilation directions and the Jacobian/affine transport lemma. The contract is stated for n≥1, t≠0,1 and finite x-coordinates; infinity is separate. The theorem hypotheses require nonsingular affine points. In particular ψ₀=0 cannot be used to infer finite order.

Item /3 gains `addOrderOf_eq_two_iff_evalEval_ψ₂_eq_zero` for the two-torsion step. Its note retains the separate projection, branch-cover and j-invariant specialization obligations; the order-two lemma does not prove all of those assertions by itself.

## /3 — correct the canonical-height normalization

Item /11's library statement now specifies the fixed-field height c_K and its ellipticity/Northcott hypotheses. Its note supplies the required normalization interface:

`c_K(P) = [K:ℚ] · ĥ_E(P) = ([K:ℚ]/2) · ĥ_t(π(P))`.

The comparison is imported from `ArithmeticDynamics:DY.6/lattes-map-canonical-height`, with its DT.0 input. The arithmetic follows from the fixed-field naive height and the half-doubling limit; it is not a newly compiled comparison theorem. The report now states the degree factor.

## /4 — register the omitted local weights

Added source issue E14, misprint, affects nothing: published p.990 and v2 p.41 omit r_v in the scalar-height identity. The normalization on p.955 requires the weights. The example K=ℚ(√2), x=2 gives 2log2 with weights and 3log2 without them. Item /10 references the corrected identity and E14. The existing E5–E7 findings on that page are different and remain unchanged.

## /5 — qualify the singularity assertion

Added E15, misprint, affects nothing: published p.951 and v2 p.2 need “possibly singular,” or the explicit branch-overlap condition. The local equations are u²=v² at a shared branch value and u²=v when only one map ramifies. For unequal branch sets with m common values, the connected degree-four normalization has genus 5−m by Riemann–Hurwitz. Disjoint branch sets give a smooth genus-five example. The main genus bound and the three-overlap genus-two application remain valid.

## /6 — choose the lift on the embedded curve

Added E16 as a **gap affecting the proof**, following the verifier's correction of the red team's proposed impact. Proposition 9.1 puts the chosen torsion pair in Φ(j_Q(X)); choose its lift w there. If d kills the pair and e kills ker Φ, then ed kills w, and the pair's order divides ord(w). This proves the required membership and order in Proposition 9.2. Item /53 now states the repaired choice and references E16. No generic sixteen-preimage count is asserted at branch values.

## /7 — add the distinct 2010 prerequisite

Added Favre–Rivera-Letelier, *Théorie ergodique des fractions rationnelles sur un corps ultramétrique*, Proc. Lond. Math. Soc. (3) 100 (2010), 116–154, DOI 10.1112/plms/pdp022, with the public [arXiv record](https://arxiv.org/abs/0709.0092). Published pp.962 and 965 explicitly use §5.1 for the interval and tent-map calculation, and p.999 identifies this bibliography entry. Items /26–/27 now identify it and distinguish it from the 2006 source. The residue-characteristic-two computation is DKY's adaptation. This adds the cited prerequisite; it is not a fresh proof audit of the FRL paper.

## /8 — record the actual publication provenance

Updated `source.readSections` to preserve the failed original access attempt while recording the subsequent published collation by the earlier review. Added structured published and preprint readings with their original receipt dates and hashes. A separate note records this fix's 30 September targeted reading, avoiding a claim of a new whole-paper read.

Both downloaded PDFs match the earlier receipts:

| Version | Pages | SHA-256 |
| --- | --- | --- |
| [Published Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p05-s.pdf) | 53 | `7a4bd817bc7cc561363c68c3941b449af55fbf4cb1b3481bd0d601e84b9307df` |
| [arXiv v2](https://arxiv.org/pdf/1901.09945v2) | 49 | `8fc51ac36f9fc4b406c7bb44cdeccf31386e81e0a471176a69e80a1a0766bab8` |

I checked published pp.951,955,962,965,990,995,997,999 and v2 pp.2,41, rendering and inspecting published pp.951,990,997. The new source issues have actual 30 September correction-search receipts: [Annals](https://annals.math.princeton.edu/2020/191-3/p05), the Crossref DOI record (empty correction relations and no update-to), the [arXiv version history](https://arxiv.org/abs/1901.09945), [DeMarco's publication list](https://people.math.harvard.edu/~demarco/) and a targeted title/author erratum search. No correction was found. V1 was not separately collated. The new entries do not impersonate an independent source-issue review; the existing red-team verification remains the record of their confirmation.

## Library and owner checks

Read the actual statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:

- [Mathlib NumberField heights](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Height/NumberField.lean): fixed-field formula and scalar absolute definitions, lines 108–147.
- [Mathlib division polynomials](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/Basic.lean): `ΨSq` and `Affine.CoordinateRing.mk_Ψ_sq`, lines 242 and 338.
- [Tau Ceti division-polynomial multiplication](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/ZSMul.lean): annihilation equivalence directions, transport and order-two characterization, lines 1071–1130.
- [Tau Ceti canonical height](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean): half-doubling definition and ellipticity/Northcott torsion criterion; also the naive-height comparison in `MordellWeil/NaiveHeight.lean:103`.

The existing RP.0 audit and the complete DY.4 standard-height and DY.6 Lattès comparison nodes were read before assigning ownership. No new roadmap, blueprint node or independent reconstruction is requested.

## Maintainer corrections outside the listed deliverables

The issue authorizes four output paths. `reviews/REV-PAPER-DEMARCO-KRIEGER-YE-20.md` is not one of them, so its historical review is left intact. Its post-review paragraph must be read with this correction: the scalar absolute height exists at the pin; only the stated tuple/normalization comparisons remain planned. Its §Library normalization sentence also needs c_K/[K:ℚ] in place of c_K when identifying the paper's absolute Néron–Tate height. These replacements are now explicit in both the authorized extraction JSON and its report.

The DeMarco–Mavraki–Ye JSON is expressly authorized and is corrected directly; its historical report/review may likewise need their library-status summary refreshed by their owner. No message to an author or other worker is needed to apply the authorized correction.

## Validation

Both paper checkers pass. DKY has 54 items (4 library, 10 planned, 40 missing), the same three routes, 13 prerequisites and 16 source issues. Each of the 40 missing items remains in exactly one route; the added scalar library item is in none. The original E1–E13 and route arrays are preserved. DMY changes are confined to item /7. Intake `check-files` and staged whitespace validation are run on the four deliverables.

No Lean deliverable is required, and none was compiled. No library build or language server was started.
