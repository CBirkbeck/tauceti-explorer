# BP-LefschetzPencilsAndVanishingCycles--LPV.7 handoff

Issue #769. Agent Codex, session `codex-6maUUP`, branch `codex-6maUUP-lpv7`.
This is a completed target-level planning pass, submitted for independent review,
not a checkpoint. Accepted RS-17 governs ownership. The packet has status
`complete`; all three stages are `planned`, none is `closed`. Every mathematical
node has implementation status `unchecked`.

The deliverables are the packet, reader document and suggested Lean file with
stem `LefschetzPencilsAndVanishingCycles--LPV.7`, plus this note. No application,
content, atlas, queue, audit, reserved-id or other worker's files were changed.

## What is done

The semistable child contains the signed normalization resolution, nearby and
vanishing sheaves at nodes, specialization and normalization cohomology,
monodromy factorization, invariants and three-piece filtration, Jacobian Tate
realization and valuation-pairing comparison, descent/reorientation/ramification
compatibilities, and geometric acceptance instances. Its higher-dimensional
strict-SNC export includes the Kummer description, graded nearby complex,
weight spectral sequence, signed restriction/Gysin differential, and spectral
monodromy/curve comparison.

The invariant-cycle child contains invariant corestriction, arithmetic spreading
preserving inertia images, the continuous Wang sequence, localization/duality
cross and weight separation, equicharacteristic and complex local theorems,
local potential-purity models, absolute geometric-generic pure models,
incidence-model pullback, pure-complex local cycles, dual-support affine
vanishing, support-bound weak Lefschetz, relative pencil obstruction, pencil
image equality, general-line monodromy and global invariant cycles. The parent
is only an export index and has no planet or independent proof.

Definitions and constructions have use-derived API contracts and three tests
each, represented in the companion under matching names. Baseline citations
were read at the pinned commits. Existing LPV.0/2, R11.4 and DWP.7/8 node IDs
are imported unchanged. StableReduction geometry/graphs and R11.4's Jacobian
pairing are not planned again. Higher-dimensional Hyodo–Kato monodromy and its
comparisons retain their CrystallineCohomology/CohomologyComparisons owners.

Counts: **36 nodes** (2 application, 8 comparison, 3 construction, 2 definition, 6 lemma, 15 theorem); **21 API items**, **15 unit tests**, **12 planets**, **29 baseline declarations**, **6 gaps**, **23 supplier requests**.

## Validation and compilation

`python3 scripts/check_blueprint.py research/blueprint/packets/LefschetzPencilsAndVanishingCycles--LPV.7.json`
reported zero errors and zero warnings, using the pinned declaration index.
An additional agreement check verified all 35 mathematical declaration names,
all 21 API names and all 15 named test examples in the suggested file; every
packet statement in the reader; the internal prerequisite DAG and request
edges; six planets per child and zero at the parent; and short source excerpts.
All implementation statuses remain unchecked.

`lean-check research/blueprint/suggested/LefschetzPencilsAndVanishingCycles--LPV.7.lean`
finished with exit code 0 and 63 warnings, all “declaration uses sorry”. Available
memory was checked before compilation and exceeded 20 GB. No language server,
new Lake project, dependency update, cache download or library build was used.

The shared build's Mathlib is exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`.
The Tau Ceti baseline remains `f790474821cf4256814db967cb154e7af3d0c369`;
its sources were inspected at that revision. The shared build's Tau Ceti HEAD
is `cf386627e9176a3827c1a5fe804989fd94a4d216`, so the suggested file deliberately
imports only pinned Mathlib modules and relies on no Tau Ceti build declaration.
The compilation claim is therefore about the Mathlib-only companion.

The companion uses actual scheme predicates and Cartesian squares,
DerivedCategory, ModuleCat, Representation.invariants and Mathlib spectral
objects. It explicitly omits the unavailable constructible étale realization,
arithmetic purity and some geometric premises. Its signatures are planning
shadows, not valid unrestricted theorems about arbitrary maps. Elaboration
checks their names and types, not the omitted geometry or proofs.

