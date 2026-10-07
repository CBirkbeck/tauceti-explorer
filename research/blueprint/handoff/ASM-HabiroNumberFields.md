# ASM-HabiroNumberFields — assembly handoff

Job #6421. Agent: Codex, session `codex-C5ZzGZ`. This is a complete assembly submission,
not a checkpoint. All declarations remain `unchecked`; target-level completion does not
claim that source gaps, supplier requests or the mathematics have been formalized.

The definitive [reader](../readmes/HabiroNumberFields.md) joins all 94 targets in
HB.1, HB.2, HB.6, HB.7 order, with a common purpose, boundaries, notation, sources,
layer overview and exact within-roadmap prerequisite links. It includes every API item,
unit test, hypothesis, proof route and acceptance criterion from all five packets.
The [suggested file](../suggested/HabiroNumberFields.lean) has one standard note, one
block of individual imports and the shared `TauCeti.HabiroNF` root namespace.

Only the named parent reader/Lean file, parent packet, HB.1 packet (declaration names),
HB.7 packet (one planet assignment) and this handoff are edited. The supplement readers
and suggested files are input documents and are not edited. No atlas, campaign, queue,
neighboring packet or upstream roadmap is changed.

## Review and re-review

Every input packet's entire `review` object is unchanged. The table below records
historical verdicts, not approval of this assembly or of its changed parent mathematics.


| Packet | Historical verdict | Date | Assembly change |
|---|---|---|---|
| parent | accepted | 2026-09-25 | Mathematical interfaces and proof routes reconciled; independent re-review required. |
| HB.1 | accepted | 2026-10-06 | Seven declaration names use the shared namespace; mathematics unchanged. |
| HB.2 | needs_changes | 2026-10-06 | Unchanged; needs_changes is preserved. |
| HB.6 | accepted | 2026-10-06 | Unchanged. |
| HB.7 | accepted | 2026-10-06 | Picard planet assignment only; mathematics unchanged. |

The HB.2 review found that its supplement reader still used an invalid analytic
neighborhood and omitted the prime hypothesis in the signed Chern evaluation. The
assembled parent reader uses the corrected packet: a small neighborhood of (X,Y)=(1/5,2)
with the actual KMS inequalities, and N=ℓ^m with ℓ an odd prime and m≥1. The excluded
supplement reader still needs its independent revision. This assembly neither changes
that verdict nor represents the supplement as accepted.

Schedule an independent re-review of the changed parent interfaces below. The old
September parent review predates these reconciliations and is not their endorsement.

