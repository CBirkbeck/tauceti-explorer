# ASM-ColemanPowerSeries — completed assembly

Issue: #6416. Worker: Codex, session `codex-k6iBhj`. Date: 18 October 2026.

The assembly is complete. The roadmap remains a plan with explicit supplier
interfaces; no layer is claimed closed and every implementation status remains
`unchecked`. No review verdict or source-finding verdict was changed.

## What is assembled

The single reader contains all 482 targets (300 parent, 140 L0, 42 L1), all
336 API items and 348 checks, with hypotheses, mathematical proof routes and
source locators. These include 86 definition/construction targets. The packet
checker counts only API/check entries attached to definitions/constructions:
329 API items and 266 checks; the reader also retains those attached to other
node kinds. Stable node ids and fully qualified declaration names are retained.

The introduction reconciles root indexing, valuation normalizations, base-valued
norm and trace, coefficient versus substitution Frobenius, the all-prime signed
Tate convention, the two interpolation twists, the raw Coleman sign, and the
first-moment endpoint. It distinguishes finite unramified arithmetic coefficients
from finite-flat tensor change. Layers are ordered by their combined dependencies.
The reviewed L0 and L1 six-planet selections replace the parent's selections;
L2–L4 retain their 4, 4 and 5 planets. There are 25 planets in total.

The suggested file has one note and import block. The current WORKERS.md shape
rule supersedes the older instruction to concatenate placeholder constructions:
only light definitions have real bodies, with representative layer milestones
and examples on native carriers. The remaining data constructors are named in
its final comment and fully specified in the reader. This deliberately removes
sorry-valued data rather than manufacturing new carriers to make signatures fit.
Part readers and suggested files are untouched.

## Reviewed mathematics changed: schedule proof-route re-review

Statements, hypotheses, acceptance conditions, API items, checks, library names,
and all three review objects are unchanged. Five reviewed proof routes and their
direct prerequisites changed; these changes should be re-reviewed:

1. `ColemanPowerSeries:L0/unit-norm-residue` specializes
   `L0/unramified-coefficient-norm-residue` at E=ℚ_p, uses `ZMod.pow_card`,
   and transports through `unramified-base-integer-equivalence` and
   `unramified-base-principal-equivalence`. This removes the former forward
   dependency on L1 arithmetic norm evaluation. Both transported norms restrict
   the same native field norm.
2. `L1/norm-fixed-evaluation-closed-image`, `L1/compact-interpolation-fibers`
   and `L1/coleman-equivalence-homeomorphism` specialize
   `L1/unramified-unit-space-compact` at O=ℤ_p, σ=id. Their scalar algebra,
   determinant norm and equalizer agree with the original carriers. The former
   Layer 3 compactness dependency is unnecessary.
3. `L2/raw-coleman-continuity` uses `L3/psi-fixed-boundary` and the exact PMIA
   `L2/phi-psi-series-continuous` target. On the fixed submodule the boundary
   is id−φψ, so its continuity does not require the whole L3 topological sequence.

The source labels and statements remain unchanged. The proof-route changes do
not assert any previously missing arithmetic adapter.

## Cross-part resolution and residual gaps

All already supplied cross-part facts have exact node references. The ten L1
stage-level L0 references now have an explicit consuming gap `L1/G1`, refining
`L0/G1`: after the absolute integral basis and relative field polynomial, supply
the relative **integral** basis ρ_(n+1)^i, i<p, coherent native integer-ring and
evaluation structures, integral/field norm and trace comparisons,
Frobenius/norm commutation and polynomial unit lifts. The absolute integral
basis of dimension d_n does not install the relative basis. No norm-evaluation
square or interpolation result is taken as a supplier hypothesis. Any absent
general chosen-generator theorem belongs in LocalFieldsRamification Part II;
the arithmetic specialization belongs here.

`L0/G2` retains the Dirac-preserving continuous algebra comparison between PMIA
weak measures and native `completedGroupAlgebra ℤ_p Γ`. The latter's action is
already implemented in current Tau Ceti. Canonical local-field receiver diamonds,
the independent PMIA ψ coefficient/receiving-topology adapter, the higher-layer
finite-flat comparisons, and the actual plus quotient/global cyclicity receivers
remain explicit. The old “unread original Coleman” parent gap is removed because
the accepted L0/L1 refinements provide that decomposition; this does not close
its arithmetic receiving-interface gaps.