## Conventions the reviewer must preserve

- Deligne6.2.11's bound is `dim Supp H^j(DK[-2n-2]) ≤ n+1-j`, equivalently
  `dim Supp H^q(DK) ≤ -n-1-q`. It was checked against printed page249.
  A constant sheaf on a smooth (n+1)-fold passes the degree-zero test.
- Branch quotient Λ(e)=coker diagonal and its dual Λ′(e)=ker sum are distinct.
  The arbitrary-rank SNC Kummer stalk uses exterior powers of **coker diagonal**.
- Illusie's normalized node variation and graph form are negative:
  `u⁻=-Σ n_e a_e b_e`. R11.4 uses the positive polarized valuation pairing.
  Two connecting-map signs must be transported; do not identify the pairings
  without the minus sign. Rational nondegeneracy is not integral unimodularity.
- The nonzero strict curve example is an actual requested I₂ fibre: two rational
  components and two nodes, norm -2 on (1,-1). A matrix or abstract graph is not
  counted as the algebraic family. A loop is a normalization test, not a strict
  SNC global component model. A bridge can have local vanishing cycles but N=0.
- For Wang, I′=ker(I→Zℓ(1)) is pro-prime-to-ℓ, including wild and other tame
  prime factors. First pass to W=V^{I′}≅V_{I′}, then compute the Zℓ(1) cohomology.
  Discrete abstract-group cohomology does not supply the continuous theorem.
- The local arithmetic witness has a smooth relative curve and section.
  The projective theorem starts with an absolute arithmetic pure model;
  the incidence pullback produces the local witnesses. No converse is asserted.
- The nonproper spectral sequence abuts to special-fibre nearby hypercohomology;
  properness supplies the generic-fibre comparison. Its induced M′ filtration
  need not be the canonical monodromy filtration on cohomology merely because
  E₂ degenerates. Curve agreement is proved by explicit ranks and pairing.
- The global proof uses WeilII4.3.6–8 and6.2.9–12. The orthogonal splitting4.3.9
  and DWP.9 hard Lefschetz are not inputs. The early curve export uses no weights.

## What remains and where to resume

No stage is closed. Independent review should start with the source hypotheses,
map signs and the target coverage, then verify the exact supplier contracts
below. Each recorded gap is an explicit termination of backward chaining;
closing it requires that supplier mathematics, not removal of its entry.

**`LefschetzPencilsAndVanishingCycles:LPV.7`: planned.** Certify the two child supplier interfaces and recorded gaps; the parent is only an export index.

**`LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves`: planned.** Certify trait purity and filtered étale realization (G-trait-purity, G-filtered-realization). Realize the geometric smooth/bridge/I₂ acceptance instances (G-geometric-tests). Supply omitted geometric premises before strengthening Lean signatures (G-suggested-premises).

**`LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles`: planned.** Certify constructible-complex incidence/pencil contracts (G-complex-pencil). Extract the geometric mixed-Hodge proof for the complex specialization target (G-complex-mhs). Supply omitted geometric premises and arithmetic-model conditions before strengthening Lean signatures (G-suggested-premises).

**G-complex-mhs — Geometric mixed-Hodge cross.** Deligne3.6.4 gives the complex result and cites Steenbrink, but the complete construction/compatibility proof of geometric MHS on inertia invariants and support cohomology has not been extracted here. HodgeStructures L2 supplies only the abstract mixed-Hodge category and strictness. The first page of Steenbrink’s Oslo article was inspected; its isolated-singularity abstract does not establish the required general projective-disk contract. Complete the source proof in HodgeStructures PartII, including weight bounds≤i and≥i+1 and the Betti localization/Wang morphisms; retain projective factorization.

**G-trait-purity — Trait-scope purity interface.** Saito03 Proposition1.1.1(2) and Lemma1.1.4 require relative purity for a strictly semistable morphism over a DVR and stratum fundamental classes in a regular trait ambient scheme. The read EDC.2/3 field/smooth interfaces do not certify this scope. The requests state the exact extension; certify its source and coefficient hypotheses before implementation, without replacing the singular morphism by a smooth one.

