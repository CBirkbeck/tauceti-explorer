# Independent review: IntegralIwasawaTheory, part I.1, revision 2

**Verdict: accepted at target level, after corrections.** Codex, session `codex-4Y48oh`, 2026-10-19. Refs #10783. This session wrote neither the original plan (`claude-tl2c1R`) nor its revision (`codex-s1mizX`), and did not conduct the previous review (`codex-zfjoCq`). This is a finished independent review, not a checkpoint.

I examined all 68 targets, their hypotheses, proof steps, prerequisites, API items, examples and acceptance conditions. The per-target record below has 57 verified and 11 corrected verdicts. Here “verified” means that the mathematical statement and target-level proof plan withstand this review with their explicitly requested suppliers. It does not mean implemented, or that another packet's unresolved proof has been independently accepted here.

The corrected [packet](../packets/IntegralIwasawaTheory--I.1.json) and [reader](../readmes/IntegralIwasawaTheory--I.1.md) have 68 targets, 188 API items, 105 definition/construction checks, six additional theorem checks, 33 planets, 35 pinned baseline references and 35 supplier contracts. All eleven coverage entries remain `planned`; none is `closed`. Every node remains `unchecked`. The packet is complete as a target-level pass under Protocol §0. Exact requested extensions remain work at their existing owners. The separately owned I.8 packet retains its own review, G1–G3 and integration obligations.

## Corrections made by this review

### Stickelberger denominators and the Serre normalization

The previous I.3 integrality statement attached the augmentation clearing property to the unsmoothed Stickelberger element θ. This is false. For Q(μ₃), with 3 depleted, θ=(1−c)/6. At p=3, multiplication by c−1 gives −(1−c)/3, which is not integral. This is a finite quotient test of the purported tower assertion.