## Ownership and restructure notes

The parts contain no nonempty `restructure` proposal. No ownership, stage id or
node id was moved in this assembly. Two points should guide subsequent packaging:

- The elementary `L3/psi-fixed-boundary` construction is used by the L2 raw map.
  The reader displays it at first use in Layer 2 and refers back to it from
  Layer 3. Its packet id, parent stage and realisation stay unchanged. A later
  approved restructuring can move this elementary construction to L2 while
  retaining its range, kernel and exactness theorems in L3.
- The historical ProfiniteProPGroups Layer 4 scalar reference resolves to
  **ProfiniteArithmetic §1.3** and current `TauCeti.IsProP.module`. Product and
  subgroup pro-p closure, p-adic powers and completed actions already exist;
  import them and verify their arithmetic receiving hypotheses. The request
  is for transport/comparison at the approved supplier revision, not another
  construction of these generic objects.

Current read-only upstream revisions checked: TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The implementation baseline remains
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Current-only declarations are not
claimed present at that baseline.

## Collected supplier requests

The following is the complete request inventory, grouped by original packet.
The packets retain exact consumer lists and remain authoritative. Overlapping
requests refer to the same owner interface; they do not authorize duplicate
planning. `ColemanPowerSeries:L0` in L1 means only the residual relative
arithmetic adapter above; the supplied L0 nodes are referenced separately.

### Parent packet (13 requests)

1. **`tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.** Finite extensions of ℚ_p as local fields with integer-ring/residue-field structures and e·f=[L:K], sufficient to instantiate K_n.

2. **`tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.** Finite-level Teichmüller splitting of local units, compact principal units and their pro-p structure; Coleman must still prove norm compatibility of the splitting.

3. **`tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.** Supply the owner’s comparison of the specified cyclotomic normed fields with its named canonical local-field structures and normalized valuation, and interpret the already established (p)=m_n^(d_n), residue field ZMod p and degree d_n as the intrinsic ramification specialization. The cyclotomic native integral closure now equals the native norm valuation ring; its maximal ideal, reduction kernel and ideal-power topology are identified. Do not rebuild these cyclotomic objects or native series evaluation.

4. **`tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.** Unramified extensions/composita and the Frobenius interface for the coefficient variant.

5. **`tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets`.** Use the existing current ProfiniteArithmetic §1.3 interface and TauCeti.IsProP.module for the functorial continuous ℤ_p-module structure on abelian pro-p groups. Verify its hypotheses and arithmetic naturality on the actual principal-unit norm limit; this is a receiving-interface request, not a request to construct the generic scalar action again.

6. **`PadicMeasuresIwasawaAlgebras:L1`.** Continuous completed-group-algebra action from the verified continuous G-action on the compact principal-unit module, including coefficient change. Supply the completed action on the verified compact principal module, the quotient G⁺=ℤ_pˣ/⟨−1⟩ algebra and weak finite-coordinate compactness/surjectivity, e⁺Λ(G)≃Λ(G⁺) with identity e⁺, and procyclic principal augmentation for the given dense integer-power generator. These generic statements stay at PMIA; Coleman proves their actual arithmetic applications.

7. **`PadicMeasuresIwasawaAlgebras:L2`.** Receiving finite-extension integer-ring instances and their integral-lattice/scaling and measure-topology comparisons for bounded Amice operators, plus unit-dilation pushforward versus formal binomial substitution. On the actual Z_p domain with Q_p coefficients, the bounded Amice norm isometry, integral image equal to the closed rational-dual unit ball, and common p-power denominators now have exact supplier nodes. General finite-extension compatibility remains required. The actual Z_p-unit-domain/Q_p-coefficient extension, lattice, norm, restriction and common-denominator comparisons now have exact supplier nodes. Coleman supplies its own normalized-trace/psi comparison; The determinant/product comparison is now supplied by exact local nodes; arithmetic-action comparisons remain local obligations. The specialized intrinsic unit-weighting/first-moment comparison is now supplied by ColemanPowerSeries:L3/intrinsic-unit-weighting-comparison using exact PMIA nodes; it is no longer requested.

8. **`PadicMeasuresIwasawaAlgebras:L5`.** Compact inverse-limit exactness, finite-flat tensor exactness and completed-tensor comparisons with the actual hypotheses used by Theorem 12.17.