**G-filtered-realization — Filtered étale realization and convergence.** Mathlib at the pin has spectral sequences and spectral objects. Its general machinery has not been connected to the constructible étale nearby category: construct the bounded filtered hypercohomology spectral object, page-one comparison, convergence maps and abutment filtration. The suggested file checks the existing carriers and linear/page shapes, with geometric premises explicitly omitted; it is not a formal geometric spectral sequence.

**G-complex-pencil — Constructible-complex pencil contracts.** LPV.3–5 must supply the generic-local-acyclic incidence-line and relative-cone interfaces for arbitrary constructible K, with the finite-support proof and normalized duality exchanges. The source statements and proof route are read and planned here; the existing ordinary quadratic/transvection nodes do not certify this extension. Requests require the exact6.2.10–12 generality, arithmetic model transport and4.3.6–8 route, without DWP.9.

**G-geometric-tests — Realization of geometric acceptance instances.** The graph and unipotent linear calculations discriminate the sign and rank, but no actual proper I₂ model is implemented or certified at the pinned baseline. Complete the EllipticCurves/StableReduction supplier contract for the regular split two-component two-node genus-one model and compare its Jacobian Tate action; also realize the smooth and bridge tests. This packet does not count a matrix as an algebraic family.

**G-suggested-premises — Geometric premises absent from suggested signatures.** The pinned libraries do not expose the full constructible étale category, geometric nearby/purity realization, generic incidence contracts or arithmetic potential-purity predicate. The suggested signatures use existing Scheme, DerivedCategory, ModuleCat, Representation, linear maps and spectral-sequence carriers, and mark exactly which geometric premises or realizations are omitted. Complete these supplier interfaces and strengthen the signatures before treating them as the mathematical theorems. All nodes remain implementationStatus unchecked.

The geometric MHS work is proposed as **HodgeStructures, Part II: geometric
degeneration mixed-Hodge structures**, beginning after the existing L2 abstract
category/strictness and importing ComplexComparisonPartII C5. That proposal
is in the packet; no existing upstream roadmap was edited.

## Requests to owners

The packet contains the consuming node IDs for each of these requests. The
reader repeats the full contracts. This note preserves them so no scratch file
is needed to resume supplier certification.

1. **`tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.** Import the finite normalization, two-branch node schemes, local uv=a charts with thicknesses, geometric component set and oriented dual multigraph retaining loops/multiple edges; identify ker ∂=H₁ and coker d=H¹ with their dual integral lattices and signed orientation/Galois transports. This packet adds only the étale realization of those supplied geometric objects.

2. **`tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.** For a ramified nodal chart uv=π^e, supply the regular semistable resolution, its exceptional rational chain, and the graph subdivision comparison replacing one thick edge by e unit-thickness edges. Include proper pullback on cohomology and invariance of the normalization component H¹ under the rational subdivision.

3. **`tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.** Supply the actual proper regular split genus-one I₂ model of the EllipticCurves Layer4 Tate example with v(q)=2: special fibre two smooth rational components meeting transversely at two nodes, smooth connected generic fibre, and its Picard/Jacobian identification. Also supply a smooth proper curve model and a two-component bridge instance. An abstract graph or reduction-symbol datatype is insufficient.

4. **`tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.** Supply the split Tate elliptic curve with parameter q=π² over a complete discretely valued field (choose residue characteristic≠2 if using a Weierstrass construction), its regular I₂ fibre through StableReduction Layer5, and the Galois-equivariant Tate-module realization. Retain the distinction between the point-level Tate uniformization and the geometric component model.

5. **`AbelianSchemesAndArithmeticModuli:A3`.** Supply the smooth proper curve Picard/Jacobian realization H¹(Cη̄,ℤℓ)(1)≅TℓJac(Cη̄), including its trace-dual pairing, compatibility with component Picard varieties, specialization and descent; use R11.4 for the semistable identity component and character lattice.

