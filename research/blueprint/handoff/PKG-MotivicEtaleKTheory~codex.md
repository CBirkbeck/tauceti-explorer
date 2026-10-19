# MotivicEtaleKTheory package handoff

Issue: #11066. Worker: Codex, GPT-6, session `codex-o0zngb`. Date: 2026-10-19.
Claim confirmed by the bot in issue comment 6274460925. This is the package submission for independent review, not a review of the worker's own work.

## Delivered

The package has twelve mathematical layers and 71 numbered prose subsections. It covers the original coefficient, arithmetic, cycle, norm-residue, logarithmic-symbol, coniveau, Chern, étale-comparison and regulator targets, including the more detailed coniveau and regulator refinements. The README retains the actual constructions, their API, discriminating Checks, examples and dependencies. Overlapping versions of a target have one final statement. There are no changes to accepted packets, upstream roadmaps or library sources.

`Suggested.lean` is 163 lines. It has three light definitions on existing carriers (`logOne`, `logSymbol`, `positiveChernFactor`), five named theorem targets and six proved examples, two for each definition. Heavy objects and headline theorems whose carriers are unavailable at the pins are specified in the README and named in the single closing comment. In particular the norm residue theorem, motivic spectral sequence and arithmetic comparisons have not been replaced by abstract groups or assumed comparison isomorphisms. Nothing here claims formalization of those theorems.

The logarithmic one-form and its naturality use absolute differentials over Z and the existing semilinear map. The exterior-algebra-valued `logSymbol` is the existing homogeneous representative of the README's exterior-power symbol. Its degree-zero value is one, and its repeated-entry value is zero even in characteristic two. `positiveChernFactor` is rational and has positive weight as its domain; it is not the degree-zero Newton-polynomial character. The Kummer theorem uses actual Kummer classes, an explicitly continuous equivariant biadditive pairing, and units whose sum is one. It is not a theorem about unrelated arbitrary cohomology classes.

## Baselines and duplicate ownership

Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
Read-only roadmap checkout inspected: `0d144d044dacebca17b654695b6f1ad58f159b27`.
Current-library checkout inspected: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
No build or update was run in either read-only checkout.

The audit covered every layer by mathematical object, including coefficient/twist carriers, cycle and transfer categories, logarithmic symbols, operations/norm varieties, supported K-theory, higher characters, real K-theory and regulator/determinant interfaces. The reviewed `data/library-coverage.json` audit was read for all fourteen source stages. Searches in current Tau Ceti and the pinned Mathlib were followed by reading the relevant declarations. Searches of the current roadmap tree included the newer AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry directions. Relevant open upstream PRs were inspected separately, rather than treating the older atlas snapshot as current.