9. **`IntegralIwasawaTheory:L0`.** Elaborate the exact global cyclic-generation and smoothed-cyclotomic-unit interfaces on the actual supplied global carrier; retain their torsion and conductor hypotheses. The global orbit-generation theorem is already an exact supplier node, not a missing theorem to re-plan locally.

10. **`PadicMeasuresIwasawaAlgebras:L0`.** Extend the supplied ambient and actual unit-domain Z_p/Q_p integral-lattice, norm, closed-image and common-denominator comparisons to the finite-flat coefficient lattices required by Coleman, with their restriction/extension and completed-tensor topology comparisons. Do not request the now supplied actual Z_p-unit-domain/Q_p case.

11. **`tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`.** Use the existing current Tau Ceti arbitrary-product and subgroup closure theorems for native IsProP, with their compact Hausdorff hypotheses, on the actual closed norm-compatible subgroup of the product of finite local principal unit groups. Verify the arithmetic receiving structures; coordinate surjectivity is not required. No generic pro-p closure theorem is missing or replanned here.

12. **`PadicMeasuresIwasawaAlgebras:L3`.** Provide the exact quotient-group plus comparison for the arithmetic pseudomeasure: after e⁺Λ(G)≃Λ(G⁺), the independently normalized ζ_p and all its integral numerators descend compatibly. Generic fraction/plus comparison is not constructed in Coleman.

13. **`DirichletPadicLFunctions:L1`.** Supply compatibility of the exact arithmetic numerator λ_a=([a]−1)ζ_p with the generic plus quotient of G and its independently normalized pseudomeasure; the signed numerator on G is already an exact node and is retained.

### L0 arithmetic refinement (8 requests)

1. **`tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.** Use the canonical finite-intermediate-field local-field, valued/normed/topological structures, their topology and algebra diamonds, integer-ring/integral-closure comparison, continuous actual field norm and its integral-unit corestriction; residue scalar inclusions and e/f tower formulas. The proof uses these declared owner interfaces; the pin does not already provide them automatically on E(ρ_n).

2. **`tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.** Use the native equivalence of residue-one integer units with unitFiltration K 1, its compact profinite topology and IsProP theorem. This supplies the actual arithmetic coordinates, without a principal-unit type replacement.

3. **`tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.** Use unramifiedness as e=1, scalar residue maps, arithmetic Frobenius on E/ℚ_p with residue r↦r^p, its order f and functoriality under actual ℚ_p field isomorphisms. The tower-specific fixed-root extension is this packet’s construction.

4. **`tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.** Use the existing Eisenstein integral-generator, power-basis, uniformizer and total-ramification contracts and norm naturality on the actual finite fields. Supply any absent integral generation theorem in LocalFieldsRamification Part II, not as a duplicate generic theorem here.

5. **`tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`.** Use the already implemented current TauCeti arbitrary-product and subgroup IsProP closure theorems, with compact Hausdorff hypotheses. The pinned IsProP.pi only covers finite index sets and cannot justify the countable tower by itself.

6. **`tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets`.** Resolve the historical scalar supplier to current ProfiniteArithmetic §1.3 and TauCeti.IsProP.module in Topology/Algebra/Group/Profinite/ProP/PadicPow. Import its naturality and joint-continuity interface on Additive of the actual compact abelian principal pro-p group; do not construct a second scalar module.

7. **`PadicMeasuresIwasawaAlgebras:L1`.** Identify the accepted weak-measure completed algebra with the current native completedGroupAlgebra ℤ_p Γ by a continuous ℤ_p-algebra isomorphism taking each Dirac measure to completedGroupAlgebra.of ℤ_p Γ. Transport the existing IsProP.completedGroupAlgebraModule across it and prove scalar, group-generator and continuity comparisons. No abstract module existence assumption replaces this arithmetic adapter.

8. **`tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.** Consume semilocalEquiv and integralSemilocalEquiv of the actual completion tensor and its integral model, including pure-tensor/projection formulas and the induced Galois factor isomorphisms. The finite product and norm limits in this packet are their cyclotomic specialization, not a second completion/tensor construction.

### L1 unramified interpolation refinement (4 requests)

1. **`tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.** Native finite-extension integer rings, complete compact Hausdorff adic topologies, finite free ℤ_p structure of the unramified integer ring O, and closed p-power ideals with p-adic error convergence. Use the existing local-field ownership and native valuation ring/integral closure comparison.

