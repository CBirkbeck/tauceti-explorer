# REV-AUDIT-27 — review of the library audit of AUDIT-27

**Verdict: accepted.** 77 corrections (40 target-level, 37 per-layer duplicate entries). I checked all 204
targets in the 45 layers of 5 roadmaps: PeriodsAndSpecialValues, RankZeroOneBSD,
SelmerIwasawaCohomology, SpecialValuesBirchTate and ArithmeticKTheory. The pinned baseline is tauceti
`f790474`, mathlib `082e2d3`. After correction there are 4 `partly built` layers and 41 `not built`
(the audit had 8 and 37); no layer is `built` or `process`.

## What I checked

**Every claim that a target is in the libraries.** All 163 citations were matched against
`declarations.tsv` and opened at their line. All exist at the cited file and line, and none is
`private` or in a file containing `sorry`. The only index misses are Mathlib's `ModularForm.Λ`,
whose namespace I confirmed by hand. Reading the statements turned up four bad citations:

* `NumberField.Units.rank_modTorsion` is a deprecated alias.
* `NumberField.Units.finrank_eq_rank` is the dimension of the log space, not the unit rank.
* `IsCyclotomicExtension.Rat.torsionOrder_eq` counts roots of unity, but was cited for total ramification.
* `LieModule.posFittingComp` was cited for Fitting ideals; the audit's own note called it unrelated.

Of the 10 targets labelled present, 5 hold: BSD.0 (the Euler product), BSD.1 (Mordell–Weil; height and
regulator), L0 (continuous cochains) and B.3 (ζ(−1) = −1/12). The other five are wrong:

* **PS.0, "complex conjugation eigenspaces, Hodge filtration, Tate twists"** (was `tauceti`). In
  Deligne's period setting the eigenspaces are H_B^± of the real Frobenius F_∞. `TauCeti.Hodge.Conjugation`
  is the antilinear involution of the real structure. Neither tree has F_∞ or real Hodge structures
  with an involution.
* **PS.1, "the Dirichlet/Tate case … with rationality"** (was `mathlib`). Mathlib has the functional
  equation and Riemann/Hurwitz values at negative integers, but for Dirichlet L-functions only the
  trivial zeros. It has no generalized Bernoulli numbers and no L(χ,1−k) = −B_{k,χ}/k. The audit's own
  note said so.
* **N.1, "O_{F,S} as a localisation, independence of presentation, compatibility with enlarging S"**
  (was `both`). Tau Ceti's `SInteger/Basic.lean` states that S-integers are "not in general a
  localization of R". No `IsLocalization` statement exists, and monotonicity in S is proved only for
  the units.
* **N.7, "conversion from the topologists' numbering"** (was `mathlib`). The roadmap's source,
  Weibel's K-book VI, defines the topologists' B_k as |B_2k| = (−1)^{k+1}B_2k. Mathlib's
  `bernoulli'` is the B₁ = +1/2 convention, a different thing, and no sign lemma for B_2k exists.
* **L0, "cup products, twists, duals, corestriction, Shapiro, projection formulas"** (was `tauceti`).
  The note itself lists missing twists, duals and degrees ≥ 3, and Shapiro exists only in degrees 0 and 1.

Four of these five were the only present targets of their layers, so PS.0, PS.1, N.1 and N.7 move from
`partly built` to `not built`.

**Absent and partial claims.** I re-searched all of them by concept, in the index and in both source
trees, with four parallel sweeps (K-theory and Birch–Tate; elliptic curves; Galois cohomology and
duality; periods and motives). I verified every positive hit in the source before using it. The
central absences hold:

* No K₁, K₂ or higher K-theory, Steinberg or Milnor symbols, or tame kernels.
* No ℚ/ℤ(j), W_j, Dedekind zeta continuation, regular primes or Iwasawa main conjectures.
* No conductor or root number of an elliptic curve, Tate's algorithm, Néron models, Tamagawa numbers,
  real period, Sha, Heegner points, Gross–Zagier, Euler systems, modular symbols, p-adic L-functions,
  or metaplectic/Jacobi forms.
* No lim¹, Hochschild–Serre or five-term sequence, local invariant map, Tate duality, Poitou–Tate,
  Selmer structures or complexes, Iwasawa cohomology, Fitting ideals, perfect complexes or determinant
  functors.
* No motives, de Rham or Betti realizations, F_∞, periods, Gauss–Manin/Picard–Fuchs, MZVs, shuffle
  products or certified enclosures.

Three targets move from absent to partial:

* **BSD.1, the rank identity for a quadratic twist.** Tau Ceti's `quadraticTwistPointEquiv` gives
  E^L(M) ≅ E(M), with every σ acting through the quadratic character
  (`…_map_eq_quadraticCharacter_smul_map`). `Affine.Point.exists_baseChange_eq_of_map_eq` descends
  σ-fixed points. These are the ± eigenspace inputs; the rank identity itself is missing.
