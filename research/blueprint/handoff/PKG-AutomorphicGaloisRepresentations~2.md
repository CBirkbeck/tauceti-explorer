# PKG-AutomorphicGaloisRepresentations~2 — checkpoint

Issue #7891; Codex (GPT-6), session `codex-68SmfT`; 10 October 2026.
Branch `codex-68SmfT-7891`. **Partial, blocked on faithful supplier interfaces;
not a completed package.** No second job was claimed.

## What this checkpoint changes

The independent package review remains binding and `review.json` is unchanged.
The accepted packet, reader input and original suggested file are unchanged.

1. `ordinaryLatticePlus_saturated` now states the promised integral quotient
   result, rather than only scalar cancellation. Its hypotheses specify a DVR
   O with fraction field K, a finite-dimensional K-space V of dimension two,
   a finitely generated O-submodule T spanning V, and a K-line Vplus. Its
   conclusion asserts torsion-freeness, freeness and O-rank one of T/Tplus.
   `ordinaryLatticePlusIn` puts the intersection inside T, and
   `ordinaryLatticeQuotient` is Mathlib's actual quotient module. The previous
   proved scalar-cancellation result is retained as `ordinaryLatticePlus_cancel`.
   Membership and stability are proved directly; the torsion-free quotient and
   generic-fibre span statements have genuine signatures with `sorry` proofs.
2. The saturation test uses the coordinate lattice in K² and the first
   coordinate line, then compares O²/Oe₁ with O²/cOe₁ for a nonzero nonunit c.
   The latter has a specified nonzero class killed by c. Zero lattice, zero
   ordinary subspace and full ordinary subspace give separate degenerate tests.
   The test fixtures are private definitions with explicit linear-map bodies.
3. Actual p-adic tests assert the unique unit root of X²+X+3 in Z₃, the absence
   of a unit root of X²+2X+2 in Z₂, and that the trace −1 is not the Z₃ root.
   These are the root portions of the ordinary-refinement tests. They do not
   construct the Galois quotient character or period comparison.
4. `exists_faithful_lift_of_not_dvd_card` is proved from the existing proposed
   finite lifting theorem: equality after reduction and residual injectivity
   imply injectivity of the lift. The lifting theorem itself still has a
   `sorry` proof. The negative test now states existence of order-five elements
   in GL₂(F₅) and absence in GL₂(Z₅), instead of merely the inequality 2<5−1.
5. Finite Scholl averaging gains naturality under a specified intertwining
   linear map and commutation with an endomorphism commuting with every group
   element. Tests evaluate the actual averaging operator on the two-element
   trivial action and distinguish signed from unsigned averaging on the
   two-point permutation representation. These do not claim the geometric
   Künneth, parabolic, Hecke or fine-level identifications.
6. The README gives the precise lattice contracts and finite-projector API.
   References to proposed IHG.1/IHG.4 are replaced by the existing Tau Ceti
   IntegralHeckeAndGaloisDeterminants roadmap, layers 1 and 4 and §1.3. Its
   determinant definition/reconstruction is not replanned here.

`metadata.toml` is deliberately removed. Intake currently treats a package as
complete when all its output paths exist, including the handoff. Keeping the
old metadata while adding this handoff would incorrectly finish revision 2.
Restore exactly `topic = "math.NT"` only after the complete correspondence gate
is met. This deletion records a checkpoint; it does not change the topic.

## Why the job cannot yet be completed within its authorized files

This is a missing-definition/interface problem, not a demand that supplier
proofs be implemented before writing a roadmap. The review requires active,
faithful statements of all targets, APIs and tests. The accepted plan permits
exact supplier requests, but several requested supplier objects have no
faithful exported Lean carrier at the pins. Inventing substitutes or importing
unqualified algebraic shadows would reproduce the review failure.

