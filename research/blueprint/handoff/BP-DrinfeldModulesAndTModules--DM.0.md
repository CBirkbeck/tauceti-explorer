# Handoff — BP-DrinfeldModulesAndTModules--DM.0

Codex, session `codex-zJGrQH`, 11 October 2026; issue #1008. Claim
[6105412765](https://github.com/CBirkbeck/tauceti-explorer/issues/1008#issuecomment-6105412765),
confirmed by bot comment
[6105413719](https://github.com/CBirkbeck/tauceti-explorer/issues/1008#issuecomment-6105413719).
Branch `codex-zJGrQH-drinfeld-blueprint`. This completes the target-level planning pass,
continuing Claude Code's `cc-fb70e5` DM.0 checkpoint. Seven retained Drinfeld node ids
are preserved. The six inherited generic Ore/additive-polynomial nodes move to the
existing FF.4 supplier. The separate DM.8 packet is unchanged.

## Deliverables and coverage

Packet status is `complete`: all stage targets and routed items in DM.0–DM.7 are planned.
This is not mathematical closure or formal implementation. There are 75 nodes:
18 definitions, 30 constructions, 22 theorems and five comparisons; 195 API items,
151 tests, 42 planets and 21 checked baseline declarations. Every definition/construction
has its uses, API and at least three discriminating tests. All implementation statuses
remain `unchecked`.

| Stage | Nodes | Status | Contents |
|---|---:|---|---|
| DM.0 | 11 | planned | modules, rank, intertwiners, scheme kernels, relative standardization, Carlitz products |
| DM.1 | 7 | planned | ideal torsion, flat/étale realizations, Tate limits/actions, characteristic local factor |
| DM.2 | 10 | planned | infinity field, projective lattices, uniformization, Carlitz period, Omega, period power |
| DM.3 | 9 | planned | levels, stack/fine moduli, generalized families, reciprocal/Satake models, forms, Hecke, integral extension |
| DM.4 | 10 | planned | Anderson/effective motives, variance, purity, uniformizability, tensor powers, inverse dual convention |
| DM.5 | 8 | planned | rational realization, Tate Hom map, algebraization, period ring, saturation, surjectivity, semisimplicity |
| DM.6 | 13 | planned | cardinalities, models, Euler product, units/classes, covolumes, nuclear trace/tangent proof, small sums/examples |
| DM.7 | 7 | planned | elliptic chains, normalization, dictionary, two-leg export, prime/characteristic realizations |

Ten gaps and ten supplier contracts remain; **zero stages are closed**. The reader is
195,461 bytes. It states targets, hypotheses, proof routes, API/tests, sources and corrections
in our own words. No source passage, PDF or restricted-library material is in the repository.

## Suggested Lean file

`lean-check` elaborates the file against Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`: exit 0, no errors, only declaration-uses-`sorry`
warnings. This checks signatures, not proofs. Available memory exceeded 20 GB before each
run. No build, cache download, project update or language server was started.

The packet's `suggestedInterface` and the Lean file's final register account for every
proposed name. Of 346 API/test entries, 124 have named native signatures, 117 have examples,
eight bind to named coordinate prototypes, and 97 are exact omissions. A signature can
still have narrower coordinate scope, explicitly recorded. These counts do not claim
native declarations for all mathematical targets. No unknown proposition encodes a gap.

Native signatures include the Ore adapter, actions and intertwiners; affine scheme spectra,
ideal CRT/base change and principal Tate quotients; completion fields, bounded projective
lattices and restricted series; matrix modules, linearized motive quotients, inverse dual
motives with the explicit q-root equation and perfect-coefficient purity lattices; separate
Taelman point/Lie actions, one-place class formulas and nonzero class examples; ultrametric
finite-nucleus determinants, actual tangent operator coefficients, and a module-sheaf chain
component. Full relative geometry, absolute-Galois continuity, general-A completed motives,
global trace/quotient operators and normalized elliptic sheaves remain named omissions.

## Ownership and requests

- **RT-AREA-finitefields/13:** FF.4 alone owns q-linearized polynomials, Frobenius linearity,
  separability, finite-subspace products and the Ore/composition comparison. Its four existing
  nodes are imported. The removed six generic DM.0 nodes acquire no replacement Drinfeld
  owner; the local native adapter adds none.
- **FA.1:** the curve coefficient ring, degree/ideal norm, finite coefficient restriction,
  Riemann–Roch and projective ideals. **FA.2:** infinity/prime completions, residue factors,
  normalized norms and finite-product infinity fields.
- **SF.0:** current AlgebraicVectorBundles, AlgebraicCurves and JacobianChallenge own bundles,
  divisor twists, descent and cohomology. **SF.1**, **SF.2**, **SF.4** supply stack descent,
  strict finite-group/finite-shtuka realization and normalization/Proj/quotient geometry.
- **HS2:** the effective characteristic local-shtuka category; the characteristic residue
  factor uses Frobenius raised to the residue degree and retains connected torsion.
- **AdicSpaces:** restricted/Tate analytic comparisons and nonarchimedean Weierstrass/Newton
  input. **DM.8:** coefficient twists. Reconcile its coarse analytic dependency by pointing
  `tate-analytic-interface` to DM.2/c-infinity and the existing analytic supplier.
  Uniformizability belongs to DM.4 and is exported to DM.8 for rigid triviality, avoiding
  a cycle. GS.2 is an outgoing consumer of the elliptic export.
- **FF.4, Part II:** sole proposed owner of complete valued-skew-field invariant factors,
  Newton decomposition and block-rank/positive-slope criteria used by Maurischat. DM.4
  applies these generic tools to Anderson matrices.
- **StableReduction Layer 0:** existing shared Fitting foundations. Current Tau Ceti
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` already has `fittingIdeal`, presentation/minors
  comparisons, quotient and base-change results, also used by current
  IntegralHeckeAndGaloisDeterminants. They are absent at the pin. DM.6 imports them and adds
  only the monic characteristic-polynomial comparison; its pinned compatibility signature
  is omitted rather than reimplementing Fitting ideals.

The packet specifies exact requests and consuming nodes. `upstreamNotes` record current
roadmap observations without changing those roadmaps. Existing bundle, curve and Fitting
foundations are never re-planned.

## Exact follow-up inputs

1. General-A positive integral rank: valuation proportionality alone is rational; establish
   finite-projective motive rank without circularity.
2. Unique nilpotent-base nonlinear standardization: inspect Hartl Lemma 3.8(a)'s cited proof
   or give the finite nilpotent induction.
3. Analytic surjectivity and the general-A projective exponential-kernel rank beyond the
   survey statement and normalized finite-product recurrence.
4. Reciprocal-ring normality from Pink–Schieder, used by Hartl–Yu Proposition 3.11.
5. Nonprincipal integral Tate-image saturation: descend realized divisibility to the
   integral Hom lattice; rational full faithfulness does not supply it.
6. The simple/semisimple Drinfeld-motive input for Stalder's Tate semisimplicity theorem.
7. Bounded-shift elliptic morphism variance; at non-rational infinity verify quotient
   residue factors, Frobenius permutation and descent. The period is rank times residue degree.
8. Exact native geometric/analytic integrations under the names in the suggested register,
   retaining the full mathematical generality while fixing shared supplier types.
9. Maurischat's generic §3 valued-skew-field proof inputs, owned by FF.4 Part II.
10. Principal-level chart/deformation proof of good-open fine-moduli representability,
    cited to Drinfeld §5 by Hartl–Yu Theorem 2.3. The fine-subgroup extension was read.

Resume from these records and per-stage `remaining` lists. This run stops refining because
all stages are planned; independent review and the precise follow-up inputs determine
subsequent work.

## Sources and decisions

Fifteen public artifacts have actual version, URL, SHA-256, read date and inspected sections.
The reader has the full register: Brownawell–Papanikolas, Pink, Hartl preprint and published
collation, Papikian lecture notes, Taelman, Wiedmann, Tamagawa, Stalder preprint and published
collation, Ngo Dac HAL, Thakur, Crew, Hartl–Yu v2, and Maurischat's January 2026 publication.
Maurischat proves that, over perfect fields, an actual Anderson module is abelian exactly
when it is A-finite. This does not add Ore-finiteness to Ngo Dac's broader effective
inverse-twist dual definition. Generic §3 algebra remains a supplier proof input.

All Ngo Dac items routed into these stages are covered: denominator/factorial products,
C-infinity/Omega/period power, inverse-twist dual convention, and small-exponent depth-one
sums. Higher-depth ABP/difference machinery is imported from DM.8. The q=2, d=1, s=3 sum
rejects an unrestricted small-exponent formula. The BP/Ngo Dac period sign adapter is explicit;
inverse twisting fixes the variable. The q=2 integral model with action theta plus theta
cubed times Frobenius has a nonzero class module; its derivation is in the packet and is
not attributed as a printed Taelman example.

Six findings, paraphrased with actual versions and correction searches, need independent
confirmation: Papikian's missing product scalar; Hartl's preprint variance display corrected
in print; Stalder's fixed-field recap notation; Hartl–Yu v2's inverted-element subscript;
Wiedmann's self-reference; Hartl's published unit argument using one minus f where f itself
is the unit. No uncleared Papikian book or other restricted book was used.

## Checks

- `scripts/check_blueprint.py`: 0 errors, 0 warnings against the pinned declaration index,
  including source-issue validation, prerequisite acyclicity and stage coverage.
- `research/blueprint/intake.py check-files`: four permitted files, zero problems.
- Every node/API/test name appears in the suggested register. All full target statements,
  API/test names and source locators appear in the reader. Planets obey six per stage.
- `lean-check`: exit 0, only declaration-uses-`sorry` warnings.
- `git diff --check`: clean; only this job's four permitted paths changed.

Scratch can be deleted after submission: everything the next worker needs is in the four
deliverables. This run claims no second job.