| Object or theorem | Owner consumed; resulting boundary |
|---|---|
| Absolute differential module, universal derivation, exterior algebra, tensor and quotient carriers | Mathlib `KaehlerDifferential`, `KaehlerDifferential.D`, `ExteriorPower`, `ExteriorAlgebra`; only logarithmic maps are new. |
| Differential pullback for arbitrary field maps | Tau Ceti `KaehlerDifferential.mapSemilinear` and its laws; no incorrectly source-linear replacement. |
| Kummer coefficients, boundary and class-map injectivity | Tau Ceti `KummerCoeff`, `kummerShortExact`, `kummerMap`, `kummerMap_eq_one_iff`, `kummerClassMap_injective`; ProfiniteCohomology supplies Hilbert 90 and all-degree cups. |
| Native compact and finite cyclotomic coefficients | Current `PadicTateTwist`, `ZModTwist`, cyclotomic Character/Prescription and `PrimeToPTateModule`. Layer 1 now owns arithmetic/sheaf dictionaries and compatibility, not these native actions or short exact sequences. These current APIs are not assumed available at the older Lean pins. |
| Elliptic Tate module, representation, pairing and determinant | Current elliptic TateModule Basic/Galois/WeilPairing/Determinant modules. Layer 12 adds variance/twist and regulator compatibility only. |
| Weight-one real regulator and Hodge Tate objects | Mathlib `NumberField.Units.regulator`, `logEmbedding`, `regOfFamily_eq_det`, current Tau Ceti unit regulator and `Geometry.Hodge.Tate`. No new elementary unit regulator. |
| Concrete spectra, EM spectra, homotopy limits and derived completion | **GeneralizedCohomology**, G2 and G3.4, G3.8–G3.9, already upstream (PR #939). Its current main files were read in addition to the supplied checkout. StableHomotopyKTheory is consumed for its filtered-spectrum, exact-couple and coefficient-product contracts, not used to re-plan these existing carriers. |
| Plus/Q comparison, exact-category spectra, products, transfers and ordinary finite-field calculation | **GeneralAlgebraicKTheory**, upstream PR #1212 at `67c1f583452d1a6cf255f200a2261340490fc894`, §§1.5,3.12,7.4–7.8,11.15–11.16,13.8a–13.8c. README and Suggested file read. Finite-field K-theory is consumed, not reconstructed by the arithmetic comparison. |
| BO/KO, real Bott periodicity, complexification and coefficient ring | **TopologicalKTheory**, upstream PR #894 at `f2c908debdefa440e7dfda339a54cb3b74cdc51c`, T4,T7; spectrum realization is GeneralizedCohomology G5.4. An earlier draft's proposed RefinedTraceMethods successor was removed after reading this actual supplier. The arithmetic comparison and mod-two extension calculation remain Layer 11 targets. |
| Enhanced sheaves, coherent diagrams, hyperdescent and spectrum comparison | **EnhancedDerivedSheaves**, upstream PR #908 at `d336bcd086af6526da9f35c30f3a695c26502355`, E2,E5:spectra-comparison. README and Suggested file read. A generic triangulated category does not supply these coherent constructions. |
| Ordinary support K-theory and operations | SchemeKTheoryOperations, support/localization and operations/gamma layers. Ordinary codimension coniveau alone does not supply facewise A1 supports. Only the latter tower and its filtered cycle compatibility are constructed here. |
| Milnor presentation, norms, tame residues, Matsumoto and Brauer/Hilbert interpretation | K2SymbolsBrauer. This package owns cohomological Steinberg and the independent Tate comparison proof, while consuming those algebraic inputs. |
| Effective transfers versus geometric motives | This package constructs finite correspondences/effective motives; MotivesAndAlgebraicCycles supplies stabilization and the independently usable Suslin/higher-cycle comparison. No cycle definition depends circularly on that comparison. |
| Henselian rigidity | KTheoryFiniteLocalFields §2.1, before that roadmap's later motivic comparison. Early rigidity → present comparison → that later application is the required order. |
| Generic arithmetic cohomology, twists and real modifications | ProfiniteCohomology, ArithmeticGaloisDuality, ClassFieldTheory, EtaleDualityAndPerverseSheaves and ClassicalAdicEtaleCohomology; only compatibility and the specific arithmetic symbol/real restriction maps are new. |
| Linear Hodge structures versus geometric Deligne complexes | HodgeStructures supplies the linear theory. Its geometric Part II contract is explicitly required for logarithmic complexes, compactification independence and semipurity; the base roadmap does not already supply these. |
| Syntomic comparison, exponentials and elliptic local conditions | PadicHodgeRegulators D2,D5/local-exponential and elliptic interfaces; early higher Chern and Deligne maps here precede the returned local comparisons. |
| Selmer complexes, Euler-family existence, determinant functor and Borel constants | SelmerIwasawaCohomology, EulerSystemsAndKolyvaginSystems, PadicMeasuresIwasawaAlgebras layer 5, PeriodsAndSpecialValues and BorelRegulators. Only actual realization maps and conditional comparison adapters are constructed here. |

Remote main for the supplementary GeneralizedCohomology read was `79ff03ab775937a744719a0ebe494621f1f16d95`. Only the named README/Suggested files from these PRs and main were fetched; no repository or snapshot was cloned or copied.

## Moves down, unsupported claims removed, and review limitations

1. The early motivic universal Chern classes, their positive-degree character normalization, relative cycle comparison, and the early Deligne regulator belong here before the Borel, syntomic, elliptic and fundamental-line applications. The consumers named in the README must import these maps. A rational eigenspace isomorphism is insufficient to define them.
2. The degree-two Tate proof is placed before all-weight norm residue. The K2SymbolsBrauer algebraic symbol, transfer and localization inputs are retained; its later arithmetic comparison application must consume this independent proof rather than create a circular supplier.
3. Local unstable motivic representability, derived symmetric powers, the split-Tate EM calculation, the degree-map stable duality construction and the DN cobordism/height comparison are explicit local targets. They cannot be inferred from possession of a triangulated effective category. The needed geometric cobordism comparison and fixed-point calculation are stated, including their characteristic-zero restriction and dimension hypotheses.
4. Picard A1 invariance is deduced from cycle homotopy invariance and the divisor–Picard comparison. It is not used as an input to the same cycle proof. Higher K3 identification remains downstream of the weight-two cycle calculation.
5. A general field Quillen–Lichtenbaum comparison is no longer restricted to the older Thomason proof's Tate–Tsen filtration or chosen Bott power. The general finite-cd statement uses the sheafified motivic/étale tower comparison. The older Bott theorem retains its actual hypotheses and erratum. The totally imaginary dyadic arithmetic comparison does not add an unwarranted μ4-containment hypothesis.
6. Naive tensorwise root inclusions, coefficient groups defined as K/m, underived completion, arbitrary ring products on mod-two K, identifying a real mapping fibre with its kernel, replacing a nontrivial extension by its graded pieces, and defining logarithmic forms as the image of the desired symbol map were all excluded. Their negative controls are in the README.
7. Unread Levine *Mixed Motives* and NSW book locators were replaced by the public MVW, Geisser, Kahn, Tate, Milne and Weibel sources actually read. No passage or file from a restricted book was copied. The failed initial MVW URL and the non-PDF NSW response were not used as evidence.
8. **Source-access limitation:** Bloch–Kato's 1986 paper proves injectivity but explicitly imports the logarithmic-generation/surjectivity result. Kato's 1982 LNM 967 contribution was not available in a cleared copy and was not downloaded from another mirror. The README separates that generation theorem and its leading-term/norm-trace proof targets from Bloch–Kato's relative elimination, and cites Weibel III.7.7.2 for the full statement. An independent reviewer should especially check that proof decomposition; this handoff does not claim to have read Kato's original proof.
9. **Supplier extension still required:** HodgeStructures' geometric Part II must supply the named logarithmic Deligne complexes/semipurity/compactification independence. QuadraticFormInvariants' successor must supply all-length Pfister splitting and the Milnor/Pfister compatibility without using the norm residue theorem under construction. Its binary/quaternion layer alone is insufficient. These are genuine prerequisite contracts, not claims that those packages are already complete. Real KO no longer needs a new successor: its existing open upstream owner was found and consumed.
10. **Order-file limitation:** `upstream/CaraianiNewton.md` orders a Caraiani–Newton subset and does not assign MotivicEtaleKTheory or most of its K-theory suppliers a tier or bundle. Its outside-the-94 appendix is not a global prohibition on those roadmaps. No tier was invented. The README gives the layer-level partial order and ownership, and does not cite an identified higher-tier target as if it were lower. The maintainer must assign the broader arithmetic K-theory family an upstream bundle/order before sending it upstream. The existing KTheoryFiniteLocalFields package review also records this routing issue (#11016, finding 7). This submission does not certify that all supplier packages have already gone upstream.
11. Supported étale characters retain the regular proper flat-model, smooth projective generic-fibre and positive-codimension hypotheses of Li–Liu Appendix B; no general vertical-cycle theorem was inferred from their generic-fibre lemma. This interface supplements the general supported rational character/Riemann–Roch work in Layer 9 and its owner.
12. Integral motivic images remain model-dependent groups and lattice candidates until finite generation, full rank and regulator injectivity are available. The final index/covolume and fundamental-line statements retain those explicit hypotheses. No special-value or Tamagawa-number conjecture was turned into a theorem. At 2 a determinant input needs the actual modified bounded perfect real complex.

## Mathematical adversarial pass

The rows below group each subsection's definitions, API laws and theorems; the target crosswalk further identifies the individual input statements. Every period-eight table row was checked at its first admitted degree, and every sign, shift, quotient and division was checked with the witnesses listed. These are mathematical checks of the proposed statements, not Lean proofs of the heavy targets. The six executable examples are exactly the two-per-definition subset statable at the pins; signs involving absent spectra, cycles and determinant carriers have README witnesses rather than fabricated Lean carriers.

| Statements and API checked | Instances and computed result | Revision or retained boundary |
|---|---|---|
| §1.1: The finite arithmetic coefficient dictionary | m=1: zero at every weight; real m=4: actions −1,+1; negative-weight evaluation has no cohomological sign; replacing ζ by ζ^a scales the generator by a^j and fixed-element coordinates by a^(−j). | Consume native twist carriers; retain only arithmetic/sheaf dictionaries. Explicitly distinguish generator scaling from coordinate scaling; no primitive root is part of the definition. |
| §1.2: Compact and divisible twists | Levels 1→2: correct lattice inclusion is ×ℓ, whereas weight-two tensorwise inclusion is ×ℓ²=0; weight-zero quotient is Qℓ/Zℓ. | Separate coefficient inclusions from tensorwise root inclusions, including negative twists and Bocksteins. |
| §1.3: Primewise divisible coefficients and cup products | Q has weight-two invariant order 24; weight zero has infinite invariants; the real degree-one mod-two square is nonzero; cor res=e. | Do not tensor Q/Z with itself or infer alternating cups at 2. Transfers obey projection rather than unital multiplicativity. |
| §1.4: Continuous étale coefficients and comparison maps | Separable closure: only H⁰; finite field: continuous H¹(Zℓ)=Zℓ, discrete H¹(Zℓ)=0; empty scheme/zero tower: zero; Milnor lim¹ remains without ML. | Use Rlim and bounded continuous cochains, not naive finite-level limits or discrete compact coefficients. |
| §1.5: Arithmetic étale comparison and Kummer sequences | Field Pic=0 recovers Kummer; nonzero Pic[n] gives extra classes; n=1 gives zero; unramified finite cover gives transfer degree. | Retain both Pic terms and use Br′ torsion, not an arbitrary equality H²(Gm)=Br′. |
| §1.6: Henselian specialization and residues | Unit residue 0, uniformizer residue +1; unit-left degree-one product residue is negative; empty deletion is identity; infinitely many compact residues need not form a direct sum. | Restrict compact direct-sum localization to finite supports and retain the henselian hypothesis. |
| §2.1: Ordinary real restriction, its kernel and its fibre | No real places: fibre=global complex; Q(√2),Z/3: diagonal H⁰ has cokernel Z/3; real D₀ and T₀ have opposite positive-degree parities. | Distinguish ordinary real cohomology, its restriction kernel and mapping fibre; retain the preceding cokernel. |
| §2.2: High degrees and the scope of duality | Totally imaginary high-degree target is zero; real mod-two cohomology never stops; finite H²(T) tensors to zero with Q₂/Z₂ but a free summand does not. | Require compact H² finiteness for the degree-two divisible isomorphism; virtual cd is not finite ordinary cd. |
| §2.3: Brauer and mod-two dimensions | Q,S={∞,2}: dimensions 2,1,1,0; no finite S-place can destroy invariant-sum surjectivity; −1 has nonzero all-negative signature. | Require a finite place for the surjective Brauer row; keep ε=u−t and strict ε<r₁. |
| §2.4: Adic finiteness, ranks and split real restriction | Weight zero has nonzero H⁰(V) and zero torsion cokernel; Q weights 2,3 give rank differences 0,1; imaginary quadratic gives 1,1. | Keep the general torsion cokernel, exclude j=0 from its shortcut, and do not designate the real splitting canonical. |
| §2.5: The localization diagram in degree two | {u,π}: tame residue ū versus cohomological −κ(ū); Pic/m can survive generic restriction; m=1 kills the coefficient rows. | Negative residue comparison retained. Ring symbol cannot be uniquely reconstructed from the field map. |
| §3.1: The finite and adic Steinberg relations | m=1 and algebraic closure give zero; over R the pair (−1,2) has zero cup but (−1,−1) is nonzero and not Steinberg. | Actual Kummer classes are tied by a+b=1; finite vanishing is not used alone to prove compact vanishing. |
| §3.2: Galois symbols and their functoriality | mth-power entries vanish; real quaternion symbol survives; Q at m=3 and {3,7} has nonzero residue; local divisible K₂ is killed. | Use tensor-valued coefficients rather than multiplication of roots; injectivity is not claimed on all integral K₂. |
| §3.3: Tate's diagram and the prime-power step | ℓ=2 has trivial cyclotomic descent; odd descent degree divides ℓ−1; γ(z⊗a^ℓ)=0; divisible kernel can be nonzero. | Prove degree-three obstruction vanishing at ℓ before using the prime-power diagram; no averaging by ℓ. |
| §3.4: Injectivity criteria, local fields and global fields | ℓth-power a gives the trivial extension; C/R norm misses −1; F₂((t)),ℓ=3 has zero target because μ₃(F₂)=0. | Exclude trivial Kummer extension in the restriction-kernel criterion. Function-field S-integer statement requires nonempty S. |
| §3.5: The ring symbol, Picard kernel and torsion generators | Q,ℓ=2 gives torsion order 8; Pic/ℓ is a possible kernel; real weight-two H³(T₂)=0 but H²(T₂) can survive. | Keep the multiquadratic exponent and ring Picard kernel; vanishing of one obstruction does not remove the real factor. |
| §4.1: Simplexes, cubes and admissible cycles | n=0 recovers cycles; field q>n gives zero; a face-contained cycle and a bad multiple intersection are rejected; constant positive cube is degenerate. | Test every face, not just divisors; use the normalized cubical quotient separately from simplicial cycles. |
| §4.2: Complexes, normalization and motivic grading | One-cube boundary is 0-face minus infinity-face; each two-face vertex occurs twice with opposite signs; CH^q(X,0)=H^(2q); normalized degree one retains infinity. | Fix differential and motivic shift before cycle symbols; do not kill both degree-one faces. |
| §4.3: Functoriality, moving and localization | Empty moving family gives all cycles; a cycle through a forbidden point fails; collapsed proper component maps to zero; degree-e component has coefficient e. | Proper/flat variance and localization extremes are explicit; homotopy invariance proves later Picard A¹ invariance. |
| §4.4: Products, low weights and the diagonal symbol | CH¹(F,1)=F× and CH¹(F,0)=0, versus Pic of a projective curve; F₂ units vanish but weight zero is Z; Steinberg two-chain and interchange sign retained. | Integral product uses MVW moving and tensor comparison; rational Levine comparison is not used as its sole supplier. |
| §4.5: Projective bundles and support purity | Rank-one projective bundle is X; rank zero is excluded; P¹ has ξ²=0 for ξ=c₁(O(1)); divisor purity shifts (2,1). | Specify positive rank, O(1) orientation and empty supported complex. |
| §4.6: Graphs and the last Gersten terms | Graph of t on A¹ gives +[0]; constant graph has divisor zero; graph(ab) equals graph(a)+graph(b) only in homology; DVR tame symbol is unit-last positive. | Keep graph, Milnor and cohomological boundary conventions separate and identify them by explicit signed maps. |
| §4.7: Descent and mixed-characteristic restrictions | Empty/disjoint union has zero/direct-sum complex; field has one coniveau term; DVR has a closed-point residue; mixed-base tail does not imply initial injectivity. | Integral mixed-characteristic Gersten beginning remains conditional where the cited source does not prove it. |
| §5.1: Finite correspondences | Point correspondences form Z with multiplicative composition; graph-transpose gives field degree; source supported on a proper subset is rejected; disconnected identity is sum of diagonals. | Require finite surjectivity onto a source component, not onto every component. |
| §5.2: Sheaves with transfers and their tensor product | Transfer unit tensors correctly; additive Yoneda tests identity; empty cover gives F(empty)=0; Z/m derived tensor has Tor in degree −1; shifted interchange has minus sign. | Derived transfer tensor and Nisnevich sheafification retain homological signs and higher Tor. |
| §5.3: Suslin complexes and homotopy-invariant sheaves | Weights zero/one are Z and Gm[−1]; base point is 1; A¹ evaluations are chain homotopic; zero stays zero; field detection includes transcendental fields. | Do not replace chain homotopy by degree-zero equality or universal field detection by algebraic extensions only. |
| §5.4: The effective category and cancellation | M(A¹)=unit; reduced M(Gm)=A(1)[1]; empty/disjoint union is zero/sum; projection splitting uses point 1. | Use the actual cancellation theorem in positive characteristic, not a resolution-only argument. |
| §5.5: Cycle transfers and the cycle comparison | Graph gives pullback; transpose field graph gives norm; weight-zero degree-e transfer multiplies by e; two affine torsors compare through their fibre product. | Cycle transfers and the independently supplied motive comparison are distinguished; equality of pages is not a derived comparison. |
| §5.6: Rigidity and the étale comparison | Constant invertible torsion sheaf passes henselian test; étale weights zero/one are constant/μm; finite field has higher cohomology; purely inseparable push-pull is p^e. | Invert p for inseparable equivalence; local constancy does not mean derived global sections are concentrated in degree zero. |
| §6.1: Motivic reduced powers and the coefficient algebra | C has ρ=0 but τ nonzero; R has ρ nonzero; P^d(u)=u^ℓ; zero/zeroth symmetric powers differ; p=q=0 is separate; μℓ at (0,1) shows split-Tate range matters. | Add actual unstable/radditive/derived-symmetric-power targets. Preserve char-zero, p≥2q, weight and scalar-action hypotheses. |
| §6.2: Relations and Milnor operations | Q₀ degree (1,0), Q₁ degree (2ℓ−1,ℓ−1); n=1 gives βP¹=P¹β−Q₁; real mod-two ρ terms survive; line Newton class is c₁^d. | Keep both odd-prime Adem sums and τ/ρ corrections, including Sq²Sq²=τSq³Sq¹; no topological-only coefficient algebra. |
| §6.3: Degree invariants, norm varieties and the motivic degree theorem | ν₀ degree-ℓ scheme has s₀=ℓ; conic at 2 has s₁=2; rational point would split a nonzero symbol; ℓ²-divisible characteristic number kills Thom coefficient. | Degree-zero characteristic number is degree, not tangent rank; dimensions alone do not give symbol splitting. |
| §6.4: Constructing the norm varieties | Weight-two binary neighbor has rank 3 and dimension 1; weight one separate; ℓ-special prime-to-ℓ extension is trivial; identity degree formula gives zero difference; m divisible by ℓ is excluded. | State fibre-tower DN hypotheses, cobordism/height comparison and nonzero preceding symbols; correct chain-lemma dimension versus next weight. |
| §6.5: Čech motives and the Rost summand | Cech(point) contracts, Cech(empty) does not; degree-ℓ point is not prime-to-ℓ; S⁰ is unit, S¹=M; ℓ=2 gives two Tate summands. | Construct divided symmetric comparison without 1/ℓ!; projector uses invertible λDλ and operation scalar must be a unit. |
| §6.6: The induction and the norm residue isomorphism | Weight zero identity, weight one Kummer, weight two Tate/Matsumoto; real nonalternating symbol survives; algebraic closure and m=1 vanish in required degrees. | Induction ranges over all field extensions; norm-variety existence is not deduced from the theorem it is meant to prove. |
| §7.1: Absolute logarithmic one-forms | Unit one gives zero; inverse changes sign; Fp(t) has nonzero dlog t but dlog(t^p)=0; Frobenius kills differentials semilinearly. | Use Ω over Z and the existing semilinear differential map, with kernel theorem for arbitrary characteristic-p fields. |
| §7.2: Tensor symbols and the Steinberg quotient | Empty tuple gives 1; positive tuple with 1 gives zero; repeated entry zero even at 2; dlog(s) wedge dlog(t) nonzero over Fp(s,t). | Distinguish alternating exterior powers from mere skew commutativity and from the tensor algebra; calculate Steinberg before quotienting. |
| §7.3: Cartier kernels and the mod-p comparison | Weight-zero Cartier kernel is Fp, not F; wp(t dlog t)=(t^p−t)dlog t; perfect fields have zero positive forms; t is not a pth power. | Logarithmic forms are the actual Artin–Schreier/Cartier kernel, not defined to be the symbol image; no F-linearity claim. |
| §7.4: The Bloch–Gabber–Kato theorem and its proof inputs | q=0 sends 1 to 1; q=1 kernel is pth powers; relative a belongs to I; prime-to-p trace rescales invertibly; infinite p-basis reduced to finite support. | Separate Kato logarithmic generation from Bloch–Kato injectivity. Original Kato proof access remains explicitly limited. |
| §7.5: Witt symbols and the coefficient-row induction | q=0 coefficient inclusion is ×p^(r−1); arbitrary A=Z/p gives a false injection at r=2; Witt dlog[t] reduces nontrivially; Tor transition is ×p. | Prove the Milnor torsion/divisibility input before coefficient-row induction. Illusie 5.7.5 is a pro-object result, not BGK itself. |
| §7.6: Prime powers away from the characteristic and continuity | Finite symbols/equalities descend in filtered unions; purely inseparable degree p is invertible modulo prime-to-p m; the same extension kills a mod-p unit class. | Keep characteristic-p logarithmic and prime-to-characteristic étale comparisons separate; continuity is an explicit construction. |
| §8.1: Facewise supports and support spectra | p=0 admits full support; n=0 ordinary codimension; field p>n allows only empty support; face-contained divisor fails; inverse image under immersion can fail. | Use every face, componentwise codimension and map-adapted supports; high simplex degrees prevent a naive uniform tower cutoff. |
| §8.2: Moving, localization and coherent functoriality | Empty/full support localization gives zero/identity; composed immersions need common adapted supports; A¹ gives equivalence of entire tower; finite-field moving uses coprime degrees. | Coherent moving roofs replace unrelated chosen inverses; degree arguments are integral, not localized at one auxiliary degree. |
| §8.3: Semilocal simplexes and well-connectedness | Semilocal Δ¹ keeps both vertices; Δ⁰ value is K(F), not zero; rank(O)=+1; K has higher homotopy although zero layer is HZ; p<d supported layer vanishes. | Separate levels from layers and start multirelative vanishing at n=1. Henselian and semilocal inputs remain actual K-theory constructions. |
| §8.4: Pointwise ranks and the cycle-layer equivalence | Transverse reduced intersection coefficient +1, length-e coefficient e; two Tor terms give alternating length difference; codimension-p generator is identity Z→Z. | Cycle map uses Euler length of derived face intersections; field weight-one π₁ is F×, fixing the shift. |
| §8.5: Global coherent models and the Friedlander–Suslin comparison | Bundles face-exact; face-supported sheaves can fail Tor vanishing; generic length e maps to e; p=0 augmentation is original K; shift [2p] gives H^(2p−m). | Global coherent and Friedlander–Suslin roofs are actual tower maps, not inferred from matching homotopy-group names. |
| §8.6: Exact couples, indexing and convergence | (p,m)=(0,0),(1,1) test (a,b)=(0,0),(0,−1); native d₁ becomes displayed d₂; dimension bound must control m and m+1. | Reindex exact couple explicitly; use both degrees to eliminate lim¹ and identify quotient completion with K. |
| §8.7: Products and operations on the tower | Rank unit has weight 0; lift change F^(p+u) dies modulo F^(p+q+u); ψ² eigenvalues at weights 1,2 are 2,4; moduli 2,4 do not inherit a commutative product. | Require moved product roofs, actual layer product identification and support-boundary Adams compatibility before rational degeneration. |
| §9.1: Universal classes and the additive higher character | Trivial bundle has zero positive Chern classes; sum of two O(1) has nonzero c₂; ch(O(1))=1+h+h²/2; a₁,a₂,a₃,a₄=1,−1,1/2,−1/6. | Separate degree-zero Newton character from positive-degree scalar factor. Chern class itself is not additive on K₀. |
| §9.2: Products, Adams weights and the inverse cycle construction | Reduced generic cycle coefficient +1 and length-e coefficient e; raw O_Z can have higher weights; degenerate cube is nullhomotopic; units product normalized coefficient +1. | Add relative cycle inverse and Adams projection, rather than assuming rational degeneration constructs a normalized character. |
| §9.3: Identifying the spectral-sequence comparison | Field K₀ character is rank; K₁ is unit; P² weights 0,1,2 and O(1) character tests factorial; ψ² projector denominator 4−2 not integral at 2. | Prove character agrees with actual tower edge and gamma filtration; splitting is rational with nonzero weight denominators. |
| §9.4: Supported localization and its normalization | Uniformizer K₁ and divisor boundary both +1; unit-last Milnor tame boundary positive but cohomological symbol residue negative; empty/full supports give zero/ordinary character. | Explicitly transport higher-boundary convention; codimension c shifts cohomological residue by 2c−1, not c. |
| §10.1: The truncated cycle comparison without resolution | Weight zero constant, weight one Kummer with Pic term; diagonal gives symbol and next degree only injection; smoothable constant theory need not be malleable; m=1 zero. | Plan full resolution-free normal-crossing, semilocal-cube, type-at-infinity and uniqueness proof; do not apply μm comparison at characteristic modulus. |
| §10.2: Smooth Dedekind bases | Z[1/ℓ] admits ℓ-power coefficients whereas Z does not globally; closed fibre shifts (2,1); weights zero/one constant/Kummer with Pic. | Use mixed-base motivic comparison and purity, not a field-only replacement or characteristic-p henselian claim at ℓ. |
| §10.3: Periodic étale K-theory and Bott descent | Geometric point has periodic even groups in negative degrees; d_r lowers t−s by 1; generic residue field included in cd bound; real ℓ=2 excluded. | Keep corrected Thomason hypotheses and actual Bott power/trivialization. Coherent spectral sheaf supplier and completion owner are identified. |
| §10.4: The Quillen–Lichtenbaum range | Separable closure d=0 gives all nonnegative degrees; finite field d=1 starts at 0; arithmetic d≤2 starts at 1; real dyadic finite-cd hypothesis fails. | Restore general finite-cd field theorem via motivic/étale towers, independent of the older Bott proof's extra Tate–Tsen hypothesis. |
| §10.5: Coefficients, completion and arithmetic degrees | j=2 compact even slot H² versus finite extra H⁰; j=1 would introduce H⁰(Zℓ); inverting ℓ adds unit ℓ to K₁; compact H⁰ can vanish while reductions have invariants. | Use genuine coefficient spectra, derived completion and j≥2 arithmetic identifications; integral localization starts in K-degree 2. |
| §10.6: Transfers and the duality sign | Split degree-d cover sends rank 1 to d; two-sheet trace of product is 2 versus product of traces 4; duality weights 2,3 signs +,−. | Transfer is projection-formula compatible, not a unital ring map; invert Adams parameter and retain ramified different-line hypotheses. |
| §11.1: The real comparison and its nontrivial extension | m=1 zero; real degree-zero rank separate; mod-two degree 2 cyclic Z/4; residues 5,6,7 zero; N=3 stability i≤1; I=0 reduced bar complex zero. | Consume existing KO/Bott/complexification owner. Construct actual real comparison proof and nontrivial coefficient extension, with proper ideal/rigidity hypotheses. |
| §11.2: Real restriction as a map of coefficient fibres | Identity fibre zero, zero-target fibre source; preceding cokernel may survive; Z/4 versus (Z/2)^2 distinguishes extension; real cd₂ infinite. | Restriction is a map of coefficient fibres. Ordinary kernel or E-infinity graded groups cannot replace the fibre and its boundaries. |
| §11.3: Divisible dyadic coefficients | n=0 gives Q₂/Z₂; r₁=1 removes rank r₁−1; residues 2,6 are Z/2 and 0. | Check first admitted degree in each periodic row; retain the residue-five extension rather than a chosen splitting. |
| §11.4: The mod-two filtration and its signature defect | r₁=1,ε=0 removes the defect factor; enlarging S can change ε; Pic/2 survives K₀; real mod-two Z/4 is not an F₂ vector space. | Restrict positive-degree periodic row at residue 0 appropriately and state genuine filtration/extension data. |
| §11.5: Integral dyadic torsion | Q(√7) gives ρ=1,ε=0 but changing S changes extension; Q(√2) has ρ=0; n=2 is H²(2), n=5 torsion zero; r₁=1 forces ρ=0. | Keep ρ separate from signature defect and retain nonnegative ranks; totally imaginary case stays in Layer 10. |
| §12.1: Finite étale Chern maps and supported cycle classes | Diagonal Chern factors at i=1,2,3 are +1,−1,+2; factorial may vanish modulo m; reduced supported cycle coefficient +1; vertical support can die generically. | No finite factorial division. Products require admitted coefficient product; Li–Liu model hypotheses and positive codimension retained. |
| §12.2: Deligne complexes and the regulator roof | Cube orientation J₀=1,J₁=−1 fixes chain map; point Deligne quotient is C/(2πi)^p R; weight-one regulator log absolute value; inverse unit changes sign. | Specify actual support-cone roof, compactification independence and geometric Hodge supplier; positive-degree weight-three coefficient 1/2, not 1/6. |
| §12.3: The early number-field regulator and integral images | Conjugation gives dimensions r₂ for even j and r₁+r₂ for odd j; real place contributes zero at j=2; zero/torsion image regulator vanishes; 2Z versus Z has index 2. | Integral image and rational integral part are distinguished from a proven full lattice; model enlargement remains localization-dependent. |
| §12.4: Realization and Euler-factor conventions | Tate weight-one Rubin polynomial 1−X versus geometric 1−q^(−1)X; elliptic determinant q versus q^(−1); rank-two constant term 1. | Fix Frobenius, duality and twist dictionaries before Euler relations; q=1 is only a formal identity check, never an arithmetic residue cardinality. |
| §12.5: Norm-compatible regulator families | K₁ unit plus i−1 Bott factors has degree 2i−1; identity unit gives zero; level reduction uses norm/projection; fixed-base family cannot be normed again. | Distinguish fixed-base and extension-level families; genuine Euler polynomial relation is an extra hypothesis with named regulator target. |
| §12.6: Local Tate conditions and elliptic Selmer adapters | Qp(1) unit finite, uniformizer not finite; j≥2 dimension [K:Qp]; lattice torsion belongs to inverse-image finite condition; away-p elliptic rational image zero. | Keep weight-one exception and semistable versus finite distinction; Selmer-complex map requires actual local homotopies, not H¹ membership alone. |
| §12.7: Determinant lines and local factors | Zero complex unit line; degree-zero local term contributes inverse determinant; [Λ --π^s→ Λ] has inverse determinant image π^(−s)Λ; odd factors swap sign. | Specify graded order, bounded perfect real modification at 2 and conditional period/regulator isomorphisms; no zeta-element existence asserted. |
| §12.8: The number-field Chern lattice index | j=2 sign −1 preserves covolume; j=3 factor 2 changes rank-r covolume by 2^r; rank zero gives 1; I=Z,Lc=2Z,j=3 gives ratio 1. | Retain finite-generation, integral finite-index and real-isomorphism hypotheses; index is e, not its inverse, and Borel coordinate change is separate. |

## Target crosswalk

All 195 distinct target IDs in the fourteen queried stage projections have a location below. These match the 195 node records in the five accepted packet files exactly. The broad norm-residue target and its detailed induction targets have separate input IDs but one final construction. The coniveau refinements replace the older high-level construction with one compatible tower; none is an alternative definition of K-theory.

### M.1

| Input target | README subsections |
|---|---|
| `MotivicEtaleKTheory:M.1/finite-tate-twist` | 1.1 |
| `MotivicEtaleKTheory:M.1/adic-tate-twist` | 1.2 |
| `MotivicEtaleKTheory:M.1/primewise-q-mod-z-twist` | 1.3 |
| `MotivicEtaleKTheory:M.1/twisted-cohomology-ring` | 1.3 |
| `MotivicEtaleKTheory:M.1/continuous-limit-comparison` | 1.4 |
| `MotivicEtaleKTheory:M.1/etale-twist-sheaf` | 1.4 |
| `MotivicEtaleKTheory:M.1/field-etale-galois-comparison` | 1.4 |
| `MotivicEtaleKTheory:M.1/s-integer-galois-comparison` | 1.5 |
| `MotivicEtaleKTheory:M.1/etale-kummer-sequences` | 1.5 |
| `MotivicEtaleKTheory:M.1/henselian-residue-comparison` | 1.6 |
| `MotivicEtaleKTheory:M.1/localization-gysin-sequence` | 1.6 |

### M.2

| Input target | README subsections |
|---|---|
| `MotivicEtaleKTheory:M.2/real-restriction-map` | 2.1 |
| `MotivicEtaleKTheory:M.2/positive-and-modified-cohomology` | 2.1 |
| `MotivicEtaleKTheory:M.2/high-degree-real-isomorphism` | 2.2 |
| `MotivicEtaleKTheory:M.2/s-integer-brauer-sequence` | 2.3 |
| `MotivicEtaleKTheory:M.2/mod-two-dimension-formulas` | 2.3 |
| `MotivicEtaleKTheory:M.2/even-twist-real-surjection` | 2.4 |
| `MotivicEtaleKTheory:M.2/adic-s-integer-cohomology` | 2.4 |
| `MotivicEtaleKTheory:M.2/degree-two-localization-diagram` | 2.5 |

### M.3

| Input target | README subsections |
|---|---|
| `MotivicEtaleKTheory:M.3/cohomological-steinberg` | 3.1 |
| `MotivicEtaleKTheory:M.3/galois-symbol` | 3.2 |
| `MotivicEtaleKTheory:M.3/adic-galois-symbol` | 3.2 |
| `MotivicEtaleKTheory:M.3/symbol-norm-compatibility` | 3.2 |
| `MotivicEtaleKTheory:M.3/symbol-residue-compatibility` | 3.2 |
| `MotivicEtaleKTheory:M.3/tate-local` | 3.4 |
| `MotivicEtaleKTheory:M.3/tate-global` | 3.4 |
| `MotivicEtaleKTheory:M.3/tate-torsion-symbols` | 3.5 |
| `MotivicEtaleKTheory:M.3/tate-s-integer` | 3.5 |
| `MotivicEtaleKTheory:M.3/tate-picard-sequence` | 3.5 |
| `MotivicEtaleKTheory:M.3/tate-adic-comparison` | 3.3 |
| `MotivicEtaleKTheory:M.3/tate-injectivity-criterion` | 3.4 |
| `MotivicEtaleKTheory:M.3/tate-gamma-kernel` | 3.5 |

### M.4

| Input target | README subsections |
|---|---|
| `MotivicEtaleKTheory:M.4/algebraic-simplex` | 4.1 |
| `MotivicEtaleKTheory:M.4/admissible-cycles` | 4.1 |
| `MotivicEtaleKTheory:M.4/cycle-complex` | 4.2 |
| `MotivicEtaleKTheory:M.4/cubical-cycle-complex` | 4.2 |
| `MotivicEtaleKTheory:M.4/simplicial-cubical-comparison` | 4.2 |
| `MotivicEtaleKTheory:M.4/functoriality` | 4.3 |
| `MotivicEtaleKTheory:M.4/homotopy-invariance` | 4.3 |
| `MotivicEtaleKTheory:M.4/moving-lemma` | 4.3 |
| `MotivicEtaleKTheory:M.4/localization-sequence` | 4.3 |
| `MotivicEtaleKTheory:M.4/products` | 4.4 |
| `MotivicEtaleKTheory:M.4/chow-degree-zero` | 4.4 |
| `MotivicEtaleKTheory:M.4/weight-zero-and-one` | 4.4 |
| `MotivicEtaleKTheory:M.4/vanishing-above-weight` | 4.4 |
| `MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro` | 4.4 |
| `MotivicEtaleKTheory:M.4/weight-two-symbol-comparison` | 4.4 |
| `MotivicEtaleKTheory:M.4/projective-bundle-formula` | 4.5 |
| `MotivicEtaleKTheory:M.4/purity-gysin-triangle` | 4.5 |
| `MotivicEtaleKTheory:M.4/dedekind-cycle-complex` | 4.1,4.7 |
| `MotivicEtaleKTheory:M.4/dedekind-gersten` | 4.6 |
| `MotivicEtaleKTheory:M.4/zariski-descent` | 4.7 |
| `MotivicEtaleKTheory:M.4/gersten-graph-comparison` | 4.6 |

### M.5

| Input target | README subsections |
|---|---|
| `MotivicEtaleKTheory:M.5/norm-residue-theorem` | 6.6,7.6 |

### M.5a

| Input target | README subsections |
|---|---|
| `MotivicEtaleKTheory:M.5a/finite-correspondence` | 5.1 |
| `MotivicEtaleKTheory:M.5a/presheaf-with-transfers` | 5.2 |
| `MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes` | 5.3 |
| `MotivicEtaleKTheory:M.5a/homotopy-invariant-sheaves` | 5.3 |
| `MotivicEtaleKTheory:M.5a/effective-motives` | 5.4 |
| `MotivicEtaleKTheory:M.5a/cancellation` | 5.4 |
| `MotivicEtaleKTheory:M.5a/cycle-complex-transfers` | 5.5 |
| `MotivicEtaleKTheory:M.5a/etale-motivic-comparison` | 5.6 |
| `MotivicEtaleKTheory:M.5a/imperfect-field-passage` | 7.6 |
| `MotivicEtaleKTheory:M.5a/tensor-product-transfers` | 5.2 |
| `MotivicEtaleKTheory:M.5a/suslin-rigidity` | 5.6 |
| `MotivicEtaleKTheory:M.5a/etale-a1-local-complexes` | 5.6 |

### M.5b

| Input target | README subsections |
|---|---|
| `MotivicEtaleKTheory:M.5b/motivic-steenrod-operations` | 6.1 |
| `MotivicEtaleKTheory:M.5b/steenrod-relations` | 6.2 |
| `MotivicEtaleKTheory:M.5b/milnor-operations` | 6.2 |
| `MotivicEtaleKTheory:M.5b/nu-variety` | 6.3 |
| `MotivicEtaleKTheory:M.5b/degree-theorem` | 6.3 |
| `MotivicEtaleKTheory:M.5b/pfister-norm-variety` | 6.4 |
| `MotivicEtaleKTheory:M.5b/chain-lemma-and-norm-principle` | 6.4 |
| `MotivicEtaleKTheory:M.5b/norm-variety-existence` | 6.4 |
| `MotivicEtaleKTheory:M.5b/cech-simplicial-scheme` | 6.5 |
| `MotivicEtaleKTheory:M.5b/dn-degree-theorem` | 6.4 |

### M.5c

| Input target | README subsections |
|---|---|
| `MotivicEtaleKTheory:M.5c/rost-motive` | 6.5 |
| `MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees` | 6.6 |
| `MotivicEtaleKTheory:M.5c/hilbert-ninety-induction` | 6.6 |
| `MotivicEtaleKTheory:M.5c/mod-l-norm-residue` | 6.6 |
| `MotivicEtaleKTheory:M.5c/symmetric-power-operation` | 6.5 |
| `MotivicEtaleKTheory:M.5c/hilbert-ninety-implies-beilinson-lichtenbaum` | 6.6 |

### M.5d

| Input target | README subsections |
|---|---|
| `MotivicEtaleKTheory:M.5d/logarithmic-one-form` | 7.1 |
| `MotivicEtaleKTheory:M.5d/logarithmic-one-form-natural` | 7.1 |
| `MotivicEtaleKTheory:M.5d/tensor-differential-symbol` | 7.2 |
| `MotivicEtaleKTheory:M.5d/steinberg-vanishing` | 7.2 |
| `MotivicEtaleKTheory:M.5d/milnor-differential-symbol` | 7.2 |
| `MotivicEtaleKTheory:M.5d/milnor-symbol-natural` | 7.2 |
| `MotivicEtaleKTheory:M.5d/milnor-symbol-product` | 7.2 |
| `MotivicEtaleKTheory:M.5d/characteristic-annihilation` | 7.3 |
| `MotivicEtaleKTheory:M.5d/mod-p-differential-symbol` | 7.3 |
| `MotivicEtaleKTheory:M.5d/artin-schreier-differential` | 7.3 |
| `MotivicEtaleKTheory:M.5d/artin-schreier-logarithmic-formula` | 7.3 |
| `MotivicEtaleKTheory:M.5d/logarithmic-differential-group` | 7.3 |
| `MotivicEtaleKTheory:M.5d/differential-symbol-fixed` | 7.3 |
| `MotivicEtaleKTheory:M.5d/logarithmic-symbol` | 7.3 |
| `MotivicEtaleKTheory:M.5d/weight-zero-comparison` | 7.3 |
| `MotivicEtaleKTheory:M.5d/perfect-field-differentials` | 7.3 |
| `MotivicEtaleKTheory:M.5d/perfect-field-milnor-mod-p` | 7.3 |
| `MotivicEtaleKTheory:M.5d/weight-one-injectivity` | 7.3 |
| `MotivicEtaleKTheory:M.5d/bloch-gabber-kato` | 7.4 |
| `MotivicEtaleKTheory:M.5d/witt-logarithmic-symbol` | 7.5 |
| `MotivicEtaleKTheory:M.5d/milnor-coefficient-row` | 7.5 |
| `MotivicEtaleKTheory:M.5d/prime-power-bgk` | 7.5 |
| `MotivicEtaleKTheory:M.5d/milnor-torsion-divisible` | 7.5 |
| `MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison` | 7.6 |
| `MotivicEtaleKTheory:M.5d/prime-power-norm-residue` | 7.6 |
| `MotivicEtaleKTheory:M.5d/filtered-colimit-comparisons` | 7.6 |
| `MotivicEtaleKTheory:M.5d/inseparable-and-characteristic-reductions` | 7.6 |

### M.6

| Input target | README subsections |
|---|---|
| `MotivicEtaleKTheory:M.6/motivic-spectral-sequence` | 8.6 |
| `MotivicEtaleKTheory:M.6/rational-weight-comparison` | 8.7,9.3 |
| `MotivicEtaleKTheory:M.6/universal-motivic-chern` | 9.1 |
| `MotivicEtaleKTheory:M.6/higher-chern-normalization` | 9.1 |
| `MotivicEtaleKTheory:M.6/higher-character-structure` | 9.2 |
| `MotivicEtaleKTheory:M.6/gamma-homotopy-coniveau-comparison` | 9.3 |
| `MotivicEtaleKTheory:M.6/relative-cycle-normalization` | 9.2 |
| `MotivicEtaleKTheory:M.6/chern-character-edge-comparison` | 9.3 |
| `MotivicEtaleKTheory:M.6/chern-localization-residue` | 9.4 |

### M.6a

| Input target | README subsections |
|---|---|
| `MotivicEtaleKTheory:M.6a/admissible-k-supports` | 8.1 |
| `MotivicEtaleKTheory:M.6a/homotopy-coniveau-tower` | 8.1 |
| `MotivicEtaleKTheory:M.6a/moving-and-excision` | 8.2 |
| `MotivicEtaleKTheory:M.6a/k-theory-well-connected` | 8.3 |
| `MotivicEtaleKTheory:M.6a/coniveau-cycle-layer` | 8.4 |
| `MotivicEtaleKTheory:M.6a/global-model-comparison` | 8.5 |
| `MotivicEtaleKTheory:M.6a/facewise-supports` | 8.1 |
| `MotivicEtaleKTheory:M.6a/support-tower` | 8.1 |
| `MotivicEtaleKTheory:M.6a/k-support-axioms` | 8.2 |
| `MotivicEtaleKTheory:M.6a/moving-with-constraints` | 8.2 |
| `MotivicEtaleKTheory:M.6a/localisation-excision` | 8.2 |
| `MotivicEtaleKTheory:M.6a/functorial-tower` | 8.2 |
| `MotivicEtaleKTheory:M.6a/tower-homotopy-invariance` | 8.2 |
| `MotivicEtaleKTheory:M.6a/semilocal-simplex` | 8.3 |
| `MotivicEtaleKTheory:M.6a/well-connected-theory` | 8.3 |
| `MotivicEtaleKTheory:M.6a/purity-t-loop-shift` | 8.3 |
| `MotivicEtaleKTheory:M.6a/semilocal-criterion` | 8.3 |
| `MotivicEtaleKTheory:M.6a/k-well-connected` | 8.3 |
| `MotivicEtaleKTheory:M.6a/layer-idempotence` | 8.3 |
| `MotivicEtaleKTheory:M.6a/point-layer-model` | 8.4 |
| `MotivicEtaleKTheory:M.6a/pointwise-cycle-map` | 8.4 |
| `MotivicEtaleKTheory:M.6a/face-rank-compatibility` | 8.4 |
| `MotivicEtaleKTheory:M.6a/layer-cycle-equivalence` | 8.4 |
| `MotivicEtaleKTheory:M.6a/face-exact-coherent-model` | 8.5 |
| `MotivicEtaleKTheory:M.6a/levine-global-comparison` | 8.5 |
| `MotivicEtaleKTheory:M.6a/friedlander-suslin-support-tower` | 8.5 |
| `MotivicEtaleKTheory:M.6a/friedlander-suslin-global-layer` | 8.5 |

### M.6b

| Input target | README subsections |
|---|---|
| `MotivicEtaleKTheory:M.6b/motivic-exact-couple` | 8.6 |
| `MotivicEtaleKTheory:M.6b/motivic-strong-convergence` | 8.6 |
| `MotivicEtaleKTheory:M.6b/filtered-motivic-products` | 8.7 |
| `MotivicEtaleKTheory:M.6b/filtered-adams-operations` | 8.7 |
| `MotivicEtaleKTheory:M.6b/rational-motivic-degeneration` | 8.7 |
| `MotivicEtaleKTheory:M.6b/motivic-native-index-transport` | 8.6 |
| `MotivicEtaleKTheory:M.6b/simultaneously-moved-product-roof` | 8.7 |
| `MotivicEtaleKTheory:M.6b/product-cycle-layer-identification` | 8.7 |
| `MotivicEtaleKTheory:M.6b/adams-support-boundary-comparison` | 8.7 |
| `MotivicEtaleKTheory:M.6b/motivic-quotient-completion` | 8.6 |

### M.7

| Input target | README subsections |
|---|---|
| `MotivicEtaleKTheory:M.7/beilinson-lichtenbaum` | 10.1 |
| `MotivicEtaleKTheory:M.7/dedekind-motivic-comparison` | 10.2 |
| `MotivicEtaleKTheory:M.7/finite-etale-k-theory` | 10.3 |
| `MotivicEtaleKTheory:M.7/bott-etale-descent` | 10.3 |
| `MotivicEtaleKTheory:M.7/quillen-lichtenbaum-field-range` | 10.4 |
| `MotivicEtaleKTheory:M.7/s-integer-comparison-range` | 10.4 |
| `MotivicEtaleKTheory:M.7/arithmetic-adic-degrees` | 10.5 |
| `MotivicEtaleKTheory:M.7/etale-adams-weights` | 10.6 |
| `MotivicEtaleKTheory:M.7/etale-k-transfer` | 10.6 |
| `MotivicEtaleKTheory:M.7/number-ring-duality-sign` | 10.6 |
| `MotivicEtaleKTheory:M.7/suslin-real-comparison` | 11.1 |
| `MotivicEtaleKTheory:M.7/real-mod-two-sequence` | 11.1 |
| `MotivicEtaleKTheory:M.7/real-place-correction` | 11.2 |
| `MotivicEtaleKTheory:M.7/dyadic-s-integer-extensions` | 11.3–11.5 |
| `MotivicEtaleKTheory:M.7/corrected-thomason-descent` | 10.3 |
| `MotivicEtaleKTheory:M.7/finite-etale-descent-transfer` | 10.6 |
| `MotivicEtaleKTheory:M.7/arithmetic-bockstein-comparison` | 10.5 |
| `MotivicEtaleKTheory:M.7/real-restriction-boundary-square` | 11.2 |
| `MotivicEtaleKTheory:M.7/dyadic-mod-two-filtration` | 11.4 |
| `MotivicEtaleKTheory:M.7/dyadic-integral-torsion-filtration` | 11.5 |

### M.8

| Input target | README subsections |
|---|---|
| `MotivicEtaleKTheory:M.8/finite-etale-chern` | 12.1,9.4 |
| `MotivicEtaleKTheory:M.8/motivic-chern-character` | 9.1–9.3 |
| `MotivicEtaleKTheory:M.8/supported-cycle-character` | 12.1,9.4 |
| `MotivicEtaleKTheory:M.8/deligne-regulator` | 12.2 |
| `MotivicEtaleKTheory:M.8/number-field-deligne-normalization` | 12.3 |
| `MotivicEtaleKTheory:M.8/chern-functoriality` | 12.1,9.4 |
| `MotivicEtaleKTheory:M.8/integral-motivic-structures` | 12.3 |
| `MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary` | 12.4 |
| `MotivicEtaleKTheory:M.8/norm-compatible-regulator-families` | 12.5 |
| `MotivicEtaleKTheory:M.8/euler-factor-regulator-compatibility` | 12.5 |
| `MotivicEtaleKTheory:M.8/selmer-regulator-factorization` | 12.6 |
| `MotivicEtaleKTheory:M.8/arithmetic-fundamental-line` | 12.7 |
| `MotivicEtaleKTheory:M.8/regulator-determinant-comparison` | 12.7 |
| `MotivicEtaleKTheory:M.8/cubical-deligne-regulator-roof` | 12.2 |
| `MotivicEtaleKTheory:M.8/beilinson-character-comparison` | 12.2 |
| `MotivicEtaleKTheory:M.8/native-tate-euler-normalizations` | 12.4 |
| `MotivicEtaleKTheory:M.8/local-tate-regulator-finite-condition` | 12.6 |
| `MotivicEtaleKTheory:M.8/elliptic-kummer-selmer-adapter` | 12.6 |
| `MotivicEtaleKTheory:M.8/selmer-local-determinant-comparison` | 12.7 |
| `MotivicEtaleKTheory:M.8/number-field-chern-lattice-index` | 12.8 |

## Sources checked

The public source versions below were accessed on 2026-10-19. SHA-256 records identify the files actually read. All repository statements are in the worker's own words; no source excerpts, PDF files or section-by-section source summaries are deliverables.

Important locator corrections include MVW Properties 17.4 (not a theorem numbered 17.4), Proposition 19.12; Levine's cubical comparison Theorem 4.7 at published p.296; the distinct Voevodsky papers 0805.4431 (simplicial schemes) and 0805.4432/its published EM version; published EM Corollary 3.33 (not the old preprint numbering); Haesemeyer–Weibel's 32-page author PDF, with Theorem 8.1 pp.22–23, Corollary 9.8 p.25 and Appendix A pp.28–31; Illusie I.5.7.5 as a pro-object theorem; Nekovář–Nizioł Proposition 5.7 p.1777 and Theorem 5.9 p.1779; and Kato's *Tamagawa number conjecture for zeta values*. Weibel VI.4.1–4.2, pp.480–481, replaces an incorrect generic citation to his curve example VI.4.6. The higher Chern, cycle-edge and gamma comparison is supported by Levine's actual §§11–14 and Appendices C–D rather than by rational degeneration alone. The finite coefficient product hypothesis is Weibel V.11.3.2, pp.453–454.

| Public file | SHA-256 |
|---|---|
| [Kbook](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) | `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845` |
| [VoevodskyNR](https://arxiv.org/pdf/0805.4430v2) | `9f4b7ed2624a8b412bcc9baea75b32dd5f72f9035267a77f6115c6d6c0234d0a` |
| [VoevodskyRPO](https://arxiv.org/pdf/math/0107109v1) | `a47880bd5aaf51b8341e472561110c91994144e95460f3141a3e6922547a2d8f` |
| [VoevodskyCancel](https://arxiv.org/pdf/math/0202012v1) | `834de6dc40560395512507023eb6241e155673edf3c4f159836658dfee650d6a` |
| [VoevodskyMCZ2](https://www.numdam.org/item/10.1007/s10240-003-0010-6.pdf) | `94abfd028ce8185ee044903c9fdf565de182aa29ebb6be07632fd544d4cdfb5c` |
| [VoevodskyMSS](https://arxiv.org/pdf/0805.4431v1) | `c37407ef2781b49aef9af2231bce6179320f7b7541bebcf1635f304845bc9d69` |
| [LevineConiveau](https://arxiv.org/pdf/math/0510334v1) | `5f268002b5ec36a74932a48ac051712c9c19c41a8b76e5bcb5dcdf0800538190` |
| [LevineMoving](https://arxiv.org/pdf/math/0510201v1) | `24cae98fca1a47bf910e30b0e4505c36f4a113e8f82c3103a5e7f0115fbb55c4` |
| [LevineSchemes](https://www.esaga.uni-due.de/f/marc.levine/publ/KthyMotI12.01.pdf) | `67affc5d6f837a78281c824d21723be9af1180bb77d44e8cff9cca5b0b2ef820` |
| [LevineChow](https://www.numdam.org/article/AST_1994__226__235_0.pdf) | `5f4de92e51f03dfb9a4708f70ed9a8f58d2c2a51e310eeb4d597be84c7450984` |
| [FriedlanderSuslin](https://www.numdam.org/item/ASENS_2002_4_35_6_773_0.pdf) | `a1b0ab836b72516b64ac15a9969d53018a59a7f98c340ba19912c0e9c7ffc266` |
| [Geisser](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf) | `88b92df6124b0e3a2be09ac24250c2b811572628d17a6282e787e0883160091f` |
| [BK](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf) | `51cf9c3fe85c3d55a6af56c9789c831b810cdd4c9b2c275057dcde6c14730dc8` |
| [MilneADT](https://www.jmilne.org/math/Books/ADTnot.pdf) | `2c6195ec76a974f3f336c77cb71cc3845b018aad2d43136716b3477a3bc5fb31` |
| [Chain](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chain-final.pdf) | `355cc3d96da367fa85001c6291bf298930a2b6ece246186f8f1f2e6145ec27ac` |
| [Tate](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf) | `5d1ee68e3f9cc49ba6cac8269e1c9ca510411c6a154f36b559290849a72db7b7` |
| [Thomason](https://numdam.org/item/10.24033/asens.1495.pdf) | `3497d34982b0f7f43682cb978a3a031cc7567c899a43a6558bb424318111bb16` |
| [ThomasonErr](https://numdam.org/item/10.24033/asens.1596.pdf) | `c38909eb3f20bd1b5a157cf78ff1486d4ae01f2c92e7d0788557f64f042f4e73` |
| [BurgosFeliu](https://arxiv.org/pdf/0907.5169v1) | `247b162be9661763dbf94bc82f33ccdd8fed463e91c22bb57402992e2d26196b` |
| [NekovarNiziol](https://msp.org/ant/2016/10-8/ant-v10-n8-p04-p.pdf) | `f14f7b7f929c7d79d299b215bcbccfbe4a5b1fdfae61dd8587f3aefbdcf6415b` |
| [Burgos](https://www.icmat.es/miembros/burgos/files/brbr.pdf) | `da6ba8c4b08bf447d1575788c33b96c52d8d0d0a377e8f2990ead6aed73f65ea` |
| [Riou](https://arxiv.org/pdf/0907.2710v2) | `4cc98488dd7482a96af54c9f03ffd4a250022ba75aa4e1889e09343d937bfd8c` |
| [FGV](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf) | `5d717b2a94288593049be2aed34e38dbde10750beba4bd3d3387820d038e8807` |
| [KatoTNC](https://arxiv.org/pdf/math/0304233v1) | `6d7f3a5924fd5291bc23870547b05552ba7fb1e39413d551f11daf052fbcf12b` |
| [Totaro](https://www.math.ucla.edu/~totaro/papers/public_html/milnor.pdf) | `3447b12c9108d37528d998376051d7e60f0461584f61c1e980bdaa46ada43aee` |
| [Park](https://arxiv.org/pdf/2108.13561v2) | `2eb581265b4d0ff9fee6b944393de0c6c63b726f7b078f38a2058e90657af53f` |
| [Spitzweck](https://arxiv.org/pdf/1207.4078v3) | `7da11119650a216f3722152c6b2e6b6b9b9feb1b28bf1f1f335e7e4ab20c6e74` |
| [MVW](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/Lecture_notes_on_motivic_cohology_published.pdf) | `1197e239873e2a7f7f4dcbd1d115af67281a6d0867eff8816cc630b86b67f020` |
| [BM](https://arxiv.org/pdf/1508.00014v3) | `35efeb3e0da2ff2093d646af957e35a0e5c0241bb5a65c083c26e8cd17fac16f` |
| [Soule](https://www.numdam.org/item/AST_1987__147-148__225_0.pdf) | `714881bf6d8d10db209d9a3f03835fb048e4fc85ae103942daaefc3924efb0b7` |
| [Calmes](https://arxiv.org/pdf/2009.07225v4) | `1e4b6720055ebdce0012f5780bfc7cdb5b853e32f29b17224a1be0bc676f770c` |
| [BK90](https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf) | `ec89c6436c7e16580791eddd562c8c04a12442d8a8484f8ac75c5ea8dc04f5e5` |
| [KahnGL](https://webusers.imj-prg.fr/~bruno.kahn/preprints/glrMathAnn.pdf) | `3bd7d9f28aa9a100a26cd3b95ba32f31554a25ac17eb9df669af077905374e6b` |
| [LiLiu](https://www.math.columbia.edu/~chaoli/AIPF.pdf) | `6ef2d63ea2cf55d8a2648f71ed7ac84e4d32f77e9e7eaeb62b47e584e4e5e566` |
| [Illusie](https://numdam.org/item/10.24033/asens.1374.pdf) | `bf9b783b4f5f255133c68ccb544aec029f25828aa943a744ccb6958d51f218d8` |
| [VoevodskyEML](https://www.numdam.org/item/PMIHES_2010__112__1_0.pdf) | `b49d40156b468ebad6548256ee7640cfe1cc71d80cc32db10fc60ac2913e649f` |
| [VoevodskyRad](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/simplicial_radditive_published.pdf) | `2f675a1bcf86280b187ba22978e2a66203b17f7433410fa72eb8429a5b2c3916` |

The two public Bloch–Kato 1990 URLs returned identical files; the register lists one hash. The unsuccessful MVW and NSW URLs are excluded. Stacks tags are live HTML locators, not included in this PDF hash register.

## Validation and submission

- `lean-check research/blueprint/packages/MotivicEtaleKTheory/Suggested.lean`: exit 0 at the pinned build; exactly five warnings, all `declaration uses sorry`, at lines 37,65,70,77,83. No other warnings or errors. `free -g` reported 77 GiB available before the final check. The process finished; no Lean server or background build remains.
- The five read-only packet checks returned zero errors and zero warnings: M.1 (82 nodes, 7 gaps, 21 requests), M.5d (67,11,36), M.6 (7,3,4), M.6a (21,0,3), M.6b (18,8,18). These counts describe the unchanged input packets, not a claim that their gaps/requests were administratively closed by this package.
- Final shape: README 199,552 bytes; twelve layers, 71 numbered subsections and 288 Check bullets, with at least three in each subsection; Examples and Dependencies in every layer. Suggested file: three real-bodied definitions, five named theorem targets, six proved examples, 163 lines; every kept declaration is named in the README. The crosswalk was checked against the actual input packets: 195 records, 195 distinct IDs, no missing or extra IDs. `python3 research/blueprint/intake.py check-files` on all four deliverables returned `4 file(s), 0 problem(s)`. No local paths, unfinished markers or unauthorized files are included.

The next action after intake is independent package review, with particular attention to the supplier extensions, general-field descent argument and characteristic-p generation proof noted above. No second issue is to be claimed by this process.
