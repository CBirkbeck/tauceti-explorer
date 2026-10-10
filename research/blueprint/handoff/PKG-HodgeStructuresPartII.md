# PKG-HodgeStructuresPartII — blocked supplier checkpoint

Codex (GPT-6), session `codex-9T45la`, issue [#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491), 10 October 2026.
Branch: `codex-9T45la-hodge-package`.
[Claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6097308041)
[confirmed](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6097309013).
Starting explorer commit: `82953625066688e6eb19dfb640449af9c218f882`.
None of the manager's priority issues appeared among the 744 available swarm
issues. WORKERS' fallback ordering selected an available focus package before
ordinary review and planning jobs. This session claimed only #7491.

## Outcome and authorization boundary

**Blocked checkpoint; the package is incomplete.** The two decisive supplier
contracts are byte-for-byte unchanged from the preceding checkpoint. This run
independently checked them, inventoried the nine continuation packets, reread
current upstream interfaces and repeated the structural and Lean checks. It
changes only this handoff; no target, supplier, ownership assignment or proof
has been changed.

Issue #7491 explicitly says: “Change no packet; if the plan has a mistake,
describe it in the handoff note.” PROTOCOL §§3, 13, 15 and 20 require exact
supplier contracts, honest signatures and unique ownership. Completing the
ordinary-connection or ordinary-Rees interfaces at their owning roadmaps,
and changing H.0's importing references, exceeds this issue's edit boundary.
A prototype that elaborates while recording missing signatures does not meet
the complete package requirement. This is a supplier blocker, not exhaustion
of this run's time allocation.

**Maintainer action:** route the CR.1 and DD.1 owner repairs below and reconcile
H.0's imports before another package continuation. These repairs are necessary
but do not close all the later-layer gaps. The inventory below identifies the
remaining scope. Do not treat the existing accepted target-level reviews as
certification that every requested interface already exists.

The preceding handoff, including the complete G1–G7 restart contracts and
historical source-reading receipts, is preserved in
[this immutable archive](https://github.com/CBirkbeck/tauceti-explorer/blob/82953625066688e6eb19dfb640449af9c218f882/research/blueprint/handoff/PKG-HodgeStructuresPartII.md).
Its claims about historical readings and proofs are not new verification by
this session. No disposable scratch file is required to resume.

## Independently checked decisive contracts

Paths in this note are relative to `research/blueprint/` unless stated otherwise.
Read the statement, hypotheses, proof route, sources, APIs and tests of the
three parent consumers and the corresponding supplier nodes. Also read the
H.0 continuation's seven gaps and four supplier requests and its review.

| Supplier | Present scope | Missing H.0 input |
| --- | --- | --- |
| `CrystallineCohomology:CR.1/integrable-connection`, in `packets/CrystallineCohomology--CR.0.json` | Affine connections with a surjective quotient of Kähler differentials; sheaf connections on the small crystalline site with its PD-base hypotheses | Ordinary additive connections on arbitrary supplied commutative differential ringed sites, with exterior extensions, curvature, horizontal maps, restriction and descent |
| `DerivedDeRhamCohomology:DD.1/filtered-modules` and `DD.1/rees-description`, in `packets/DerivedDeRhamCohomology.json` | Enhanced derived filtrations over a ring, graded cofibres, graded Rees equivalence and derived zero/localized fibres | Bounded locally split ordinary finite module-sheaf filtrations and their canonical finite locally free Rees sheaves, with actual zero, unit and localized fibre maps |

The consumers in `packets/HodgeStructuresPartII.json` are
`HodgeStructuresPartII:H.0/ordinary-fiber`, `H.0/rees-parameter` and
`H.0/rees-specialization`. Their proof routes expressly import the absent
interfaces; local chart calculations do not supply those imports.

**G1 repair acceptance.** On the supplied differential site require an additive
sheaf operator D:E→E⊗Ω¹ with D(fs)=fD(s)+s⊗df, exterior extensions
D(s⊗ω)=D(s)∧ω+s⊗dω, curvature D₁D₀, and horizontal O-linear maps
satisfying D_F f=(f⊗1)D_E. Identify the same sheaf and actual section operators
with H.0 at λ=1, retaining restriction and gluing. Rank is locally varying;
PD lifts and quasi-nilpotence remain assumptions of crystal comparisons only.

The existing `NonUniversalDifferentialChecks` gives a concrete separation:
on a one-point site take O=Q, Ω¹=Qω, Ω²=0 and scalar differential zero.
The nonzero flat operator D(q)=qω meets the ordinary Leibniz equation.
But Ω¹_(Q/Q)=0 cannot surject onto Qω. This run read its `operator_eq`,
`flat`, `operator_ne_zero`, `no_kaehler_quotient` and five examples directly.
It also read `KaehlerDifferential.subsingleton_of_surjective` in the pinned
Mathlib source. The global comparison is still absent.

**G3 repair acceptance.** DD.1 owns the ordinary canonical sheaf
Rees_F(E)=Σ_p FᵖE·t⁻ᵖ inside E[t,t⁻¹]. On finite split charts it is
⊕_p G_p[t]·t⁻ᵖ. Export splitting-independent and restriction-compatible maps
Rees/(t)≃⊕_p grᵖ_F E, Rees/(t−1)≃E and
Rees[t⁻¹]≃E[t,t⁻¹], finite local freeness, filtered-map naturality and
convolution-tensor/quotient comparisons. The first map sends the class of
e t⁻ᵖ to the graded class of e; the second sends it to e. The generic carrier
has no connection field. H.0 owns t∇, relative dt=0, and the operator
comparisons to the graded Higgs symbol, ∇ and its localized rescaling.

A useful additional repair check is a nonzero rank-one step filtration:
F¹E=E and F²E=0. Its Rees lattice is E[t]t⁻¹ and its zero fibre is E in
grade one. In contrast E[t,t⁻¹]/tE[t,t⁻¹]=0 because t is invertible.
Thus taking the zero fibre of the ambient localized module before forming
the Rees lattice gives the wrong answer. This is a proposed mathematical
acceptance check, not a new Lean theorem or an implemented sheaf comparison.

Preserve the proved `SplitReesChecks`: F¹=Oe₁, ∇e₁=e₂dx, ∇e₂=0,
u₁=t⁻¹e₁, u₂=e₂ give D(u₁)=u₂dx and
D(xu₁)=(xu₂+tu₁)dx. For e₂′=e₂+xe₁, the polynomial basis matrix
B=((1,xt),(0,1)) transports the matrix A by B⁻¹AB+tB⁻¹δB.
Its upper-right entry at x=0,t=1 is 1; conjugation alone gives 0.
This run reread all twelve split-chart/frame-change examples. They test the
normalization and gauge term but do not construct the sheaf fibres.

## Full restart inventory

The parent file contains 569 H.0 nodes; it does not contain the later-layer
nodes. H.0's continuation adds seven targets. The eight other part files
supply 309 nodes. Read and preserve all ten files when completing the package.
Their accepted reviews retain explicit gaps. Counts below are per-file
entries, not counts of distinct mathematical obstructions across the roadmap.

| Packet suffix | Nodes | Gaps | Requests | Coverage |
| --- | ---: | ---: | ---: | --- |
| Parent | 569 | 13 | 5 | H.0 partial; H.1–H.8 not_read in this earlier pass |
| `--H.0` | 7 | 7 | 4 | planned |
| `--H.1` | 36 | 11 | 18 | planned |
| `--H.2` | 33 | 19 | 14 | planned |
| `--H.3` | 43 | 5 | 23 | planned |
| `--H.4` | 30 | 6 | 3 | planned |
| `--H.5` | 73 | 13 | 16 | planned |
| `--H.6` | 32 | 6 | 7 | planned |
| `--H.7` | 31 | 7 | 12 | planned |
| `--H.8` | 31 | 5 | 11 | planned |

The coverage table is a metadata inventory, not a fresh source audit of H.1–H.8.
In particular, H.1's `signatureCoverage` records two native and 34 omitted
node interfaces; H.5's records 15 native, 15 partial and 43 omitted interfaces.
These ledgers must be reconciled with the assembled file before declaring a
complete package. Closing G1/G3 alone does not establish their geometric,
analytic, moduli, arithmetic or definability assertions.

Resume in this order:

1. At CR.1 and DD.1 supply the two owner contracts, then update H.0's imports
   through the owning planning/review jobs. Recheck the above consumers before
   adding the 36 omitted global parent signatures and their API/tests.
2. G2: use native sheaf tensors, closed duals and polynomial powers. Construct
   the remaining operator comparisons, effective gluing and coherent pullback;
   tensoring global sections does not compute sections of a sheaf tensor.
3. G4: retain locally varying rank and specified determinant connections.
   Glue alternating-sum connections using determinant gauge transport and
   `ColemanPowerSeries:L1/derivation-determinant-unit`; permit nonflat wedge
   base change. Trace zero is only the fixed trivial determinant convention.
4. G5: preserve the unbounded localized Liu–Zhu filtration and
   tⁱFilʲ=Filⁱ⁺ʲ. Identify the actual residue of the lattice-preserving t∇
   with the graded symbol in Ω¹_X(−1), with Galois/Tate and curvature maps.
   The bounded Rees export is not a replacement for this period adapter.
5. G6: local nilpotence needs a uniform exponent for a global bound; a finite
   subcover gives a maximum. Increasing Jordan sizes on infinitely many
   components do not. Retain the rank-bound, kernel/subbundle and nonflat-image
   distinctions recorded in the preceding handoff.
6. G7: supply the coherent image algebra and coefficient section under Heuer's
   analytic finiteness hypotheses. Spectral-cover/Picard correspondence stays
   with its p-adic Simpson owner.
7. Reconcile every H.1–H.8 target, API, test and bottom-up supplier with the
   corresponding part, preserving each honest omitted signature. Complete
   reader grouping and geometry-level examples only against actual carriers.

Preserve all 698 existing Lean examples, the proved affine/operator controls,
H.5 scheme-theoretic fibres and finite-projective lattices, Betti scalar
checks and H.7 negative controls. Do not restore the twenty removed
unrestricted H.7 signatures. `ShimuraData:D3/variation` already specifies
compatible rational/real data; a thinner prototype does not show an owner
plan gap. `IntegralVariationFibers` does not replace global integral data
and their scalar-extension agreement and lattice naturality.

## Current upstream and library check

Read-only roadmap environment commit: `e255659f8eb50cd472809d9d565c8f755acffd84`.
Current Tau Ceti commit: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Read AlgebraicVectorBundles and Completed/HodgeStructures READMEs in full.
The former supplies scheme bundle operations in L0A–L0C; the latter's L0–L3
owns Hodge linear algebra and places geometric variations in its successor.
Inspected DifferentialGeometry's `CurvatureForm` signature: its smooth real
bundle two-form carrier does not supply the arbitrary differential-site
ordinary-connection interface.

Read current Tau Ceti's `RingTheory/ReesAlgebra/Grading.lean`, including
`reesAlgebra.mem_grade_iff`. It grades ideal-power monomials in a Rees
algebra, rather than an ordinary filtered module sheaf with all three fibre
maps. Name searches for `ReesModule`, `reesModule`, `ordinaryConnection` and
`integrableConnection` across current Tau Ceti and active/completed roadmap
trees returned no supplier. This is a targeted screen, not an exhaustive
absence audit. No read-only tree was modified or used for a Lake command.

Read the native sheaf exterior-power functor, its defining sheafification
isomorphism and morphism equation. Its hypotheses are a category and topology,
a commutative-ring sheaf, sheaf composition, weak sheafification of abelian
groups and locally-bijective sheafification maps. No `SmallCategory` assumption
is built into that power functor. Preserve the preceding handoff's native
closed tensor/dual/symmetric interfaces rather than building new carriers.

Read the four HodgeStructures entries in `data/library-coverage.json`;
they record three built layers and a partly built L2. No direct HodgeStructuresPartII,
CR.1 or DD.1 entry is present. Those inventory facts do not discharge the
missing interfaces or supersede direct declaration checks.

## Validation

All ten Hodge packets and both decisive supplier packets passed
`python3 scripts/check_blueprint.py`: twelve exit-zero checks, zero errors
and warnings. Structural validity does not discharge their mathematical gaps.

`lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean`
finished with exit 0, zero errors, 1,619 warnings about admitted declarations
and no other warnings. Available memory before launch was 104 GB. The managed
build uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and documents the
Tau Ceti baseline as `f790474821cf4256814db967cb154e7af3d0c369`. The newer
read-only upstream/library screen above is separate from this compilation
baseline. No Lean process from this run remains.

README.md remains 199933 bytes. Suggested.lean remains 819395 bytes, with
one block of 108 imports, the standard non-exhaustive header and 698 examples.
Metadata is still absent; the intended final topic is `math.AG`. It is not
added to this blocked checkpoint as a signal of completed deliverables.

| File relative to `research/blueprint/` | SHA-256 |
| --- | --- |
| `packets/HodgeStructuresPartII.json` | `2b0cd77691cded87b89d241a3d0b714857e4953c302230943ed06a2ff7a2be60` |
| `packets/HodgeStructuresPartII--H.0.json` | `4ae94aa821ea9fb8fde4a53659cfe1cef4aba1b8ce077b66d3482ee59694ac7e` |
| `packets/CrystallineCohomology--CR.0.json` | `90d720b682eccf1d80061213921ff7041dc895175937de5491f163e045c668fb` |
| `packets/DerivedDeRhamCohomology.json` | `146a591348fccd8af4605020dd796a905c508ca12ebe52753302c6b08517673b` |
| `packages/HodgeStructuresPartII/README.md` | `ad226b4c2b8e7a9e1d1dcf487e207b89226df9fd68a5ff7991f859df97f2c585` |
| `packages/HodgeStructuresPartII/Suggested.lean` | `443e09fc05317a7749fa850b1bfe5535b659b7335d5c92db43928f918cc58493` |

Scoped `research/blueprint/intake.py check-files` and `git diff --check` passed
for the single changed handoff. Package and supplier hashes are unchanged.

No new proof, full H.1–H.8 certification, source excerpt or ownership move is
asserted by this checkpoint. The current contracts, restart inventory and
immutable archive contain everything needed for the next worker.