| Concrete evidence | Consequence for this package |
| --- | --- |
| `research/blueprint/suggested/ModularCurvesPartII--R14.3.lean`, lines 34–45: modular quotient, H¹, its Hecke action and Eichler–Shimura signatures are schematic text inside a block comment. The current upstream ModularCurves suggested file has genuine scheme/moduli interfaces but does not supply these higher-coefficient parabolic realizations. | R19.1 coefficient Eichler–Shimura, parabolic premotive, integral/rank-two newform realization and R19.6 full weight-two cohomological Hecke module cannot be instantiated from this file. The analytic newform API alone does not provide them. |
| `research/blueprint/suggested/GeneralizedHeegnerCycles.lean`, lines 39–47 and the declarations `epsX_middle` (line 260), `projectedHodgeFiltration` (line 270): D/Coh/Chow are supplied module parameters, with the geometric hypotheses explicitly omitted. For example the filtration statement is about an arbitrary supplied filtration. | This is not the GH.0 geometric cohomology/realization carrier needed for the Scholl parabolic comparison and newform coefficient descent. Reusing these fragments as unconditional geometric theorems would change their meaning. |
| `research/blueprint/suggested/PotentialModularityAndCompatibleSystems.lean`, lines 66–82: family structures explicitly omit unramified/Frobenius, Weil–Deligne and labelled p-adic Hodge conditions. | They do not supply the full strict compatible-system carrier required in R19.3, or the member/local-parameter tests that must detect nonzero Steinberg monodromy. |
| `research/blueprint/suggested/OrdinaryAutomorphicFormsAndModularityLifting.lean`: lines 66–105 are comment-only ordinary forms/Hecke interfaces; the active R21.3 examples are matrix and normalization calculations. | The arithmetic ordinary character/filtration contract and the coefficient/period comparison remain unstated here. The completed lattice algebra must not be advertised as `ordinaryRefinement`. |

Current Tau Ceti was searched as well as the reviewed R19.1–R19.6 library audit.
It has analytic eigenforms/newforms, continuous representation infrastructure,
Hodge structures and discrete integral Galois lattices. In particular
`TauCeti/RepresentationTheory/GaloisLattice/Basic.lean` defines finite free
**Z**-modules with open vector stabilizers; it is not the continuous Oλ-lattice
and period realization required here. No faithful parabolic premotive,
Weil–Deligne or Wach realization export was found. This is a bounded interface
search, not a claim that all current library mathematics was exhaustively read.

The read-only upstream snapshot checked was
`37769f03c170a7bc3e1082df70522a0ad59c5ffd`; current Tau Ceti was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches included the newer roadmap
families named in WORKERS, with direct inspection of LocalGaloisGroups'
cyclotomic interface. Existing local cyclotomic/class-field material must be
imported, not redefined. IntegralHeckeAndGaloisDeterminants already defines
`Determinant` on a genuine polynomial law and has reconstruction/interpolation
signatures. Its suggested file also imports another upstream suggested module;
that is not an installed native export at the package's pinned build. The
remaining geometric Hecke specialization cannot be filled by copying that
owner's definitions or by replacing the whole law with its values at fields.

## What remains and how to resume

The review's target/API and test tables remain the worklist for full completion.
After stripping nested comments, this file has 16 definitions/abbreviations
(including two private fixtures), 18 named theorem commands and 66 examples.
Only 10 of the accepted plan's 90 API names are active, as before; the saturation
API now has its full quotient contract. The added algebraic API has distinct
names. **The count of examples is not coverage of the 66 planned tests.** Most
of the 51 theorem/lemma targets still lack their full signatures. No inventory
entry is counted as elaborated Lean.

Unblocking needs faithful exports from the named owners, or an explicit
maintainer decision about how package signatures consume unimplemented supplier
interfaces without duplicating their definitions. Do not silently relax the
package review's gate, create `Prop` stand-ins, omit essential hypotheses from
arbitrary maps, or plan a second cohomology/WD/determinant theory here.

