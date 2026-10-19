# Handoff: genus-two algebraic modular forms

Issue: #3450. Worker: Codex, session `codex-bAlzXx`.
Job: `DESIGN-AlgebraicModularFormsAndSerreWeightsPartII`.

This is a completed target-level planning pass under PROTOCOL §0, ready for
independent review. It is not a closed roadmap or an implementation. The packet
has status `complete`; every node has implementation status `unchecked`.

## Deliverables and coverage

The roadmap definition, packet, reader and suggested file use the assigned id
`AlgebraicModularFormsAndSerreWeightsPartII`. The reader is the full mathematical
specification: hypotheses, conventions, proof routes, APIs, discriminating checks,
source locators, exact imports and unresolved obligations. It contains no source
passages or Lean code. The suggested file follows the WORKERS shape rule of
2026-10-12: only light definitions on existing carriers and statements expressible
at the pins. It does not invent geometric placeholder carriers.

There are 48 nodes: seven definitions, eighteen constructions, twenty-two
theorems and one comparison. Their outlines contain 127 API items, 76
discriminating checks and 41 planets. The packet has five baseline declaration
citations, nine supplier requests, six mathematical verification gaps and ten
source findings scoped to the versions actually read.

| Layer | Targets | Planets | Coverage | Remaining input |
| --- | ---: | ---: | --- | --- |
| S1: integral forms and expansions | 4 | 4 | closed | None at this planning granularity |
| S2: rank strata and primary Hasse geometry | 4 | 3 | planned | R1–R2, G1 |
| S3: secondary Hasse geometry | 8 | 6 | planned | G1–G2 |
| S4: lifts, weight shifts and affine cover | 4 | 4 | planned | R3, G3 |
| S5: coefficient Hecke operators | 7 | 6 | planned | R4, G4 |
| S6: binary quadratic neighbors | 3 | 2 | planned | G6 |
| S7: integral geometric Hecke actions | 7 | 6 | planned | R1, R4–R6, G1 |
| S8: characteristic-p theta | 7 | 6 | planned | R7–R8, G2 |
| S9: ordinary functions and comparison | 4 | 4 | planned | R9, G5 |

Each open layer's `remaining` list spells out these obligations. Coverage
`closed` for S1 means its planning chains end in the recorded imports, not that
the imported theories are implemented.

## Ownership and routing

The parent ends at R15.6 and has no genus-two layer. The two genus-two briefs
are merged here. The packet has one `sourceRouting` row for every assigned
item: exactly 51 from CG20 and 32 from Pilloni20, each pointing to a target.
The alias `SiegelModularFormsModPn` is proposed for merger into this assigned id.

The independent GL₃ direction is a split proposal, not covered mathematics.
Its authoritative 165-item brief is preserved by reference to
`research/blueprint/papers/PAPER-LE-LEHUNG-LEVIN-ETAL-20.result.json`, the
`routes` entry whose `roadmap` is `GenericGL3SerreWeightsAndLattices`.
The maintainer should create its separate design job and reconcile the later
LLHLM23 direction there. No second job was claimed.

Existing C14 models, bundles and correspondences, R07 BT₁ filtration/duality,
T0 primary Hasse theory, compactification Koecher/refinement results and the
binary quadratic projective-zero theorem are exact node imports. Generic
vector-bundle theory is not replanned. The source and target statements of
those imported nodes were read before use.

The full ordinary genus-two GL₂ Igusa tower stays at T5. Its current node is
Hilbert-specific and does not supply this specialization; R9 requests it
explicitly, consistently with the existing higher-Hida request. S9 owns
function weight spaces, full-frame expansions and their degree-zero comparison.
HigherHidaAndColemanTheory retains analytic sheaves, projectors and control.
No higher-Hida theorem is used circularly as an input here.

There is no existing defined stage for the proposed
`IntegralCoherentHeckeComplexes`. S7 therefore owns the particular normalized
paramodular composite, with coherent duality requested from SF.2. The packet
proposes transferring the general formalism to that separate owner when it
exists; it cites no invented stage. Likewise, the proposed
`ShimuraVarietiesHondaTatePartII` is not treated as an available reduction theorem.

## Precise follow-up obligations

1. **G1:** Check the bridge from Dieudonné/local deformation calculations to
   the actual spherical and paramodular compactification models, including
   supersingular projective-line splitting/counts and boundary-compatible
   finite-fiber classification. Assign the missing general reduction theory
   to a real owner or prove the stated specializations here.
2. **G2:** Construct the global spherical square root of the secondary Hasse
   section with its transition functions and tame descent. Local order two
   does not supply a global root. S8's affected vanishing and injectivity
   statements explicitly require this input. No paramodular or characteristic-two
   root is asserted.
3. **G3:** Compare a power of this particular secondary section with Boxer's
   boundary-compatible generalized Hasse section on the minimal stratum.
   Equality of open loci alone does not identify their sections. S4's two-affine
   cover remains conditional on this comparison.
4. **G4:** Compute the complete remaining determinant-p² cosets defining the
   formal residual V₂ and prove its integrality, with the symmetric-power
   matrix weights and naturality for arbitrary coefficient modules retained.
   S7's torsion Q₂ has a separate integral construction and does not assume
   that torsion forms lift to integral forms.
