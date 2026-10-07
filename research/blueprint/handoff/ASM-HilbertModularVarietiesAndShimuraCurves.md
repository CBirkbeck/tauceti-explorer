# ASM-HilbertModularVarietiesAndShimuraCurves

Agent: Codex — `codex-40DqVa`. Issue: [#239](https://github.com/CBirkbeck/tauceti-explorer/issues/239).
Status: assembly complete. This is a finished assembly, not a checkpoint.

## Delivered

The full reader joins H0–H6 and R18.1–R18.6 with shared purpose, boundaries,
notation, versioned bibliography, layer overview, baseline, declaration plan,
producer contracts, closure ledger and source corrections. It carries the reviewed
packet statements rather than the older part-document renderings: all 133 nodes,
206 API items, 157 tests and 59 planets are present. R18.6 remains an export index.
Twelve mathematical layers are planned; none is closed. No implementation is claimed.

The full suggested file joins the two reviewed bodies with 22 distinct imports
in one block and one standard note. Namespaces remain `TauCeti.HilbertModular`
and `TauCeti.Blueprint.Quaternionic`. Available Mathlib prototypes elaborate;
the unavailable geometric carriers remain exact, explicitly omitted contracts.
The positive-unit subgroup P remains parameterized because the compiled Tau Ceti
positive-unit module is absent from the shared build. No library was rebuilt.

The H0 packet and both part documents and part suggested files are unchanged.
The only changed part packet is R18.2. Both independent review objects and all
node statements, hypotheses, API items, tests, source findings and implementation
statuses are preserved.

## Cross-part reconciliation and review impact

Five whole-R18.1 prerequisite entries are replaced by exact suppliers:

| Consumer | R18.1 supplier(s) |
| --- | --- |
| R18.2/quaternion-pel-instance | yz-pel-instance; canonical-quaternionic-curve |
| R18.2/effective-small-level | quaternionic-effective-stabilizers |
| R18.2/quaternion-pdiv-tower | canonical-quaternionic-curve; effective-small-level imports the stabilizer result |
| R18.2/bridge-tate-comparison | yz-torus-bridge |
| R18.5/totally-real-uniformisation | canonical-quaternionic-curve; quaternionic-reflex-dimension |

R18.2/connected-pel-comparison and /finite-pel-comparison explicitly import
R18.1/yz-component-comparison. The effective-small-level proof route now reuses
the existing stabilizer theorem instead of outlining the same proof again.
Its target statement and hypotheses are unchanged; it is a local-tower application
of the single geometric supplier, with its existing node ID retained.

**Mathematical closure change requiring attention:** the geometric supplier only
provides a comparison over a common algebraic closure and explicitly leaves its
Carayol descent field unresolved. It cannot discharge the R18.2 targets over
K=completion of F_v^ur. A new gap in the consuming packet, “Cross-part
connected-comparison descent over K”, records this mismatch for connected and
finite-level comparison and the integral-uniformisation transfer. The R18.2 and
R18.5 completion requirements include it. The comparison proof routes state the
remaining obligation. No theorem statement is strengthened or weakened, and no
new proof of descent is asserted. The orchestrator should re-review these changed
dependency/proof-closure routes if required; the recorded accepted verdicts have
not been edited. BZ's uniformisation theorem is unchanged.

The two obsolete intra-roadmap stage requests (R18.1 and H6) are removed.
The H6 export now names `HilbertModularVarietiesAndShimuraCurves:H6/moret-bailly-input-export`
and explicitly retains Taylor's structured-realization and Allen's finite-local
pairing gaps. Nothing claims unconditional prescribed local points.

The removed R18.1 request also mentioned CM alignment/point cases and the
height-erratum graph-of-different-torsion kernel. Those are not additional inputs
used by its five listed consumers and are not supplied by the H0 node list.
The source-routing table retains their ownership; the assembly does not silently
claim a height or graph-kernel theorem. A future CM/height consumer must name an
actual supplier node or record its own gap. No new mathematics is invented to
satisfy that overbroad request.

The two packets reuse source-issue IDs such as `<roadmap>/E1`. The reader qualifies
them as H0/E1 and R18.2/E1 and links to the respective packet evidence. They remain
part-local; no combined packet or new source finding is created by this assembly.
The existing correction-version and independent-confirmation records remain intact.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/HilbertModularVarietiesAndShimuraCurves--H0.json`: 0 errors, 0 warnings.
- The same check on `HilbertModularVarietiesAndShimuraCurves--R18.2.json`: 0 errors, 0 warnings.
- Combined dependency traversal: 133 nodes, acyclic, every same-roadmap prerequisite is an existing exact node ID; no blanket same-roadmap stage prerequisite remains.
- Reader/packet/suggested coverage: all 133 target statements, 206 API names and 157 test names represented; reader API/test statements agree with the packets; all internal reader anchors resolve.
- Joined Lean bodies retain the reviewed native signatures and ledgers. Exactly one standard note and 22 unique imports.
- `lean-check research/blueprint/suggested/HilbertModularVarietiesAndShimuraCurves.lean`: exit 0, 117 `declaration uses sorry` warnings, no other diagnostics. Available memory exceeded 20 GB before compilation. The shared Mathlib checkout is exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti declarations were read at `f790474821cf4256814db967cb154e7af3d0c369`; the joined prototype imports only Mathlib because the required compiled Tau Ceti modules are unavailable. The advanced omission ledgers were not elaborated as signatures.
- `python3 research/blueprint/intake.py check-files` on the four changed deliverables: 0 problems; no private paths.
- All 31 distinct cited baseline declarations were read at the pins using the existing shared checkout. The reviewed library audit, accepted RS-23 ownership, both independent reviews and their handoffs were consulted. Upstream comparison documents: JacobianChallenge and RepresentationTheory.

The new consuming gap leaves 15 recorded gap entries across the parts (8 H0,
7 continuation; some are propagated obligations). It does not make an otherwise
closed layer open: no input layer was certified closed.

## Producer worklist

These are all 54 remaining external request entries: 18 Hilbert and 36
quaternionic. Repeated suppliers carry distinct contracts and consumers; a producer
must satisfy both relevant contracts, not merely their common stage label.
The two reconciled intra-roadmap requests are accounted for above.

### H0 supplier requests

1. **`AbelianSchemesAndArithmeticModuliPartII:F3`** — Import the reviewed honda-tate node for the underlying finite-field isogeny class. Extend its realization contract to the specified O-action, ordinary slopes and ordered polarization used by Taylor Lemma1.3; the unpolarized simple-class classification alone does not supply this structured witness. Keep Honda existence proof with this owner.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:H6/hilbert-finite-local-points`.

2. **`AbelianSchemesAndArithmeticModuli:A1`** — Relative abelian-scheme/group-over-base carrier, endomorphism sheaf and real-multiplication action, base change and rigidity for the N≥4 Hilbert tame marking. Reuse the pinned Scheme and Tau Ceti group-object/abelian-variety carriers; an abelian variety over a field is not yet this relative object.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:H1/symmetric-polarizations`.

3. **`AbelianSchemesAndArithmeticModuli:A2`** — Dual abelian scheme with biduality, symmetric O-linear Hom sheaf, positive polarizations from ample bundles, Rosati fixing O, and pullback compatibility. The existing rosati-involution node is imported, but alone does not provide this relative dual/polarization package.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:H1/symmetric-polarizations`.

4. **`AbelianSchemesAndArithmeticModuli:A3`** — Serre tensor A⊗_O c for invertible modules; Cartier-dual finite-flat torsion and perfect Weil pairing; quotients by finite locally free O-stable subgroups and dual-isogeny/polarization descent. Supply all pairing twists and quotient base-change maps used here, including the μ_N versus marked-point isogeny comparison.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:H1/symmetric-polarizations`, `HilbertModularVarietiesAndShimuraCurves:H1/c-polarization`, `HilbertModularVarietiesAndShimuraCurves:H1/tame-level-functors`, `HilbertModularVarietiesAndShimuraCurves:H1/linear-weil-pairing`, `HilbertModularVarietiesAndShimuraCurves:H3/hilbert-hecke-isogenies`, `HilbertModularVarietiesAndShimuraCurves:H4/hybrid-full-level`, `HilbertModularVarietiesAndShimuraCurves:H4/integral-gamma0`.

5. **`AbelianSchemesAndArithmeticModuli:A4`** — Hodge exact sequence with O-action and the Lie characteristic polynomial, polarized O-linear Grothendieck–Messing comparison with the Hilbert local model, and Serre–Tate deformation equivalence retaining endomorphisms and c-polarization. For the ordinary H6 construction include the lift of the finite extension class with its sign and local character twists.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:H1/hilbert-determinant`, `HilbertModularVarietiesAndShimuraCurves:H2/dp-flat-normal`, `HilbertModularVarietiesAndShimuraCurves:H2/dp-determinant-all-bases`, `HilbertModularVarietiesAndShimuraCurves:H2/rapoport-locus`, `HilbertModularVarietiesAndShimuraCurves:H2/ordinary-rapoport`, `HilbertModularVarietiesAndShimuraCurves:H6/hilbert-finite-local-points`, `HilbertModularVarietiesAndShimuraCurves:H6/allen-finite-local-points`.

6. **`AlgebraicModuliForArithmeticGeometry:R09.1`** — Relative rank-g Grassmannian and invariant-subbundle equations: closed representability of O-stability and the self-orthogonal wedge condition, with universal subbundle and arbitrary base change. No abelian moduli construction is requested here.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:H2/dp-local-model`.

7. **`AlgebraicModuliForArithmeticGeometry:R09.3`** — Effective finite étale descent of quasi-projective schemes, actual abelian families, endomorphisms and ordered polarizations under a finite, possibly NONCOMMUTATIVE symplectic Isom-torsor, retaining a descended ample power and universal moduli property. Also algebraic-space descent from the fine full-tame DP presentation. Quasi-coherent module descent and R09.4 commutative torsor twists alone do not supply this.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:H2/dp-integral-model`, `HilbertModularVarietiesAndShimuraCurves:H6/torsion-isom-torsor`, `HilbertModularVarietiesAndShimuraCurves:H6/simultaneous-torsion-twist`, `HilbertModularVarietiesAndShimuraCurves:H6/twisted-component-descent`.

8. **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`** — Grothendieck–Messing with O-endomorphism/polarization structures at p=2 and ramified p, and the finite-flat residual torsion comparison in Allen Lemma7.1.8: supersingular induced type or the indicated ordinary finite H_f extension, with connected–étale orientation. Do not infer every local residual module is realizable.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:H2/dp-flat-normal`, `HilbertModularVarietiesAndShimuraCurves:H6/hilbert-finite-local-points`, `HilbertModularVarietiesAndShimuraCurves:H6/allen-finite-local-points`.

9. **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`** — Per accepted RT-AREA-padic-1/26, generic BT₁ Ha=det(V*) in (detω)^(p−1), its base-change law and intrinsic ordinary criterion at EVERY p including2; polarized O-linear ordinary decomposition sufficient for ω to be rank one over O⊗k. Generic Fargues LF and intrinsic BT₁ Hodge–Tate map remain here; H2 only specializes Ha and its ideal, and T0 owns the boundary extension downstream.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:H2/ordinary-rapoport`, `HilbertModularVarietiesAndShimuraCurves:H2/hilbert-hasse-ideal`.

10. **`AlgebraicModuliForArithmeticGeometry:R09.5`** — Finite effective unit-group quotients in the algebraic-space category, identification of free finite constant group actions with finite étale torsors, their Cartesian base changes and compatible characteristic-zero canonical comparisons. State the scheme/descent hypotheses rather than asserting a universal family on arbitrary coarse quotients; compare the pre-existing finite étale quotient owner.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:H3/arithmetic-quotient`, `HilbertModularVarietiesAndShimuraCurves:H4/arithmetic-full-level`.

11. **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`** — General finite locally free subgroup-scheme/Cartier-dual carrier with rank, O-action, isotropy and base change used for integral Γ₀ levels. The p-divisible-group and Raynaud specialized nodes do not by themselves supply this subgroup parameter functor.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:H4/integral-gamma0`.

12. **`ModularCurvesPartII:R12.2`** — The canonical Q modular curve, its tame μ_N/point-level comparison by quotient and Cartier duality, finite-flat Γ₀ levels and rational split-quaternion identification, all with matching field, marking and effective stabilizers.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:H5/rational-modular-comparison`, `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`.

13. **`AbelianSchemesAndArithmeticModuli:A5`** — Algebraization of the trace-polarized complex/real Hilbert torus, the homological lattice period map and its compatibility with dual/tame/pairing levels. Supply the real involution and polarization-sign computation used to identify paired torsion frames.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:H6/real-torsion-points`.

14. **`ReductiveGroupsPartII:RG2.0a`** — Restriction of scalars, central algebraic-group quotients and fibre products on existing carriers, including Res B×, its norm-one derived group and the quotient (B××E×)/{(a⁻¹,a)} with descended norm/conjugation maps.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-datum`, `HilbertModularVarietiesAndShimuraCurves:R18.1/yz-bridge-groups`.

15. **`tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`** — Existing quaternion algebra, conjugation, reduced norm/trace, real matrix splitting and CM scalar extension comparison used for the quaternionic datum and PEL bridge. Import upstream rather than proposing another quaternion algebra.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-datum`.

16. **`ShimuraVarieties:V8`** — Canonical finite-level models and complex uniformization over the D3 reflex field for the D4 SV1–SV3 quaternionic datum, whose central weight need not be Q-rational; small-level effective quotient, properness and datum-map descent. Existing finite-level-maps/datum-functoriality nodes are used, but do not alone state this canonical-model endpoint.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`.

17. **`ReductiveGroupsPartII:RG2.0`** — Real/local points and their topology on the imported quaternion and restriction-of-scalars algebraic groups, including arithmetic subgroup actions and their scalar kernels.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-effective-stabilizers`.

18. **`ReductiveGroupsPartII:RG2.3`** — Integral quaternion order levels (1+NÔ_B)×, their compact openness and nested-level comparison, with effective rational scalar stabilizers computed separately.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-effective-stabilizers`.

### R18.2 supplier requests

1. **`PELModuli:M0`** — Supply the integral PEL datum carrier with involution, trace/different dual lattice, signatures and determinant condition; the B′ datum here is only an instance.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pel-instance`.

2. **`PELModuli:M1`** — Supply generic PEL functors, O_B-actions, universal abelian schemes and p-divisible torsion sheaves with level-compatible descent. The quaternionic specialization does not reconstruct these carriers.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pel-instance`, `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pdiv-tower`, `HilbertModularVarietiesAndShimuraCurves:R18.2/integral-pdiv`, `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-tate-comparison`.

3. **`PELModuli:M2`** — Supply good-prime PEL representability and the generic basic Rapoport–Zink uniformisation comparison, including p-level structures on the rigid generic fibre and the identification of the universal p-divisible group, with its Hasse-principle/surjectivity and nilpotent-base deformation hypotheses. The latter is a PELModuli Part II extension, not supplied by current M5 examples; BZ §6.2 is the source contract.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pel-instance`, `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`, `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, `HilbertModularVarietiesAndShimuraCurves:R18.5/tower-uniformisation`.

4. **`PELModuli:M4`** — Supply canonical-model comparison, finite normal integral level changes and finite effective coarse quotients; no universal family on an arbitrary normalization is assumed.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`, `HilbertModularVarietiesAndShimuraCurves:R18.2/coarse-model`.

5. **`AdelicAlgebraicGroups:AA.3`** — Supply compactness modulo centre and finiteness of the definite adelic component/class set, with exact rational versus adelic central quotients.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient`.

6. **`AdelicAlgebraicGroups:AA.4`** — Supply strong approximation for quaternion norm-one groups with a noncompact split finite factor, and level-map degrees/effective stabilisers. No false strong approximation for tori is used.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.2/hecke-integral-extension`, `HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient`.

7. **`AdelicAlgebraicGroups:AA.5`** — Supply the definite quaternion compactness/class-set validation. Use AA.3 for general reduction theory and AA.4 for the norm-fibre strong-approximation theorem.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-class-set`, `HilbertModularVarietiesAndShimuraCurves:R18.3/norm-branch`, `HilbertModularVarietiesAndShimuraCurves:R18.3/isotropy-exponent`.

8. **`GL2AutomorphicRepresentationsAndTransfer:R16.2`** — Supply local division-quaternion valuation, maximal compact and scalar-square quotient conventions; the dyadic sign specialization here is arithmetic geometry, not a new local Langlands correspondence.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-sign-extension`.

9. **`GL2AutomorphicRepresentationsAndTransfer:R17.3`** — Supply global JL after excluding norm characters, infinity-weight matching, split Hecke normalization and actual rational models. Add the supplier edge to R18.3 required by RT-AREA-automorphic-1/12; R18.4 inherits it.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.3/norm-branch`.

10. **`AutomorphicFormsOnReductiveGroups:AF.4`** — Supply Sym^{k−2} tensor coefficient lattices, scalar extension, semigroup coefficient action and its perfect-pairing range; quaternionic weight specialization retains all local splitting hypotheses.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.3/quaternion-weight`, `HilbertModularVarietiesAndShimuraCurves:R18.3/integral-pairing`.

11. **`AutomorphicFormsOnReductiveGroups:AF.5`** — Extend the existing AF.5 carrier and evaluation theorem to fixed central character on D×\D_f×/(UZ) with effective Γ_t=(UZ∩t⁻¹D×t)/F×. The existing discrete-centre hypothesis excludes positive-rank O_F×. Supply generic coefficient-function Hecke and level maps and abstract versus acting Hecke algebra; R18.3 only specializes them.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.3/integral-pairing`, `HilbertModularVarietiesAndShimuraCurves:R18.3/split-hecke-normalisation`, `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-degeneracy`, `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-level`, `HilbertModularVarietiesAndShimuraCurves:R18.3/residual-hecke-ideal`.

12. **`AutomorphicBundles:B2`** — Supply rational automorphic line bundles, norm/pullback maps and the generic Hodge/dualizing identification. R18.2 owns its coarse quaternionic branch correction and metric normalization.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line`.

13. **`ArakelovGeometryAndAbelianHeights:R35.2`** — Supply generic hermitian rational lines, arithmetic degree and norm descent of metrics; consume the quaternionic Hodge line without redoing its integral model. Heights and Colmez identity remain here, not in R18.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line`.

14. **`CrystallineCohomology:CR.7`** — Supply strict O_v-relative covariant Dieudonné crystals, special Lie/Hodge filtration and Grothendieck–Messing tangent comparison. At ramified v the raw τ-quotient is nonexact: a saturated relative filtration/determinant theorem is required.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.2/integral-kodaira-spencer`.

15. **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`** — Supply strict formal O_K-modules, special O_D-actions, relative heights, Cartier duals, finite torsion levels and moduli of framed quasi-isogenies; absolute p-height must scale by [K:Q_p].

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.5/special-formal-moduli`, `HilbertModularVarietiesAndShimuraCurves:R18.5/tower-uniformisation`.

16. **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`** — Supply integral Dieudonné/Cartier equivalence on nilpotent bases, compatible duality and structured tensor/filtration comparison in the admissible coefficient components, including strict O_K-relative ranks.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-filtered-crystal`, `HilbertModularVarietiesAndShimuraCurves:R18.5/special-formal-moduli`, `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-representability`.

17. **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`** — Supply full faithfulness and all-prime crystalline Barsotti–Tate lattice classification over O_L, including p=2 (Kim/Lau/Liu scope), with descent after finite extension. Tensor products require the componentwise absence of weight −2.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-point-extension`, `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-filtered-crystal`.

18. **`ArithmeticLocallySymmetricSpaces:ALS.1`** — Supply the generic associated coefficient local system and its singular chain/sheaf realization. TauCeti.LocalCoefficientSystem supplies only the fundamental-groupoid functor carrier.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-local-systems`.

19. **`ArithmeticLocallySymmetricSpaces:ALS.3`** — Supply coefficient-compatible Hecke correspondence pullback/trace and composition on actual complexes, with finite-cover and orientation conventions.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology`, `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomology-pairing`, `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-degeneracy`.

20. **`ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`** — Supply early finite-level derived integral duality, pullback/trace adjoints and coefficient change before completed cohomology or automorphic comparison.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology`, `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomology-pairing`.

21. **`ArithmeticLocallySymmetricSpaces:ALS.5`** — Supply the characteristic-zero cohomological automorphic decomposition and real discrete-series/relative Lie algebra computation. Only this late spectral comparison uses the spectral supplier; it is not imported into early finite-level duality.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-eigenspaces`.

22. **`ClassicalAdicEtaleCohomology:H0`** — Supply actual derived étale cohomology with integral inverse systems, coefficient exact sequence and Hochschild–Serre for finite étale covers; extend to the finite proper-curve finiteness theorem needed here rather than interpreting the definition as finiteness.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology`, `HilbertModularVarietiesAndShimuraCurves:R18.4/integral-cohomology-control`, `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-level-descent`.

23. **`ClassicalAdicEtaleCohomology:H3`** — Supply proper smooth curve trace, Poincaré duality with L∨(1), and integral derived duality. A perfect integral H¹ pairing requires the explicitly stated torsion/vanishing conditions.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology`, `HilbertModularVarietiesAndShimuraCurves:R18.4/integral-cohomology-control`, `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomology-pairing`.

24. **`ClassicalAdicEtaleCohomology:H5`** — Supply algebraic–analytic étale and complex Betti comparison for proper curves with finite coefficient local systems, compatibly in l^n and with Hecke pull-push.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology`.

25. **`WeightsInEtaleCohomology:R34.5`** — Extend the elliptic-family Sym-power purity node to a rank-two Morita/projector constituent of the higher-dimensional quaternionic PEL abelian family, and the general pure-coefficient proper H¹ theorem. Verify relative splitting projectors and total tensor weight; do not invoke elliptic purity without this extension.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-purity`.

26. **`AutomorphicGaloisRepresentations:R19.2`** — Supply the residual Galois-to-acting-Hecke dictionary and the characteristic-zero local–global compatibility excluding Steinberg at distinct-root TW places. Restrict this contract to the early coefficient/eigenspace construction from R18.2 and early R18.4: it must not depend on R18.3/tw-localised-control, R22 patching or R23 modularity, avoiding a declaration-level cycle.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-localised-control`, `HilbertModularVarietiesAndShimuraCurves:R18.3/residual-hecke-ideal`.

27. **`ReductiveGroupsPartII:RG2.2`** — Supply the GL₂ reduced building as the lattice/norm-class tree, adjacency, q+1 valence and PGL₂ action; R18.5 constructs the analytic reduction and its formal charts, not a second general building.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-half-plane`, `HilbertModularVarietiesAndShimuraCurves:R18.5/affinoid-reduction`.

28. **`AdicSpacesPartII:R2`** — Supply gluing/separated quotients and algebraisation for the flat locally finite-type semistable formal curves used in the arithmetic quotient; extend the existing admissible-formal/generic-fibre machinery as AdicSpacesPartII Part II where quotient representability is not yet stated.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient`.

29. **`NeronModelsAndSemistableAbelianVarieties:R11.4`** — Supply the semistable Jacobian graph character lattice, thickness-weighted monodromy pairing, component-group cokernel and Hecke/degeneracy functoriality. R18.5 only identifies this generic graph/lattice with its arithmetic tree quotient.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.5/character-monodromy`.

30. **`tauceti:TauCetiRoadmap/StableReduction#layer-0-relative-curves-and-extensions-of-dvrs`** — Import the existing upstream relative-curve/DVR extension and descent framework, with unramified versus ramified base change distinguished.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.2/coarse-model`.

31. **`tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`** — Import the existing node/normalization and dual multigraph API, including thickness, branches, loops and repeated edges; do not replan it.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-formal-model`, `HilbertModularVarietiesAndShimuraCurves:R18.5/tree-dual-graph`.

32. **`tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`** — Import regular-surface codimension-two extension and divisor Cartier/norm tools. At the node both multiplication factors can be nonunits; extend the generic/smooth-locus determinant across codimension two.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.2/qfactorial-model`, `HilbertModularVarietiesAndShimuraCurves:R18.2/integral-kodaira-spencer`.

33. **`tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`** — Import the regular proper model, relative minimality and the uniqueness of the minimal regular model for positive generic genus (Layer 5), used for the fine models of genus at least 2. Layer 5 does not state finite group quotients or formal algebraisation: the effective finite quotient is requested from PELModuli:M4 and the algebraisation of proper formal curves from AdicSpacesPartII:R2.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`, `HilbertModularVarietiesAndShimuraCurves:R18.2/regular-model-tower`, `HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient`.

34. **`tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion`** — Import graph/Picard numerical compatibility; the full generic Jacobian monodromy theorem is specifically requested from R11.4.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.5/character-monodromy`.

35. **`tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`** — Import existing line/divisor/Picard degree and base-change maps; require the rational-line and finite norm extension from the assigned arithmetic owner rather than inventing it here.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line`.

36. **`ModularCurvesPartII:R12.2`** — Import the rational split modular-curve moduli and compactification with compatible tame-level conventions; this is outside the compact division-prime theorem.

   Consumers: `HilbertModularVarietiesAndShimuraCurves:R18.5/rational-uniformisation`.

## Collected restructuring proposals

All eight proposals are retained as maintainer work; this assembly does not edit
atlas stages, another roadmap or upstream files. The combined node graph is
acyclic, but its coarse stage order still needs the two layer splits below.

### H0 proposal 1: rescope

Roadmaps: `HilbertModularVarietiesAndShimuraCurves`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, `HodgeTateAndCanonicalSubgroups`, `ShimuraCompactifications`, `AlgebraicModularFormsAndSerreWeights`.

Apply the confirmed RT-AREA-padic-1/26 owner correction across the outstanding source briefs; this packet already imports R07.2.

Proposal: Generic BT₁ Ha=det(V*), Fargues LF and the intrinsic BT₁ Hodge–Tate map have owner R07.2. T0 keeps the semi-abelian/boundary extension. H2 and R15.3 retain only Hilbert/elliptic specialization; C6 and IG.2 import the generic output. Repoint the four paper briefs and add R07.2→R15.3 through their own authorized jobs.

### R18.2 proposal 1: rescope

Stages: `GL2ModularityLifting:R22.2`, `HilbertModularVarietiesAndShimuraCurves:R18.3`.

Roadmaps: `GL2ModularityLifting`, `HilbertModularVarietiesAndShimuraCurves`.

Reason: Replace R22.2/delta-freeness-at-taylor-wiles-level and /dyadic-twists-of-forms by imports of R18.3/tw-freeness, /tw-localised-control, /dyadic-norm-twist and /dyadic-hecke-twist. R22 owns prime choice, deformation twist comparison and patching. RT-AREA-langlands-2/19 and accepted RS-23 require this ownership.

Proposal: Replace R22.2/delta-freeness-at-taylor-wiles-level and /dyadic-twists-of-forms by imports of R18.3/tw-freeness, /tw-localised-control, /dyadic-norm-twist and /dyadic-hecke-twist. R22 owns prime choice, deformation twist comparison and patching. RT-AREA-langlands-2/19 and accepted RS-23 require this ownership.

### R18.2 proposal 2: rescope

Stages: `AutomorphicFormsOnReductiveGroups:AF.5`.

Roadmaps: `AutomorphicFormsOnReductiveGroups`.

Reason: AutomorphicFormsOnReductiveGroups Part II: extend the current discrete-centre AF.5 algebraic-forms and structure nodes to fixed central character modulo the adelic centre, including finite effective isotropy and integral coefficient actions. R18.3 specializes this carrier; no second generic form space.

Proposal: AutomorphicFormsOnReductiveGroups Part II: extend the current discrete-centre AF.5 algebraic-forms and structure nodes to fixed central character modulo the adelic centre, including finite effective isotropy and integral coefficient actions. R18.3 specializes this carrier; no second generic form space.

### R18.2 proposal 3: rescope

Stages: `PELModuli:M2`.

Roadmaps: `PELModuli`.

Reason: PELModuli Part II: basic formal Rapoport–Zink uniformisation with exact action, Weil descent, Hasse principle and geometric-point surjectivity hypotheses for BZ §6.2. Existing M5 examples do not supply this theorem.

Proposal: PELModuli Part II: basic formal Rapoport–Zink uniformisation with exact action, Weil descent, Hasse principle and geometric-point surjectivity hypotheses for BZ §6.2. Existing M5 examples do not supply this theorem.

### R18.2 proposal 4: rescope

Stages: `AdicSpacesPartII:R2`.

Roadmaps: `AdicSpacesPartII`.

Reason: AdicSpacesPartII Part II: proper semistable formal quotients by free discrete cocompact projective groups and algebraisation, used by the arithmetic Drinfeld quotient; reuse formal and generic-fibre carriers.

Proposal: AdicSpacesPartII Part II: proper semistable formal quotients by free discrete cocompact projective groups and algebraisation, used by the arithmetic Drinfeld quotient; reuse formal and generic-fibre carriers.

### R18.2 proposal 5: rescope

Stages: `HilbertModularVarietiesAndShimuraCurves:R18.6`.

Roadmaps: `HilbertModularVarietiesAndShimuraCurves`.

Reason: Keep the accepted RS-23 export interface as a dependency/consumer index without new mathematical nodes or planets; audit marks it process-only. Its mathematics is exactly the exports below, not another theorem.

Proposal: Keep the accepted RS-23 export interface as a dependency/consumer index without new mathematical nodes or planets; audit marks it process-only. Its mathematics is exactly the exports below, not another theorem.

### R18.2 proposal 6: rescope

Stages: `HilbertModularVarietiesAndShimuraCurves:R18.2`, `HilbertModularVarietiesAndShimuraCurves:R18.5`.

Roadmaps: `HilbertModularVarietiesAndShimuraCurves`.

Reason: R18.2 depends on R18.5 while R18.5 depends on R18.2. R18.2/regular-model-tower needs R18.5/totally-real-uniformisation for the division-place model, and R18.2/integral-pdiv needs R18.5/drinfeld-representability; meanwhile R18.5/totally-real-uniformisation needs R18.2/quaternion-pel-instance, quaternion-pdiv-tower and connected-pel-comparison. The node graph is acyclic, but the layer order R18.2 → R18.4 → R18.5 makes these forward references.

R18.5 uses nothing from R18.4: its nodes cite only R18.1, the auxiliary PEL nodes of R18.2 and other roadmaps. Its present requirement on R18.4 is only the linear order of the source document.

Proposal: Divide R18.2 into two sub-layers. R18.2a, ‘Auxiliary PEL datum and split-place models’: quaternion-pel-instance, effective-small-level, quaternion-pdiv-tower, connected-pel-comparison, finite-pel-comparison, carayol-split-model, bridge-tate-comparison. R18.2b, ‘Integral models at every place’: regular-model-tower, coarse-model, hecke-integral-extension, qfactorial-model, arithmetic-hodge-line, integral-pdiv, integral-kodaira-spencer, bridge-integral-model, bridge-point-extension, bridge-filtered-crystal, bridge-determinant. R18.5 requires R18.2a and R18.1, not R18.4; R18.2b requires R18.2a and R18.5; R18.4 requires R18.2b and R18.3. Every node edge then points forward.

### R18.2 proposal 7: rescope

Stages: `HilbertModularVarietiesAndShimuraCurves:R18.3`, `AutomorphicGaloisRepresentations:R19.2`.

Roadmaps: `HilbertModularVarietiesAndShimuraCurves`, `AutomorphicGaloisRepresentations`.

Reason: R18.3/tw-localised-control (KW Corollary 7.5) and R18.3/residual-hecke-ideal cite AutomorphicGaloisRepresentations:R19.2, and R18.3/dyadic-hecke-twist depends on tw-localised-control. But R19.2 requires R18.4, which requires R18.3, so the R19.2 → R18.3 link closes a loop of layers and the atlas drops it. The node graph is acyclic only because the R19.2 request excludes these nodes.

KW’s proof of Corollary 7.5 excludes Steinberg components at the places of Q by the local–global compatibility of Carayol and Taylor, which R19.2 supplies from the cohomology of R18.4. Lemma 7.4, the stabiliser and freeness theorems and the twist of §7.5 need no Galois input.

Proposal: Give R18.3 a second sub-layer, R18.3b ‘Localized Taylor–Wiles control’, containing tw-localised-control, dyadic-hecke-twist and residual-hecke-ideal. R18.3b requires R18.3 and AutomorphicGaloisRepresentations:R19.2, and is consumed by GL2ModularityLifting:R22.1, R22.2 and R22.6. The rest of R18.3 keeps its place before R18.4. residual-hecke-ideal needs R19.2 only for its actingFactor API item; its kernel and maximality need no Galois input.

## Remaining work after this assembly

No assembly deliverable remains. Future jobs close the named proof and supplier
obligations and apply the collected ownership/layer proposals. In particular:
restore the exact Carayol descent contract; prove the ramified relative
Kodaira–Spencer and bridge determinant repairs; close Hilbert scheme refinement,
Γ₀ closure and Hecke-polarization descent; finish the Taylor/Allen local inputs;
collate Khare's actual Lemma 2.2; prove the required indefinite integral Ihara
and residual vanishing statements without circular patching; obtain the actual
geometric carriers for the omitted Lean signatures. S5/O4 consumers must use
stable images for the corrected connected unit limit.

The reader's closure ledger contains every part gap and layer requirement.
Part review verdicts are unchanged; no mathematical implementation is claimed.
This run claims no second job.