* **L0, Mittag-Leffler bookkeeping.** Mathlib has `CategoryTheory.Functor.IsMittagLeffler` and
  `eventualRange`, and surjectivity for towers of surjections.
* **L2, the compact Pontryagin dual.** Mathlib's `PontryaginDual` is the topological dual with
  contravariant functoriality, alongside `CharacterModule`. It is not a Fourier-analytic construction,
  as the note claimed. The contragredient Galois action is missing.

Several note-level negatives were false even where the label stands:

* Tau Ceti has K₀ of finitely generated projective modules over **any** ring
  (`finiteProjectiveModulesExactStructure`, proved split, with the Cartan map). This contradicts "no
  algebraic K-theory" / "no K₀ of a ring" in three summaries and eight notes.
* Tau Ceti also has μ_n as a discrete G_K-module with H⁰, the top exterior power with endomorphisms
  acting by det (`exteriorPower.topEquiv`, `map_top_eq_det_smul`), Hopf-algebra Tannakian
  reconstruction, local-system monodromy, the deconcatenation word coalgebra, restriction of Euler
  products away from S, the quaternion reduced norm and the exponent-2 case of Kronecker–Weber.
* Mathlib has the ℤ_p^×-valued `cyclotomicCharacter`, exact interval arithmetic
  (`Algebra/Order/Interval/Basic.lean`) and the Gauss hypergeometric function `ordinaryHypergeometric`.
* Tau Ceti's comparison of its H¹ and H² with Mathlib's group cohomology is for discrete groups only.
* The BSD.0 local Euler-factor comparison needs no analytic continuation.

## Duplicates

I read the named layer for each of the 98 links. The rule is the one used from REV-AUDIT-20 onward: a
layer that only consumes, imports or supplies a target does not duplicate it, but owners of inputs that
the audit made targets are kept.

* **35 removed:**
  * 14 same-roadmap links: BSD.6/6a, BSD.7/7a, BSD.9→BSD.8, B.2→B.4, B.3→B.1, B.5→B.6, the N.3
    parent/sublayer links, and two of ArithmeticKTheory's own KU checkpoints.
  * N.7→KU-oddmain, a hidden checkpoint whose owner, I.5, is not an input to N.7.
  * 20 consumers, suppliers or overlaps not stated in the named layer. Examples: EllipticCurves Layer 8
    (Szpiro/abc, not BSD tests), ArithmeticStatistics ST.4, GH.8, and K.2:plus for N.1.
* **10 re-pointed:**
  * Four hidden KU checkpoints go to their owners: IntegralIwasawaTheory I.5, I.9, I.10 and
    GeneralAlgebraicKTheory K.3.
  * Six go to the layer that actually states the target: HodgeStructures L2→L0 (PS.0), R02.4→D7 (PS.4),
    MC.4→MC.6 (PS.9), BorelRegulators R.7→R.5 (B.8), R.1→R.3 (N.3:ranks) and M.5→M.7 (N.6).
* **2 moved** from BSD.6 to BSD.6a: AutomorphicCongruences L2 and ModularIwasawaMainConjectures L6.
* **4 notes corrected.**
* **46 added.** The most important owners the audit missed:
  * KTheoryLowDegrees Z.4 and U.4, which prove K₀(O_{F,S}) ≅ ℤ ⊕ Cl and K₁(O_{F,S}) ≅ O_{F,S}^× — exactly
    N.1's "import Z and U".
  * K2SymbolsBrauer T.5 (tame kernels, K₂(ℤ)) and T.7, MotivicEtaleKTheory M.3 (Tate's degree-two
    theorem) and M.7, BorelRegulators R.3 (Borel ranks), K3BlochGroups V.5, and ClassFieldTheory
    Layer 5 (local invariant and duality).
  * The reverse links of duplicates already accepted in AUDIT-23 to AUDIT-26: NE.5, PadicMeasuresIwasawaAlgebras L5,
    ModularIwasawaMainConjectures L5/L6, ES.0, AutomorphicCongruences L0 and AutomorphicPadicLFunctions L5.

All five roadmap summaries were rewritten to match. After correction there are 182 citations and
109 duplicates. Every duplicate id is a visible atlas layer of another roadmap, and every verdict is
consistent with its target labels.

## Most important finding

The audit's inventory of what exists is careful and mostly right. Its errors run in both directions.
Four "partly built" verdicts rested on over-read present labels: a Hodge conjugation taken for F_∞, the
ζ(−n) formula taken for Dirichlet L-values, S-integers defined by valuations taken for a localisation,
and Mathlib's `bernoulli'` taken for the topologists' Bernoulli numbers. So PeriodsAndSpecialValues and
ArithmeticKTheory have no partly built layer at all. In the other direction, the headline claim that
neither library has "algebraic K-theory of a ring" is false: Tau Ceti defines K₀ of finitely generated
projectives over any ring. And the duplicate lists missed the true owners of N.1's two isomorphisms
(KTheoryLowDegrees Z.4 and U.4) while pointing at hidden checkpoints and same-roadmap copies.
