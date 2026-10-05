# BP-KTheoryLowDegrees--U.1~2

Issue #6503. Agent: Codex, session `codex-1lp2cs`, 2026-10-05.
This revision completes the bounded planning pass and submits it for independent
review. It is not an implementation or a closure claim. The input already had
332 nodes, exceeding the 300-node budget, so this round adds no nodes. All node
IDs, 14 source issues and the entire independent `needs_changes` review object
are preserved. The next independent reviewer replaces that object.

## Deliverables and changes

- [Packet](../packets/KTheoryLowDegrees--U.1.json): status `complete`; exact
  issue scope Z.1, Z.2, U.1–U.6; all implementation statuses `unchecked`.
- [Reader](../readmes/KTheoryLowDegrees--U.1.md): regenerated from every current
  node, including all 32 review additions and all 59 corrected contracts. It
  contains each statement, hypotheses, proof, API, tests, acceptance cases,
  prerequisites and source locators. A topological order within each stage
  places split conclusions before their consumers. Coverage, gaps, requests,
  source corrections and routed-source inventories agree with the packet.
- [Suggested file](../suggested/KTheoryLowDegrees--U.1.lean): retains the
  review's atomic signatures and substantive tests. The standard note opens
  the file. The current K.5 relative-fibre supplier replaces the obsolete ID;
  the additional relative-plus and degree-two proof obligations are explicit.
  The individual pinned Frobenius module is imported. Historical fragment
  results do not certify this complete file.

The principal BMS condition is `a−1∈qA`, where the scalar q belongs to the ideal
𝔮. The reader includes the actual membership witness, evaluation equation,
finite-family/common-residue-image conclusion, principal-level move and
power-reduction output. It no longer gives the weaker ambient-ideal condition
as sufficient. The counterexample is A=ℤ, 𝔮=2ℤ, a=3, q=6: the ambient congruence
holds, but (a,q) is not unimodular.

The reader exposes the canonical supplier edges, named cohomological pairing,
separate degree-m Artin dictionary and power-subgroup topology, actual relative
SK₁ quotient/kernel, zero-ring qualification, DVR entry positions and
determinant-value-2 tests. The relative comparison has an explicit proof gap;
the double-ring five-lemma argument is not a proof because the neighboring
absolute maps are not isomorphisms.

Proof references now name the separate complement, basis, multiplicativity,
free-cofinality, scalar-extension, product-decomposition, relative normality and
projection-formula nodes. The finite-product decomposition includes the
explicit isomorphism Aᵢ⊗P≃eᵢP. K₀ uses left modules and row matrices; projective
automorphism K₁ and transfer use right modules, with restriction along fᵒᵖ in
the noncommutative case. Neither convention silently assumes commutativity.

Reading CH-L18 identified two already-built facts:
`AlgHom.IsArithFrobAt.apply_eq_pow_absNorm_of_pow_eq_one` and
`AlgHom.IsArithFrobAt.autToPow_eq_absNorm`. Their statements, enclosing variables
and proofs were read at the Tau Ceti pin. They are baseline citations, not new
nodes. The Chebotarev layer-4 request now concerns the cyclotomic extension and
transport to the actual Frobenius/LiesOver hypotheses. The U.4 residue-field
comparison uses pinned `isCyclic_subgroup_units` and `Fintype.card_units`
directly instead of importing its downstream U.6 computation.

## Counts and coverage

| Stage | Nodes | Coverage | Resume point |
|---|---:|---|---|
| Z.1 | 53 | source_decomposed | Concrete projective/K₀ and Milnor contracts are decomposed. |
| Z.2 | 30 | source_decomposed | Virtual rank and ring computations are decomposed. |
| U.1 | 27 | source_decomposed | Stable matrices, elementary groups and Whitehead calculus are decomposed. |
| U.2 | 22 | source_decomposed | Classical K₁ and projective automorphism calculus are decomposed. |
| U.3 | 42 | partial | Receive the continuous SL-to-SO retraction. |
| U.4 | 113 | partial | Close the arithmetic suppliers and decompose BMS §10 onward. |
| U.5 | 31 | partial | Establish the relative homotopy comparison owned by U.6. |
| U.6 | 14 | partial | Establish relative-plus, supplier naturality and coherent determinant comparisons. |

There are 23 definitions, 48 constructions, 170 lemmas, 69 theorems, 12
comparisons and 10 applications; 498 definition/construction API items; 285
unit tests; 44 planets; 481 baseline declarations; nine gaps and eight requests.
No stage is closed. The four source-decomposed stages have empty remaining
lists; all four partial stages retain precise remaining lists.