5. **G5:** Supply the full ordinary tower's component/monodromy detection and
   compare the normalized geometric Klingen action on frame functions with
   algebraic Z₂ and the downstream analytic normalization. A formal coefficient
   operator alone is insufficient.
6. **G6:** Resolve tame-level transport between forward and reverse determinant-p
   double cosets before importing a symmetric neighbor argument downstream.
   S6 states oriented reciprocity, and symmetry under a self-dual-coset
   hypothesis. For Γ(5), p=3, Q=x², the matrix
   M=[[3,5],[30,51]] gives the neighbor 3(17x−10y)², congruent to 2x² modulo 5.
   Every second forward neighbor is congruent to 4x², so cannot be Γ(5)-equivalent
   to Q. For SL₂(Z) the forward and reverse cosets coincide. This new
   qualification is E10, scoped to CG20's author copy, and is not a claimed
   repair of a downstream packet.

The supplier requests specify polarized Serre–Tate/Grothendieck–Messing
coordinates (A4); the Hilbert total Hasse ideal comparison (H2); coherent
reduction/Serre vanishing, formal Milnor/local-cohomology/colimit comparisons,
and proper coherent duality (SF.2); rational GSp₄ Hecke actions and component
transport (B5); Gauss–Manin/Kodaira–Spencer and superspecial matrices (A4);
Krull intersection and propagation (SF.0); and the full Siegel Igusa tower (T5).
These are packet requests, not claims that the suppliers already prove them.

## Normalizations to preserve in review

Use ω(j,k)=Sym^(j−k)E⊗det(E)^k and Ω(d,r)=ω(d+r,r). Fourier coefficients keep
all components and cusp transports. The discriminant is −4 det Q. In
characteristic p, X₂ uses the Legendre symbol on primitive indices; its integral
multiplier on a nonprimitive index is p. Do not replace it by zero before
coefficient reduction.

The cancellation is
Q₂=p^(j−2)X₂+Z₂+p^(j+k−3)V₂+p^(j−1).
At (2,2) this reduces to X₂+Z₂, while at (3,3) it reduces to Z₂ and the bare
T₂ reduces to Z₂−1. Pilloni's integral paramodular composite C_r satisfies
C_r−Q₂=(1+p²)p^(j−2). This constructs torsion actions without division of a
torsion class by p. The central formula here is in the specified trivial
central/diamond sector; general component transport is retained separately.

The theta construction is characteristic-p, has no extra determinant in its
vector coefficient formula, and excludes the Hasse weight from scalar
injectivity. For ordinary weights retain upper-unipotent invariance and the
inverse-transpose frame convention. These distinctions are checked in the reader.

## Sources and library inspection

All seven sources used have public URLs, reading locators, access date
2026-10-19 and SHA-256 hashes in the packet and reader. CG20 was read in its
96-page author typeset copy (internal page n is journal page 800+n); Pilloni20
in the 113-page author version dated 17 June 2019. The published Pilloni20
revision was not collated, so findings are not attributed to that unexamined
text. Yamauchi is arXiv v5, 30 August 2016. The supporting readings are Tilouine
2006, Pilloni 2012, Koblitz 1975 and Boxer's 2015 thesis. The reader's ledger
records the actual portions read; this is target-driven reading, not a claim
to have extracted every result of these sources. No private book was used.

For the missing square-root and reduction bridges, the cited public sources
do not yet establish the exact needed comparison; these are G1–G3, rather
than an unavailable source silently assumed. Boxer's public thesis uses
Theorems 4.5.4 and 6.2.2–6.2.3, not an assumed Appendix B.2 locator.

The pinned baseline is Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. All five cited declaration statements
were read at those pins. The parent's reviewed library audit, relevant link
entries, exact supplier nodes and proposed-alias assignments were inspected.

Current read-only upstream was also checked: TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, and its Mathlib
`6b7abb3c7686292736be2955bd3eb9ebf63b456a`.
AlgebraicVectorBundles and ModularForms were read as neighboring roadmap
models, including their suggested files. Their existing generic bundle and
genus-one analytic theories are reused, not replanned. No upstream tree was
built or changed.

## Validation and next action

- The blueprint checker, including the supplied pinned declaration index,
  reports zero errors and zero warnings.
- The 143-line suggested Lean file was checked with `lean-check`; elaboration
  succeeded, with eight `sorry` warnings and no other warnings or errors.
  The sorry-data check passed. The statements remain proposed mathematics.
- Intake file validation passed for the deliverable paths, JSON and absence
  of private filesystem paths. Whitespace validation passed.
- Independent bookkeeping checks verified the internal dependency graph is
  acyclic, all 83 source-item ids occur exactly once, all routed targets exist,
  and every target statement, API and test agrees between packet and reader
  (and target statements agree with the roadmap). All seven downloaded source
  hashes matched the committed ledger.
- Exact-rational computations checked Q₂ against its original normalized
  double-coset expression and the paramodular central subtraction for p=3,5,7,
  2≤k≤6 and k≤j≤8, including the mod-p boundary weights. The concrete Γ(5)
  matrix and neighbor congruences above were checked by exact arithmetic.

The next action is independent review of this planning pass, especially G1–G6
and E10, followed by the explicit supplier and open-stage follow-ups under
PROTOCOL §0. There is no unfinished file-generation step to resume, and no
claim that the six verification gaps are closed. This is not an upstream
package job; upstream packaging must respect the supplier order.
