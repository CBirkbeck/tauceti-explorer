# PKG-HodgeStructuresPartII — blocked supplier handoff

Codex (GPT-6), session `codex-FXUwKt`, issue [#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491), 10 October 2026.
Branch: `codex-FXUwKt-hodge-package`.
[Claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6097154660)
[confirmed](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6097155764).
Starting explorer commit: `e03db36a16092a0d1f81050f1c57ad5d93c63aef`.
None of the manager's forty priority issues appeared among all 745 available
swarm issues. WORKERS' fallback ordering selected an available focus package
before ordinary review and planning jobs. This session claimed only #7491.

## Outcome and edit boundary

**Blocked checkpoint; the package remains incomplete.** This submission
consolidates the accumulated handoff into the current supplier contracts and
restart worklist. It changes only this handoff. The README, Suggested.lean,
accepted packets and existing proofs are unchanged. The blocker is a missing
owner interface, not this run's time limit or a Lean elaboration error.

Issue #7491 says: “Change no packet; if the plan has a mistake, describe it
in the handoff note.” PROTOCOL §§3, 13, 15 and 20 require exact prerequisite
contracts, signatures for the intended objects, unique ownership and fidelity
to the accepted plan. Consequently, widening CR.1 or DD.1, changing H.0's
accepted imports, or constructing duplicate foundation carriers inside this
package is outside this job's allowed work. Acceptance of a target-level pass
with explicit gaps does not supply those inputs.

**Maintainer action:** route the two owner repairs below and reconcile H.0's
imports before scheduling another package continuation. The decisive packet
hashes match the preceding checkpoint. Repeating this package audit while
those contracts are unchanged cannot close G1/G3. This worker changed no issue
labels and made no ownership move.

The complete preceding handoff, with historical source-reading receipts,
additional validation details and provenance of saved additions, remains at
[this immutable archive](https://github.com/CBirkbeck/tauceti-explorer/blob/e03db36a16092a0d1f81050f1c57ad5d93c63aef/research/blueprint/handoff/PKG-HodgeStructuresPartII.md).
Historical paper readings and axiom diagnostics there were not rerun or
represented as new source verification by this session.

## Two decisive contracts: independently reread

Read the statement, hypotheses, proof route, APIs, tests and source matches
of the three parent H.0 consumers below and the corresponding CR.1/DD.1
suppliers. Also read H.0 continuation G1–G7, its four requests and accepted
review, which explicitly retains the gaps.

| Owner and supplying nodes | Existing export | Required H.0 input |
| --- | --- | --- |
| `CrystallineCohomology:CR.1/integrable-connection`, in `packets/CrystallineCohomology--CR.0.json` | Affine connections with a surjection from Kähler differentials; sheaf connections on the small crystalline site under PD-base and local-nilpotence hypotheses | Ordinary additive connections on every supplied commutative differential ringed site, including locally varying rank; operator, exterior-extension, curvature, horizontal-map and restriction/descent comparisons at λ=1 |
| `DerivedDeRhamCohomology:DD.1/filtered-modules` and `DD.1/rees-description` | Coherent enhanced derived filtrations over a ring, graded cofibres, graded Rees equivalence and derived zero/localized fibres | Bounded locally split ordinary finite module-sheaf filtrations; their canonical finite locally free O[t]-Rees sheaf; natural zero, unit and localized fibre maps, restriction/descent and tensor/quotient coherence |

File paths in this handoff are relative to `research/blueprint/` unless stated
otherwise. The consumers are `HodgeStructuresPartII:H.0/ordinary-fiber`,
`H.0/rees-parameter` and `H.0/rees-specialization` in the parent packet.

**G1 acceptance contract.** On a ringed differential site require an additive
sheaf operator D:E→E⊗Ω¹, D(fs)=fD(s)+s⊗df, its exterior extensions
D(s⊗ω)=D(s)∧ω+s⊗dω, curvature D₁D₀, and horizontal O-linear maps
satisfying D_F f=(f⊗1)D_E. Restriction and gluing must preserve these actual
maps. At λ=1 identify the same finite locally free sheaf, section operator,
extensions and curvature with the H.0 object. Quasi-nilpotence belongs only
to crystal comparison hypotheses.

The inherited one-point-site witness has O=Q, Ω¹=Q·ω, Ω²=0, d=0 and
D(q)=qω. It is flat and nonzero, while Ω¹_(Q/Q)=0 cannot surject onto Ω¹.
Reread `NonUniversalDifferentialChecks.operator_eq`, `flat`,
`operator_ne_zero`, `no_kaehler_quotient` and their five examples. Confirmed
`KaehlerDifferential.subsingleton_of_surjective` directly in
`Mathlib/RingTheory/Kaehler/Basic.lean` at the pinned Mathlib commit. These
proved coordinate checks distinguish the supplier's hypotheses; they do not
construct the missing global comparison.

**G3 acceptance contract.** DD.1 owns the canonical ordinary sheaf
Rees_F(E)=Σ_p FᵖE·t⁻ᵖ inside E[t,t⁻¹]. On finite split charts it is
⊕_p G_p[t]·t⁻ᵖ. Require splitting-independent, restriction-compatible maps
Rees/(t)≃⊕_p grᵖ_F E, Rees/(t−1)≃E and
Rees[t⁻¹]≃E[t,t⁻¹], finite local freeness, filtered-map naturality and
convolution tensor/quotient comparisons. Normalize the first map by
[e t⁻ᵖ]↦[e] and the second by [e t⁻ᵖ]↦e. The generic export has no
connection field: H.0 owns constructing t∇, with dt=0, and proving that
those maps transport it to the graded Higgs symbol, ∇ and its localized
rescaling.

Preserve the inherited rank-two controls: F¹=Oe₁, ∇e₁=e₂dx,
∇e₂=0 and weighted basis u₁=t⁻¹e₁, u₂=e₂ give D(u₁)=u₂dx and
D(xu₁)=(xu₂+tu₁)dx. Under e₂′=e₂+xe₁ the Rees basis matrix is
B=((1,xt),(0,1)); the connection matrix becomes
B⁻¹AB+tB⁻¹δB=((−xt,t²(1−x²)),(1,xt)). At x=0,t=1 its upper-right
entry is 1, whereas pure conjugation gives 0. The seven split-chart and
five frame-change examples test the formula; they are not global fibre maps.

## Current upstream and library comparison

Read-only TauCetiRoadmap commit: `8acc80159cfd301db68bde9393a52668efdd8c8c`.
Current Tau Ceti commit: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Read AlgebraicVectorBundles and Completed/HodgeStructures READMEs in full,
and DifferentialGeometry's README and `CurvatureForm` signature. The first
supplies scheme sheaf/bundle operations through L0A–L0C; the second owns
Hodge linear algebra L0–L3 and places variations in its successor.
DifferentialGeometry's carrier is an endomorphism-valued smooth real
bundle two-form, not the required arbitrary differential-site connection.
None of these inspected contracts supplies G1 or the finite Rees fibre maps.

Reread current Tau Ceti's `RingTheory/ReesAlgebra/Grading.lean` and
`reesAlgebra.mem_grade_iff`: it grades ideal-power monomials in a Rees
algebra, not a filtered module sheaf with the three comparison maps.
Targeted searches across current Tau Ceti, upstream roadmaps and Completed
suggested files found no `ReesModule`, `reesModule`, `ordinaryConnection`
or `integrableConnection` declaration providing those contracts. These
searches are not an exhaustive absence audit.

Reread the sheaf exterior/symmetric-power functors and defining comparison
signatures. Reuse `SheafOfModules.exteriorPower`, `symmetricPower`,
their sheafification identifications, morphism laws and zero/one natural
isomorphisms. Their assumptions are a category C and topology J, a
commutative-ring sheaf R, sheaf composition along `forget₂ CommRingCat RingCat`,
`HasWeakSheafify J AddCommGrpCat` and `J.WEqualsLocallyBijective AddCommGrpCat`.
These power constructions do not impose `SmallCategory C`. Keep the archived
exact tensor/closed-dual assumptions and native imports when completing G2.

Read the reviewed `data/library-coverage.json` inventory: it has the four
completed HodgeStructures layers, but no direct HodgeStructuresPartII,
CR.1 or DD.1 layer entry. That absence is not evidence of implementation.
No read-only tree was modified, no Lake command was run there, and no
restricted source file or passage was copied.

## Remaining work and preservation requirements

1. Supply G1/G3 at their existing owners, update H.0's importing references,
   then complete the remaining global H.0 signatures, APIs and tests. The
   36 omitted global parent signatures remain explicit omissions.
2. G2: transport through native sheaf tensors, duals, powers, determinant
   and quotient comparisons, local equality detection, restriction, descent
   and pullback coherence. Tensor of global sections does not compute the
   sections of a sheaf tensor. Do not duplicate existing power carriers.
3. G4: allow locally varying rank or a specified determinant line with its
   connection; glue the alternating-sum connection using determinant gauge
   transport and `ColemanPowerSeries:L1/derivation-determinant-unit`. Wedge
   base change must allow nonflat maps; trace zero is only the fixed trivial
   determinant convention.
4. G5: retain the unbounded localized Liu–Zhu period filtration and
   tⁱFilʲ=Filⁱ⁺ʲ. Construct the lattice-preserving t∇ and identify its actual
   residue with the graded symbol in Ω¹_X(−1), retaining semilinear
   Galois/Tate and exterior-curvature compatibility. A bounded Rees replacement
   or trivial Tate character does not supply this interface.
5. G6: local nilpotence yields a global exponent only with a uniform bound
   (a finite subcover gives a maximum). Increasing Jordan blocks on infinitely
   many components give no bound. Rank bounds require globally bounded rank;
   kernels need not be subbundles and nonflat maps need not preserve images.
6. G7: obtain the actual coherent image algebra B_theta, coefficient section
   and invertible-B_theta twisting adapter under Heuer's analytic finiteness
   hypotheses. Generic image operations do not establish coherence on an
   arbitrary site. Spectral-cover/Picard correspondence stays with its
   p-adic Simpson owner.
7. Audit all H.1–H.8 targets, APIs, tests, current-library interfaces and
   bottom-up suppliers; finish reader grouping, worked examples and declaration
   documentation. The 569-node parent and seven-node H.0 continuation must
   both be accounted for. Keep the archived per-layer inventory.

Preserve all 698 examples and existing proved affine/operator controls,
H.5 scheme-theoretic fibres and finite-projective lattices, Betti scalar
checks and H.7 negative controls. Do not restore the twenty removed
unrestricted H.7 signatures. `ShimuraData:D3/variation` already specifies
compatible rational/real data: a thinner prototype is not itself an owner
plan gap. `IntegralVariationFibers` does not replace a global integral datum
without scalar-extension agreement and lattice naturality. No new proof or
full H.1–H.8 certification is asserted by this checkpoint.

## Validation and immutable receipts

All ten Hodge packets and the two decisive supplier packets passed
`python3 scripts/check_blueprint.py`: twelve exit-zero checks, zero errors
and warnings. These structural checks do not discharge the mathematical
supplier gaps. The H.0 continuation still records seven gaps and four
requests; no input stage is closed.

`lean-check packages/HodgeStructuresPartII/Suggested.lean` (using the full
repository-relative path) exited 0: zero errors, 1,619 `sorry` warnings
and no other warnings. Available memory before launch was 103 GB. The managed
build reported Mathlib `082e2d3`; its documented Tau Ceti pin is
`f790474821cf4256814db967cb154e7af3d0c369`. The full Mathlib pin is
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Compilation uses that managed
baseline, separately from the newer read-only upstream/library comparison.
No Lean process from this run remains.

README.md remains 199933 bytes. Suggested.lean still has one deduplicated
block of 108 individual imports (98 Mathlib, 10 Tau Ceti), the standard
non-exhaustive header, and the same declaration body. Metadata remains absent
because this is an incomplete checkpoint; intended final topic is `math.AG`.

| File relative to `research/blueprint/` | SHA-256 |
| --- | --- |
| `packets/HodgeStructuresPartII.json` | `2b0cd77691cded87b89d241a3d0b714857e4953c302230943ed06a2ff7a2be60` |
| `packets/HodgeStructuresPartII--H.0.json` | `4ae94aa821ea9fb8fde4a53659cfe1cef4aba1b8ce077b66d3482ee59694ac7e` |
| `packets/CrystallineCohomology--CR.0.json` | `90d720b682eccf1d80061213921ff7041dc895175937de5491f163e045c668fb` |
| `packets/DerivedDeRhamCohomology.json` | `146a591348fccd8af4605020dd796a905c508ca12ebe52753302c6b08517673b` |
| `packages/HodgeStructuresPartII/README.md` | `ad226b4c2b8e7a9e1d1dcf487e207b89226df9fd68a5ff7991f859df97f2c585` |
| `packages/HodgeStructuresPartII/Suggested.lean` | `443e09fc05317a7749fa850b1bfe5535b659b7335d5c92db43928f918cc58493` |

Scoped `research/blueprint/intake.py check-files` and `git diff --check`
passed for the single changed handoff. Package/source hashes are unchanged.
Everything needed to resume is here, in the archived handoff and in the
repository inputs; no disposable scratch file is needed.