2. **`tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.** Canonical arithmetic p-Frobenius σ of finite unramified E/ℚ_p and its restriction to O, continuity, σ(p)=p, and residue action x↦x^p. The current library has this beyond the pinned baseline; use the roadmap input rather than replan it.

3. **`ColemanPowerSeries:L0`.** Reuse L0 unramified-coefficient-level, -degree, -integral-basis, -unit-norm, -frobenius, -frobenius-inclusion, -unit-limit and -series-point; they already plan the arithmetic tower, roots, degree, Frobenius and norm equalizer. Remaining specialization interface: transport their valuation-ring objects to integralClosure O E_n by LocalFieldsRamification integerRing_eq_integralClosure, with coherent inclusion/scalar/valuation/topology instances; continuous native eval₂Hom in the coefficient topology; the relative integral basis ζ_(n+1)^i (i<p), refined from the relative minimal polynomial X^p−ζ_n and total ramification; native integral norm/trace agreement with field norms/traces and σ_n commutation with relative norms; polynomial unit lifts at π_n with unit constant term. These adapters must be checked on the actual fields, not supplied by an uncharacterized carrier or an assumed L1 evaluation square. The accepted L0 G1 receiver/basis refinement remains open; existing absolute-basis nodes are not the relative-basis adapter.

4. **`PadicMeasuresIwasawaAlgebras:L2`.** Coefficient-extend the existing integral bounded ψ operator and its Amice realization to O: a continuous O-linear ψ_O on O[[T]], with ψ_O(Y^m)=Y^(m/p) when p divides m and zero otherwise. Use the existing integral-coefficient-extension and coefficient-extension-amice nodes; provide the receiving-ring topology/lattice adapter for finite unramified coefficients. Do not identify ψ_O with trace as an input.

## Source checks and provenance

The assembly freshly checked Coleman, *Division Values in Local Fields*,
printed p.98 and pp.102–106 in the journal scan: Theorem 4/Corollary 5(i),
Theorem 11/Corollary 12(ii), Lemma 13/equation (2), Proposition 14,
Theorems 15–16 and Corollary 17. In particular the norm-evaluation locator
is Corollary 12(ii), and the inverse interpolation twist is negative Frobenius.

Rodrigues Jacinto–Williams, published pp.165–170 and pp.179–180, was checked
for the interpolation/root-product and arithmetic sign conventions. Its PDF
hash matches the reviewed version. Sharifi's author PDF was checked in §5.4,
printed pp.143–147. The 18 October bytes have SHA-256
`e5308be4c3d9ded6002cefb50df64b31f62b584b6ff68be7f21dc939f2508c26`,
different from the reviewed snapshot, with the same numbering and identified
indexing/product/coefficient-Frobenius slips. Both provenance records remain;
no earlier verdict was reassigned to a new version. The inherited
Coates–Sujatha audit was retained without claiming a fresh book reading.
All source descriptions in the reader are mathematical paraphrases with
locators; no source passages were added.

## Validation and next step

- All three `scripts/check_blueprint.py` runs: zero errors and zero warnings.
- Inventory parity: 482 ids, all statements/hypotheses/acceptance/API/checks and
  library names, three review objects and all source-finding reviews preserved.
- Combined exact-node dependency closure: 745 reachable nodes, 1,730 edges,
  acyclic, no unresolved exact-node references. Stage requests remain explicit
  leaves; this does not certify that their open interfaces are implemented.
- `lean-check research/blueprint/suggested/ColemanPowerSeries.lean`: exit 0,
  with `sorry` as the only warning, at the pinned baseline. The final file has
  403 lines and seven light definitions with real bodies. Algebraic and
  topological hypotheses are explicitly retained in the representative signatures.
- Submission-file check: six files, zero problems. `git diff --check`: clean.
- Reader anchor check: 482 unique target anchors and 1,131 resolved internal
  target/receiver links.

The next action is independent review of this assembly, concentrating on the
five proof routes listed above and the relative arithmetic receiver gap. This
is a finished assembly submission, rather than a checkpoint or a claim that the
underlying supplier obligations have been implemented.