Then proceed in this order:

1. Establish the actual R14/GH parabolic/coefficient realization objects and
   morphisms. Use them for the R19.1 premotive, integral module, Scholl image and
   rational orbit factor. Instantiate Hecke/fine-level maps in the finite
   naturality lemmas, and add geometric fibre and orbit-versus-embedding tests.
2. Establish the Hilbert eigenform/cohomology and local WD/period interfaces.
   State Carayol, the unrestricted constructor, its normalization/uniqueness,
   and full local compatibility. Preserve N through Frobenius semisimplification.
3. Use the actual strict-family carrier for R19.3 and ordinary/period/Wach
   carriers for R19.5. Complete character, coefficient-change and period tests;
   the root and saturated-lattice algebra in this checkpoint is reusable.
4. Import upstream whole-ring determinant/reconstruction interfaces for R19.6.
   Supply the actual faithful generic cohomology module and nilpotent quotient
   specialization, then the local-condition factorization. Field points do not
   discharge this work.
5. Recheck the review's full 66-target/90-API/66-test correspondence, elaborate,
   and restore metadata only upon completion. Leave the existing independent
   `review.json` for the next reviewer to replace.

The accepted packet's 12 gaps and 51 requests were not edited or claimed closed.
A bookkeeping follow-up should update its IHG references to the current upstream
owner; this job is forbidden to edit the packet.

## Sources and validation

Fresh source readings were limited to the changed mathematical interfaces:

- Deligne–Serre, *Formes modulaires de poids 1*, published Numdam scan,
  §8.6, printed p.526, for finite prime-to-characteristic lifting and the
  isomorphic finite image. SHA-256
  `65b390f6d33e827e30c6c66bbc15421eca51db3180bdf5996dcee19047be97fc`.
- Skinner–Wiles, *Residually reducible representations and modular forms*,
  Numdam scan, §3.3, equation (3.2), printed pp.38–39, for the arithmetic
  ordinary quotient convention. SHA-256
  `ec0697b3e9c9fa68063b19688f10347d204a8b7b86526384c9ccd6e7fe30e6f3`.
- Diamond–Flach–Guo, arXiv 2512.02348v2, §5.4, Lemma 5.7, pp.58–59,
  for the rank-two realization and pairing underlying the chosen lattice.
  SHA-256 `0f4984acdabd2efd542aae932850da83c36ec023185a47f40c8ef5813bd21898`.
  The elementary quotient assertions are derived lattice algebra, not a claim
  that this lemma states every new lattice signature.

The rest of the source evidence is inherited from the accepted plan and package
review; no fresh reading of all sources is claimed. No private-library source
was needed. No source passage or source file is committed.

Two current upstream README examples were read in full: ArithmeticDirichletSeries
and Chebotarev. Relevant determinant layers and suggested definitions were also
read. All 13 baseline declarations were reread using the exact Mathlib/Tau Ceti
pins, including their hypotheses.

- Packet checker: 0 errors, 0 warnings; 66 nodes, 90 APIs, 66 tests, 27 planets.
- Final `lean-check research/blueprint/packages/AutomorphicGaloisRepresentations/Suggested.lean`:
  exit 0, 46 warnings, all `declaration uses sorry`; no errors or other warnings.
  The file imports individual Mathlib modules only. Mathlib's build commit is
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. This does not claim compilation of
  Tau Ceti imports at `f790474821cf4256814db967cb154e7af3d0c369`; its cited Landau
  statement was read at that exact commit. Memory exceeded 20 GB; only one
  `lean-check` ran at a time. No build/update/cache or language-server process
  was started, and no Lean process is left running.
- README: 145,211 bytes, all mathematical target sections retained. No process
  history added to the roadmap; no source excerpts or private paths.
- `git diff --check`: pass. Intake file validation is recorded in the PR.

All information needed to resume is here and in the retained package/review.
Disposable scratch files are not inputs to the next worker.
