# Review of AUDIT-19

**Job** REV-AUDIT-19 · **Date** 2026-09-17 · **Verdict `accepted`** · **7 corrections**

Baseline: tauceti `f790474`, mathlib `082e2d3`.

Scope: the five roadmaps of `research/blueprint/audit/AUDIT-19.json` —
`HabiroCohomologyFoundations`, `LefschetzPencilsAndVanishingCycles`, `WeightsInEtaleCohomology`,
`WeilConjectures` and `FiniteFieldsAndCharacterSums`. That is 41 layers, 192 targets, 133
declaration citations in 141 distinct files, and 66 duplicate claims.

**The audit is sound and unusually well evidenced.** Its central finding — that the cohomological
spine of all five roadmaps (étale cohomology with its Frobenius, nearby and vanishing cycles, weights,
prismatic and q-de Rham theory) is simply not in either library, while the surrounding linear algebra,
finite-field theory and character theory largely are — survives re-checking. Seven entries needed
correction: two real misses in Tau Ceti, one misread Mathlib lemma, one false parenthetical, one
verdict, and three duplicates.

## Corrections

1. **`FiniteFieldsAndCharacterSums:FF.1`, orthogonality — `mathlib` → `both`.** The audit recorded the
   column (dual) relation for multiplicative characters as available only for Dirichlet characters
   modulo `n`, "not separately for F_q^× with q not prime". Tau Ceti proves exactly the missing
   statement: `CommGroup.sum_monoidHom_apply_eq_ite`
   (`TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:104`, with the punctured form at
   `:91`) gives `∑_{χ : G →* Mˣ} χ(g) = Nat.card G` at `g = 1` and `0` otherwise for **any** finite
   commutative `G` and any domain `M` with enough roots of unity — so for `F_q^×` at every prime power
   `q`. That file's own docstring sets out why Mathlib's `ZMod n` and complex-valued specialisations do
   not imply it. This is the one place where the audit called a target's key ingredient missing when it
   is proved.
2. **`FF.1`, Hasse–Davenport — note.** The relations themselves are genuinely absent; the parenthetical
   "a grep for Davenport and Stickelberger found nothing" was false. Tau Ceti has
   `NumberTheory/NumberField/Discriminant/Stickelberger.lean` (the congruence `disc ≡ 0, 1 mod 4`) and
   Mathlib has Cauchy–Davenport. Neither is the Gauss-sum theorem, and the note now says so.
3. **`LefschetzPencilsAndVanishingCycles:LPV.4`, nondegenerate descent — citation.** The audit said
   Mathlib "identifies the kernel of the restriction to `W` with `W ∩ W^⊥`" and cited
   `LinearMap.BilinForm.toLin_restrict_ker_eq_inf_orthogonal`. That lemma is about `B.domRestrict W`
   and gives `W ⊓ B.orthogonal ⊤`, the intersection with the radical of `B` on the whole space. The
   lemmas that do say what was claimed are `inf_orthogonal_self_le_ker_restrict`
   (`Orthogonal.lean:251`) and `nondegenerate_restrict_of_disjoint_orthogonal` (`:193`); the entry now
   cites those. `partial` is unchanged — the descended form on `W/(W ∩ W^⊥)` is still not stated.
4. **`LPV.1`, the unipotent monodromy operator — citations.** Only Mathlib's `IsNilpotent.exp` was
   cited. Tau Ceti has a developed unipotent-automorphism theory (`IsUnipotent` as nilpotence of
   `g − 1`, the `charpoly = (X − 1)^n` characterisation over a domain, closure under commuting products,
   powers, inverses and conjugation, the generalised 1-eigenspace). Added as related. The logarithm of
   a unipotent operator is still absent, so the entry stays `partial`.
5. **`WeilConjectures:WC.0` — `process` → `not built`.** Only the first half of WC.0 is bookkeeping.
   It also demands finiteness of `X(F_{q^r})` for a separated finite-type `k`-scheme *as a proved
   theorem, not a `Fintype` instance*, and the canonical translations between point sets over
   isomorphic fields with tower compatibility. The audit itself records both as `partial`, and neither
   library proves either, so the layer states mathematics that is not built.
6. **`LPV.7` and `LPV.7:semistable-curves` — duplicate added.**
   `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs` owns nodes, the
   local normal form `κ̄[[x,y]]/(xy)`, normalisation with its conductor sequence, and the dual graph of a
   proper nodal curve with `p_a = Σ g_v + b₁(Γ)` — the normalisation/node and dual-graph half of what
   this substage recomputes before applying nearby cycles.
7. **`FF.4` — duplicate added.**
   `tauceti:TauCetiRoadmap/AlgebraicCodingTheory#layer-1-…` (with Layer 2) owns generator and
   parity-check matrices, encoding maps, dimension formulae, puncturing/shortening bounds and minimum
   distance, which is FF.4's stated acceptance criterion; FF.4 keeps only the evaluation/residue codes
   built on that API.

## What was checked

**Mechanical.** All 41 batch layers are present. Every one of the 133 citations resolves at its stated
library, file and line; the single exception is Mathlib's `abbrev LinearMap.IsRefl.liftQ₂`, which the
index omits but which is at `Quotient/Bilinear.lean:52` exactly as cited. No cited file contains a
`sorry` in a proof — the only two hits are docstring prose in
`EllipticCurve/Isogeny/Frobenius/Basic.lean` and `Affine/Point/FrobeniusFixed.lean`, the second of
which explicitly says the stale "`sorry` stub" wording is not carried across. No citation is `private`,
an axiom or a bare structure field. Verdicts agree with target labels throughout.

