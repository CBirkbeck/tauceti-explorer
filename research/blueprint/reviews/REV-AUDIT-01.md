# Review of AUDIT-01

**Job** REV-AUDIT-01 · **Date** 2026-09-16 · **Verdict `accepted`** · **1 correction**

Baseline: tauceti `f790474`, mathlib `082e2d3`.

Scope: the five roadmaps of `research/blueprint/audit/AUDIT-01.json` —
AlgebraicModuliForArithmeticGeometry, ComplexComparisonPartII, SchemeAndStackFoundations,
AlgebraicCurves and AnalyticToricGeometry — 46 layers, 482 targets, 1326 declaration
citations, 120 duplicate claims.

## What was checked

**Every citation, mechanically.** The 1326 citations name 969 distinct declarations in 365
files. Each was resolved in the pinned baseline: all exist at the claimed file **and line**;
none is an axiom or a bare structure field; none has a `sorry` in its body. The single
`sorry` token in any cited file is inside a comment
(`Mathlib/Geometry/Manifold/LocalDiffeomorph.lean:370`).

**Every claim of presence.** The statement of each cited declaration was extracted and read
against its target, and the load-bearing ones were opened in the source. Hypotheses and
generality match, including where it is delicate: Riemann–Roch for an arbitrary exact
constant field with no perfectness or separability; the classification of the places of
`k(x)` as a repackaging of Mathlib's Ostrowski rather than a reproof; Dedekind's different
theorem in the tame case; the Kummer–Dedekind conclusions; the Weierstrass gap theorem; the
elliptic point–place dictionary.

**Both `built` verdicts** — AlgebraicCurves layer 1 and layer 4 — were confirmed target by
target at the source. **Both `process` verdicts** match the layer text, which says
`Execution state: specification` (SF.6) and `This is a Part II proposal` (C6).

**The `absent` and `partial` claims.** Every one whose concept has a standard Mathlib name
was searched again independently — by name, by Mathlib naming convention, and by concept
keywords over the declaration index and over the Lean sources of both libraries. That covered
well over half of the 232 absent targets: Chern classes, Chow groups and rational
equivalence, Grothendieck–Riemann–Roch, the Hodge index theorem, the Hasse–Weil bound,
Néron models, alterations, Weil restriction, algebraic spaces, stackification, quotient
stacks, coarse spaces, rigidification, Artin representability, excellent rings, resolution
of singularities, blowups of schemes, marked ideals, maximal contact, SNC divisors, Hilbert
and Quot schemes, Hilbert polynomials, flag schemes, ampleness, projective bundles, `O(n)`,
Chow's lemma, analytification and GAGA, Oka coherence, convergent power series, Stein
spaces, Cartan–Serre, Chow's theorem, the algebraic de Rham complex, Gauss–Manin,
logarithmic de Rham, cycle class maps, proper and smooth base change, compactly supported
cohomology, Picard schemes, dualizing sheaves and Serre duality, formal schemes, the Hurwitz
genus formula, the cotrace, a tame/wild predicate, Abhyankar's lemma, Castelnuovo's
inequality, Hilbert's different formula, Clifford's theorem, non-special divisors,
Weierstrass points, hyperelliptic function fields, Artin–Schreier covers of function fields,
`Aut(k(x)/k) ≅ PGL₂`, infinitude of places, the Japanese/Nagata property, `ToricVariety`.
**None is in the pinned baseline**, so no absent or partial verdict needed changing.

**The duplicates.** All 120 name layers that exist in the atlas; none points at the retired
roadmap `FoundationsAndLibraryIntegration`; and each claimed overlap is borne out by the
target layer's own description.

Fine-grained claims about *unnamed* instances were spot-checked and hold:
`HasPullbacks Scheme` at `Pullbacks.lean:484`, `IsProper (Proj.toSpecZero 𝒜)` at
`ProjectiveSpectrum/Proper.lean:372`, the fpqc/fppf subcanonicity instances in
`Sites/Fpqc.lean`, and the affine-descent TODO in `Morphisms/Descent.lean`.

## The one correction

`AnalyticToricGeometry` layer 3 (*finite-fan analytic gluing*) recorded no duplicates.
Added **`ShimuraCompactifications:C2`**: it builds the local partial compactifications from
relative torus embeddings and glues them, proving their transition and separation
properties — the same analytic gluing of torus-embedding charts, and the companion of the
boundary statement the audit already shares with layer 4. The audit pairs C2 with layer 4
and C0 with layers 0 and 5, so the gluing step was the gap.

## Most important finding

**The pinned declaration index `declarations.tsv` is not a complete index of the
libraries, and the audit is right where the index is wrong.** Six citations, naming five declarations, do not
appear in the tsv — `RatFunc.Luroth.eq_adjoin_generator`, `RatFunc.Luroth.algEquiv`,
`Algebra.Smooth.exists_finiteType`,
`Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`,
`isDedekindDomain_iff_isDiscreteValuationRing_atPrime`. All five are real and sorry-free at
exactly the cited lines. The extractor drops every declaration carrying the `public`
modifier (about 306 in Mathlib, 232 in Tau Ceti) and misparses `class abbrev`
(`IsAffineAddMonoid`, `IsAffineMonoid` are both recorded under the name `abbrev`). The
audit flags the `class abbrev` defect itself and says outright that Lüroth's theorem is
missing from the tsv, so it read the Lean sources rather than the index. **An audit run
against the tsv alone would have reported Lüroth's theorem — a named `exact` hit for a
layer-1 target — as absent.** Later batches should grep the sources as a backstop.
