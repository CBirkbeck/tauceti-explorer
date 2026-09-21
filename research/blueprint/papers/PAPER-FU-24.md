# PAPER-FU-24 — Bianchi multiplicities: extraction and routing checkpoint

Refs #1083. Agent: ChatGPT Pro. Session: `gpt-20260921-c74f2a`.

**Status: partial checkpoint, not a completed extraction or an accepted route.**
The JSON saves 115 declaration-sized draft items: six narrowly identified library
items, eleven existing-stage imports, and 98 missing items. Every missing item has
exactly one proposed route. All seven sections of the main paper were read, but the
source archive, complete published-version comparison and catalogue-wide coverage
checks listed below remain open. No theorem is claimed formalized.

## Source and conventions

The main source read was [Fu, arXiv:2201.11190v2, 15 February 2024](https://arxiv.org/html/2201.11190v2).
The [publisher record](https://annals.math.princeton.edu/2024/200-1/p03) identifies
*Annals of Mathematics* 200 (2024), no. 1, 123–152,
DOI `10.4007/annals.2024.200.1.3`. The complete v2 HTML, including the proofs and
bibliography, was read; accessible PDF passages and selected auxiliary-source page
images were compared. This does not constitute a line-by-line collation of the
published article with v2. Attempts to download the source bytes into scratch
failed, including the dedicated download tool. Consequently `source.sha256` is null;
there is no invented original-PDF digest. The next worker must archive the exact
source version and complete the visual comparison of the omitted diagrams.

Equation locators in the JSON refer to **v2 HTML**: the section-6 free-module
sequences are (33) and (34), dimension shifting is (35)–(36), coefficient comparison
is (37), and the global spectral sequence is (38). The polynomial Peter–Weyl
formulae are unnumbered displays before (32), not (29).

For the local argument, fix odd `p`, a product `G` of `m` first congruence subgroups
of `SL₂(Z_p)`, and `W_k = ⊠ Sym^{k_i}`. Write `D_k = ∏(k_i+1)`. Rational Iwasawa
coefficients mean the bounded-denominator algebra `Q_p ⊗ Z_p[[G]]`, not the
unrestricted inverse limit of rational finite group rings. Enveloping completion
is taken on an integral lattice **before** inverting `p`. General finite coefficient
extensions occur only in the statements that provide the relevant comparison.

For the global argument, distinguish `d = [F:Q] = r₁+2r₂` from the number
`r₁+r₂` of archimedean places. The global weight has the latter number of even
entries `κ_v ≥ 2`, and

`Δ(κ) = ∏_(real v) κ_v · ∏_(complex v) κ_v²`.

At a completely split auxiliary prime, a real entry gives the exponent `κ_v−2`
and a complex entry gives two exponents `κ_v/2−1`. This is the dictionary needed
to turn a local multiaffine bound into the global bound; it is not a relabeling
of one weight vector. Modules, duals and Ore fractions retain their handedness.

## What the proof adds

The local endpoint is Fu Theorem 1.4: for a finitely generated rational Iwasawa
module `M` of rank `a`, both the error in

`dim H₀(G, M ⊗ W_k) = a D_k + error`

and every positive-degree homology dimension are bounded by one multiaffine
polynomial of total degree at most `m−1`. First prove the torsion degree-zero
bound. The two finite-module exact sequences give the upper and lower rank
estimates without assuming `H₁` vanishes. Only then use dimension shifting and
finite global dimension. This order avoids a circular use of the desired
higher-homology bound.

The main inputs are the generic cyclic-module bound (Theorems 1.6/3.2), the
comparison of algebraic quotients through microlocalization (Theorem 4.3), and
injectivity after **every integral** Casimir specialization (Theorem 1.5).
Sections 2–3 supply the filtration, central PBW and integral-image calculations;
sections 4–5 supply the analytic and microlocal comparison. Neither “PBW” nor
“locally analytic distributions” alone supplies this chain.

For fixed level and `r₂>0`, the resulting automorphic endpoint is
`dim S_κ ≤ C Δ(κ)/min_v κ_v`, and in parallel weight it is `O(κ^(d−1))`.
The Bianchi specialization gives the linear upper bound. Its two-sided sharpness
uses a separate base-change lower bound at suitable levels; it is not a
consequence of the upper estimate. Historical bounds, the totally-real asymptotic
and conjectural stronger predictions are recorded as context, not silently added
to the proof's dependency graph.

## Existing owners and baseline checks

The explorer snapshot used is `5b3798c6fbe4b868803e0a37ab1e94d3dde2e35f`.
The implementation baselines are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

The following narrow interfaces were read directly in the pinned Lean sources.
They are imports, not new theorem targets:

| Existing input | Pinned source and scope |
| --- | --- |
| `IsRingFiltration`, `IsModuleFiltration`, integer-index constructor | Mathlib `RingTheory/FilteredAlgebra/Basic.lean`; does not supply the source-specific separation and strictness theorems. |
| Ore ring/module localization and its universal map | Mathlib `RingTheory/OreLocalization/Ring.lean`; an `OreSet` hypothesis is required, not manufactured by naming fractions. |
| PBW word filtration and exhaustivity | Tau Ceti `Algebra/Lie/UniversalEnveloping/PBW/Basic.lean`; no ordered-monomial independence is inferred. |
| PBW graded pieces, direct sum and generator equation | Tau Ceti `Algebra/Lie/UniversalEnveloping/PBW/AssociatedGraded.lean`; not the missing injectivity half of PBW. |
| Normalized `sl₂` Casimir operator and commutation | Tau Ceti `Algebra/Lie/Sl2/Casimir.lean`; field and characteristic restrictions are retained. |
| Primitive-vector eigenvalue `n(n+2)/2` | The same Casimir file, `sl2Casimir_apply_of_hasPrimitiveVectorWith`. |

The upstream **LieHighestWeight** roadmap owns the field PBW, highest-weight and
Harish–Chandra development. Its actual stage identifiers, including the `lλ`
suffix, are used. It is not re-planned. **ProfiniteProPGroups** supplies the
abstract profinite foundations, not all Lazard analytic theory.

**PadicMeasuresIwasawaAlgebras L1** already constructs completed group rings and
convolution for noncommutative profinite groups. **LocallyAnalyticDistributions
L0** already owns radius-indexed analytic function spaces, their inductive-limit
topology, continuous duals and the projective system of Banach duals. Its later
abelian Amice/character theory is not the general noncommutative Fréchet–Stein
algebra required here. **NoncommutativeAndEquivariantIwasawa NE.0** owns the
Lazard–Venjakob noetherian/homological direction; NE.1's canonical relative Ore
set is not Fu's microlocal set.

**ArithmeticLocallySymmetricSpaces ALS.0–1** supplies the quotient and local
systems. **CompletedCohomologyPartII CC.2–6** supplies the completed tower,
duality, finite chain models, finiteness/torsion and descent spectral sequence.
Its integrated decomposition already records the no-discrete-series torsion
input. Its existing source-proof gaps are not a reason to build another owner.

The oversized `data/library-coverage.json` could not be read in full. The accepted
`REV-AUDIT-25`, its locally analytic target records, the integrated CC decomposition
and named roadmap descriptions were read as the available audit evidence. The
new-roadmap directory at the snapshot contains only the six inspected analytic/
Habiro/Lawrence–Venkatesh proposals; none supplies this local theory. A complete
search of all relevant packets, reserved IDs and reviewed coverage remains a
checkpoint requirement. The provisional `missing` decisions are not a claim of
an exhaustive absence proof from keyword searches.

## Five proposed routes

### 1. `PadicEnvelopingAlgebras` — 30 missing items

A Part II of **Representations of semisimple Lie algebras, highest weight theory,
and the Weyl formulas**. It adds integral `sl₂` PBW lattices, saturated ideal
completion, central reductions and their normal forms, integral image lattices,
the generic annihilator estimate and the affinoid Verma central-annihilator
construction. The integral symmetric-power representation belongs here, before
restricting it to analytic compact groups. Existing filtered-ring, Ore and
ordinary field Lie interfaces remain imports.

The finite-image comparison distinguishes the integral image lattice from all
integral matrices; only the rational image is identified with the full
endomorphism algebra. Infinite low-coordinate strips in the growth estimate are
handled by induction, not dismissed as a finite list of exceptional weights.
The equal-Casimir nongeneric example is initially an algebraic module; a completed
analogue would need its own quotient and domain argument.

### 2. `NoncommutativeAnalyticDistributions` — 42 missing items

A Part II of **locally analytic distributions, growth, and character spaces**.
It imports the existing function/dual construction and the bounded completed
group ring, then adds uniform-group/Lie comparison, noncommutative analytic
convolution, radius algebras, flatness, microlocalization, algebraic quotient
recovery, crossed products, central analytic duality and the central injectivity
endpoint. The direct induced-character proof and the all-integral affinoid-Verma
route are distinct proof branches with explicit interfaces.

This is reusable local representation theory, not a hidden Bianchi-only lemma.
It does not include Colmez's correspondence or a geometric theorem about locally
analytic vectors of completed cohomology. Its coefficient, radius, handedness,
quotient and separatedness conditions must be present in the subsequent design.

### 3. `WeightAspectAutomorphicMultiplicity` — 25 missing items

A Part II of **Arithmetic locally symmetric spaces and their cohomology**.
It imports the two local extensions and the existing completed-homology library,
then proves the torsion estimate, two rank inequalities, higher homology,
coefficient-field/weight comparisons, global spectral bound and Bianchi result.
The suitable-level lower bound and the support/boundary comparison are required
mathematics, not notation. No totally-real degree saving or unrestricted
arbitrary-level lower bound is proposed.

### 4. Source addition to `CompletedCohomologyPartII`

Attach Fu section 7 and its Calegari–Emerton/Marshall inputs to **CC.2–CC.6**.
The four inventory items are already planned there. This gives an explicit
consumer and source trail rather than duplicating the tower or its spectral
sequence. In particular it does not reinstate the overstrong Ext/base-change
isomorphism criticized in the integrated CC review.

### 5. Source addition to `NoncommutativeAndEquivariantIwasawa:NE.0`

Make the exact Auslander-regular/finite-global-dimension input explicit inside
NE.0's existing homological programme. The JSON marks the source-specific theorem
missing rather than claiming that a broad direction already states every
hypothesis. Groups with `p`-torsion are not granted finite global dimension.

## Source issues requiring explicit resolution

These are recorded as `S1`–`S6` in the JSON. They distinguish checked discrepancies
from further proof obligations; they do not claim to invalidate the main theorem.

**S1 — support convention.** [Marshall 2012](https://annals.math.princeton.edu/wp-content/uploads/annals-v175-n3-p13-p.pdf),
section 2.1, uses `H_c` for the cuspidal subspace of ordinary cohomology and states
its dimension identity for nontrivial coefficients. Fu describes it as compactly
supported. Keep the cuspidal injection for the upper bound and prove the
boundary long exact sequence and Poincaré–Lefschetz comparison before transporting
the two-sided statement. The trivial coefficient is a separate case. The lower
bound uses [FGT](https://arxiv.org/abs/0808.1204), Theorem 4.17 and Corollary 4.20,
and the indicated congruence-level class, with restriction/trace for sublevels.

**S2 — bounded series are not norm-completed series.**
[Schneider–Teitelbaum 2003](https://arxiv.org/abs/math/0206056), section 4,
distinguishes the weighted-`c₀` radius completion from the larger bounded space.
Fu (16) displays only boundedness. At `r=p^(-1/p)`, coefficients `c_(pj)=p^(-j)`
have weighted size one, so do not tend to zero. Keep both spaces distinct and
check each claimed density and radius-transition map on the correct one.

**S3 — all integral characters.** Fu 1.5 quantifies over `Z_p^m`, whereas 5.1
first concerns characters induced over `Q_p`. At `p=3`, the scalar `λ=1` would
require `(a+1)²=3`, which has no solution in `Q₃`. The alternate route through
[Ardakov–Wadsley 2014](https://arxiv.org/abs/1308.5104), 4.6 and 5.4, uses a finite
coefficient extension with integral roots and then faithful descent. The `n=0`
case is included in the inspected theorem. Those comparisons are still tasks,
not a fictitious equality of parameter sets.

**S4 — coefficient ramification.** The microlocal set displayed in Fu (17) must
be matched to the uniformizer hypotheses in
[Ardakov–Wadsley 2013](https://arxiv.org/abs/1102.2606), section 10. If `p` lies in
the square of the maximal ideal, a literal set of the form
`∪_a (p^a + m^(a+1))` may contain zero. Start with the unramified construction
needed over `Q_p`; prove the finite-coefficient-extension comparison separately.

**S5 — quotient topology.** A weaker norm filtration on a quotient must be
proved separated before its domain property follows from the associated graded.
The topological PBW comparison left to the reader at the end of Fu 5.1 also needs
a norm/decay and injectivity proof. Neither is supplied by displaying an
associated-graded equation. Keep Fu's arbitrary-radius statement in view and
check any rational-radius restrictions of the imported theorems.

**S6 — indices and asymptotic meaning.** Use actual archimedean entries for the
minimum, and separate them from local factors after splitting. The Bianchi
sharpness conclusion is an upper and lower bound up to constants, not a proved
leading constant or ratio-one asymptotic.

The prerequisite register separates inspected passages from bibliography-only
leads. In particular **AB07 is Ardakov–Brown, *Primeness, semiprimeness and
localisation in Iwasawa algebras***, not their similarly named survey.
Frommer is the Münster SFB-preprint 265 (2003); the original theorem locator and
proof still need acquisition. Full proof transcriptions of the selected ST,
AW, Venjakob, Frommer/Kohlhaase and FGT inputs remain subsequent work.

## Validation and continuation

JSON parsing, unique IDs, exact-once routing of all 98 missing items and the
selected 115-vertex/157-edge item dependency graph passed local checks.
The copied `check` function from `scripts/check_paper.py` was run against the
explicitly inspected roadmap/stage map and returned no errors. This was a scoped
check, not the command with the complete atlas loader. Repository CI must run
the actual checker on all known atlas and proposed-roadmap identifiers.

The `dependsOn` list is a selected proof-critical graph, not an exhaustive
blueprint. No Lean compilation, full-atlas acyclicity, mathematical review or
accepted design route is claimed. Resume from the companion handoff: obtain the
source archive, finish the coverage/status reconciliation, audit S1–S5, and only
then change the extraction to complete. Existing item IDs should be retained
when refining this checkpoint.