**Presence claims (11 targets, all in FF.0/FF.1).** Read in the source. `FiniteField.card`,
`GaloisField.card`, `algEquivOfCardEq`, `frobeniusAlgEquivOfAlgebraic` with
`orderOf_frobeniusAlgHom = finrank`, `Extension.exists_frob_pow_eq`,
`nonempty_algHom_iff_finrank_dvd`, `natCard_algHom_of_finrank_dvd`,
`algebraMap_trace_eq_sum_pow`, `algebraMap_norm_eq_pow_sum`, `norm_surjective`,
`trace_to_zmod_nondegenerate`, `IsGalois.normalBasis`, `AddChar.FiniteField.primitiveChar`,
`gaussSum_mul_gaussSum_eq_card`, `gaussSum_sq`, `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`,
`jacobiSum_mul_jacobiSum_inv`, `gaussSum_pow_eq_prod_jacobiSum` all hold, with the hypotheses the notes
state (nontrivial `χ`, primitive `ψ`, `ringChar F' ≠ ringChar F` where needed).

**`process` verdicts.** Confirmed against the layer descriptions for `HQ.7` (acceptance tests),
`R34.3` and `R34.4` (R34 is declared an import interface and these two layers state no theorem of their
own), `WC.7` (worked realisations and assembly) and `FF.5` (a handoff). `WC.0` did not survive; see
correction 5.

**Absent and partial claims.** Every one was re-searched by concept across `declarations.tsv` and both
source trees (about 110 sweeps), not only the ones with standard Mathlib names. Confirmed absent:
q-derivatives and q-de Rham, Λ- and δ-rings and prisms, animated rings, décalage, de Rham–Witt
complexes, truncation sets, big Witt vectors, quasi-syntomic rings, spectra; nearby and vanishing
cycles, lisse and constructible sheaves, Verdier duality, perverse t-structures, blow-ups of schemes,
Veronese, Bertini, dual varieties, tame and wild inertia, Abhyankar, quasi-unipotence, monodromy
filtrations, p-adic Lie groups; Weil numbers, Rosati, Tate modules, Kuga–Sato, Eichler–Shimura,
compatible systems; zeta functions of varieties or function fields, Euler products by closed-point
degree, Fatou, Künneth, Lefschetz trace formulas, the Hodge index theorem and surface intersection
theory, Pfaffians; Kloosterman sums, Weil/Deligne character-sum bounds, Hasse–Davenport, Berlekamp /
Cantor–Zassenhaus / Rabin, Galois rings, linearised and permutation polynomials, linear recurring
sequences, Reed–Solomon / BCH / AG codes, finite upper half-planes. Three checks worth recording:

- **Tau Ceti's Hasse bound really is conditional.** `Matrix.sq_le_four_mul_of_exists_nonneg_pencil_det`
  and `…_symplectic_multiplier` (`LinearAlgebra/Matrix/PencilDiscriminant.lean:100,125`) prove
  `t² ≤ 4q` only from a hypothesis supplying ℓ-torsion Frobenius matrices with the symplectic scaling,
  and `LinearAlgebra/Matrix/SymplecticMultiplier.lean` and `QuadraticFormCongruence.lean` say in as many
  words that supplying it "is the work of the Weil pairing", which is not built. The audit's repeated
  `partial` on the curve bound (R34.2, WC.5) is right.
- **Mathlib's ℓ-adic cohomology carries nothing arithmetic.**
  `AlgebraicGeometry/Sites/ElladicCohomology.lean` defines only the pro-étale sheaf `U ↦ C(U, ℤ_ℓ)` and
  its cohomology groups, with three declarations in the file and no Frobenius, finiteness or comparison.
- **No evenness of the middle Betti number over a general field.**
  `TauCeti.SymplecticForm.even_finrank` is over `ℝ`, proved through a compatible almost complex
  structure, and `SymplecticMultiplier.lean` records that this Mathlib has no Pfaffian. WC.2's `partial`
  with `special case` is the right reading.

**Duplicates.** All 66 cited layer ids exist in the atlas, and none belongs to a retired roadmap. I read
the sampled overlaps (PR.6, H1:valuation-nearby-cycles, R01.2, FA.5, EDC.8, CA.1, DWP.9, CN.0, C5) and
they are accurate; `DWP.9` and `ClassicalAdicEtaleCohomology:H1` are consumers of LPV rather than
duplicates, and the audit correctly does not list them as such. A keyword sweep of all 1962 atlas layer
descriptions against this batch's targets turned up the three overlaps added above and nothing else.

## Reading

The roadmap documents are accurate about their own gaps, with one systematic exception: the elementary
shell under the cohomology is further along than they assume. FF.0 and FF.1 are close to done in
Mathlib (classification, Frobenius, subfields, trace and norm formulas with surjectivity, normal bases,
characters, Gauss and Jacobi sums with all three identities), Tau Ceti closes the orthogonality gap,
and much of the linear algebra LPV.1–LPV.5 proposes to build — transvections with their fixed spaces,
forms descending to quotients by their kernels, characteristic-free quadratic-form nondegeneracy,
nilpotent exponentials, unipotent automorphisms, generation of `Sp` by root subgroups — already exists.
What is missing everywhere is the geometry.