| Parent node | Changed fields |
|---|---|
| [HabiroNumberFields:HB.1/bloch-group-conventions](../readmes/HabiroNumberFields.md#HB-1-bloch-group-conventions) | `statement`, `hypotheses`, `proofSteps`, `acceptance`, `prerequisites`, `sources` |
| [HabiroNumberFields:HB.1/units-realise-c-zeta](../readmes/HabiroNumberFields.md#HB-1-units-realise-c-zeta) | `hypotheses`, `proofSteps`, `prerequisites` |
| [HabiroNumberFields:HB.1/equivariant-unit-rank](../readmes/HabiroNumberFields.md#HB-1-equivariant-unit-rank) | `title`, `statement`, `hypotheses`, `proofSteps`, `acceptance`, `prerequisites` |
| [HabiroNumberFields:HB.1/eigenspace-of-units-mod-p](../readmes/HabiroNumberFields.md#HB-1-eigenspace-of-units-mod-p) | `proofSteps`, `prerequisites` |
| [HabiroNumberFields:HB.2/kms-identity](../readmes/HabiroNumberFields.md#HB-2-kms-identity) | `statement`, `hypotheses`, `proofSteps`, `acceptance`, `prerequisites` |
| [HabiroNumberFields:HB.2/lifting-obstruction-is-a-cup-product](../readmes/HabiroNumberFields.md#HB-2-lifting-obstruction-is-a-cup-product) | `hypotheses`, `prerequisites` |
| [HabiroNumberFields:HB.2/the-map-R-zeta](../readmes/HabiroNumberFields.md#HB-2-the-map-R-zeta) | `hypotheses`, `prerequisites` |
| [HabiroNumberFields:HB.2/five-term-distribution-and-galois](../readmes/HabiroNumberFields.md#HB-2-five-term-distribution-and-galois) | `hypotheses`, `prerequisites` |
| [HabiroNumberFields:HB.2/etale-bloch-group-and-K2](../readmes/HabiroNumberFields.md#HB-2-etale-bloch-group-and-K2) | `hypotheses`, `prerequisites` |
| [HabiroNumberFields:HB.2/the-element-eta](../readmes/HabiroNumberFields.md#HB-2-the-element-eta) | `hypotheses`, `prerequisites` |
| [HabiroNumberFields:HB.2/eta-is-zeta-times-bott](../readmes/HabiroNumberFields.md#HB-2-eta-is-zeta-times-bott) | `statement`, `prerequisites` |
| [HabiroNumberFields:HB.2/chern-sign-conventions](../readmes/HabiroNumberFields.md#HB-2-chern-sign-conventions) | `statement`, `hypotheses`, `proofSteps` |
| [HabiroNumberFields:HB.2/soule-formula-in-degree-three](../readmes/HabiroNumberFields.md#HB-2-soule-formula-in-degree-three) | `statement`, `hypotheses` |
| [HabiroNumberFields:HB.2/chern-class-of-eta](../readmes/HabiroNumberFields.md#HB-2-chern-class-of-eta) | `statement`, `hypotheses`, `proofSteps`, `acceptance`, `prerequisites` |
| [HabiroNumberFields:HB.2/hutchinson-refinement](../readmes/HabiroNumberFields.md#HB-2-hutchinson-refinement) | `statement`, `proofSteps` |
| [HabiroNumberFields:HB.6/the-p-adic-classical-ring](../readmes/HabiroNumberFields.md#HB-6-the-p-adic-classical-ring) | `proofSteps`, `prerequisites` |
| [HabiroNumberFields:HB.6/ring-operations-and-the-classical-comparison](../readmes/HabiroNumberFields.md#HB-6-ring-operations-and-the-classical-comparison) | `proofSteps`, `prerequisites` |
| [HabiroNumberFields:HB.7/the-global-module](../readmes/HabiroNumberFields.md#HB-7-the-global-module) | `statement`, `proofSteps` |
| [HabiroNumberFields:HB.7/the-ring-case-and-tensor-products](../readmes/HabiroNumberFields.md#HB-7-the-ring-case-and-tensor-products) | `title`, `statement`, `hypotheses`, `proofSteps`, `acceptance` |
| [HabiroNumberFields:HB.7/what-the-local-picture-does-not-give](../readmes/HabiroNumberFields.md#HB-7-what-the-local-picture-does-not-give) | `statement`, `prerequisites` |

The mathematical changes are explicit:

- HB.1 imports the distinct published and repaired arXiv Bloch groups through the exact
  V.3 maps. Odd convention comparison and the stronger arithmetic K₃ comparison have
  separate hypotheses. Ordinary-unit descent uses the actual valuation image D/n and
  the exact M.1/N.6 interfaces. Complex multiplicity uses an actual odd complex character;
  prime reduction retains the torsion line and does not assert full G outside the
  unramified regime. The general prime-rank target is retained.
- HB.2's broad KMS node imports its odd-order refinement. Bar/Bott and signed evaluation
  retain odd-prime-power hypotheses. The early convention node defines raw and independently
  negated maps; eta evaluation is a later target, avoiding a hidden reverse dependency.
  Matching the fixed CGZ/GSWZ map to those maps remains a separate source-sign gap.
- HB.6's parent proof routes use all five refinements, double limits after reduction
  modulo p^a, the full-factor HR.5 chart, and exact HC.4 lattice/injectivity exports.
  The old generic HC.4 request is discharged by those concrete suppliers. This does not
  discharge the first global-completion isomorphism in GSWZ (14).
- HB.7's stable `the-ring-case-and-tensor-products` id is narrowed to degree-zero equality
  and actual family multiplication. Effective descent, tensor bijectivity and Picard
  coherence retain their separate refinement nodes. This prevents a tensor/descent cycle
  and keeps G-global-descent explicit. The Picard planet moves to its exact construction.
  Actual arithmetic naturality and higher half-shift/presentation inputs remain gaps.

The Lean integration also reuses Tau Ceti's actual power-class quotient, the parent
cyclic polynomial/Pochhammer expression, coefficient algebra, compatible exponent,
root transitions and classical completion model. Prime and positive-order hypotheses
are added to root-transition signatures, Δ>0 to the domain statement, and the abelian
comparison is a ring equivalence. The old multiplication signature with arbitrary maps
between ambient Kummer algebras is omitted: it requires the actual root-line product
and its Frobenius/regulator compatibility. These are signature repairs, not proofs.

## Validation

- `python3 scripts/check_blueprint.py` on all five named packets: 0 errors and 0 warnings
  for every packet. JSON parses; every implementation status is `unchecked`.
- The joined internal node graph has 94 distinct ids and no cycle. Every internal
  prerequisite is earlier in the reader. No prerequisite goes from a later layer back
  into an earlier one. Reader API/test-name inventory agrees with all five packets;
  the suggested-file inventory contains every API/test name as an active signature or
  an explicitly omitted declaration with its missing objects named.
- Joined planets: HB.1 5, HB.2 6, HB.6 4, HB.7 4; all within the six-per-layer limit.
- Memory was checked before Lean. `lean-check research/blueprint/suggested/HabiroNumberFields.lean`
  was attempted in the shared build at Mathlib 082e2d3. Full elaboration stops at the
  missing object file for `TauCeti.Algebra.Group.PowerClassGroup`. The final complete
  file is **not elaborated**. No library build, cache download or language server is used.
- A Mathlib-only diagnostic subset (1,676 lines), consisting of the merged arithmetic
  ring/local-family forms and new finite-group, cyclic-sum, completion, first-jet,
  Picard and norm signatures, elaborated at Mathlib 082e2d3 with only `sorry` warnings.
  It excludes Tau Ceti power-class-dependent signatures and is not a compilation claim
  for the final file. The diagnostic also caught and repaired namespace/open scope,
  coefficient-algebra instance and universe declaration integration errors.
- `git diff --check` and the swarm file-content validator pass. No private filesystem
  paths or deleted files are in the deliverables.

## Intake allowlist mismatch

The full instructions of issue #6421 explicitly allow editing the five listed packets
and require clear cross-part corrections there. The queue entry `ASM-HabiroNumberFields`
currently lists only the reader, suggested file and handoff in `outputs`.
`research/blueprint/intake.py` derives its per-job allowlist solely from those outputs,
so the three authorized packet edits may be left to the maintainer. The queue is outside
this job's edit scope. Maintainer action: reconcile its allowlist with the full issue
instructions, then take in this one assembly PR. No permission or scope extension is
needed to justify the packet edits already authorized by the issue.

## Reconciled ownership and sequencing

The historical proposals disagree in several places. Use the following reconciled
interpretation, reflected in the parent packet and definitive reader:

- No HB.2b stage is created. Existing HabiroNahmSeries HB.5 owns unconditional scalar-two
  assembly after HB.4/acceptance-andrews-gordon; HB.2 retains the conditional implication.
  HB.9 consumes HB.5 or discharges that implication's premises.
- Published V.3 comparison is B→B_new→B_old with the separate kernel/cokernel corrections.
  The older blanket κ description is not the published map. V.3 keeps all generic ownership.
- Split an early finite-Chern/product prefix from M.8 with M.7 as stage prerequisite;
  its maintainer assigns a real identifier. Never import all of late M.8 early.
- QM.0 owns shared regulator-independent complex q-product/bilateral estimates,
  QM.1 eta phase, P.1 the branch-qualified complex five-term. HB.4 owns the Nahm
  specialization and HB.7 the p-adic defect. Keep the actual P.1→HB.2 KMS dependency.
- Remove M.1→HB.6 and the two KU continuous/existing inputs to KU-habiroring; attach
  the forwarded Galois inputs to HB.1. Add HR.1→HB.6/KU-habiroring and HC.4→HB.6.
  Preserve HB.6→HR.5-number-field; only the exact baseline-only HR.5 chart is imported back.
- HB.7 owns full arithmetic naturality targets, with their named gaps. HR.6 is a
  downstream consumer, not a reverse supplier. Retain all factors and a whole-series norm.
- K2SymbolsBrauer retains one Milnor-number-field owner. Its arithmetic proof closure
  is T.7, using M.2 real-place inputs; V.2 consumes the proof export. Do not add a
  T.7/M.3→T.2:symbols cycle. This assembly changes none of those owner packets.

## Every restructure proposal

The entries below collect all current proposals, including overlaps. They are requests
to the owning maintainer/restructure jobs; no atlas or neighboring stage edit is applied.

### parent restructure 1 — HB.1 imports both published and arXiv Bloch conventions from V.3

Owners: `HabiroNumberFields`, `K3BlochGroups`.

The accepted V.3 published comparison and the HB.1 supplement supersede the older single-map description. RS-10 ownership means use of V.3, not reconstruction. The units are ordinary units and their power classes in F(ζ_n).

**Action.** Use B → B_new → B_old with the distinct kernel/cokernel corrections and odd coefficient maps from V.3. Retain the additional arithmetic hypotheses for K₃/n. Use ordinary units rather than only cyclotomic units. Add the weight-one M.1 and continuous ProfiniteCohomology inputs to HB.1; request an early finite-Chern prefix of M.8 with M.7 prerequisite, never the whole late stage.

### parent restructure 2 — Unconditional scalar-two assembly belongs to existing HabiroNahmSeries HB.5

Owners: `HabiroNumberFields`, `HabiroNahmSeries`.

HB.4/acceptance-andrews-gordon consumes HB.2, so its eta evaluation cannot be an HB.2 prerequisite. The reviewed HB.2 supplement and the later red-team correction agree on the existing HB.5 owner.

**Action.** Keep HB.2/hutchinson-refinement as the conditional implication with compatible prime-power evaluations and CRT. Assemble the unconditional scalar-two comparison at existing HabiroNahmSeries HB.5 using HB.4/acceptance-andrews-gordon and the fixed Chern-sign comparison; HB.9 consumes that result. Add QM.0/QM.1 → HB.5 and HB.5 → HB.9. Do not create HB.2b or add HB.4 → HB.2. Move the old refinement landmark to HB.5; HB.2 uses the KMS landmark instead. ε_m=c_m² is defined at every order independently of this comparison.

### parent restructure 3 — HB.2 stage text: the 'weaker comparison outside the refinement' is vacuous, the exported units are c^2 for every m, and Soulé's formula is imported

Owners: `HabiroNumberFields`.

(1) For a number field, (n, w_F) = 1 forces n odd, and n prime to M_F (the hypothesis of CGZ Theorem 1.6) implies n odd and μ_n(F) = 1; so there is no n for which Theorem 1.6 holds but Hutchinson's hypotheses fail, and 'outside the refinement's hypotheses retain the source's weaker comparison' has no content. Conversely Hutchinson states R_ζ = c_ζ^2 for all odd N with μ_N(F) = 1 but proves it through Theorem 1.6, i.e. for n prime to M_F. (2) GSWZ (16) defines ε_m = c^2_{ζ_m} on K_3(K) for every m ≥ 1, including m with μ_m ⊂ K where R_ζ does not exist; 'the units ε_m(ξ)' of the stage text must be these. (3) 'Construct ... Soulé's Chern-product formula' duplicates MotivicEtaleKTheory:M.8 ('Prove compatibility with ... products'). Added by REV-HabiroNumberFields.

**Action.** HB.2 exports ε_m(ξ)=c_ζm(ξ)² for every m≥1, with inverse-character Kummer class, root line, multiplicativity and coherence. Equality with R_ζm requires m prime to M_K and the late HB.5 comparison with a proved source-sign match. Keep the unknown-power comparison and conditional scalar-from-eta early. Import generic Soulé products only from the requested early M.8 prefix; specialize bar cycles, Bott and degree-three signed evaluation here.

### parent restructure 4 — Common complex q-product estimates belong to QM.0; Nahm asymptotics remain HB.4

Owners: `HabiroNumberFields`, `HabiroNahmSeries`, `HabiroCyclotomicCompletions`, `Polylogarithms`, `QSeriesPartitionsAndMockModularForms`.

The HB.2 KMS proof needs regulator-independent leading q-product and bilateral estimates, eta phase and the branch-qualified complex five-term identity. These are distinct from HB.4’s regulator-dependent Nahm asymptotics and from HB.7’s p-adic defect.

**Action.** Extract the precise leading complex q-product and bilateral uniform-tail exports requested by HB.2 into QM.0, eta phase into QM.1, and complex five-term into P.1. HB.2 and HB.4 consume those suppliers independently. Keep HabiroNahmSeries:HB.4/pochhammer-radial-asymptotics as the Nahm specialization. Withdraw a blanket HB.2 request for all GSWZ §2.1 asymptotics; retain P.1 → HB.2 for the actual KMS proof, rather than deleting it.

### parent restructure 5 — HabiroNahmSeries uses exact HB.2 exports and the late HB.5 comparison

Owners: `HabiroNahmSeries`, `HabiroNumberFields`.

The CGZ polynomial and the analytic GSWZ n-th root have different powers at one. The R/P/injectivity exports are HB.2, while the unconditional scalar-two result is downstream. The excluded Nahm owner must check its current references against these interfaces.

**Action.** Use exact HB.2/the-cyclic-quantum-dilogarithm, kummer-value-P, the-map-R-zeta, R-injectivity-and-image and eta-galois-scaling exports. Keep D_CGZ(1)^24=m^(12m) and (D_GSWZ(1))^(24m)=m^(12m). HB.9/constant-term-is-the-unit consumes the existing HB.5 unconditional assembly or discharges the conditional HB.2 premises; never reference nonexistent HB.2b. Other packets are not edited here.

### parent restructure 6 — Owner of CGZ's étale Bloch group B(F; Z/n) and Theorem 1.7

Owners: `HabiroNumberFields`, `K3BlochGroups`.

K3BlochGroups records the gap 'B(F; Z/nZ) has no owner'. R_ζ is defined on it (CGZ Theorem 2.11). Added by REV-HabiroNumberFields.

**Action.** HabiroNumberFields:HB.2/etale-bloch-group-and-K2 owns B_CGZ(F; Z/n) and CGZ Theorem 1.7; K3BlochGroups:V.6/comparison-finite-coefficients and HB.1 cite it.

### parent restructure 7 — HB.6 imports the Frobenius lift of étale algebras from HR.1

Owners: `HabiroNumberFields`, `HabiroRings`.

RS-10 (not accepted; ownership judged sound by REV-RS-10) has 'HR.1 builds the early Taylor ring, HB.6 specializes it arithmetically'. The packet constructed φ_p itself and cited HR.5 (the wrong direction). HabiroRings:HR.1/the-etale-frobenius-lift supplies exactly the unique Frobenius lift on the p-completion of an étale algebra over a perfectly covered base; Z[1/Δ] with trivial Adams operations and R = O_K[1/Δ] is such a pair. No cycle: HR.1 requires only PrismaticCohomology:PR.0. Added by REV-HabiroNumberFields.

**Action.** HB.6/coefficient-rings-and-frobenius imports HabiroRings:HR.1/the-etale-frobenius-lift. HB.6 owns root-order arithmetic specialization, full-factor p-completed decomposition, rational comparison, class decomposition and the abelian case. Add HR.1 → HB.6 and HR.1 → KU-habiroring; do not duplicate the generic lift.

### parent restructure 8 — HB.6 does not use MotivicEtaleKTheory M.1

Owners: `HabiroNumberFields`, `MotivicEtaleKTheory`.

The atlas lists MotivicEtaleKTheory:M.1 among HB.6's requires, but no HB.6 node needs continuous arithmetic cohomology; RS-10 also drops it. REV-RS-10 notes that §15 has no mechanism to remove an edge. Added by REV-HabiroNumberFields.

**Action.** Maintainer action: remove MotivicEtaleKTheory:M.1 -> HabiroNumberFields:HB.6; remove MotivicEtaleKTheory:KU-continuous and StableHomotopyKTheory:KU-existing from the prerequisites of HabiroNumberFields:KU-habiroring; do not apply RS-08's three forwarded Galois-cohomology links to HB.6, but attach them to HB.1. Add HabiroRings:HR.1 -> HB.6 and HR.1 -> KU-habiroring, and the HC.4 -> HB.6 lattice dependency. Preserve HB.6 -> HR.5-number-field-comparison; only HR.5/the-ell-adic-taylor-comparison is imported in the reverse direction, and that node has exclusively baseline prerequisites. No atlas/data/content file is changed by this packet.

### parent restructure 9 — The inverted integer carries two conditions and both should be named in HB.6 and HB.7

Owners: `HabiroNumberFields`.

GSWZ asks disc(K) | Δ for Definition 1.1 and 6 | Δ for Theorem 1 and the modules (Remark 1.8: 'we will only consider primes p > 3 and always assume that 2, 3 | ∆'). HB.6's stage text names only the first. Added by REV-HabiroNumberFields.

**Action.** HB.6 and HB.7 stage texts both state: Δ > 0 with disc(K) | Δ; for H_{R,ξ} and Theorems 1-2 also 6 | Δ.

### parent restructure 10 — HB.7 owns arithmetic naturality targets; HR.6 consumes them

Owners: `HabiroNumberFields`, `HabiroRings`.

The HB.7 supplement provides explicit field-pullback, scalar-equivalence, Galois and whole-series norm targets, with G-arithmetic-naturality and exact supplier requests. These are additional targets rather than theorems attributed to GSWZ.

**Action.** Keep HB.7/followup-field-pullback, followup-scalar-equivalence, followup-galois-action, followup-local-norm-defect and followup-transfer-norm as the source of the number-field module interfaces. HR.6 imports those results and Picard coherence downstream. Retain G-arithmetic-naturality until D.1/D.4 and early finite-Chern comparisons prove the full-factor transport. Do not use HR.6 as a reverse supplier.

### parent restructure 11 — Keep the p-adic defect distinct from common complex radial estimates

Owners: `HabiroNumberFields`, `HabiroNahmSeries`, `QSeriesPartitionsAndMockModularForms`.

HB.7/pochhammer-dwork-difference is a p-adic logarithmic Frobenius-defect specialization. The HB.2 and HB.4 analytic proofs need common complex estimates from QM.0/QM.1, rather than importing this late HB.7 node.

**Action.** Keep the p-adic section-defect theorem in HB.7 and the Nahm specialization in HB.4. Extract their regulator-independent complex leading estimates to QM.0 before HB.2/HB.4, with eta phase from QM.1. Do not move the p-adic HB.7 node wholesale into HB.2.

### parent restructure 12 — RT-AREA-ktheory-2/2: conditional early implication and late comparison

Owners: .

Preserve the stable HB.2/hutchinson-refinement ID with explicit premises, but move the unconditional assembly to HabiroNahmSeries HB.5 after the accepted HB.4/acceptance-andrews-gordon. Update HB.9/constant-term-is-the-unit to discharge those premises or consume the late result. No HB.4→HB.2 edge is added. ε_m=c² for all m, the unknown-power comparison, Chern η calculation, sign gap, root lines and CRT remain early. The excluded HabiroNahmSeries owner must complete this integration.

**Action.** Preserve the stable HB.2/hutchinson-refinement ID with explicit premises, but move the unconditional assembly to HabiroNahmSeries HB.5 after the accepted HB.4/acceptance-andrews-gordon. Update HB.9/constant-term-is-the-unit to discharge those premises or consume the late result. No HB.4→HB.2 edge is added. ε_m=c² for all m, the unknown-power comparison, Chern η calculation, sign gap, root lines and CRT remain early. The excluded HabiroNahmSeries owner must complete this integration.

### parent restructure 13 — RT-AREA-ktheory-2/7,18,24: early foundations before comparisons

Owners: .

Maintainer: split the requested early finite-Chern and real-Deligne interfaces from M.8’s late comparison work. Retain finite coefficients, naturality, products, twists and real conjugation; P.5 retains Goncharov’s concrete current complex and the comparison with generic Deligne cohomology. The packet requests record missing exports without introducing M.8→R.7 or M.8→D.2 cycles.

**Action.** Maintainer: split the requested early finite-Chern and real-Deligne interfaces from M.8’s late comparison work. Retain finite coefficients, naturality, products, twists and real conjugation; P.5 retains Goncharov’s concrete current complex and the comparison with generic Deligne cohomology. The packet requests record missing exports without introducing M.8→R.7 or M.8→D.2 cycles.

### HB.1 restructure 1 — rescope

Owners: `HabiroNumberFields`, `K3BlochGroups`.

RT-AREA-ktheory-2/17 and the updated V.3 published packet settle the ownership of the integral CGZ conventions. RS-10 is now accepted, contrary to the issue text’s historical description, but its HB.1 wording must be interpreted as use, not a second construction.

**Action.** V.3 owns P¹(F) degenerate symbols, the negative-tensor target, every integral comparison and published Lemma 2.2. HB.1 imports these along a direct V.3→HB.1 edge. Reconcile PLAN-HABIRO §4.2 and the HB.1 stage description through the owning restructure/assembly job; these files are outside this job’s deliverables.

### HB.1 restructure 2 — split

Owners: `MotivicEtaleKTheory`, `HabiroNumberFields`, `PadicHodgeRegulators`, `BorelRegulators`.

RT-AREA-ktheory-2/18: the generic finite étale Chern classes and product formula belong to M.8 under accepted RS-08; the whole stage has D.2/R.7 inputs and cannot be imported early without a cycle.

**Action.** Retain one generic construction in an early part of MotivicEtaleKTheory requiring only M.7, with late regulator comparisons in the existing late part. HB.1 keeps only c_ζ and χ⁻¹ identification; HB.2 and D.2 import the same early product formula. A restructuring owner chooses and approves the real stage IDs. No prerequisite on the whole current M.8 is added.

### HB.2 restructure 1 — rescope

Owners: `HabiroNumberFields`, `HabiroNahmSeries`, `QSeriesPartitionsAndMockModularForms`.

HB.4 depends on HB.2. Neither CGZ Theorem 7.4 nor HB.4’s common product machinery may be imported into HB.2. The scalar-two target currently appears in the early stage text.

**Action.** HB.2 retains the universal invertible scalar and the convention-qualified Chern eta calculation. Assign the unconditional scalar-two assembly to existing HabiroNahmSeries HB.5; reuse HB.4/acceptance-andrews-gordon. Add QM.0→HN HB.5, QM.1→HN HB.5 and HN HB.5→HN HB.9. Extract the regulator-independent leading q-product and bilateral machinery to QM.0 before HB.2/HB.4. Do not create an HB.2b stage or add HB.4→HB.2. Move the parent Hutchinson refinement landmark to HB.5 and select the new KMS landmark in HB.2; keep its other five inherited landmarks. The signed Chern node refines the existing Chern landmark and the hypergeometric sum is supporting API, not another planet.

### HB.2 restructure 2 — split

Owners: `MotivicEtaleKTheory`, `HabiroNumberFields`, `PadicHodgeRegulators`.

Soulé finite Chern classes/products must have one owner, and all of M.8 is too late for HB.1/HB.2.

**Action.** Split the requested finite-Chern prefix from M.8 with M.7 as its only stage prerequisite. HB.1, HB.2 and D.2 import that prefix. Preserve the late comparison part of M.8 and its R.7/D.2 inputs. The maintainer assigns the new identifier; this packet names no nonexistent stage.

### HB.2 restructure 3 — rescope

Owners: `K2SymbolsBrauer`, `K3BlochGroups`, `MotivicEtaleKTheory`.

The existing T.2:symbols/milnor-number-field theorem retains its original Bass–Tate proof gap. T.7 and M.3 already consume T.2:symbols, so adding them to that whole stage creates a cycle.

**Action.** Keep one K2SymbolsBrauer owner and the existing statement import; assign its arithmetic proof closure to T.7, with real places from M.2 and T.7’s Hilbert/global-K₂ inputs. V.2 imports this proof export. Add M.2→T.7, M.2→V.2 and T.7→V.2, all acyclic; do not add T.7→T.2:symbols or M.3→T.2:symbols. No duplicate Milnor theorem is planned in HB.2 or V.2.

### HB.6 restructure 1 — rescope

Owners: `HabiroNumberFields`, `HabiroRings`, `MotivicEtaleKTheory`, `StableHomotopyKTheory`, `ProfiniteCohomology`.

RT-AREA-ktheory-2/16: the explicit ring construction needs the etale Frobenius and classical Taylor/lattice APIs, not continuous Galois cohomology. Existing stage-edge deletion cannot be expressed by additive links.

**Action.** Maintainer action: remove MotivicEtaleKTheory:M.1 -> HabiroNumberFields:HB.6; remove MotivicEtaleKTheory:KU-continuous and StableHomotopyKTheory:KU-existing from the prerequisites of HabiroNumberFields:KU-habiroring; do not apply RS-08's three forwarded Galois-cohomology links to HB.6, but attach them to HB.1. Add HabiroRings:HR.1 -> HB.6 and HR.1 -> KU-habiroring, and the HC.4 -> HB.6 lattice dependency. Preserve HB.6 -> HR.5-number-field-comparison; only HR.5/the-ell-adic-taylor-comparison is imported in the reverse direction, and that node has exclusively baseline prerequisites. No atlas/data/content file is changed by this packet.

## Every supplier request

Each statement below is retained in full with its consuming ids. Requests through M.8 name a desired early prefix, not an approved dependency on the whole late stage.

### parent request 1 — `GeneralAlgebraicKTheory:K.7`

Graded-commutative products K_n(A; Z/N) × K_m(A; Z/N) → K_{n+m}(A; Z/N) for N odd and commutative A, compatible with the Hurewicz maps h_n : K_n(A; Z/N) → H_n(GL(A), Z/N), where the product on homology is induced by the tensor product of matrices (the Pontryagin product on H_*(GL_1(A), Z/N)).

Consumers: [HabiroNumberFields:HB.2/hurewicz-mod-odd-N](../readmes/HabiroNumberFields.md#HB-2-hurewicz-mod-odd-N).

### parent request 2 — `KTheoryFiniteLocalFields:L.2`

Gabber rigidity in the form K_3(O_{F,q}; Z_p) ≅ K_3(F_q) ⊗ Z_p for the completion O_{F,q} of the ring of integers at a prime q not above p (CGZ proof of Lemma 4.1).

Consumers: [HabiroNumberFields:HB.2/local-maps-at-primes-of-norm-minus-one](../readmes/HabiroNumberFields.md#HB-2-local-maps-at-primes-of-norm-minus-one).

### parent request 3 — `KTheoryFiniteLocalFields:L.7`

For a number field F, n = p^m and a prime q of F not above p: the étale Chern class K_3(F)/n → H^1(F, Z/n(2)) is compatible with completion at q and lands, on K_3(O_F) = K_3(F), in the unramified classes identified with H^1(F_q, Z/n(2)); with the finite-field Chern class c_{ζ,q} on K_3(F_q)/n (CGZ Lemma 4.1).

Consumers: [HabiroNumberFields:HB.2/local-maps-at-primes-of-norm-minus-one](../readmes/HabiroNumberFields.md#HB-2-local-maps-at-primes-of-norm-minus-one).

### parent request 4 — `MotivicEtaleKTheory:M.1`

The finite and continuous Tate twists ℤ/n(m) = μ_n^{⊗m} and ℤ_p(m) = lim μ_{p^k}^{⊗m}, with the Galois action through χ^m, and ℚ_p/ℤ_p(m) (whose invariants define w_m(F)), as used in CGZ §3.1. The RS-10 link M.1 → HB.1 records this dependence.

Consumers: [HabiroNumberFields:HB.1/inflation-restriction-injectivity](../readmes/HabiroNumberFields.md#HB-1-inflation-restriction-injectivity), [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](../readmes/HabiroNumberFields.md#HB-1-the-chern-class-map-c-zeta).

### parent request 5 — `MotivicEtaleKTheory:M.3`

Tate's theorem in the field form K_2(F)/n ≅ H^2(F, Z/n(2)) and the n-torsion statement K_2(F)[n] ≅ H^2(F, Z_p(2))[n] for n = p^m, used in CGZ (38) to show R_ζ : B(F; Z/n) → H^1(F, Z/n(2)) is an isomorphism for n prime to w_2(F).

Consumers: [HabiroNumberFields:HB.2/etale-bloch-group-and-K2](../readmes/HabiroNumberFields.md#HB-2-etale-bloch-group-and-K2).

### parent request 6 — `MotivicEtaleKTheory:M.7`

The degree-three case at odd primes of the comparison with Galois cohomology. For a number field F and an odd prime p: Soulé's Chern class gives K₃(F) ⊗ ℤ_p ≅ K₃(O_F) ⊗ ℤ_p ≅ H¹_ét(O_F[1/p], ℤ_p(2)), and H¹_ét(O_F[1/p], ℤ_p(2)) ≅ H¹(F, ℤ_p(2)) (CGZ Theorem 3.2 and §3.2). For a number field E ⊇ μ_N with N odd: c̄_{2,1} : K₃(E; ℤ/N) → H¹(E, μ_N^{⊗2}) is an isomorphism (Hutchinson Theorem 2.10, Levine's theorem, in this case). The HB.1 stage requires M.7; the packet had omitted it.

Consumers: [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](../readmes/HabiroNumberFields.md#HB-1-finite-coefficient-K3-and-the-chern-class), [HabiroNumberFields:HB.1/quillen-lichtenbaum-degree-three](../readmes/HabiroNumberFields.md#HB-1-quillen-lichtenbaum-degree-three).

### parent request 7 — `MotivicEtaleKTheory:M.8`

Soulé's étale Chern classes c̄_{i,k} : K_{2i−k}(A; ℤ/ℓ^ν) → H^k(A, μ_{ℓ^ν}^{⊗i}) for rings A with ℓ invertible, and their ℓ-adic limits c : K_{2m−1}(F) → H¹(F, ℤ_ℓ(m)). Needed with: compatibility with reduction modulo ℓ^ν and with K_m(A)/ℓ^ν → K_m(A; ℤ/ℓ^ν); base change along finite extensions; c̄_{1,1} = the Kummer map on K₁(F; ℤ/N) = Fˣ/(Fˣ)^N; and Soulé's product formula (Hutchinson Theorem 2.12, Soulé II.3 Théorème 1(i)) with its specialisation c̄_{2,1}(a∗b) = −c̄_{1,1}(a) ∪ c̄_{1,0}(b) (Hutchinson Corollary 2.13). Require an early finite-coefficient étale Chern classes interface, before D.2 and BorelRegulators:R.7. The current atlas M.8 remains unsplit and depends on those later comparisons; this request is not a dependency on all of M.8 and does not claim the prefix already exists.

Consumers: [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](../readmes/HabiroNumberFields.md#HB-1-finite-coefficient-K3-and-the-chern-class), [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](../readmes/HabiroNumberFields.md#HB-1-the-chern-class-map-c-zeta), [HabiroNumberFields:HB.1/hutchinson-chern-class-agrees](../readmes/HabiroNumberFields.md#HB-1-hutchinson-chern-class-agrees), [HabiroNumberFields:HB.2/bott-element](../readmes/HabiroNumberFields.md#HB-2-bott-element), [HabiroNumberFields:HB.2/chern-sign-conventions](../readmes/HabiroNumberFields.md#HB-2-chern-sign-conventions), [HabiroNumberFields:HB.2/soule-formula-in-degree-three](../readmes/HabiroNumberFields.md#HB-2-soule-formula-in-degree-three).

### parent request 8 — `PadicHodgeRegulators:D.3`

GSWZ Theorem 9: for p > 3 unramified, D_p : K_3(K_p; Z_p) → p^2 O_{K_p} is a Z_p-linear isomorphism and K_3(K_p; Z_p) is generated by the classes [ζ], ζ ∈ μ(K_p). Used for the presentation (206) of ξ̂ in the proof of Theorem 1.

Consumers: [HabiroNumberFields:HB.7/pochhammer-sections](../readmes/HabiroNumberFields.md#HB-7-pochhammer-sections), [HabiroNumberFields:HB.7/local-freeness](../readmes/HabiroNumberFields.md#HB-7-local-freeness).

### parent request 9 — `PadicHodgeRegulators:D.4`

The localisation map K_3(K) → K_3(K_p; Z_p) for p unramified and the p-adic regulator D_p : K_3(K_p) → K_p = K ⊗ Q_p in the exact normalisation of GSWZ (19) and (22) (Coleman's p-adic dilogarithm D_p(z) = Li_2(z) + ½ log z log(1 − z), with D_p([ζ]) = Li_2(ζ) for roots of unity), with its compatibility with Frobenius (D_p(φ_p ξ) = φ_p D_p(ξ)).

Consumers: [HabiroNumberFields:HB.7/invertible-local-sections](../readmes/HabiroNumberFields.md#HB-7-invertible-local-sections), [HabiroNumberFields:HB.7/pochhammer-sections](../readmes/HabiroNumberFields.md#HB-7-pochhammer-sections).

### parent request 10 — `StableHomotopyKTheory:H.6`

E/m as the cofiber of multiplication by m on a spectrum and the Bockstein exact sequence 0 → π_n(E)/m → π_n(E/m) → π_{n−1}(E)[m] → 0, applied to the K-theory spectrum. This gives K_m(R; ℤ/ℓ) and 0 → K_m(R)/ℓ → K_m(R; ℤ/ℓ) → K_{m−1}(R)[ℓ] → 0 (Hutchinson §2.3). It replaces the request to StableHomotopyKTheory:H.2, which supplies none of this.

Consumers: [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](../readmes/HabiroNumberFields.md#HB-1-finite-coefficient-K3-and-the-chern-class), [HabiroNumberFields:HB.2/bott-element](../readmes/HabiroNumberFields.md#HB-2-bott-element), [HabiroNumberFields:HB.2/hurewicz-mod-odd-N](../readmes/HabiroNumberFields.md#HB-2-hurewicz-mod-odd-N).

### parent request 11 — `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

The Chebotarev density theorem: for a finite Galois extension of number fields and a conjugacy class C of its Galois group, the primes with Frobenius class C have Dirichlet density #C/#G, in particular are infinite; used with Frobenius prescribed simultaneously in a cyclotomic field and a Kummer extension (CGZ Proposition 4.2 and proof of Theorem 5.2). A Tau Ceti layer cannot be a node prerequisite, hence this request.

Consumers: [HabiroNumberFields:HB.2/chebotarev-detection](../readmes/HabiroNumberFields.md#HB-2-chebotarev-detection), [HabiroNumberFields:HB.2/local-R-is-an-isomorphism](../readmes/HabiroNumberFields.md#HB-2-local-R-is-an-isomorphism).

### parent request 12 — `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`

Inflation–restriction 0 → H¹(G/N, M^N) → H¹(G, M) → H¹(N, M) for a closed normal subgroup N of a profinite group G and a discrete module M (explicitInfl1_injective, explicitInfRes_exact), applied to G_{F_n} ⊂ G_F with M = ℤ/n(m).

Consumers: [HabiroNumberFields:HB.1/inflation-restriction-injectivity](../readmes/HabiroNumberFields.md#HB-1-inflation-restriction-injectivity).

### parent request 13 — `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`

Hilbert 90 for the separable closure and the Kummer isomorphism Lˣ/(Lˣ)^n ≅ H¹(G_L, μ_n) for n invertible in L. Tau Ceti has the injective Kummer map TauCeti.kummerClassMap_injective; surjectivity is this layer's. Used for H¹(F_n, μ_n) = F_nˣ/(F_nˣ)^n in CGZ §3.1. The RS-10 link records this dependence.

Consumers: [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](../readmes/HabiroNumberFields.md#HB-1-the-chern-class-map-c-zeta), [HabiroNumberFields:HB.1/s-units-realise-c-zeta](../readmes/HabiroNumberFields.md#HB-1-s-units-realise-c-zeta).

### parent request 14 — `ArithmeticKTheory:N.6`

Use keune-cyclotomic-picard-injection for n=p^m, p odd and unramified in F: twisted Pic/p^m coinvariants inject into K₂(O_F)/p^m. Combine their vanishing with the corresponding finite-module Pic[p^m] invariant criterion. Original Keune proof remains an explicit supplier gap.

Consumers: [HabiroNumberFields:HB.1/units-realise-c-zeta](../readmes/HabiroNumberFields.md#HB-1-units-realise-c-zeta).

### parent request 15 — `PadicHodgeRegulators:D.1`

Import Coleman Li₂, the logarithm branch, five-term identity and the GSWZ normalization D_p(z)=Li₂(z)+(1/2)log(z)log(1−z). HB.7 applies them to completed coefficient algebras; D.2 owns descent/comparison and D.3/D.4 the regulator/integrality results. Keep p>3 and unramified hypotheses on the integral estimates.

Consumers: [HabiroNumberFields:HB.7/invertible-local-sections](../readmes/HabiroNumberFields.md#HB-7-invertible-local-sections), [HabiroNumberFields:HB.7/pochhammer-sections](../readmes/HabiroNumberFields.md#HB-7-pochhammer-sections).

### HB.1 request 1 — `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`

For a finite local-field extension, an Eisenstein polynomial of degree d generates a totally ramified extension of degree d with residue degree one. Apply to Φ_{p^m}(X+1) over the unramified completion F_𝔭. Consume the existing Layer 3 construction and its local carrier.

Consumers: [HabiroNumberFields:HB.1/cyclotomic-prime-valuation-action](../readmes/HabiroNumberFields.md#HB-1-cyclotomic-prime-valuation-action).

### HB.1 request 2 — `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`

For the canonical completion algebras, supply the global/local e and f identifications (Layer 5.5), including the consequence that p∤disc(F) makes F_𝔭/ℚ_p unramified. Use the semilocal completion product (Layer 5.3): [L:F]=Σ_{𝔓|𝔭}[L_𝔓:F_𝔭]. A completed factor of degree φ(p^m), with global degree at most φ(p^m), then gives the unique prime above each 𝔭. All local scalar structures are the canonical ones from Layer 5.2.

Consumers: [HabiroNumberFields:HB.1/cyclotomic-prime-valuation-action](../readmes/HabiroNumberFields.md#HB-1-cyclotomic-prime-valuation-action).

### HB.1 request 3 — `MotivicEtaleKTheory:M.1`

At the M.1 realization/Kummer-localization interface, supply the G-equivariant étale Kummer sequence at A=𝓞 L[1/p], with n=p^m invertible in A: 0→Aˣ/n→H¹_ét(A,μ_n)→Pic(A)[n]→0. Identify its unit inclusion, connecting map and restriction to H¹(L,μ_n) with the existing algebraic S-unit/Selmer sequence and the field Galois Kummer map. M.3 is the degree-two K₂ comparison and does not supply this weight-one sequence; it also does not substitute for Keune.

Consumers: [HabiroNumberFields:HB.1/ordinary-unit-eigenclass-lift](../readmes/HabiroNumberFields.md#HB-1-ordinary-unit-eigenclass-lift).

### HB.1 request 4 — `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`

The Galois Kummer isomorphism and its naturality on the field L, compatible with the algebraic S-unit/Selmer and étale Kummer maps. The algebraic maps at the pin do not on their own give this cohomology identification.

Consumers: [HabiroNumberFields:HB.1/ordinary-unit-eigenclass-lift](../readmes/HabiroNumberFields.md#HB-1-ordinary-unit-eigenclass-lift).

### HB.1 request 5 — `MotivicEtaleKTheory:M.8`

Split and accept the early finite-Chern prefix of M.8 before using it as a dependency. Export Soulé finite classes c̄_{i,k}:K_{2i−k}(R;ℤ/n)→H^k_ét(R,μ_n^{⊗i}) for n invertible, including the coefficient/restriction/K₁ normalizations and product formula. Its prerequisites are M.7; HB.1, HB.2 and D.2 consume that prefix. Current late M.8 comparisons with D.2/R.7 are outside this input. This request is not an edge from all of M.8.

Consumers: [HabiroNumberFields:HB.1/ordinary-unit-eigenclass-lift](../readmes/HabiroNumberFields.md#HB-1-ordinary-unit-eigenclass-lift), [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](../readmes/HabiroNumberFields.md#HB-1-finite-coefficient-K3-and-the-chern-class), [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](../readmes/HabiroNumberFields.md#HB-1-the-chern-class-map-c-zeta), [HabiroNumberFields:HB.1/hutchinson-chern-class-agrees](../readmes/HabiroNumberFields.md#HB-1-hutchinson-chern-class-agrees).

### HB.2 request 1 — `QSeriesPartitionsAndMockModularForms:QM.0`

Extend the finite q-Pochhammer API from formal power-series coefficients to an arbitrary commutative ring, with evaluation compatibility. Supply the analytic bilateral Ramanujan 1ψ1 identity in GZ (58) for |q|<1, |x/y|<|z|<1 and nonvanishing denominators. Extract the common leading-product limit (a;ζ exp(−ε/n))_∞^(−n) ~ [∏_{k=1}^{n−1}(1−ζ^k a)^k](1−a^n)^(−n/2) exp(Li₂(a^n)/ε) on the slit domain, before HB.2/HB.4. Supply the uniform residue-class/tail estimate √ε Ψ→√(2π/n)√((1−X)(1−Y)/(X−Y)) ∑_{k<n}(ζy;ζ)_k/(ζx;ζ)_k z^k on a sufficiently small simply connected complex neighborhood of (X,Y)=(1/5,2), with Z=(1−X)/(1−Y), |X/Y|<|Z|<1, Re S>0 and compatible analytic nth roots. Work on the generic nonreal subopen and extend across removable summand singularities by the backward recurrence. State locally uniform estimates on compact subsets of that neighborhood. Prove two-sided tail bounds, not just the fixed-residue Taylor formula. These are q-product/hypergeometric facts, with no regulator or Nahm-sum dependence.

Consumers: [HabiroNumberFields:HB.2/kms-odd-order-proof](../readmes/HabiroNumberFields.md#HB-2-kms-odd-order-proof).

### HB.2 request 2 — `Polylogarithms:P.1`

Supply the classical dilogarithm five-term specialization B=−Li₂(X/(YZ))+Li₂(YZ)+Li₂(1/(YZ))+Li₂(X/Y)+Li₂(1)−Li₂(X)−Li₂(1/Y)−Li₂(Z)=0, with Z=(1−X)/(1−Y), on the same sufficiently small simply connected open neighborhood of (X,Y)=(1/5,2) and compatible principal branches; all variable Li₂ arguments at that point are real and less than one. The Bloch–Wigner imaginary-part identity is insufficient. Derive the full complex identity using the differential and normalization of the existing classical-polylogarithm, and fix Li₂(1)=π²/6.

Consumers: [HabiroNumberFields:HB.2/kms-odd-order-proof](../readmes/HabiroNumberFields.md#HB-2-kms-odd-order-proof).

### HB.2 request 3 — `K3BlochGroups:V.4`

Extend the existing configuration/hyperhomology map with Hutchinson 2013 §6.3–6.4: the positive periodic cyclic generator maps to ∑cr(β₃(1,t,t^(j+1),t^(j+2))) in RP(F), independent of auxiliary x,y, with the explicit correction terms printed on p.33. Include the forgetful RP→P comparison and the actual H₃(SL₂)→B map, and agree with V.5/nonsplit-cartan-mod-n for finite fields. This generic configuration calculation has one owner here; HB.2 supplies only t_ζ’s cyclotomic specialization.

Consumers: [HabiroNumberFields:HB.2/eta-bar-bloch-specialization](../readmes/HabiroNumberFields.md#HB-2-eta-bar-bloch-specialization).

### HB.2 request 4 — `MotivicEtaleKTheory:M.8`

Split an early finite-coefficient Chern prefix from M.8, requiring M.7 only and not BorelRegulators R.7 or PadicHodgeRegulators D.2. It owns c̄_(i,k):K_(2i−k)(A;Z/ℓ^m)→H^k_et(A,μ_(ℓ^m)^⊗i), coefficient/base-change compatibility, c̄_(1,1)=standard Kummer, c̄_(1,0)(β)=ζ for ∂β=ζ, and Soulé’s negative product formula. HB.1 specializes/untwists, HB.2 evaluates, D.2 imports the same construction. No new stage identifier is invented, and no edge from all of unsplit M.8 is asserted. Compare its raw class with the fixed CGZ/GSWZ class, including every sign.

Consumers: [HabiroNumberFields:HB.2/eta-chern-signed-evaluation](../readmes/HabiroNumberFields.md#HB-2-eta-chern-signed-evaluation).

### HB.2 request 5 — `K2SymbolsBrauer:T.7`

Close the original-proof gap of the existing T.2:symbols/milnor-number-field theorem without duplicating its statement. Its arithmetic proof must be rescoped after T.7, within the same K2SymbolsBrauer owner: T.7 uses the real-place inputs of MotivicEtaleKTheory M.2 and its own Hilbert-symbol/global K₂ inputs; V.2 imports that proof export. Do not add T.7 or M.3 as prerequisites of all of T.2:symbols: both already consume T.2:symbols and that would create a cycle. Retain the existing theorem id as the statement import and gap until the rescope is applied. Expose K₃^M(F)={−1}·K₂^M(F), with the Matsumoto identification of K₂^M(F) with K₂(F) from the Milnor owner, and prove the product consequence via real signatures and weak approximation.

Consumers: [HabiroNumberFields:HB.2/eta-chern-signed-evaluation](../readmes/HabiroNumberFields.md#HB-2-eta-chern-signed-evaluation).

### HB.2 request 6 — `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`

Consume the existing Layer 9 Kummer isomorphism and its explicit/canonical map compatibility, with its continuous coefficient transport and Layer 8 cup product. This is an import contract for already-owned upstream work, not a proposal to re-plan or extend that roadmap. The pinned kummerClassMap alone supplies only injectivity.

Consumers: [HabiroNumberFields:HB.2/eta-chern-signed-evaluation](../readmes/HabiroNumberFields.md#HB-2-eta-chern-signed-evaluation).

### HB.2 request 7 — `HabiroNahmSeries:HB.5`

Assemble the scalar-two theorem after HB.4/HB.5a/HB.2. Import the existing HB.4/acceptance-andrews-gordon (CGZ Theorem 7.4); do not duplicate it. Consume QM.0/andrews-gordon-nahm-form with the reversal of coordinates needed for CGZ’s product condition 2k≠0,±1 mod n, and QM.1’s Jacobi theta/eta transformation APIs. With η defined by the imported HB.2 node and the signed evaluation here, apply parent scalar-from-eta locally at q≡−1 mod n, q≢−1 mod pn, then global comparison and CRT. State R=c_+² or R=c_raw^(−2), and assert GSWZ’s fixed R=c² only after its sign comparison. Export this assembled theorem to HabiroNahmSeries HB.9, while epsilon_m=c_m² for all m remains early.

Consumers: [HabiroNumberFields:HB.2/hutchinson-refinement](../readmes/HabiroNumberFields.md#HB-2-hutchinson-refinement), [HabiroNumberFields:HB.2/the-exported-interface](../readmes/HabiroNumberFields.md#HB-2-the-exported-interface).

### HB.7 request 1 — `PadicHodgeRegulators:D.1`

Coleman Li₂, log branch and GSWZ D_p(z)=Li₂(z)+(1/2)log(z)log(1−z), with log(root of unity)=0, the exact scalar-extension/Frobenius normalization and log/trace identity used here. Direct D.1 dependency is the disposition of RT-AREA-ktheory-2/15.

Consumers: [HabiroNumberFields:HB.7/followup-half-shift-first-jet](../readmes/HabiroNumberFields.md#HB-7-followup-half-shift-first-jet), [HabiroNumberFields:HB.7/followup-integral-linear-jet](../readmes/HabiroNumberFields.md#HB-7-followup-integral-linear-jet), [HabiroNumberFields:HB.7/followup-field-pullback](../readmes/HabiroNumberFields.md#HB-7-followup-field-pullback), [HabiroNumberFields:HB.7/followup-local-norm-defect](../readmes/HabiroNumberFields.md#HB-7-followup-local-norm-defect).

### HB.7 request 2 — `PadicHodgeRegulators:D.3`

For p>3 and a finite PRODUCT of unramified Q_p extensions, the completed regulator isomorphism to p²O and a valid finite Z_p presentation by permitted nontrivial roots, with coefficient-localized/integral-multiple comparison to the notation [ζ]. Raw [ζ] need not lie in a Bloch kernel.

Consumers: [HabiroNumberFields:HB.7/followup-integral-linear-jet](../readmes/HabiroNumberFields.md#HB-7-followup-integral-linear-jet).

### HB.7 request 3 — `PadicHodgeRegulators:D.4`

Global K₃ localization to all completions and its compatibility with scalar restriction, coefficient automorphisms, Frobenius and finite-extension transfer: D_p(tr ξ)=Tr D_p(ξ), with denominator/torsion control, for the full local products.

Consumers: [HabiroNumberFields:HB.7/followup-integral-linear-jet](../readmes/HabiroNumberFields.md#HB-7-followup-integral-linear-jet), [HabiroNumberFields:HB.7/followup-field-pullback](../readmes/HabiroNumberFields.md#HB-7-followup-field-pullback), [HabiroNumberFields:HB.7/followup-local-norm-defect](../readmes/HabiroNumberFields.md#HB-7-followup-local-norm-defect), [HabiroNumberFields:HB.7/followup-transfer-norm](../readmes/HabiroNumberFields.md#HB-7-followup-transfer-norm).

### HB.7 request 4 — `MotivicEtaleKTheory:M.8`

The early finite-coefficient étale Chern restriction/corestriction identity inducing ε_m=c_m² and canonical Kummer torsor base change/norm at all m used by HB.7, including composition and coefficient automorphism coherence. Only this early Chern interface is requested; do not import the later Euler-system/Selmer-complex bundle, which may consume Habiro theory.

Consumers: [HabiroNumberFields:HB.7/followup-field-pullback](../readmes/HabiroNumberFields.md#HB-7-followup-field-pullback), [HabiroNumberFields:HB.7/followup-local-norm-defect](../readmes/HabiroNumberFields.md#HB-7-followup-local-norm-defect), [HabiroNumberFields:HB.7/followup-transfer-norm](../readmes/HabiroNumberFields.md#HB-7-followup-transfer-norm).

### Discharged parent HC.4 request

GSWZ §5.1 for R = Z[1/Δ] and Z_p: the finite-level maps ι^N : R[q]/((q;q)_{N−1}) → P_R^N are given by an integer matrix M_N independent of R, injective with non-zero determinant (graded pieces D_{m,ℓ} = m^{2ℓ−1}(ℓ − 1)!, (310)-(311)), and Proposition 5.2: H ∈ ι(R[q]^N) iff M_N^* applied to its coordinates is ≡ 0 mod D(N) for all N. PLAN-HABIRO places GSWZ §5.1 in HC.4 (recorded as remaining by REV-HabiroCyclotomicCompletions).

Consumers: [HabiroNumberFields:HB.6/ring-operations-and-the-classical-comparison](../readmes/HabiroNumberFields.md#HB-6-ring-operations-and-the-classical-comparison).

Resolved by exact `HabiroCyclotomicCompletions:HC.4/local-integrality-detection` and `HC.4/global-taylor-injective` through `HabiroNumberFields:HB.6/rational-gluing-image-criterion`; no new HC.4 target is requested.

## Remaining proof obligations

All packet gaps are retained below. The retired parent Herbrand, unread KMS/bar and local splitting gaps are superseded by the exact refinement targets; their genuine supplier/source obligations remain in the consuming supplement.

### parent — Keune's injection for the Picard group of cyclotomic S-integers into K₂(O_F)

ArithmeticKTheory:N.6/keune-cyclotomic-picard-injection supplies the required contract on twisted Pic/p^m coinvariants. Its original-source proof and exact hypothesis translation remain obligations there. Finite-module vanishing, weight-one Kummer p-units and total-ramification valuation descent are the exact HB.1 refinement targets.

Consumers: [HabiroNumberFields:HB.1/units-realise-c-zeta](../readmes/HabiroNumberFields.md#HB-1-units-realise-c-zeta).

### parent — The sign of the comparison scalar

Raw Soulé and the independently negated degree-(2,1) map are fixed by HB.2/eta-chern-signed-evaluation. The actual CGZ/GSWZ edge/boundary map and Suslin/Hurewicz compatibility still require the separate source comparison recorded in the HB.2 supplement. Squaring an inverted class inverts ε_m; its normalization cannot be chosen by the eta value.

Consumers: [HabiroNumberFields:HB.2/chern-sign-conventions](../readmes/HabiroNumberFields.md#HB-2-chern-sign-conventions), [HabiroNumberFields:HB.2/chern-class-of-eta](../readmes/HabiroNumberFields.md#HB-2-chern-class-of-eta), [HabiroNumberFields:HB.2/hutchinson-refinement](../readmes/HabiroNumberFields.md#HB-2-hutchinson-refinement).

### parent — Theorem 2 beyond the multiplication map

The parent ring-case node supplies equality at degree zero and actual multiplication. Effective additive descent, finite projectivity, actual chart base changes and conservativity are HB.7/followup-effective-global-descent. Tensor bijectivity and Σ f_i g_i=1 depend on that exact target; Picard coherence then follows. G-global-descent remains open and E23 is not resolved.

Consumers: [HabiroNumberFields:HB.7/the-ring-case-and-tensor-products](../readmes/HabiroNumberFields.md#HB-7-the-ring-case-and-tensor-products), [HabiroNumberFields:HB.7/what-the-local-picture-does-not-give](../readmes/HabiroNumberFields.md#HB-7-what-the-local-picture-does-not-give).

### parent — Scalar extension, Galois action and transfer compatibility have no source

The exact own targets are HB.7/followup-field-pullback, followup-scalar-equivalence, followup-galois-action, followup-local-norm-defect and followup-transfer-norm. G-arithmetic-naturality and the requested D.1/D.4/early-M.8 comparisons remain explicit. HR.6 consumes HB.7 and is not a supplier of these missing proofs.

Consumers: [HabiroNumberFields:HB.7/operations-on-the-modules](../readmes/HabiroNumberFields.md#HB-7-operations-on-the-modules).

### parent — Theorem 10 and the corrected shape of invertible sections

HB.7/followup-half-shift-first-jet and followup-integral-linear-jet give the branch-one integral linear coefficient, including even-root tests. The higher half-shift Frobenius-defect proof and valid presentation independence remain G-inherited-local-inputs in the HB.7 supplement. Keep the corrected integral linear shape and source issue E24.

Consumers: [HabiroNumberFields:HB.7/pochhammer-sections](../readmes/HabiroNumberFields.md#HB-7-pochhammer-sections), [HabiroNumberFields:HB.7/local-freeness](../readmes/HabiroNumberFields.md#HB-7-local-freeness), [HabiroNumberFields:HB.7/followup-integral-linear-jet](../readmes/HabiroNumberFields.md#HB-7-followup-integral-linear-jet).

### parent — CGZ Theorem 7.4, R_ζ(η_ζ) = ζ², is proved only through Nahm-sum asymptotics

HabiroNahmSeries:HB.4/acceptance-andrews-gordon supplies R(η)=ζ² through HB.4/andrews-gordon-radial-constant. Since HB.4 consumes HB.2, assemble the unconditional R=c² conclusion at existing HB.5 with the actual source-sign comparison and CRT. HB.2/hutchinson-refinement supplies only the conditional algebraic implication. HB.9/constant-term-is-the-unit consumes the late result or discharges those premises; its integration is a request to the Nahm owner.

Consumers: [HabiroNumberFields:HB.2/hutchinson-refinement](../readmes/HabiroNumberFields.md#HB-2-hutchinson-refinement).

### parent — Early M.8 supplier must be split before it can be a dependency

The generic finite-coefficient étale Chern classes is requested through M.8 but requires a separately accepted early prefix. Do not add the whole M.8→consumer edge: it imports late D.2/R.7 work and can close a cycle. No new stage ID is fabricated here.

Consumers: [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](../readmes/HabiroNumberFields.md#HB-1-finite-coefficient-K3-and-the-chern-class), [HabiroNumberFields:HB.1/hutchinson-chern-class-agrees](../readmes/HabiroNumberFields.md#HB-1-hutchinson-chern-class-agrees), [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](../readmes/HabiroNumberFields.md#HB-1-the-chern-class-map-c-zeta), [HabiroNumberFields:HB.2/bott-element](../readmes/HabiroNumberFields.md#HB-2-bott-element), [HabiroNumberFields:HB.2/chern-sign-conventions](../readmes/HabiroNumberFields.md#HB-2-chern-sign-conventions), [HabiroNumberFields:HB.2/soule-formula-in-degree-three](../readmes/HabiroNumberFields.md#HB-2-soule-formula-in-degree-three).

### HB.1 — Keune original-source and exact-hypothesis verification at the existing owner

The exact injection is imported from ArithmeticKTheory:N.6/keune-cyclotomic-picard-injection in ArithmeticKTheory--N.1.json. CGZ published Lemma 3.5, pp.402–403, has been read. The original Keune K-Theory 2 (1989), 625–645, DOI 10.1007/BF00535049, could not be accessed through the publisher DOI/PDF and no public author copy was obtained. The supplier explicitly leaves its original proof and hypothesis translation open. Verify them in N.6; do not count this citation as a completed proof or replace it by the M.3 K₂ comparison.

Consumers: [HabiroNumberFields:HB.1/keune-picard-eigen-obstruction](../readmes/HabiroNumberFields.md#HB-1-keune-picard-eigen-obstruction), [HabiroNumberFields:HB.1/ordinary-unit-eigenclass-lift](../readmes/HabiroNumberFields.md#HB-1-ordinary-unit-eigenclass-lift), [HabiroNumberFields:HB.1/units-realise-c-zeta](../readmes/HabiroNumberFields.md#HB-1-units-realise-c-zeta).

### HB.1 — Early finite-Chern supplier prefix is not yet an accepted stage

The accepted owner M.8 still carries late D.2/R.7 inputs. Its requested early prefix must be split/accepted and its precise node IDs substituted at the inherited interfaces. No new stage ID and no whole-M.8 prerequisite edge is fabricated in this packet.

Consumers: [HabiroNumberFields:HB.1/ordinary-unit-eigenclass-lift](../readmes/HabiroNumberFields.md#HB-1-ordinary-unit-eigenclass-lift), [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](../readmes/HabiroNumberFields.md#HB-1-finite-coefficient-K3-and-the-chern-class), [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](../readmes/HabiroNumberFields.md#HB-1-the-chern-class-map-c-zeta), [HabiroNumberFields:HB.1/hutchinson-chern-class-agrees](../readmes/HabiroNumberFields.md#HB-1-hutchinson-chern-class-agrees).

### HB.2 — Acyclic common analytic supplier exports

The published GZ appendix is read and its normalization corrections and final algebra are given here. The two-sided uniform residue/tail estimates and common q-product limits are not provided by QM.0’s existing formal-series node. Its request states exactly what is needed; move the generic part out of HB.4 rather than importing HB.4 into HB.2. The classical complex five-term identity is likewise requested from P.1. Numerical checks do not discharge these analytic obligations.

Consumers: [HabiroNumberFields:HB.2/kms-odd-order-proof](../readmes/HabiroNumberFields.md#HB-2-kms-odd-order-proof).

### HB.2 — Early finite Chern owner and source sign compatibility

M.8 is still an unsplit late stage; the early prefix is a restructuring request, not a current dependency. Raw Soulé gives ζ⁻¹, while the independently negated map gives ζ. Parent E14 remains unresolved as a CGZ/GSWZ normalization comparison. Compare the actual étale-K-theory edge/boundary maps and Suslin/Hurewicz convention with the raw finite Chern class. Until then retain sign-qualified scalar statements; no arbitrary normalization chosen by evaluating η identifies the published map.

Consumers: [HabiroNumberFields:HB.2/eta-chern-signed-evaluation](../readmes/HabiroNumberFields.md#HB-2-eta-chern-signed-evaluation).

### HB.2 — Inherited Bass–Tate proof closure

The degree-three result is supplied by V.2/milnor-k3-number-field, which imports T.2:symbols/milnor-number-field. The latter explicitly retains G-Bass-Tate. This pass imports that gap instead of claiming its arithmetic proof is supplied. The request specifies real-place and Hilbert/global-K₂ inputs, the product consequence, and a rescope of the arithmetic proof after T.7 to avoid a T.7→T.2:symbols cycle.

Consumers: [HabiroNumberFields:HB.2/eta-chern-signed-evaluation](../readmes/HabiroNumberFields.md#HB-2-eta-chern-signed-evaluation).

### HB.7 — Effective global descent, beyond local freeness

Inherited HabiroNumberFields/E23 remains unresolved. Construct a linear descent datum, prove it equals Definition 1.4 including additive closure, prove finite presentation/projectivity, identify actual tensor base changes, and prove charts conservative. A finite sum f_i g_i=1 must follow for every ξ, not just Nahm classes. GSWZ v2 §3.3 only establishes a multiplication map. Wagner thesis §2.2 describes the ring equalizer and cites the Picard map in its introduction but gives no missing indexed-line proof in the passages read. No alternative complete proof was found in the 2026-10-06 source search. This gap prevents claiming any global tensor or scalar equivalence unconditionally.

Consumers: [HabiroNumberFields:HB.7/followup-effective-global-descent](../readmes/HabiroNumberFields.md#HB-7-followup-effective-global-descent), [HabiroNumberFields:HB.7/followup-tensor-bijectivity](../readmes/HabiroNumberFields.md#HB-7-followup-tensor-bijectivity), [HabiroNumberFields:HB.7/followup-picard-character](../readmes/HabiroNumberFields.md#HB-7-followup-picard-character), [HabiroNumberFields:HB.7/followup-scalar-equivalence](../readmes/HabiroNumberFields.md#HB-7-followup-scalar-equivalence), [HabiroNumberFields:HB.7/followup-transfer-norm](../readmes/HabiroNumberFields.md#HB-7-followup-transfer-norm).

### HB.7 — Arithmetic torsor naturality and coherent norm transport

GSWZ has no scalar-extension, coefficient Galois, or K₃ transfer theorem. Establish requested D.1/D.4 scalar, Frobenius and trace identities and M.8 finite-Chern restriction/corestriction on the full cyclotomic algebras, with ε_m=c_m² and torsor-level coherence at every m. Check integral lattices, p-unit representatives and all factors. Then prove coefficient maps and rational/local series norms preserve the exact gluing; the proof outlines here specify these missing comparisons rather than assigning them to HR.6, which already consumes HB.7.

Consumers: [HabiroNumberFields:HB.7/followup-field-pullback](../readmes/HabiroNumberFields.md#HB-7-followup-field-pullback), [HabiroNumberFields:HB.7/followup-galois-action](../readmes/HabiroNumberFields.md#HB-7-followup-galois-action), [HabiroNumberFields:HB.7/followup-local-norm-defect](../readmes/HabiroNumberFields.md#HB-7-followup-local-norm-defect), [HabiroNumberFields:HB.7/followup-transfer-norm](../readmes/HabiroNumberFields.md#HB-7-followup-transfer-norm).

### HB.7 — Uncompleted local analytic and presentation inputs

D.1, D.3 and D.4 remain requested stages, not implementations. The accepted pochhammer-dwork-difference and pochhammer-sections nodes retain the half-shift Frobenius-defect proof and presentation-independence obligations; the new finite-jet derivation supplies the integral linear term only. Source issue E24 still requires the corrected shape. E26, the global abelian generator claim, remains unproved and is not used here.

Consumers: [HabiroNumberFields:HB.7/followup-half-shift-first-jet](../readmes/HabiroNumberFields.md#HB-7-followup-half-shift-first-jet), [HabiroNumberFields:HB.7/followup-integral-linear-jet](../readmes/HabiroNumberFields.md#HB-7-followup-integral-linear-jet), [HabiroNumberFields:HB.7/followup-effective-global-descent](../readmes/HabiroNumberFields.md#HB-7-followup-effective-global-descent).

## Where to resume

The assembly deliverables are complete. The orchestrator should arrange the parent
re-review, retain the HB.2 revision outcome, and route the collected owner requests.
Implementation starts from the definitive reader's exact node dependencies. Full Lean
checking can resume once the existing shared build contains the pinned Tau Ceti imported
object files. No result or source text needed for that work depends on this run's scratch
space; it is deleted after the PR opens.