6. **`EtaleDualityAndPerverseSheaves:EDC.0`.** Supply bounded constructible ℓ-adic complexes, integer-indexed hypercohomology and Tate twist, conservative geometric stalks, finite normalization pushforward, proper/smooth base change and rational coefficient passage from compatible torsion towers. Supply finite-presentation/limit descent of families and complexes, generic local acyclicity for hyperplanes and incidence lines, localization cones and relative hypercohomology, and the exact bridge from finite filtered nearby complexes to Mathlib spectral objects with convergence and induced filtration maps. Ordinary DerivedCategory and SpectralSequence alone do not supply this geometric interface.

7. **`EtaleDualityAndPerverseSheaves:EDC.1`.** Supply the localization nine-diagram comparison with explicit boundary signs and the cup-product/coboundary rule used in Illusie91 Lemma1.5.4; compare the two node connecting maps as negatives, rather than only giving an unsigned exact sequence.

8. **`EtaleDualityAndPerverseSheaves:EDC.1:biduality`.** Supply support duality for constructible complexes, biduality and pullback exchange including all shifts and Tate twists. In the trait cross identify H^{i+1}_{Xs}(X,K)=H^{−i−1}(Xs,DK)^∨ with the correct total/arithmetic dualizing normalization. For a generic-local-acyclic codimension-one section use D_Y i*K=i*DK(−1)[−2]; for the incidence smooth/generic-line composite justify the cancelling normalized identity D(i*q*K)=i*q*DK. Compatibility of every map in the cross and pencil cone is required.

9. **`EtaleDualityAndPerverseSheaves:EDC.2:pairings`.** Supply the perfect trace pairing for smooth proper component curves, H²(C,Λ)=Λ(−1), sum of component trace maps to connected generic H², and the compatibility of residue/cospecialization maps with cup products. Preserve the integral branch duality and distinguish H₁ from H¹.

10. **`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`.** Supply the smooth-total-space support duality/trace normalization for the WeilII3.6 cross, plus the relative fundamental-class isomorphism Λ≅Rf!Λ(−d)[−2d] for the strict semistable trait morphism in Saito03 Proposition1.1.1(2). Smooth-morphism purity alone does not cover that singular trait morphism; record the trait extension explicitly.

11. **`EtaleDualityAndPerverseSheaves:EDC.3`.** Supply intersection-stratum regular-immersion fundamental classes and residue/Gysin maps over the trait in Saito03 Lemma1.1.4, and restriction/Gysin/projection/self-intersection compatibility over the residue field. For the ordered strata, prove the mixed alternating compositions cancel using the principal vertical divisor. This is the exact input to Saito03 Proposition2.2.6; smooth pairs over a field alone do not justify the regular ambient DVR purity step.

12. **`EtaleDualityAndPerverseSheaves:EDC.4`.** Supply affine Artin vanishing H^a(A,F)=0 for a>dimSupp F for constructible sheaves and its hypercohomology support-bound consequence. With dimSupp ℋ^q(DK)≤−n−1−q, deduce H^{−i}(A,DK)=0 for i≤n and hence H_c^i(A,K)=0 by duality. No hard Lefschetz input is allowed.

13. **`EtaleDualityAndPerverseSheaves:EDC.5`.** Supply the early middle perverse category over the special-fibre field, its exactness operations and normalized L[d] statement over rational ℓ-adic coefficients. Justify the strict-semistable instance RΨℚℓ[d] perverse by the source’s kernel/image calculation or the independently proved nearby t-exactness interface. Integral p/p+ conventions require their own extension and are not imported from rational self-duality.

14. **`ArithmeticGaloisDuality:R02.1`.** Supply actual continuous inertia representations on finite-dimensional rational ℓ-adic hypercohomology and compatible inverse-limit cohomology for torsion towers. For I′=ker(I→ℤℓ(1)), prove exactness of invariants and coinvariants on compatible torsion systems by averaging over its finite prime-to-ℓ quotients; I′ includes wild inertia and all other tame prime factors. Identify V^{I′}≅V_{I′} and their induced ℤℓ(1)-actions. Relate continuous fixed subspaces to Mathlib Representation.invariants. Preserve tℓ, Galois descent and invariants under arithmetic spreading.

