# Enriques roadmap package handoff

Job `PKG-EnriquesSurfacesAndIntegralNonexistence`, issue #9168, completed by
Codex (GPT-6), session `codex-qw0wbh`, on 14 October 2026. Claim confirmation:
[bot comment](https://github.com/CBirkbeck/tauceti-explorer/issues/9168#issuecomment-6161702699).
Only this job was claimed. Branch: `codex-qw0wbh-enriques-package`.

## Deliverables and scope

The package is in
[`packages/EnriquesSurfacesAndIntegralNonexistence`](../packages/EnriquesSurfacesAndIntegralNonexistence/README.md):
the complete README, a 227-line `Suggested.lean`, and `metadata.toml` with
`topic = "math.AG"`. This is a completed packaging job, not a checkpoint or
a proof of the nonexistence theorems. It still requires independent package
review. No packet, old reader, old suggested file, registry, or upstream file
was changed.

The accepted packet, reviewed on 11 October by session `codex-ZNqdCO`, was the
mathematical source of truth. The older reader has the stale blanket
hypotheses identified in
[the independent design review](../reviews/REV-DESIGN-EnriquesSurfacesAndIntegralNonexistence.md).
The new package incorporates the corrected hypotheses and all eleven added
targets directly, without changing that out-of-scope reader. Upstream style
was checked against the complete current AlgebraicVectorBundles and
JacobianChallenge READMEs and their suggested-file interfaces.

All 112 target nodes survive as mathematical subsections, with their sources,
prerequisites and proof outlines. All 80 API entries are represented by 79
distinct names: the two `EnriquesFamily.iso` entries describe the same
isomorphism-transport interface and are combined, including composition and
base change. All 56 named test specifications survive, with additional native
lattice checks and worked examples. Every one of the seventeen
definition/construction nodes has at least three discriminating Checks.

| Accepted layer | README subsections | Targets |
| --- | --- | ---: |
| E0 | 0.1–0.4 | 4 |
| E1 | 1.1–1.26 | 26 |
| E2 | 2.1–2.20 | 20 |
| E3 | 3.1–3.13 | 13 |
| E4 | 4.1–4.11 | 11 |
| E5 | 5.1–5.15 | 15 |
| E6 | 6.1–6.12 | 12 |
| E7 | 7.1–7.4 | 4 |
| E8 | 8.1–8.7 | 7 |

Each layer ends with worked examples and dependencies. Explicit anchors
resolve all local links. The fourteen elliptic candidates, four quasielliptic
triples and conditional eight-case residual list are displayed in full.
The sparse matrix specifications give every entry, their basis orders and
their conversion to zero-based Lean indices. The README and Lean contain no
packet IDs or workflow narrative.

## Current upstream and pinned-library audit

Current upstream was read without modification at TauCetiRoadmap commit
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti was inspected at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The reviewed library coverage was
also read. Searches used the mathematical objects as well as their names.
No complete Enriques, conductrix, quasielliptic, or surface-Picard interface
was found. No new target duplicates an existing general library object.

- IntegralLattices completed Layers 1–5 own the lattice, discriminant and
  overlattice machinery; current Layer 6A owns indefinite even-unimodular
  uniqueness. The package imports that classification contract and retains
  only the geometric Num comparison and the two concrete matrices. It does
  not introduce another classifier. The exact Layer 6A import still needs
  atlas registration by its owner.
- AlgebraicVectorBundles supplies tensor operations and relative Spec.
  Current `LineBundleClass`,
  `Scheme.CartierDivisor.toLineBundleClassHom`,
  `LineBundleClass.eulerDegreeHom`, `LineBundleClass.picZero`, and
  `rigidifiedPicardFunctor` are named as reusable underlying objects in
  Scope and ownership. The surface and unpointed adapters state what is
  additional; they do not redefine those groups or degree maps. Their
  presence in the newer library is not asserted at the older Lean pin.
- JacobianChallenge Layer D v1 is for smooth pointed curves, and Layer E
  for abelian varieties. The generic Enriques curve can be unpointed or
  regular and nonsmooth. The package preserves that genus-one extension
  boundary and the separate general surface-Picard extension.
- LocalFieldsRamification Layers 1–2 supply local power classes and
  unramified extensions. Only the explicit global-to-dyadic twist adapter
  belongs here. The four global classes come from the units of
  `Z[1/2]`, not from local-field classification.

The ten baseline declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`:

| Declaration | Module | Constraint retained |
| --- | --- | --- |
| `Pi.basisFun` | Mathlib/LinearAlgebra/StdBasis | Finite coordinate basis |
| `bijective_algebraMap_int_of_finite_of_unramified` | Mathlib/NumberTheory/NumberField/ExistsRamified | Finite unramified faithful integer algebra which is a domain; decomposition adapter required |
| `hensels_lemma` | Mathlib/NumberTheory/Padics/Hensel | Strict derivative-norm inequality |
| `TauCeti.IntegralLattice` | TauCeti/LinearAlgebra/IntegralLattice/Basic | Native full integral carrier with symmetric form |
| `IntegralLattice.ofGramMatrix` | Same | Symmetric integer matrix; permits degeneracy |
| `IntegralLattice.integralForm_ofGramMatrix_apply` | Same | Native carrier-basis pairing |
| `IntegralLattice.hyperbolicPlane` | IntegralLattice/Examples | Zero diagonal and off-diagonal one |
| `IntegralLattice.d8PlusLattice` | IntegralLattice/RootLattice/D8Plus/Basic | Positive E8 model; negate the form here |
| `IntegralLattice.discriminantQuadraticMap` | IntegralLattice/Discriminant/Quadratic | Even lattice, half-norm in Q/Z |
| `IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup` | IntegralLattice/Overlattice/Isotropic | Quadratic-isotropic subgroups, not merely bilinear-isotropic ones |

Short module names in the last four rows are relative to
`TauCeti/LinearAlgebra/`.

## Sources checked and reading limits

Sources were read from the precise public author versions linked in the
README. Their SHA-256 values match the accepted packet:

| Source | SHA-256 |
| --- | --- |
| SCH23 author revision 19 July 2022 | `828efee55d68b29b5c1617872cc97955bb22374500de721cddd24a7b3c1ed191` |
| ESB21, arXiv:math/0405510v2 | `286a66bd91e12053a50d562100c7dcd635a4f3ac103e95a80c1d416934fb3cf3` |
| DI21 author manuscript 4 January 2021 | `806acbf84c48c72ca5a62550cae5033928d44f669dfa870d905c0c7e3edd627a` |
| MMV22, arXiv:2201.05481v1 | `d1eddae313c18886ecea690875841e844781a221aad4fe89e9c737658caa0e46` |
| Fontaine preprint 91-02 | `3a0d2b7a95db090438b43a86040d92b748e351a6461257dd083151864f33dc67` |

The SCH23 target passages throughout §§1–15 were checked, particularly
Propositions 5.4–5.5, §§7–11, the two matrices and §12 incidence branches,
§13 and Proposition 14.1. ESB21 checks included the conductrix setup,
Proposition 2.8(6), Proposition 3.16, Theorem 4.2 and Corollary 4.3.
DI21 checks included Proposition 3.3, Corollary 3.4, Proposition 4.2,
Theorem 4.3, Theorem 6.1, Proposition 7.1 and Theorem 7.2 at the manuscript
pages given in the README. MMV22 checks included Theorem 1.2, Remark 1.5,
and Lemmas 2.1–2.4. The older foundational proofs these papers quote were
not thereby acquired.

Fontaine's scan was inspected visually at Theorem 1 and Remark (a), printed
p. 3, PDF p. 4. Its hypothesis is proper smooth scheme models at every
prime; the stronger projective local models in this roadmap suffice.
The full Fontaine proof was not read. Stacks Tags 0D24, 0D3D, 0EMV and
0H74 were opened and their actual statements read; their section numbers
are those of 14 October 2026. In particular 0D3D gives openness of relative
ampleness; the projective-scheme conclusion additionally uses properness
and an ample line bundle.

Everything committed is stated in our own words with numbered locators.
No source passages, PDFs, extracted texts or uncleared books are committed.
The cleared-library index was checked; no unauthorized CD89, CDL or Lang
copy was read. Full foundational proof acquisition remains open.

## Mathematical checks and clarifications

| Statements checked | Instances and result |
| --- | --- |
| Enriques and family domains | Arbitrary field versus geometric field; algebraic space versus scheme; no Enriques hypothesis inside its own definition |
| Numerical versus full Picard constancy | Finite-field count uses constant Num; doubled numerical divisor descent and finite-field Brauer vanishing avoid using later full-Picard constancy |
| Picard/cover duality | Ordinary P=mu2 gives G=Z/2; classical swaps them; alpha2 is self-dual. Connected rank-two schemes have length two, not two geometric points |
| Descent obstruction | A section splits the Picard lifting obstruction locally; arbitrary-affine descent retains the full cohomological H2(Gm) hypothesis |
| Half-fibre normalization | F.F'=1 gives (2F).(2F')=4; an integral two-section has R.F=1 and can have square zero |
| Dyadic representatives | Eight valuation-parity and odd-unit-residue classes; four global twists. All eight identities r(e,a,b)u(e,a)=5^b(2^a)^2 checked; x=0 excluded from square-class classification |
| Unramified model | Class five uses z^2-z-1 over Z2; the Kummer equation s^2=5 is neither the global unit torsor nor the required dyadic etale model |
| Hensel normalization | For an odd unit congruent to one mod eight, norm F(1)<=1/8<1/4=norm F'(1)^2 |
| Both Gram matrices | Exact rational Gaussian elimination gives symmetry, even diagonal, determinant -4, rank eight mod two, and inverse denominators dividing two; hence Smith factors 1^8,2,2 |
| First dual quadratic form | R* has square zero, not -2. C8*.R*=0, C8*.F*=2, R*.F*=1 and (C8*+nR*+F*)^2=2n, tested at n=0,1,2,7 |
| Native discriminant convention | Full norms -2 and -1 give half-norm classes zero and 1/2. Four nonzero isotropic incidence supports are {0,7},{0,8},{1,7},{1,8} for both models |
| I4* incidence enumeration | All nonnegative weighted-sum-two vectors: 15 vectors and six orbits of sizes 1,2,2,2,4,4 under the stated affine D8 generators |
| III* incidence enumeration | Six vectors and four orbits of sizes 1,1,2,2 under the stated reversal |
| Point counts | q=2 gives 25; q=4 gives 57; the displayed rational-fibre count examples sum to 25 |
| Graph descent | A graph recording total intersections does not identify individual conjugate nodes, so its descent does not silently split nonsplit I1 or I2 |
| Classification dependency | All fourteen elliptic candidates retained. Both completeness and three additional exclusions precede every residual-table use. Model equations alone prove neither |
| IV* exclusion | The E4 other half-fibre is smooth ordinary, so the printed four-point argument for a III/IV other half-fibre is not extended to it |
| Noncircular ten-curve order | First exclusion, independent opposite-tip lemma, second exclusion, then no I4*. The {1,8} case is an unmarked original-graph relabeling, not a symmetry fixing F' |
| Generic Picard quotient | Classicality stated; the order-two Pic0 quotient is separated from the infinite degree summand |
| Characteristic-independent endpoint | General partner exception handled before Proposition 14.1; no characteristic-two-only result invoked over every field |
| Tangent cohomology | (0,10,0) and (1,12,1) both have Euler characteristic -10; DI21's printed +10 is not used |
| Lifting branches | Supersingular alpha2 obstruction separate from the exceptional classical differential criterion, which requires canonical bundle of exact order two |
| Deformation flatness | Nonlifting plus one obstruction gives regularity; W-flatness also requires the characteristic-zero formal-lifting assertion, equivalently the extra condition of DI21 Corollary 3.4. It is not inferred from dimensions alone |
| Integral endpoint | Z/4 base change to W2 of the algebraic closure uses the nilpotent scheme-thickening theorem; finite-field contradiction still has both classification prerequisites |

These are author-side checks, not an independent review and not proofs of
geometric realizability. The reproducible finite-computation method is:
parse the two integer matrices, use exact rational row elimination, reduce
modulo two for rank, enumerate entries in {0,1,2} with weighted sum two,
take graph-permutation orbits, and apply the inverse matrices to test native
half-norm modulo Z. No exhaustive rational-elliptic classification search
was performed.

## Remaining proof and supplier obligations

The accepted plan has nine planned layers and zero closed layers. Its
thirteen gaps remain; package completeness does not close any of them.
The independent reviewer should start with the Exact supplier contracts
and README 5.7, 5.14, 6.4–6.10 and 8.1–8.7.

1. Prove fourteen-case rational-Jacobian exhaustiveness, the separate
   `/247` obligation. SCH23's printed list does not prove the strengthened
   classification.
2. Prove `/246`: exclude I2*+E4+nonsplit-I2,
   I3*+E4+nonsplit-I1 and IV*+E4+nonsplit-I2 as Enriques
   configurations, with additive and E4 fibres multiple. Both endpoints
   remain conditional on this and item 1.
3. Acquire or independently prove the narrowed coset-preserving
   degree-two reducibility theorem used in 1.26 and Layer 6. No universal
   Lang theorem for every degree-two class is claimed.
4. Acquire the authorized general half-fibre partner proof quoted by
   MMV22, retaining its characteristic-independent domain and affine-E8
   exception.
5. Supply the underlying foliation, conductrix, differential sequence and
   exceptional-classification proofs; a Boolean exceptionality flag is
   not an implementation.
6. Supply native geometric Enriques/Betti/Picard/intersection signatures.
   The geometry is README-only until those carriers and interfaces exist.
7. Register concrete layers for NumericalPicardAndContractionDescent,
   including the correct local section-based projectivity theorem.
8. Register the genus-one supplier and its unpointed/quasielliptic,
   local-comparison, vertical-kernel and classification extensions.
9. Supply the shared K3 predicate and the general Fontaine proof through
   their proposed owners, with scheme local-model hypotheses.
10. Supply SF.4 deformation/de Rham criteria, R07.1 finite-flat
    nonlifting and A0 surface-Picard flatness, including the extra
    W-flatness justification in 8.4.
11. Acquire foundational proofs for Pic^tau length, Num perfectness,
    nef reduction, primitive-nef pencils, integral two-sections and
    ordinary/supersingular vector fields. These remain local geometric
    targets, separate from items 3 and 4.
12. Register the exact current IntegralLattices Layer 6A import rather
    than replanning it.
13. Assign the proper-flat surface Picard representability/base-change
    extension within the A0 direction; pointed-curve and abelian
    constructors alone do not supply it.

The proposed numerical-Picard, genus-one, K3 and Fontaine owners have no
registered layer IDs in this snapshot. The package specifies their exact
contracts instead of inventing IDs or citing an unrelated higher layer.
The maintainer must register and tier those suppliers and the A0 extension
before porting this roadmap upstream. This job was not authorized to edit
registries or other roadmaps. No new ownership move is proposed beyond the
accepted design's boundaries.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/EnriquesSurfacesAndIntegralNonexistence.json`:
  exit 0, zero errors and zero warnings, 112 nodes, 80 API entries, 56
  tests, thirteen gaps, all nine layers planned.
- `lean-check research/blueprint/packages/EnriquesSurfacesAndIntegralNonexistence/Suggested.lean`:
  exit 0 against the pinned shared build; seventeen warnings, all
  `declaration uses sorry`, and no errors or other warnings. Available
  memory was over 100 GiB. No build/update/cache operation or language
  server was started.
- The final Lean file has six real definitions, fifteen theorem
  signatures and fourteen examples. The native Gram constructors prove
  symmetry directly, so no data body depends on a placeholder theorem.
  Twelve examples have real proofs; the two half-norm examples and all
  fifteen future theorems use the permitted proof placeholders. The
  closing comment names every geometric definition absent from Lean.
- Author-side inventory and arithmetic checks passed: 112 unique target
  sections; all API and test names; nine Examples/Dependencies pairs;
  all local anchors; both matrices, discriminants, incidence counts,
  twist identities, point-count examples and tangent Euler signs.

- `python3 research/blueprint/intake.py check-files` on the four authorized
  deliverables: exit 0, four files and zero problems.
- `git diff --cached --check`: clean. Only the four authorized deliverables
  are staged.

Scratch downloads, scripts and compile logs are removed after the pull
request opens; the methods and results needed by the next worker are
recorded here.
