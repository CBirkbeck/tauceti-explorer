# PKG-SemisimpleAlgebrasPartII~2 — package revision

Issue: [#9193](https://github.com/CBirkbeck/tauceti-explorer/issues/9193).
Agent: Codex, session `codex-pXXZ3T`. Date: 2026-10-14.
Branch: `codex-pXXZ3T-pkg-semisimple-algebras-part-ii`.
[Winning claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9193#issuecomment-6160539153).

**The package revision is complete for independent review.** The README
retains the mathematics of all 55 accepted input targets, all 30 API entries
and all 31 definition checks. One input target is consumed as an existing
Mathlib supplier contract instead of proposed again. The compact suggested
file follows the binding 2026-10-12 shape; absent geometric carriers remain
README targets. This is a roadmap submission, not a claim of formalisation
or of mathematical closure of its suppliers.

Only the package README, Suggested.lean and this handoff changed. The existing
one-line `topic = "math.RA"` metadata remains correct. The accepted packet,
reader, original prototype and previous package review verdict are unchanged;
the new independent reviewer must replace `review.json`.

## Revision requirements

### R1: normalized field transfer

The README now fixes the actual embedding subgroup, the continuous Galois
group isomorphism and the equivariant separable-closure units transport. Its
degree-two transport is the compatible pair with the inverse group map and
the forward coefficient map. The comparisons are the crossed-product-normalized
ones owned by QuadraticFormInvariants 7B, not arbitrary additive equivalences.

Section 1.2 gives both the defining equation identifying algebraic transfer
with `explicitCor2` and the exact composite defining it. Section 1.1 and
the transported equation in 1.2 require an all-class restriction square as a
theorem to prove from those normalized comparisons, rather than assuming the
desired square in a helper. Embedding independence is equality of the resulting
homomorphisms; the tower and identity equations are retained. The restriction
formula alone is expressly insufficient to characterize transfer.

The old sorry-bodied `brauerCorestriction` homomorphism and its arbitrary
transport helper have been removed from Suggested.lean. They cannot be kept
under the October 12 prohibition on admitted data. The exact algebraic-to-
cohomological comparison is not an importable carrier at the pins, so these
are full README construction/API targets, also named in the closing omission
comment. No replacement private Brauer group or vacuous property was introduced.

### R2: geometric targets and the current package shape

The October 10 review demanded every missing geometric signature in Lean.
The October 12 instructions in WORKERS.md, PROTOCOL §20, PACKAGE_REVIEW.md
and this revision issue now require the opposite when their carriers are absent:
retain the full mathematical statement, API and Checks in the README and omit
the Lean declaration. The revised README does that for all the sheaf Morita,
transition-line, characteristic, finite spectral and relative Cartier targets.
It adds an opening Summary, scope/ownership, exact supplier contracts, numbered
topics, seven visible Checks lists and Examples/Dependencies at each layer end.

Suggested.lean has five light real-bodied definitions/specialisations over
pinned carriers, 15 end-theorem/milestone signatures and 14 examples. It has no
admitted data definition, auxiliary theory development, invented sheaf category,
opaque Higgs carrier, arbitrary comparison equivalence or conclusion-valued
input field. Its short closing comment names the geometric and normalized
transfer targets whose carriers are absent.

### R3: required Cartier ownership decision

The review explicitly permits recording the required ownership decision here.
**A named roadmap and layer must still be assigned by the maintainer to the
following five contracts, together, before treating SA.4's supplier chain as
closed:**

1. The exact relative Cartier sequence for smooth `Y/S`, with its units,
   closed forms, relative Frobenius and `π* − C` maps.
2. Full sequence diagrams under the relative base changes and morphisms used
   on the possibly nonreduced parameter scheme, including the restriction
   comparisons needed for singular spectral schemes.
3. The differential-operator Azumaya algebra and its contact-form boundary
   comparison, with actual represented classes.
4. The splitting determined by a specified `W₂`-lift on the `(p−1)`-st
   zero-section neighborhood, with the exact bound and pullback domain.
5. The contact-form/differential-operator comparison bimodules, evaluation,
   identity-fibre and composition maps needed for the chosen refinement.

No existing roadmap/layer supplying this entire contract was identified in
the current roadmaps or library. The proposed CrystallineCohomology Part II
direction is not an identified package with these exports. Generic CR.1
crystalline cohomology, SF.2 sheaf cohomology and H.0's affine connection
prototype are not substitutes. This revision does not invent an owner or
modify another job's files. README §4.1 states the five contracts as explicit
hypotheses of the application, not as exports of an anonymous roadmap.

All seven SA.4 targets remain. In particular, `relativeClassVanishingInput`
retains the actual connection, its de Rham Hitchin invariant, the `W₂`-lift
and full relative diagrams. Its vanishing is a theorem target, not an axiom
inside the supplier input. A valid relative argument is still needed. The
candidate difference map `(v,t) ↦ (t−1)v` factors through the neighborhood
defined by `I^p`, since `(t−1)^p = 0`; this observation alone does not prove
the required identification of its pulled-back class with the difference of
the two classes. Chosen bimodule coherence remains additional data beyond
Brauer-class equality.

## Fidelity inventory

The counts are of mathematical specifications, not proved declarations.

| Input layer | Disposition in the README |
| --- | --- |
| SA.0, 20 targets | All retained in §§0.1–0.5: quotient index and its APIs; splitting degrees/attainment; actual restricted column action, tower, finiteness and dimensions; all-finite extension bounds; minimum, gcd and cyclic-subgroup invariance |
| SA.1, 10 targets | All retained in §§1.1–1.4: normalized all-class square, algebraic corestriction and degree formula; annihilation, finite order, period divisibility; Sylow splitting and prime-divisor equivalence |
| SA.2, five input targets | Four new targets in §§2.1–2.4; the affine `matrix-support` calculation is consumed under “From Mathlib: annihilators of products” |
| SA.3, 13 targets | All retained in §§3.1–3.7: transition line, line twist, Morita polynomial, Frobenius-root boundary, finite pushforward, spectral line, overlap and all four Higgs invariant APIs |
| SA.4, seven targets | All retained in §§4.2–4.7 after the exact five-contract input in §4.1 |

| Definition | API entries retained | Checks retained |
| --- | ---: | ---: |
| classIndex | 4 | 6 |
| splittingDegrees | 5 | 4 |
| division-column action | 4 | 4 |
| brauerCorestriction | 5 | 4 |
| sheafMorita | 4 | 4 |
| moritaCharpoly | 4 | 4 |
| moritaHiggsInvariant | 4 | 5 |
| Total | 30 | 31 |

The fidelity check matched all 55 input target correspondences to the stated
README topics and checked every API and test name. The representative Lean
file intentionally has a smaller inventory. Its definitions use the existing
Brauer quotient, `Quotient.out` with an explicit `CSA` type, real finite field
extension data, `Module.compHom`, and native square-zero extensions. Choice
independence of the index is the representative-formula theorem, not an
additional carrier. The old chains of column lemmas and the construction of
transported transfer live in the README rather than becoming theory in Lean.

## Baseline and duplication audit

The atlas checkout began at `a9232ae1f`. The current read-only TauCetiRoadmap
checkout was `0d144d044dacebca17b654695b6f1ad58f159b27`; its Tau Ceti
dependency was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No Lake operation
was run in that checkout. Both the current parent SemisimpleAlgebras and
AlgebraicVectorBundles READMEs were read in full, with their relevant suggested
declarations. The current QuadraticFormInvariants 7B normalization was also read.

The audit checked the reviewed library-coverage data, all 48 cited pinned
baseline statements, the current library's relevant algebra, matrix, support,
cohomology and sheaf interfaces, and mathematical-object searches across the
nine newer upstream roadmaps and the four Completed roadmaps. Unrelated uses
of annihilators, quadratic invariants and distribution geometry are not the
targets here. The following deferrals matter:

- **Remove affine `matrixSupport` as proposed work.** Mathlib
  `Module.annihilator_pi` already supplies the product formula; nonempty
  constant factors give the displayed annihilator equality. The full formula,
  nonempty/empty boundary and source application are preserved as a supplier
  contract. Layer 2 proposes only the new ideal-sheaf comparison, together with
  the Morita targets and negative support example.
- **Consume current cohomological transfer.** The current
  `TauCeti/NumberTheory/ClassFieldTheory/Brauer/Restriction.lean` was read.
  `TauCeti.ClassFieldTheory.brRes`, `brCor`, `brRes_eq_explicitMap2` and
  `brCor_brRes` act on `Br K = H²`; they do not implement algebraic transfer
  on the central-simple-algebra quotient. The README cites them as existing
  inputs and states exactly the additional normalized comparison.
- **Keep the index and separable splitter with the parent.** The pin's
  exact-index finite splitter and its finite separable splitter are distinct
  existence statements. The parent Layer 6 owns the separable exact-index
  result over infinite fields. SA.1 consumes that precise conjunction and
  uses finite-field index one separately.
- **Use AlgebraicVectorBundles L0A–L0C.** Sheaf tensor/internal Hom, finite
  locally free rank/duals and determinant inputs belong there, rather than
  being replanned under the coarse incoming SF.0 reference. The specific
  Morita and coefficient-descent applications remain here. No matching global
  Morita characteristic invariant was found upstream.
- **Keep generic Morita and Higgs ownership.** K.7 owns projective-generator
  tensor/Hom localization; HodgeStructuresPartII H.0 owns the single symmetric
  Higgs action and determinant interface; SF.2 owns the shared scheme Brauer
  carrier. Missing imports are not replaced by private carriers here.

When packet changes are authorized separately, its coarse SF.0 tensor/rank/
determinant references should be reconciled with AlgebraicVectorBundles,
`matrix-support` should become a library deferral, and the Cartier owner must
be assigned. This revision changes no packet or supplier file.

## Adversarial mathematics pass

The pass checked statements and defining conventions in each group against
their degenerate and boundary instances. Elaborating a `sorry` theorem is
not evidence of its truth.

| Statements and conventions checked | Instances/computations and resulting constraints |
| --- | --- |
| Quotient index, representative formula, positivity, index one and base change | Positive matrix sizes have index one although degree changes; the Hamilton class has index two and becomes index one over the complex numbers. Zero-size matrix stabilization is excluded. The existing finite-field theorem handles that branch. |
| Splitting degrees, attainment, extension divisibility, minimum and gcd | Identity degree one; degree zero impossible; inseparable extensions remain in the domain. The gcd statement at `m=0` has both sides false because the attained index is positive. The reverse bound uses an actual finite extension tower. |
| Column action, tower, finiteness, dimension and cancellation | The first coordinate of a two-entry column is the sum of the two row terms. Empty columns have dimension zero but cannot justify cancellation. Dimension four and extension degree three would force `2 ∣ 3`, hence the negative example. The module action is the specified restriction, not a chosen dimension predicate. |
| Cyclic-subgroup invariance | Both classes trivial gives equal index one; for general equal cyclic subgroups the same field extensions split both. No equality of representatives or degree is asserted. |
| Normalized square, transfer, identity, tower and embedding equations | Identity transfer and trivial class; the quadratic composite is squaring. A Hamilton class restricts trivially and squares to one, so the composite cannot be asserted to return the original class. A nontrivial purely inseparable extension lacks the transfer hypothesis. |
| Index annihilation, finite order, period divisibility, Sylow splitting and primes | Trivial class has period/index one; positivity is proved before using order. Arithmetic primes may equal the characteristic. Zero is not prime. Two unrelated splitting existential statements do not yield the separable index-degree conjunction. |
| Affine annihilators, nilpotent boundary, sheaf Morita, coherent and exact support targets | Empty products have unit annihilator. In Z/4, the ideal (2) is nilpotent but does not annihilate the regular module. Rank-one splitting is identity; rank two gives two columns; disconnected positive ranks are allowed. A zero generator on a nonempty base cannot provide a counit. Finite presentation is distinguished from coherence off noetherian bases. |
| Transition line, line twist, Morita polynomial and its APIs | For `Q = P ⊗ L`, the inverse changes by the dual line. Scalar `b` gives `T−b`; zero rank gives polynomial one. Over characteristic-two dual numbers, the specified epsilon is nonzero and square-zero, and `T` and `T+epsilon` have equal squares but unequal coefficients. No root uniqueness is used. |
| Finite pushforward, spectral lines, overlap and full Higgs invariant/APIs | The line is on the finite cover, not assumed pulled back from the base. All symmetric coefficients and all commuting actions are retained, including over finite fields. Two components with splitting ranks one and two give original/inverse ranks three/two and zero-action polynomials `T³`/`T²`; no single power works. The power API requires one fixed rank on the whole inverse image. |
| Cartier middle image, boundary, additivity, naturality and represented classes | The composition is first delta-zero then delta-one. Boundary of zero is zero. Naturality needs both short exact sequence diagrams with the actual units. Only represented classes are translated through an injective algebraic Brauer comparison; surjectivity is not assumed. |
| Relative vanishing, class equality and chosen refinement | Fibre vanishing of `epsilon·xi dx` does not imply zero-section support: it survives inversion of xi. The difference map kills `I^p`, but the full relative comparison remains to prove. Smoothness of an ambient scheme does not imply smoothness of the spectral thickening. Scalar automorphisms one and two over F3 are distinct, so no unique-isomorphism assertion chooses evaluation/coherence. |

The pass preserved the accepted strengthened hypotheses. It added explicit
layer examples and native sign, zero-rank and inseparability controls; it did
not certify the outstanding relative vanishing argument.

## Fresh source reading

Public versions were read on 2026-10-14 at the passages below, including the
relevant arguments. These are selected passages, not a claim to have read the
whole book or all papers. All roadmap statements are in our own words. No
source passage, PDF or text extraction is committed.

| Version and public source | Passage read | SHA-256 |
| --- | --- | --- |
| [GS first edition, 2006](https://www.math.ens.psl.eu/~benoist/refs/Gille-Szamuely.pdf) | Proposition 4.2.10, pp. 88–89; §4.4, pp. 95–99; §4.5, pp. 100–106 | `3697582f57a11547addeb8d5d63764d788b9d670e2bd76bd7401b9f3994f1e63` |
| [GS author errata, 4 December 2020](https://pagine.dm.unipi.it/tamas/erratams.pdf) | p. 3, including the correction to the separable-element argument on book p. 101 | `db7cea507d8aa13060aeff424845bbfd74e12fd71faceb4c374dbc7e815f3d04` |
| [Benoist, published IHÉS 130 (2019)](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf) | §0.1, printed p. 63, for general index/period conventions | `8dfc0f221ab510ba1ecfe7c5b5fde12c217019f33d704ea89ce1a0c144398d3b` |
| [EG, arXiv:1707.00752v4](https://arxiv.org/pdf/1707.00752v4) | Theorem 2.17/Remark 2.18, pp. 13–14; Proposition A.2/Remark A.3, pp. 40–41 | `bcc435b58bb2b1c06869413c1cd96018676d15da8003d21e5b507b114a63c4eb` |
| [OV, published IHÉS 106 (2007)](https://www.numdam.org/item/10.1007/s10240-007-0010-z.pdf) | Theorem 2.8/Corollary 2.9, pp. 33–34; §4.2, equation (4.1.1) and Proposition 4.2, pp. 85–86; Proposition 4.4, pp. 87–88 | `2266595d31d3ee482d7fffefaf86ad8f50767804059bbde9ccaaf3b27c4f1035` |
| [BB, arXiv:math/0602255v2](https://arxiv.org/pdf/math/0602255v2) | §2.2, p. 3; Proposition 3.11/Corollary 3.12, p. 11 | `a94800bee9fcbb4ea99b6d945b4e8c24b99a80fd957021d6f5ca530ca38b0b1c` |

The fresh GS reading resolves the previous worker's unavailable-book receipt.
It also corrects the locator types to Corollary 4.5.11, Definition 4.5.12 and
Lemma 4.5.14. Section 4.5's standing infinite-field hypothesis is recorded;
the roadmap handles finite fields with the existing index-one result. The
GS correction embeds the reduced-characteristic-polynomial algebra into the
division algebra; it does not assert irreducibility over an algebraic closure.

The README preserves the identified source boundaries: EG's monic-root
uniqueness and fibre-support shortcuts are not used; OV's splitting has its
bounded domain; BB's differential-operator rank is `p^(2d)` and the contact
section has the correctly typed composition `eta ∘ delta`. No identification
of the EG/BB preprints with their published texts is asserted.

## Validation and next step

- Final `lean-check research/blueprint/packages/SemisimpleAlgebrasPartII/Suggested.lean`
  exits 0: 29 warnings, all “declaration uses sorry”; zero errors and zero
  other warnings. The file has 248 lines. The shared build uses Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- The unchanged packet checker reports zero errors and zero warnings,
  55 nodes, 30 API entries and 31 tests. Its five planned/zero closed stages,
  11 gaps and ten requests remain unchanged; packaging does not close them.
- The README inventory retains the 55 mathematical correspondences, 30 API
  entries and 31 Checks, with five Examples and five Dependencies sections.
- Metadata, permitted paths, absence of private paths/process residue in the
  package, whitespace, and the intake file rules were checked before submission.

The next step is a fresh independent package review under the October 12
shape, especially the normalized coefficient-map directions and the explicit
Cartier ownership decision. No second job was claimed. The maintainer's owner
assignment and subsequent mathematical implementation belong to later work;
there is no unfinished package editing checkpoint in this submission.