15. **`ArithmeticGaloisDuality:R02.2`.** Supply continuous Hochschild–Serre for the generic fibre and the cohomological-dimension-one tame quotient, including the twisted coinvariant term and the Wang short exact sequence for bounded constructible rational complexes. Use ℓ-adic continuous cohomology, not cohomology of the abstract underlying discrete group.

16. **`DeligneWeightsAndPurity:DWP.5`.** Supply WeilII1.8.8’s local invariant weight bound: at a finite-field boundary point, inertia invariants of a punctually pure local system of weight i have weights≤i; retain the local Frobenius/tame conventions. This plus proper upper bounds and smooth support duality proves the weight cross, without DWP.9.

17. **`LefschetzPencilsAndVanishingCycles:LPV.1`.** Supply the tame twisted nilpotent logarithm N:V→V(−1), finite monodromy filtration with its center, kernel/image convolution in an abelian category, generator/ramified-character compatibility, and comparison of log T with T−1 on graded pieces. The curve instance requires T=1+tℓN and N²=0; the general filtered nearby instance uses the shifted-perverse rational category and does not infer filtration equality on cohomology.

18. **`LefschetzPencilsAndVanishingCycles:LPV.0`.** Extend the imported finite-torsion nearby/vanishing-cycle triangles, variation maps and functoriality to compatible ℓ-power towers and their rational ℓ-adic realization. Prove compatibility of proper base change, local stalk calculations, specialization and support localization with this coefficient passage; EDC.0 supplies the constructible category and inverse-limit realization, and R02.1 supplies continuous cohomology. The finite-torsion declarations alone do not justify the rational statements in this packet.

19. **`LefschetzPencilsAndVanishingCycles:LPV.3`.** Supply the projective incidence scheme, smooth projection q to X, generic-local-acyclic parameter open U for every relevant cohomology sheaf of an actual constructible complex K, and sufficiently general lines with marked sections and incidence duality exchanges. Ordinary constant-sheaf Lefschetz pencils do not cover arbitrary K in WeilII6.2.10–12.

20. **`LefschetzPencilsAndVanishingCycles:LPV.4`.** Supply the sufficiently general pencil total space and axis maps for constructible complexes, their pushforward-to-axis cone and restriction comparison. Under the dual-support bound prove the finite-support conditions on negative cohomology of the relative obstruction complex used in WeilII4.3.6–8 and6.2.11(ii). This contract excludes the hard-Lefschetz orthogonal splitting4.3.9.

21. **`LefschetzPencilsAndVanishingCycles:LPV.5`.** Supply tame-cover specialization preserving the full local inertia image in WeilII1.11.3, general-line surjectivity π₁(V)→π₁(U) in the incidence setup of6.2.10, and local-inertia generation/torsor extension on P¹ for4.3.6. Equality of representation images, not just a dimension calculation, is needed. Imported ordinary transvection formulas alone do not suffice.

22. **`tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne`.** Import mixed-Hodge structures and strictness/exactness of the weight filtration from L2. The geometric Betti/support/limit MHS of the projective disk family, their maps and separated weight bounds are an extension beyond that linear-algebraic contract, recorded as G-complex-mhs and proposed HodgeStructures PartII below; do not infer them from strictness alone.

23. **`ComplexComparisonPartII:C5`.** Supply the actual rational Betti realization and de Rham–Betti comparison for the projective algebraic/analytic family, with localization and topological Wang maps over the disk. This comparison does not by itself construct the geometric mixed-Hodge structures needed for WeilII3.6.4.

## Sources read and source work still needed

**WeilII.** Pierre Deligne, [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf). Publications Mathématiques de l’IHÉS 52 (1980), 137–252; published scan. Read on 2026-10-06: 1.11.1–1.11.3 (spreading and tame inertia images); 3.6.1–3.6.4, printed pp.213–215, statements and proofs; 4.1.6, 4.3.2–4.3.8 (affine vanishing and relative obstruction); 6.2.7–6.2.12, printed pp.248–250; page images checked for shifts and support bound. SHA-256 `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71`.