## Open work for follow-up passes

The nine gap entries are authoritative. Resume at the following boundaries:

1. **Real-circle obstruction:** the LieGroups layer-9 continuous SL_N(ℝ)-to-SO
   retraction for each N≥2, with the pinned SO topology and coordinate
   compatibility. Spin/lifting and the Dedekind coordinate-ring contracts are
   already decomposed; they do not establish the missing retraction.
2. **Power reciprocity:** remove the CA.1→T.7 cycle and supply BMS A.16,
   A.19–A.21 with `(a,b)_BMS=(b,a)_CA.1`. The current CA.1 nodes are exact
   imported plans with the cycle recorded, not a solved supplier.
3. **Higher units:** source and decompose A.17–A.18, cited to Serre's *Corps
   locaux* XIV §3, using an accessible proof source.
4. **Relative homotopy:** supply an actual relative-plus/excision-defect proof
   and its degree-two boundary comparison. π₂=K₂ alone is insufficient. The
   T.1:plus/T.6 route still encounters the stage cycle. Use the current
   `GeneralAlgebraicKTheory:K.5/relative-K-theory` fibre contract, which delegates
   the classical comparison to this owner.
5. **Finite arithmetic defect:** resume at BMS §10, printed p.115, Lemma 10.2.
   Prove the higher-rank last swap under Proposition 8.6 separately from the
   Dedekind rank-two calculation under Proposition 8.5. Bundle and iterate
   the actual multiplicative extension, then decompose §11 finite-rank
   relative universality, Theorem 4.1(c), Corollary 4.3, r(I), transition maps
   and compatible roots-of-unity normalization. §9 through Lemma 9.6 is the
   existing boundary, not a proof of these targets.
6. **Completions:** import the generic topology carriers, construct the
   arithmetic/congruence inverse-limit comparison and its central kernel,
   then prove BMS Theorem 14.1.
7. **SL₂:** read and decompose Serre's infinite-unit-rank congruence theorem;
   the CM-quartic CG case uses it. Imaginary-quadratic S=∅ is excluded.
8. **CG interface:** specify the SL-to-GL, Hecke and non-Eisenstein-localized
   H¹/compact-support interface. A finite central kernel alone does not imply
   vanishing when the coefficient characteristic divides its order.
9. **Symbol dictionary/topology:** ClassFieldTheory layer 5 supplies the named
   cohomological pairing and its algebraic properties. Layer 6 promises only
   the exponent-two comparison. The general degree-m Artin normalization and
   BMS orientation, openness and finite index of local power subgroups,
   including A.13–A.15 and archimedean cases, require a Part II supplier.

The eight canonical requests remain: ClassFieldTheory layers 5, 12, 13;
Chebotarev layers 4, 10; GlobalNumberFields layers 6, 7; LieGroups layer 9.
Every listed consumer has its requested supplier as a prerequisite. The
ClassFieldTheory Part II and relative-stage restructuring proposals now state
the unresolved obligations without treating their cycle removal as completed.
U.6 also retains the H.3 universal-property proof boundary and the companion's
typed coherent determinant-loop contracts.

## Ownership, routed sources and red-team findings

Accepted RS-18 supplies the Part II title and narrowed Z.1/Z.2 scope. The
categorical split/exact K₀ carrier and stalk rank are reused. No native Tau Ceti
roadmap is re-planned. The audited eight stages, two upstream roadmap documents
(GrothendieckEulerForms and Chebotarev), touching link entries and the eight
requested supplier stage descriptions were read.

- **RT-AREA-ktheory-1/9:** T.5 owns the degree-two tame-kernel sequences and
  K₂(ℤ), K₂(𝔽_q), K₂(ℚ). ArithmeticKTheory N.6 owns certified presentations.
  The existing import/ownership proposals retain those edges; U.6 supplies
  K₁(ℤ), companion Z.6 supplies K₀(ℤ), and no K₂ calculation is duplicated.
- **RT-AREA-ktheory-1/24:** the finite-S unit theorem has rank
  r₁+r₂+|S|−1, with S a set of finite places; torsion is μ(F). S=∅ recovers
  ordinary units. The determinant map is canonical; a decomposition requires
  chosen fundamental S-units. ArithmeticKTheory N.3 imports this theorem.
