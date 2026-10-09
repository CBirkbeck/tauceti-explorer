# Handoff: PKG-AutomorphicBundles — issue #7457

Worker: Codex, session `codex-zCUwaj`, 9 October 2026. Branch:
`codex-zCUwaj-automorphic-bundles`. The claim was confirmed by the bot in
[comment 6072502888](https://github.com/CBirkbeck/tauceti-explorer/issues/7457#issuecomment-6072502888).
This is a completed package submission, not a checkpoint. No second job was
claimed.

## Deliverables

- `research/blueprint/packages/AutomorphicBundles/README.md`: the roadmap in
  upstream form, approximately 165 KB. It includes all 96 accepted targets,
  all 154 API items and all 102 test specifications, with hypotheses, source
  locators and prerequisites. The nine layers follow dependency order:
  B0, B1, B1.general, B2, B2.general, B3, B3.general, B4, B5.
- `research/blueprint/packages/AutomorphicBundles/Suggested.lean`: one import
  block, one standard note and root namespace `AutomorphicBundles`, retaining
  the assembly's executable prototypes and replacing its long inventories
  with a compact inventory of mathematical contracts and every proposed
  declaration/API/test name.
- `research/blueprint/packages/AutomorphicBundles/metadata.toml`:
  `topic = "math.NT"`.
- This handoff note.

The source of truth was the two accepted packets,
`AutomorphicBundles--B0.json` and `AutomorphicBundles--B5.json`, and the joined
reader, suggested file and `ASM-AutomorphicBundles.md`. No packet, assembly
file, atlas data or neighbouring roadmap was changed. The two upstream
READMEs read in full for style were ClassicalGroups and AdicSpaces, using
their copies under `content/tau-ceti/`. The reviewed library audit and the
LieGroups link map were also read, and the 42 recorded baseline entries
were checked against declaration statements at the pins.

The README rewrites target statements in our own words. It contains no source
passages, extraction ledger or programme status. The assembly's 150 source
passages were excluded. The larger plan's proof routes are represented by
precise mathematical supplier contracts, particularly for integral
coefficients, formal charts and geometric component detection. The scope
preserves each source's model, field, level and coefficient restrictions.

## Validation

- `python3 scripts/check_blueprint.py` on each of the two unchanged packets,
  with the pinned declaration index: 0 errors and 0 warnings. Counts were
  68/128/84 targets/API/tests for B0 and 28/26/18 for B5.
- A scripted agreement check found every target title and every API/test
  name in the README, and every proposed library/API/test name in the Lean
  file. It also checked the 200 KB limit, parsed the TOML, and found no
  retained source passage of eight or more words from the extraction fields.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  4 files, 0 problems.
- `git diff --check`: clean.
- `lean-check research/blueprint/packages/AutomorphicBundles/Suggested.lean`:
  exit 0, no errors, exactly 62 warnings, all `declaration uses 'sorry'`.
  Available memory was checked before the single compilation; it completed
  within the wrapper's time limit and left no compilation running.

**Compile scope.** The shared build has Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. It lacks compiled objects for
the assembly's three unused Tau Ceti imports:
`TauCeti.NumberTheory.ModularForms.HeckeSlash.Nebentypus.Prime.Basic`,
`TauCeti.NumberTheory.ModularForms.HeckeSlash.Nebentypus.Action` and
`TauCeti.AlgebraicGeometry.Modules.TensorProduct`. Their three `#check`s
and imports remain commented together, with an explanation in the header.
The corresponding declaration statements were read at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`; no Tau Ceti build was attempted.
Thus this is a successful Mathlib-only elaboration, not a successful full
Tau Ceti import check.

The active code covers functional cocycles, the SlashAction adapter, integer
Hilbert weights, supplied scheme-module sections and maps, and algebraic
shadows of the expansion argument using existing exactness, prime-filtration,
completion, power-series and trace APIs. It does not construct the actual
Shimura varieties or their canonical coefficients. The geometric contracts
and their API/test names remain comments where the supplier carriers cannot
yet be stated, following PROTOCOL §13; no opaque `Prop` carrier was invented.
The compile does not certify these commented geometric signatures or any
proof admitted with `sorry`.

## Inherited plan issues preserved for review

1. **Integral B2–B4 interfaces are incomplete.** The assembly identifies
   R1/R2/R5/R6, used by nine B5 nodes, without corresponding complete target
   nodes in the earlier field-based layers. R1 is the actual integral
   section functor with arbitrary module coefficients inside the sheaf,
   cuspidal versions, functoriality and qcqs colimits. R2 is coefficient-
   sensitive fan/Hecke comparison and reduced-boundary transport. R5 is
   finite-projective integral Levi coefficients, their canonical and
   subcanonical extensions, Hecke cocycle and boundary bundle. R6 is the
   ramified Hilbert splitting-model line for Diamond's general integer
   pairs `(k,m)` over Noetherian coefficient algebras. The README gives
   these as model-specific prerequisites under B5, rather than deriving
   them from the field construction. A planning job owning B2–B4 must
   resolve the missing nodes; packaging does not close this gap.
2. **Cross-part citations and duplicate ownership.** B5's 35 citations to
   its own earlier stages have 19 fully answered occurrences and 16
   integral residuals. The README expands the node references using the
   assembly's proposed patch and retains the residual contracts. The
   classical VB normalization belongs to B4; B5 imports it and adds its
   cohomological, subcanonical, level and Hecke compatibilities. The B0
   request for both BCGP Theorem 4.8.2 displays is answered by the two B5
   comparison targets. The packets still need the assembly's listed edits.
3. **Names and source identity.** The package uses
   `TauCeti/Geometry/Shimura/AutomorphicBundles/` and root namespace
   `AutomorphicBundles`, reconciling the packets' two module roots. Milne
   `MILNE-2018` is the canonical-models notes `AA.pdf`, the same source as
   B0's `milne`; its B5 title incorrectly names the separate 1988 connected
   bundles paper. The package bibliography corrects that title and retains
   the 1988 paper separately.
4. **Supplier proofs are still prerequisites.** The accepted packets retain
   24 gaps, 50 requests and 14 source issues. These concern algebraic torsors,
   absolute Hodge/CM foundations, jet and principal descent, realizations,
   boundary normalization, non-neat descent, integral component detection,
   completed traces and classical comparison carriers/proofs. Their
   substantive mathematical requirements appear in the README's supplier
   contracts. The package asserts neither dependency closure nor
   formalisation of these foundations.
5. **Formal and boundary distinctions.** A face-open immersion does not
   produce an arbitrary map between stratum completions. The package uses
   the common boundary completion and degree maps. Its affine illustration
   compares `k[[x,y]]` with `k[y,y⁻¹][[x]]`, using the unit obstruction for
   `1−y`. Finite-thickening base change precedes taking inverse limits;
   tensor is not commuted with arbitrary limits. Prime-reduction detection
   is fibrewise; non-neat coverage is an extra argument. Early C5 toroidal
   charts are distinguished from the minimal factorization that consumes
   B5's constant-term theorem, preventing a circular dependency.
6. **Endpoints beyond this accepted plan.** Multiplicativity of Siegel
   Fourier–Jacobi expansions and their analytic Fourier-series comparison
   are unresolved consumer interfaces. Hilbert expansions for analytic
   p-level families belong to the overconvergent consumer, beyond the
   classical prime-to-p Hilbert theorem. Neither endpoint is claimed here.

## Source checks in this run

The packaging source checks concentrated on the statements whose restrictions
control the joined document: Milne III, V §6 and VII (including the fact that
VII 4.1 is a conjecture); Lan 7.1.1–7.1.2; the Higher Koecher boundary
coefficient comparison; Diamond's ramified cusp detection and normalized
Hecke formula; and the two BCGP Siegel decompositions. These checks do not
claim a fresh reading of every proof leaf in the accepted plans.

Fresh public downloads on 9 October 2026 reproduced these source hashes:

| Source | SHA-256 |
|---|---|
| [Lan's 14 March 2021 revision](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf) | `a7a454f5d0735f4bf11f00a8afc14c361c5fc2cefd691d7466f7620ab4c3a079` |
| [Lan, Higher Koecher preprint](https://www.kwlan.org/articles/Koecher.pdf) | `5916b37f2e350a55947cf97ac0c6640086088e7d9617267655081a3369f58f0a` |
| [Diamond, arXiv:2211.06922v1](https://arxiv.org/pdf/2211.06922v1) | `672b6b4bc3bedb9081dbad088829cba95754e2461dcbb22a1a0453cf0585b24c` |
| [BCGP, arXiv:2502.20645v1](https://arxiv.org/pdf/2502.20645v1) | `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c` |

Lan Proposition 5.6 uses preprint pp.11–13, not journal pp.163–199; its
boundary filtration need not descend to the stabilizer quotient. Diamond
Proposition 6.2.1 (p.25) retains the determinant-component and coefficient-
subalgebra hypotheses and excludes the general Iwahori special-fibre
extension. Proposition 6.5.1 (pp.28–29) retains the normalized central
correspondence `S_v`. BCGP Theorem 4.8.2 (pp.101–102) retains all four weights,
parity, shifts, Tate twists and the reduced-boundary twist in every
compact-support summand.

The private-library index was respected. Faltings–Chai was not cleared and
was not read. The Siegel target cites BCGP's displayed theorem and its
attribution to Faltings–Chai Theorem 6.2, with the underlying logarithmic,
dual BGG and degeneration/duality inputs explicitly required. No independent
verification of that restricted proof is claimed. No private source file
or passage was copied.

## Where to resume

No packaging deliverable remains. Independent review should compare the
README and Lean inventory against both packets, repeat the allowed compile,
and assess the inherited integral and supplier issues above. A full import
check can restore the three imports and corresponding `#check`s together
when compiled Tau Ceti objects at the pin are supplied; no geometry is added
by that restoration. The assembly handoff contains the exact packet patch
for the owning follow-up job. All continuing-worker information is here or
in the committed input files; scratch source downloads and logs are disposable.