Kurihara §4.1, equation (11), p. 23, relates θ to the Serre pseudomeasure g by g=τ(θ^#), with τ(σ)=κ(σ)⁻¹σ. The augmentation ideal clears g. On the full tower containing μ_{p∞}, transporting its generators through #τ⁻¹ gives

    #τ⁻¹(σ−1) = κ(σ)σ⁻¹−1 = −σ⁻¹(σ−κ(σ)).

Consequently the closed cyclotomic ideal Jκ=(σ−κ(σ)) clears θ. Both targets and the reader now distinguish these assertions. The full tower and full cyclotomic character are required; the principal-unit character alone is not the character on its tame factor. Restriction to a smaller tower does not justify asserting a new augmentation clearing property for θ there.

Three checks distinguish the normalizations: the finite p=3 example, the transported ideal, and the pole moving from γ=1 for the trivial tame component of g to γ=κ(γ) for the cyclotomic tame component of θ. Smoothing by T={7} still gives the integral element −(1−c); the correction does not alter that calculation.

### Q Eisenstein suppliers

The I.5 proof still used a PadicFamilies L5 definite quaternionic Hecke construction and an R21.3 Hilbert-family representation whose hypotheses require even totally real degree. These cannot supply a theorem over Q. Existing residual-irreducibility assumptions on the L1 modular-symbol freeness statement also exclude the Eisenstein factor used here.

I replaced these edges by two precise Part II requests at the existing owners:

- **PadicFamilies L1:** the ordinary modular-curve tower over Q, full and cuspidal form modules, their Hecke algebras, a₁-duality and weight/level control, including the boundary at Eisenstein factors. Sharifi AWS, Theorems 4.2.5, 4.2.7, 4.2.9 and Corollary 4.2.12, pp. 45–47, give this scope. The fractional-constant-term lattice is distinguished where needed.
- **OrdinaryAutomorphicFormsAndModularityLifting R21.3:** the ordinary trace limit of H¹_et(X₁(Npʳ),Z_p(1)), its Λ-freeness, rank two over the total quotient algebra and its ordinary local filtration. The quotient is unramified with Frobenius U_p; its relation to cusp forms and the inertia character on the submodule are part of the request. Sharifi AWS, Theorems 4.2.13–4.2.15 and the following construction, pp. 47–49, supply the mathematical route.

These requests do not assume residual irreducibility, integral rank-two freeness over the Eisenstein Hecke ring or Gorensteinness. Splitting over total fractions means splitting as modules; no G_Qp-equivariant splitting is asserted. I.5 retains the particular congruence quotient and Ribet matrix/cocycle argument as its own arithmetic work. The full Hecke quotient is Λ; Λ/(ξ) appears only after imposing the cuspidal quotient. The unit-ξ case needs no representation. The arbitrary-module congruence comparison removed by the revision has not been reintroduced.

### Integral minus parts and lattice duality

For H=Q(μ₃) and T={7}, the ray class group is Z/6 with trivial conjugation: the two residue multiplicative groups are quotiented by the anti-diagonal image of μ₆. Its integral minus quotient is Z/2, rather than zero. The minus part becomes zero after inverting 2. Correspondingly the Sinnott–Kurihara ideal in Z[G]⁻≅Z is (2), equal to the Fitting ideal of the minus dual class group in this example. Both become unit ideals over Z[1/2]. The acceptance example and both affected checks are corrected. A proved finite computation in the suggested file verifies that the class of 1 survives modulo twice Z/6.

The lattice dual formula also needed its action stated. For the contragredient action on Hom_Z(M,Z), the map

    Fφ(m) = Σ_g φ(gm)g⁻¹

is equivariant with Hom_{Z[G]}(M,Z[G]) restricted along #. Indeed F(σφ)=σ⁻¹Fφ for the ordinary output-scalar action. The coefficient of 1 is the inverse map. A C₆ regular-module check separates σ from σ⁻¹; an exponent-two example would not detect the error. I propagated this convention to the transpose and Rubin proof steps. DK Lemma A.8, pp. 86–87, uses lattice duality with the dual convention specified earlier in that paper; the packet's contragredient convention must retain the same restriction.

### Smaller corrections

The Q maximal S-ramified module is Z_p in the stated minimal S example only for odd p. At p=2 with S={2,∞}, its Galois group is Z₂×≅C₂×Z₂; the real inertia factor must remain. The universal property now describes the canonical restriction surjection attached to a chosen intermediate extension.

I removed the lingering `Ideal.spanNorm` proof instruction: the class-group norm uses `Ideal.relNorm` and compatibility with principal ideals. The PMIL L5 homological extension is classified as a Part II contract, consistently with its requested extra scope. The NSW URL now uses the working PDF download query, with the same recorded hash.

## Rechecking the revision's substantive arguments

The earlier negative review identified fourteen gaps. Their replacement arguments are now sufficiently explicit at the required target granularity; they are not being accepted merely because the revision changed the bibliography.

| Earlier gap | Independent assessment of the revised route |
| --- | --- |
| G-I2-H2 | NSW 5.6.15–17, pp. 331–332, 8.3.20, pp. 464–465, and 8.7.5–7, pp. 509–511, provide the homological criterion and truncated ordinary Euler route. The real-dyadic extension is stated exactly at R02.4/PMIL L5; the free-H₂ clause retains its cohomological-dimension hypothesis. |
| G-I2-FEDERER | The norm-minus comparison is proved through Kummer theory and ordinary Hochschild–Serre in K∞=F∞(i). It does not claim an unavailable proof from Federer. |
| G-I2-IWASAWA83 | Yamashita Lemma 3, p. 77, Lemmas 4, 5 and 7, pp. 78–79, and the theorem/proof on p. 79 support the invariant-ideal/capitulation calculation. The finite two-rank, rather than the full finite order, is retained. |
| G-I2-REAL-UNITS | The augmented finite-level sequence retains real μ₂ and the tower sign module. NSW 10.3.13, pp. 630–632, and 10.3.24, p. 640, support its comparison with p-only unit closures; the sign module is not assumed to inject. |
| G-I2-UNIT-FINITENESS | Local reciprocity and compact Nakayama first establish finite generation of the local multiplicative/principal-unit limit. Global unit finite generation follows from its later injection. This avoids circular use of weak Leopoldt. |
| G-I4-ENLARGE | The augmented global–local diagram and old-unit injectivity establish the new local inertia injection. Specialization keeps the Teichmüller component of Frobenius. |
| G-I5-WILES | Kurihara Theorem 4.1 and its remarks, pp. 24–27, supply an alternate proof through I.7→I.9→I.10. It is independent of Wiles's conclusion and distinguishes character quotients from integral eigenspaces. |
| G-I5-CONGRUENCE | Sharifi AWS Theorem 4.3.3, p. 50, proves the particular Q quotient by the constant-term functional and T₀. This supplies the needed statement without a generic arbitrary-module comparison; the ordinary Q inputs are now requested correctly. |
| G-I5-INDUCTION | Greenberg Propositions 1–3, pp. 78–80, the formulas on pp. 81–83 and Proposition 5, pp. 84–85, give the arbitrary-prime induction and type-W change. Poles remain in the analytic quotient. |
| G-I10-REALPLACE | The exact sequences, correction rank, covariant-dual conversion and finite Euler quotient are explicit. Kolster 1989, Theorem 1 and Lemma 2, pp. 249–250, and Kurihara Lemma 4.2, pp. 25–26, support the resulting comparison. |
| G-I7-NORM-PRESENTATIONS | Finite square presentations are retained without compatible free bases or finite nonzero determinants. BKS Proposition 2.4, pp. 571–574, and the exact PMIL L6 controlled-limit request give a valid route; the separate consumer integration remains required below. |
| G-I7-RIBET-RESIDUAL | The IHG.6 request covers every residual component and includes weighted local data and topology. DKSW Ribet Theorem 2.1, Remark 2.2 and §2.1, pp. 8–10, distinguish the coincident and distinct-character constructions. |
| G-I7-GALOIS-SUPPLIER | The finite-weight all-prime R19.2 extension has the precise ordinary and auxiliary-prime local shapes needed in DKSW §3.3, Lemmas 3.10–3.12 and Theorem 3.14, pp. 27–30. No narrower family theorem is passed off as this extension. |
| G-I7-MODULAR-SUPPLIERS | The APL L3 request names the all-cusp constant terms, coefficient orders, weight/level range and correction step of DK Theorems 8.8, 8.9 and 8.15, pp. 54, 58, and the DKSW old-form extension, pp. 24–26. The Hecke cancellation proof is distinct from these generic inputs. |

### Dyadic rank and finite specialization

The real-place comparison has actual maps and exact sequences. For F totally real of degree d, put K∞=F∞(i), J=Gal(K∞/F∞), V=O_{K∞}×⊗Q₂/Z₂, W_F=colim(O_{F_n}×/{±1})/2 and C_F=W_F∨. A CM unit divided by its conjugate is a root of unity; divisibility of roots in the full tower makes V a trivial J-module and identifies V[2] with W_F. Uniform capitulation, invariant principal ideals and the unit ranks give dim_F₂ W_F^{Γ_n}=d·2ⁿ+O(1). The structure theorem therefore gives rank_F₂[[Γ]] C_F=d and char_Λ C_F=(2^d), allowing finite submodules.

Taking negative eigenvectors in the Kummer sequence is justified by V/2V=0. The comparison between norm-minus classes and negative eigenclasses retains the finite transfer kernel until its direct-limit dual embeds into a module with no finite Λ-submodule. Ordinary Hochschild–Serre on the untwisted Q₂/Z₂ then produces the separate order-two cokernel. Thus the two sequences give a height-one factor 2^d and a finite error; a mere quotient of sign modules would not prove this rank.

The Kolster module uses a covariant Hom action. Inversion and the cyclotomic twist yield ι_u(γ)=uγ⁻¹, with the full 2-power content retained. In weight-two descent the compact degree-two and degree-three terms are X(−2)_Γ and Z₂(−2)_Γ. The latter retains w₂(F)₂. On the discrete class side the term is an invariant group. For a finite error E, #E_Γ/#E^Γ=1; deleting only one term is invalid. The Q check gives the dyadic quotient 2/8 rather than losing its denominator.

### Finite-to-infinite Fitting passage and the separate I.8 part

The generic replacement is mathematically viable. For a finite free coefficient order R over O[[Γ]], put I_n=(γ^{pⁿ}−1). Quotient control M/I_nM≅M_n and Fitting base change identify the desired finite ideals. The I_n eventually lie in every fixed power of the maximal ideal; closedness then gives the limiting ideal equality. Actual profinite neighborhoods use (pᵃ,I_n), not I_n alone.

A square presentation can be lifted without compatible matrices. Choose a minimal cover Rʳ→M on each local factor with relation module K. Cancelling excess generators in the finite square presentations bounds the finite relation image by r generators. For large n, Artin–Rees gives K∩I_nRʳ⊂Jac(R)K, so the finite relation image detects K/Jac(R)K. Nakayama bounds its generators by r; padding gives a square matrix. A nonzerodivisor determinant is established only at the infinite level by character nonvanishing. A split finite depletion prime can give a zero determinant.

BKS Proposition 2.4 identifies the cohomology of the T-modified complex: H² is the required Selmer group and H³ is dual to torsion S,T-units. The torsion-free T hypothesis kills H³. In its perfectness range, derived coefficient change gives top-cohomology quotient control. This is applied to the untwisted minus module; twisting transports I_n rather than preserving it automatically. Character change must use this presentation and the T-local triangle, not just tensor a height-one ideal identity.

The existing [revision handoff](../handoff/BP-IntegralIwasawaTheory--I.1~2.md#required-integration-in-the-separately-owned-part-i8) specifies the exact changes to `I.9/selmer-modified-iwasawa-limit` and `I.9/twisted-selmer-fitting`. This review checks that replacement but does not edit or reaccept the separate I.8 packet. Its G1 (bounded real-dyadic model), G2 (circular-unit lattice) and G3 (Ferrero–Washington adapters) remain. Those are explicit prerequisites outside this review's deliverables, and must be resolved in their owner before closure or packaging. The local I.10 target names the controlled-limit request directly, so the dependency is visible even before that consumer edit.

## Sources, baseline and ownership

All sixteen source records have a separate reading record for this review. The fifteen public PDFs used match their recorded SHA-256 values. The DKSW Ribet v2 paper was read in place from the maintainer-cleared library; no copy, extracted passage or source file was written into the repository. Statements and proof plans here are in our own words. Federer 1982, Iwasawa 1983 and Wiles 1990 were not read as originals; the alternate proof routes above are the evidence used. Mazur–Wiles is historical attribution; the particular Q route was checked against Sharifi's AWS account of the Ohta/Emerton argument. The earlier source-issue verdicts are preserved with their original scope, without claiming a fresh source-errata investigation.

All 35 baseline declaration statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The citations provide their stated limited roles. In particular algebraic cyclotomic characters require separate continuity, the Galois quotient equivalence requires separate topological verification, and the pinned zeta declaration is not an analytic continuation theorem. `Ideal.relNorm` supplies the relative ideal norm, with the class-group descent proved separately.

I also read the 64 exact external node statements/hypotheses used by this packet and examined its stage-only contracts. The review discovered the Q supplier mismatch through those statements. The all-residual Ribet, all-prime Hilbert, ordinary real-dyadic and controlled-limit extensions remain exact requests; they are not asserted as present declarations. Generic definitions and constructions stay with their existing owners. No new roadmap or tier placement is proposed.

Current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were checked read-only, including nearby ProfiniteArithmetic and LocalGaloisGroups material. Their completed group algebra, compact-module action, all-index Fitting carrier and local unit filtration are existing work, as is the distinguished-polynomial lemma cited at I.1. The plan imports those inputs rather than assigning them new owners. No Lake command was run in those trees.

## API, checks, Lean and dependency validation

The targets remain at the required granularity: 19 constructions, five definitions, 40 theorems and four comparisons. The APIs include evaluation, characterization, maps, compatibility and universal properties serving the recorded uses. Every definition/construction has at least three discriminating checks. The 33 planets remain mathematical objects or named results, with no stage exceeding six; no planet was added during review.

The suggested file is 214 lines and gives representative statements over pinned carriers, with light real-bodied definitions. The new Z/6 example is proved by computation. Heavy arithmetic carriers and theorems remain explicit reader targets. A successful elaboration does not verify the roadmap's mathematical theorems.

- `python3 scripts/check_blueprint.py research/blueprint/packets/IntegralIwasawaTheory--I.1.json`: **zero errors, zero warnings**.
- Reader consistency: all 68 complete node blocks match the packet, including every statement, hypothesis, proof step, prerequisite, API item, check, use, acceptance item and source locator/match. All 35 supplier contracts match, and the source audit includes this review's reading records.
- Combined dependency check with the separate I.8 packet: **121 nodes, 550 edges, acyclic**, expanding shared-stage references. The I.7 keystone has no dependency on the Wiles conclusion. This is a cycle check, not a claim that the other packet's gaps are closed.
- All fifteen public PDF hashes match; there is no `excerpt` field in the packet.
- `lean-check research/blueprint/suggested/IntegralIwasawaTheory--I.1.lean`: **exit 0**, with only fourteen expected `sorry` warnings at the pinned shared build. Available memory was 81 GB. No language server, Lake build, update or cache command was started.
- `git diff --check`: clean.

## Per-target verdicts

| Target | Verdict | Independent check |
| --- | --- | --- |
| `I.1/cyclotomic-zp-extension` | verified | The fixed field uses the actual torsion subgroup of the cyclotomic image; finite reductions supply continuity, including the dyadic counterexample. |
| `I.1/cyclotomic-layers` | corrected | Removed the remaining spanNorm proof instruction: relative ideal norms, their principal-ideal compatibility and transitivity are required. |
| `I.1/full-cyclotomic-tower` | verified | The torsion-free cyclotomic image supplies the rank-one quotient; a noncanonical splitting is distinguished from its canonical restriction maps. |
| `I.1/tower-ramification` | verified | Local cyclotomic inertia proves eventual total ramification; Frobenius and the torsion-free quotient control splitting away from p. |
| `I.1/iwasawa-algebra-coordinate` | verified | The coordinate, Tate-twist substitution and generator changes agree; generic completed algebra is imported from its existing owner. |
| `I.1/finite-level-kernel` | verified | The integral kernel is generated by omega_n, not T^(p^n); current Tau Ceti already supplies the distinguished-polynomial lemma. |
| `I.1/arithmetic-compact-action` | verified | Finite continuous actions extend through the existing completed algebra; conjugation and norm maps give the arithmetic applications. |
| `I.1/equivariant-iwasawa-algebra` | verified | The finite-abelian extension algebra and augmentation are separated from an unchosen product decomposition. |
| `I.1/character-decomposition-integrality` | verified | Integral prime-to-p idempotents and rational p-primary decomposition are distinguished; height-one equality is not asserted for arbitrary ideals. |
| `I.2/class-group-limit` | verified | Norm inverse limits and extension direct limits use the wide class group; projection surjectivity has the necessary hypotheses. |
| `I.2/unit-limits` | verified | Unit, S-unit and norm-compatible limits are distinguished; the API includes their transition maps and global-to-local uses. |
| `I.2/semilocal-principal-units` | verified | Principal-unit limits use the local multiplicative limit and reciprocity, avoiding a global finite-generation assumption. |
| `I.2/leopoldt-map-and-defect` | verified | The diagonal map and Leopoldt defect have one arithmetic owner; the conjecture is separated from its abelian-field theorem. |
| `I.2/maximal-abelian-pro-p-extensions` | corrected | Restricted the Q rank-one example to odd p and added the real-inertia C2 factor at p=2; restriction gives the canonical quotient map. |
| `I.2/class-field-identification` | verified | Unramified, split and S-ramified Galois modules use different class-field quotients, with wide and real-place conventions explicit. |
| `I.2/global-local-unit-sequence` | verified | The augmented dyadic unit sequence retains real signs; comparison with the p-only closure uses the vanishing homology limit. |
| `I.2/iwasawa-finiteness` | verified | Local finite generation precedes global unit finite generation; torsion and rank claims retain their field and splitting hypotheses. |
| `I.2/weak-leopoldt` | verified | The NSW truncated Euler and homological criteria supply the real-dyadic route; ordinary cd_2 is not bounded by two there. |
| `I.2/cm-minus-class-modules` | verified | Kummer and descent compare the norm-minus module only in the specified F_infinity(i) tower; the bounded transfer kernel is handled. |
| `I.2/uniform-capitulation` | verified | Uniform capitulation controls the invariant-principal-ideal error independently of the desired real-unit rank. |
| `I.2/real-unit-radical` | verified | CM units modulo roots become real in the tower; invariant dimensions give the F2[[Gamma]] rank, allowing finite submodules. |
| `I.2/real-unit-galois-cohomology` | verified | Yamashita supplies the cohomology route; the finite contribution is #B[2]=#(B/2B), tested with Z/4. |
| `I.3/stickelberger-elements` | verified | The inverse-character normalization and partial-zeta coefficients agree; the API characterizes elements without unfolding them. |
| `I.3/stickelberger-functoriality` | verified | Restriction, depletion and smoothing are compatible with arithmetic Frobenius and the inverse-character convention. |
| `I.3/smoothed-integrality` | corrected | Separated Stickelberger and Serre clearing ideals; J_kappa clears theta, whereas augmentation clears g; added three separating checks. |
| `I.3/deligne-ribet-dictionary` | corrected | Recorded tau(theta sharp)=g and the resulting clearing-ideal change, preserving the full-tower interpolation dictionary. |
| `I.3/kubota-leopoldt-stickelberger-dictionary` | verified | The Bernoulli and Kubota-Leopoldt formulas use the same indexing, inverse character and exceptional pole conventions. |
| `I.3/interpolation-uniqueness` | verified | Interpolation uniqueness uses character separation after a common denominator; the pole cannot be removed by evaluating finitely many values. |
| `I.4/arithmetic-iwasawa-complex` | verified | Finite-level cochains and their derived inverse limit are separated; real dyadic places use the requested ordinary bounded-model contract. |
| `I.4/finite-layer-descent` | verified | Derived coefficient change retains Tor and inverse-limit hypotheses rather than assuming exact underived tensor products. |
| `I.4/coinvariant-euler-characteristic` | verified | Specialization retains invariant and coinvariant terms together; finite errors cancel only through their Euler quotient. |
| `I.4/twisted-coinvariant-descent` | verified | The compact/discrete duality and Tate twist give the stated degree-two coinvariants in their specified character and weight range. |
| `I.4/s-enlargement-euler-factors` | verified | The augmented global-local diagram proves the new inertia injection; the Teichmuller factor is retained in the Euler polynomial. |
| `I.4/dyadic-real-place-correction` | verified | The two Kummer/descent sequences separate a characteristic factor 2^d from the finite order-two error. |
| `I.5/main-conjecture-statement` | verified | Weak distinguished-polynomial equality and the stronger mu assertion are distinct; the exceptional and p=3 branches are accounted for. |
| `I.5/hida-hecke-eisenstein-ideal` | corrected | Replaced the even-degree quaternionic supplier by an exact Q ordinary-tower request including Eisenstein factors and boundary terms. |
| `I.5/ribet-extension-construction` | corrected | Replaced the even-degree family supplier by the Q ordinary Tate-module request; clarified module splitting and retained the unit-xi case. |
| `I.5/hecke-class-group-comparison` | verified | The cocycle action, inverse diamond action and Tate twist agree before characteristic ideals are compared. |
| `I.5/divisibility-to-equality` | verified | The degree comparison uses the analytic class-number formula and Ferrero-Washington, including the exceptional unit numerator. |
| `I.5/mazur-wiles-theorem` | verified | The Q Eisenstein route remains independent; its abelian extension uses the general route and the character-field hypothesis. |
| `I.5/wiles-main-conjecture` | verified | The alternate I.7 to I.9 to I.10 proof supplies the Wiles conclusion without using it as an input; integral mu scope is retained. |
| `I.5/going-up-induction` | verified | Greenberg Propositions 1-3 and 5 give arbitrary-prime induction and type-W twisting, with poles and coordinate changes retained. |
| `I.5/special-value-endpoint` | verified | The special-value endpoint uses the established Euler characteristic and its ramification, weight and nonvanishing hypotheses. |
| `I.6/cm-minus-parts-and-duals` | corrected | Added the sharp scalar restriction to group-ring lattice duality; the C6 test detects the missing inverse action. |
| `I.6/smoothed-class-groups` | corrected | Corrected the Q(mu3), T={7} example: its trivial-conjugation Z/6 ray group has integral minus quotient Z/2. |
| `I.6/smoothed-stickelberger` | verified | All smoothing and dyadic integrality hypotheses are retained; the trivial-character component is not discarded without its condition. |
| `I.6/sinnott-kurihara-ideal` | corrected | Corrected the same example to the integral ideal (2), matching the minus dual-class Fitting ideal; both become units away from two. |
| `I.6/minus-class-number-formula` | verified | The class-number comparison keeps its integral power of two rather than inferring it from an away-from-two decomposition. |
| `I.6/selmer-module` | verified | The Selmer carrier and evaluation pairing are explicit; minus exactness is only invoked with the required coefficient hypotheses. |
| `I.6/ritter-weiss-module` | verified | The generalized Ritter-Weiss presentation and the original presentation have separate hypotheses and local factors. |
| `I.6/ritter-weiss-transpose` | corrected | Propagated the sharp convention through the lattice-dual transpose identification and its quadratic presentation. |
| `I.6/ritter-weiss-galois-cohomology` | verified | The local/global extension-class description supplies the ramification data needed for the arithmetic surjection. |
| `I.7/inclusion-implies-equality` | verified | Fitting inclusion becomes equality through the class-number/index argument; finite and localized ideal comparisons are distinguished. |
| `I.7/extra-congruence-cusp-form` | verified | The exact all-prime, all-cusp modular extensions are requested from APL L3; the 2^d factor and level changes are retained. |
| `I.7/group-ring-hecke-eisenstein-homomorphism` | verified | The coefficient algebra can be nonreduced at two; the weighted cancellation condition uses the actual Hecke quotient. |
| `I.7/hecke-galois-representation` | verified | The all-prime finite-weight R19.2 extension supplies both ordinary and auxiliary-prime local shapes; it is not a family theorem. |
| `I.7/eisenstein-cohomology-class` | verified | The all-residual local Ribet request includes the matrix lattice topology, local vectors and weighted Fitting conclusion. |
| `I.7/surjection-from-nabla` | verified | The generalized Ritter-Weiss surjection uses both the global cocycle and all prescribed local generators. |
| `I.7/fitting-ideal-calculation` | verified | The weighted Fitting bound is combined with Hecke cancellation; an unweighted global Ribet theorem would not suffice. |
| `I.7/keystone-fitting-theorem` | verified | The keystone retains every DKSW (A1)-(A5) hypothesis and is independent of the Wiles conclusion. |
| `I.7/kurihara-theorem-2-12` | verified | Finite square presentations permit zero determinants; the controlled-limit contract replaces unsupported compatible free bases. |
| `I.7/partial-kurihara-and-strong-brumer-stark` | verified | The p-modified formula and strong Brumer-Stark consequence retain their smoothing and depletion sets. |
| `I.7/kurihara-fitting-formula` | verified | The dual-class Fitting formula keeps local correction ideals and the dual involution, not only annihilation. |
| `I.7/brumer-stark-theorem` | verified | Annihilation and the anti-unit construction are distinct targets; the higher-degree argument and degree-one case are separated. |
| `I.7/rubin-conjecture-consequence` | corrected | Propagated the contragredient lattice-dual convention; fixed depletion and split-place evaluation remain distinct. |
| `I.10/nonequivariant-characteristic-ideal` | verified | The all-prime conclusion explicitly requires the controlled I.9 replacement and presentation-level character change. |
| `I.10/kurihara-kolster-module-dictionary` | verified | The covariant Kolster Hom module is converted using inversion and the cyclotomic twist; the full factor 2^d is retained. |
| `I.10/finite-euler-characteristic-comparison` | verified | The discrete class side uses invariants; compact degrees two and three retain w2 and both terms of every finite Euler error. |