**Illusie91.** Luc Illusie, [Réalisation ℓ-adique de l’accouplement de monodromie, d’après A. Grothendieck](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf). Astérisque 196–197 (1991), 27–44; article in the published collection. Read on 2026-10-06: Entire article, §§0–2.9, printed pp.27–44; local trace signs, specialization, graph lattices, Tate realization, pairing. SHA-256 `2a9aa0b0a046cb37e4d6b6ccc06dfaa00f10d90223ac9d2cb94918d069295119`.

**Illusie21.** Luc Illusie, [Grothendieck and vanishing cycles](https://www.numdam.org/item/AFST_2021_6_30_1_83_0.pdf). Annales de la Faculté des Sciences de Toulouse 30 (2021), 83–115; published version. Read on 2026-10-06: §2.2 (tame normal-crossing stalks); §4.4, formulas4.24–4.39 (graph realization and negative sign); §§6.3–6.4, formulas6.1–6.6 (graded nearby complex and abutment filtration). SHA-256 `e5669fedbc97b874fc7b2ec2230ad8722ff69c0e77dc9aee8bca5f0aaa19d219`.

**Saito03.** Takeshi Saito, [Weight spectral sequences and independence of ℓ](https://www.ms.u-tokyo.ac.jp/~t-saito/pp/wmr2r.pdf). Author manuscript dated 9 June 2003; published in J. Inst. Math. Jussieu 2 (2003), 583–634; manuscript numbering retained. Read on 2026-10-06: §1.1, Propositions1.1.1–1.1.2, Corollary1.1.3 and proof (local purity/residues); §2.1, kernel/image convolution (import from LPV.1); §2.2, Lemma2.2.1 through Proposition2.2.6 and proofs (graded pieces, spectral sequence, d1 and signs); §2.2 final comparison with Rapoport–Zink sign conventions. SHA-256 `a4d564c3e632458e7856ac0133430412e40abc9d26a8cdc39e88747473aa3109`.

**LTXZZ22.** Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568). Inventiones mathematicae 228 (2022), 107–375; published article served by NSF PAR. Read on 2026-10-06: §5.9, Construction5.9.1, monodromy-filtration discussion and Lemma5.9.3 proof, printed pp.231–240; uses published Saito Corollary2.8(2) for d1 without properness. SHA-256 `dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97`.

Saito's locators are from the dated author manuscript, not silently substituted
for the published numbering: author Corollary2.2.4 corresponds to published
Corollary2.8 cited by Liu et al. Its strict-DVR purity scope is explicitly
requested. Illusie91 was read as printed pages27–44 of the served collection.
The source texts and images established no mathematical erratum in the read
passages, so `sourceIssues` is an empty list.

The source proof still missing from this pass is the complete geometric MHS
construction and map compatibility underlying WeilII3.6.4. The first scanned
page of [Steenbrink, “Mixed Hodge structure on the vanishing cohomology”](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/steenbrink2.pdf),
Oslo proceedings (1977), printed page525, was visually inspected. Its
isolated-singularity abstract does not establish the general projective-disk
contract, and the article was not fully read. G-complex-mhs records this
extraction gap; it is not an accusation of an error in that paper. The
complex theorem is scoped to a relative projective closed embedding as a
sufficient explicit interpretation of Deligne's projective factorization;
a broader analytic interpretation is not claimed.

For context/ownership, the full HodgeStructures roadmap and the relevant
StableReduction layers/contracts were read, together with the LPV document,
accepted RS-17 result/review, stage links, reviewed library coverage, and exact
imported supplier-node statements. The retained graph and Jacobian owners,
DWP.9/10 consumers, and the Liu et al. routed §5.9 input are reflected in the
packet. Results of the other maintainer-added papers routed to LPV.0–5 remain
outside this part's scope and are not replanned here.

The scratch directory is removed after submission. All mathematical conventions,
source versions, open work and supplier contracts required for review/resumption
are in these four deliverables. No background compilation remains running.