- **RT-AREA-ktheory-1/25:** arithmetic prime choice and power reduction import
  the precise CFT/Chebotarev/global-arithmetic contracts. Canonical supplier
  edges, the reciprocity cycle, higher-unit and symbol/topology gaps remain
  visible. The theorem is not asserted for arbitrary Dedekind domains.

All 21 Bhatt–Scholze routed items retain their inventory and finer companion
contracts. General Picard groupoids, spectra, localization and categorical K₀
keep their owners. This part supplies the classical local K₀/K₁ and automorphism
loop interfaces; companion Z.3–Z.6 supplies graded, coherent perfect-complex and
Witt-support determinant consequences. Both the companion and the K.1 supplier
have `needs_changes` reviews in the consulted inputs. No acceptance or
implementation of their contracts is claimed.

The 14 inherited source issues E101–E114 remain unchanged with their independent
confirmations. In particular, E112 records Serre's published withdrawal of the
BMS A.23(b) exponent formula. E113–E114 retain the reverse push-pull and reverse
kernel counterexamples over k→k×k. Only the true forward projection formula is
used. K-book findings concern the hash-pinned author draft, not an unread
published edition.

## Source reads and reproducibility

This revision freshly downloaded five public PDFs, reconfirming their exact
packet SHA-256 values. The packet's appended `sourceVersions` records the date,
URL, hash and limited passages read:

- Weibel's combined 2013 K-book draft: PDF pp.76–78, 80, 84, 86–88, 190,
  193–195, 199, 201–203, 275–276 and 283.
- Bass 1964: printed p.32, projective-automorphism presentation calculus.
- Dieudonné 1943: printed p.32, the rank-two F₂ commutator exception.
- Bass–Milnor–Serre 1967: printed pp.66–68, 75–76 and 85–87, principal residue
  congruences, power reduction, symbol orientation and higher-unit boundaries.
- Serre 1974 erratum: all four printed pages 241–244.

Fresh reads do not replace the inherited broader source provenance. This round
does not claim a fresh proof read of Milne, Conrad, CG, Bhatt–Scholze, Serre's
SL₂ proof, *Corps locaux*, or undecomposed BMS §10–§11. The independent review's
source-specific confirmations remain identifiable. The missing accessible
higher-unit proof and the open routed congruence arguments remain follow-ups.
Public URLs and exact hashes are in the packet; no source PDF or extracted text
is committed or needed from scratch.

## Validation and Lean result

`python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryLowDegrees--U.1.json`
reports **0 errors, 0 warnings**, with the counts above. `git diff --check`
passes. Additional checks compare all 332 IDs and the independent review and
source-issue objects against the input; check each reader node's exact
statement, hypotheses, proof, API, tests and prerequisites; check all canonical
request edges; and restrict changed paths to the four issue deliverables.

Independent small computations enumerate invertible 2×2 matrices and their
commutator subgroups. Over F₂, GL₂=E₂=SL₂ has order 6 and its commutator has
order 3. Over F₃, GL₂ has order 48 and commutator order 24, while E₂=SL₂ has
order 24 and commutator order 8. For reproduction, enumerate the p⁴ matrices,
filter by nonzero determinant or determinant one, form every ghg⁻¹h⁻¹ and take
the subgroup they generate by repeated multiplication. Elementary generators
are the upper/lower unipotents, whose closure equals SL₂ in both cases.
The principal-congruence gcd counterexample and k×k reverse push-pull were
also reproduced: restriction sums coordinates, extension sends n to (n,n),
so (1,0) maps to (1,1), not (2,0), and (1,−1) is a kernel element not killed
by a power of 2.

The prescribed full-file command was run with 96 GB available memory:
`lean-check research/blueprint/suggested/KTheoryLowDegrees--U.1.lean`.
It exited with status 1 during import loading because
`TauCeti/CategoryTheory/Exact/Functor.olean` does not exist in the shared build.
**The complete file did not elaborate; its body was not checked.** The shared
Tau Ceti checkout was `cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than
the packet's `f790474821cf4256814db967cb154e7af3d0c369`. Mathlib matched
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Pinned source reads used the
recorded git objects and are separate from this build limitation. No build,
cache download, extra Lake project or Lean server was started; no compilation
is left running. Arrange a complete prebuilt environment at both exact pins
and rerun the full suggested file before claiming successful elaboration.

The regenerated reader and corrected packet should be reviewed together.
Preserve the nine gaps and four partial stages until their mathematical inputs
are established. The next stage of this job is independent review; a new
planning pass can extend the open stages after acceptance.
