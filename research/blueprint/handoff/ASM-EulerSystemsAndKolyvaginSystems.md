# ASM-EulerSystemsAndKolyvaginSystems — assembly handoff

Job #229. Agent: Codex — `codex-oRMTHL`. This submission completes the assembly task;
it is not a checkpoint of an unfinished assembly. It does not upgrade the underlying plans.

## Delivered

- `research/blueprint/readmes/EulerSystemsAndKolyvaginSystems.md`: one reader for ES.0–ES.8,
  with purpose, scope, neighbouring ownership boundaries, unified conventions, version-specific
  sources, pinned library inputs, layer overview, all 119 packet nodes in order, application
  handoffs, coverage, requests, gaps and source issues. It contains all 370 API statements and
  222 unit-test statements, plus source excerpts, uses, proof outlines and acceptance criteria.
- `research/blueprint/suggested/EulerSystemsAndKolyvaginSystems.lean`: one standard note and
  22 distinct imports, then the two corrected prototype bodies in isolated sections. The existing
  namespace-qualified declaration names are preserved. An ES.8 inventory spells out every
  packet API/test name and its full statement/hypotheses; it is explicitly a comment inventory.
- `research/blueprint/packets/EulerSystemsAndKolyvaginSystems--ES.8.json`: 28 whole-stage
  prerequisite occurrences in 18 nodes replaced by exact finite-level node references. One
  proof-outline ownership label moves general-R KS functoriality from ES.4 to its actual
  definition in ES.3/kolyvagin-system-module. ES.4/selmer-sheaf remains its sheaf realization.
- This handoff collects all 15 requests and five restructuring proposals, with resume guidance.

The ES.0 packet and both review objects are unchanged. ES.0–ES.7 still has status `partial`
and verdict `needs_changes` from `REV-EulerSystemsAndKolyvaginSystems--ES.0`; ES.8 still has
status `complete` and its accepted target-level verdict. No reviewed mathematical statement,
hypothesis, API/test statement, source excerpt or acceptance condition was changed. The only
packet proof edit is the ownership label above. Mathematical re-review is not requested for a
new theorem in this assembly; follow-up closure/signature/ownership fixes need their own review.

## Reconciliation decisions

The part readers predate the review edits, so their node bodies were regenerated from the
current packets. This brings the corrected Cartier dual carrier, signed/positive core-rank
conventions, finite-order twist conductor factors, Frobenius compatibility hypotheses, truncated
artinian indices, free-hub qualification, Howard scalar-change condition, bidual rank conditions,
and higher derivative descent/determinant corrections into the aggregate reader. The original
part readers and suggested files were outside the edit scope and remain untouched.

ES.8 is rank-one descent even when the Rubin tower has dimension d > 1. None of its exact
internal prerequisites is in ES.6–ES.7; ES.8h remains a restructuring proposal with no current
nodes or consumers. The generic bidual entries in ES.6 are retained as a reviewed inventory,
with their conflicting L6 ownership explicitly flagged; this assembly does not create a second
owner or silently regard the existing request as fulfilled.

The lattice dual Hom_O(T,O(1)) and discrete Cartier dual Hom(T,μ_{p^∞}) are named separately.
With the tautological action Ψ, Shapiro is ι-semilinear, and the Rubin/Mazur–Rubin X modules
must be transported with the involution on both sides of a characteristic bound. Residual
primitivity uses the generalized module and agrees with ordinary KS in core rank one. Error
bounds invert the specified height-one primes, including the augmentation prime where required.

The cyclotomic application imports Rubin II.3.3 plus Proposition II.3.7, rather than II.3.8:
Rubin III §2's cyclotomic case has torsion singular localization, so II.3.8's non-torsion
hypothesis fails. Howard's theorem retains (A)–(D) as consumer obligations; the residual-reducible
error version retains the full (C′) finite-level structure and uniform error hypotheses.

## Cross-part prerequisite trace

Each replacement follows the existing consuming statement/proof and the current supplier node.
The algebraic and arithmetic inputs remain subject to the gaps recorded below. In particular,
ES.4/rubin-hypotheses contains the Appendix C finiteness input used in weak Leopoldt, and
ES.5/structure-theorem contains the sharpness result used in Mazur–Rubin's height-one equality.
The two-prime choices use Rubin's prime-selection node; their tower evaluation induction remains
ES.8's own theorem, rather than being attributed wholesale to Chebotarev.

| Consumer (all in ES.8) | Original prerequisite | Exact replacement(s) |
| --- | --- | --- |
| `iwasawa-large-image-hypotheses` | `ES.0` | `ES.0/selmer-triple` |
| `iwasawa-large-image-hypotheses` | `ES.4` | `ES.4/rubin-hypotheses` |
| `iwasawa-class-of-an-euler-system` | `ES.2` | `ES.2/euler-system-module` |
| `twisting-by-characters-of-gamma` | `ES.2` | `ES.2/twisting`, `ES.2/euler-polynomial` |
| `iwasawa-evaluation-maps` | `ES.1` | `ES.1/kolyvagin-primes`, `ES.1/rubin-prime-selection` |
| `iwasawa-evaluation-maps` | `ES.3` | `ES.3/derivative-class`, `ES.3/derivative-local-properties`, `ES.3/congruence` |
| `weak-leopoldt-from-an-euler-system` | `ES.3` | `ES.3/derivative-class` |
| `weak-leopoldt-from-an-euler-system` | `ES.4` | `ES.4/rubin-hypotheses` |
| `kolyvagin-sequence-induction` | `ES.1` | `ES.1/rubin-prime-selection` |
| `kolyvagin-sequence-induction` | `ES.3` | `ES.3/derivative-class`, `ES.3/derivative-local-properties`, `ES.3/congruence` |
| `characteristic-ideal-bound-with-error` | `ES.3` | `ES.3/derivative-class` |
| `unramified-at-split-primes-condition` | `ES.1` | `ES.1/kolyvagin-primes`, `ES.1/rubin-prime-selection` |
| `lambda-adic-kolyvagin-systems` | `ES.1` | `ES.1/conductor-ideal`, `ES.1/finite-singular-comparison`, `ES.1/modified-selmer-structures` |
| `lambda-adic-kolyvagin-systems` | `ES.4` | `ES.3/kolyvagin-system-module` |
| `euler-to-lambda-adic-kolyvagin` | `ES.2` | `ES.2/euler-system-module`, `ES.2/euler-polynomial`, `ES.2/conductor-presentation` |
| `euler-to-lambda-adic-kolyvagin` | `ES.3` | `ES.3/derivative-class`, `ES.3/derivative-local-properties`, `ES.3/finite-part-formula`, `ES.3/euler-to-kolyvagin` |
| `specialization-control` | `ES.0` | `ES.0/hypotheses-mr2004`, `ES.0/canonical-selmer-structure`, `ES.0/selmer-torsion-identification` |
| `generic-core-rank` | `ES.0` | `ES.0/core-rank`, `ES.0/core-rank-formula` |
| `blind-spot-and-lambda-primitivity` | `ES.5` | `ES.5/divisibility-invariants`, `ES.5/rank-one-module-theorem` |
| `blind-spot-and-lambda-primitivity` | `ES.0` | `ES.0/core-rank` |
| `residual-primitivity-implies-lambda-primitivity` | `ES.5` | `ES.5/divisibility-invariants` |
| `weak-leopoldt-from-lambda-adic-kolyvagin` | `ES.4` | `ES.4/kolyvagin-bound` |
| `weak-leopoldt-from-lambda-adic-kolyvagin` | `ES.0` | `ES.0/hypotheses-mr2004` |
| `mazur-rubin-lambda-adic-main-theorem` | `ES.4` | `ES.4/kolyvagin-bound` |
| `mazur-rubin-lambda-adic-main-theorem` | `ES.5` | `ES.5/structure-theorem` |
| `self-dual-lambda-adic-kolyvagin-bound` | `ES.5` | `ES.5/howard-hypotheses`, `ES.5/cassels-structure`, `ES.5/howard-dvr-theorem` |
| `self-dual-lambda-adic-kolyvagin-bound` | `ES.1` | `ES.1/finite-singular-comparison`, `ES.1/conductor-ideal` |
| `error-tolerant-self-dual-lambda-adic-bound` | `ES.4` | `ES.4/howard-descent-with-errors` |

All 119 in-roadmap node IDs resolve and their aggregate prerequisite graph is acyclic.
Whole-stage references to external suppliers remain where those suppliers have unresolved or
stage-level contracts; no guessed supplier declaration was substituted. Clear cross-part fixes
required no new packet gap; the 13 existing packet gaps are reproduced in the reader.

## Supplier requests collected

These are unfulfilled contracts, not evidence that a supplier already proves the statement.
The general-R L2 request includes the artinian/global-length identities and the weaker Cassels
pairing needed by the error route. The L6 request includes the delicate group-ring norm/transfer
and invariant-descent maps; ordinary bidual functoriality does not discharge it.

### ES.0-R1: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields

Existence of the ray class field of K modulo a prime q, with Gal(K[q]/K) ≅ the ray class group Cl_q(K), and the description of its ramification; used to define K(q), K(1) and Γ_q.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`
- `EulerSystemsAndKolyvaginSystems:ES.2/conductor-presentation`

### ES.0-R2: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors

The absolute local Artin map, normalized by arithmetic Frobenius, and its restriction to finite tame extensions, identifying the p-primary tame inertia quotient with residue-field units (or the relative residue-unit quotient at Howard’s inert primes). Local Tate duality is supplied separately by Layer 5.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`
- `EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality`

### ES.0-R3: tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev

The Chebotarev density theorem for a finite Galois extension of number fields in Dirichlet-density form: the primes with a given Frobenius class have density |C|/|G|; in particular infinitely many, also after removing a finite set.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`
- `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`
- `EulerSystemsAndKolyvaginSystems:ES.1/rubin-prime-selection`
- `EulerSystemsAndKolyvaginSystems:ES.1/abundant-tuples`
- `EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem`

### ES.0-R4: PadicMeasuresIwasawaAlgebras:L6

For a Gorenstein order R over a complete discrete valuation ring and its quotients R/(p^m): self-injectivity of R/(p^m); exactness of Hom(−, R/(p^m)) and reflexivity of finitely generated modules; Fitting ideals Fitt^i_R with their determinantal description from a presentation and their behaviour under base change; and the identification X^∨ ≅ X^* for R/(p^m)-modules. Also the general exterior-bidual scalar/group-ring change maps and transfer/norm comparison, in particular BSS II §6.3 map (9), invariants descent and Lemma 6.9’s corestriction-versus-group-norm identity. Pure exterior-bidual algebra is owned by L6 and must be imported here; ES.6 keeps its Selmer/Stark specialization.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.6/bidual-functoriality`
- `EulerSystemsAndKolyvaginSystems:ES.6/stark-structure`
- `EulerSystemsAndKolyvaginSystems:ES.6/bss-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.6/regulator-isomorphism`
- `EulerSystemsAndKolyvaginSystems:ES.7/higher-rank-euler-systems`
- `EulerSystemsAndKolyvaginSystems:ES.7/fitting-bounds`
- `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`
- `EulerSystemsAndKolyvaginSystems:ES.6/stark-systems`
- `EulerSystemsAndKolyvaginSystems:ES.7/higher-kolyvagin-derivative`

### ES.0-R5: SelmerIwasawaCohomology:L2

Selmer structures over a number field with coefficients in a complete noetherian local ring R (not only the integers of a p-adic field): the nodes L2/dual-selmer-structure and L2/selmer-structure-poitou-tate are stated for O; the artinian and Gorenstein cases of Mazur–Rubin Theorem 2.3.4 and Burns–Sakamoto–Sano Theorem 3.1 (the five-term global duality sequence for F₁ ≤ F₂ over a self-injective ring) are needed in the same form. Supply the actual Selmer/cohomology carrier and Cartier-dual coefficient dictionaries at that generality, propagation and orthogonal-complement compatibility, global and local duality with the signed length convention. For the CGLS error route provide the Cassels pairing under vanishing residual invariants, cartesian local conditions and Howard’s symmetric self-duality, without assuming residual absolute irreducibility; see CGLS Proposition 3.3.2.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`
- `EulerSystemsAndKolyvaginSystems:ES.5/kolyvagin-dual-selmer`
- `EulerSystemsAndKolyvaginSystems:ES.6/stark-structure`
- `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`
- `EulerSystemsAndKolyvaginSystems:ES.0/quotient-category`
- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`
- `EulerSystemsAndKolyvaginSystems:ES.0/quotient-dual-propagation`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference`
- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-independence-of-modulus`
- `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`
- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-formula`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`
- `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`
- `EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality`
- `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`
- `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`
- `EulerSystemsAndKolyvaginSystems:ES.4/howard-descent-with-errors`

### ES.0-R6: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality

Perfect local Tate pairings for finite p-primary unramified coefficients at places of residue characteristic different from p, with the cup/invariant normalization, restriction-corestriction adjointness and the exact-annihilator statement used for the transverse condition. Mixed-characteristic p-adic lattice/discrete extensions are requested from SelmerIwasawaCohomology L1/L2.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`
- `EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality`

### ES.8-R1: PadicMeasuresIwasawaAlgebras:L4

Multivariable Iwasawa algebras Λ = O[[Γ]] ≅ O⟦T_1, …, T_d⟧ for Γ ≅ Z_p^d: noetherian, regular local of dimension d + 1, hence factorial; pseudo-null modules (annihilated by an ideal of height ≥ 2, not finite when d ≥ 2), pseudo-isomorphisms and characteristic ideals over them, with multiplicativity in exact sequences and pseudo-isomorphism invariance. Rubin's Theorems II.3.2–II.3.4 and II.3.8 are stated for every d ≥ 1 (the stage's own remaining item 'Multivariable algebras O⟦T₁, …, T_d⟧').

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.8/restriction-control-over-the-tower`
- `EulerSystemsAndKolyvaginSystems:ES.8/kolyvagin-sequence-induction`
- `EulerSystemsAndKolyvaginSystems:ES.8/rubin-iwasawa-divisibility`
- `EulerSystemsAndKolyvaginSystems:ES.8/twisting-invariance-of-iwasawa-theorems`

### ES.8-R2: PadicMeasuresIwasawaAlgebras:L4

Twisting of characteristic ideals and annihilators: for a character ρ: Γ → O^×, Tw_ρ: Λ → Λ the O-algebra automorphism γ ↦ ρ(γ)γ, and a finitely generated torsion Λ-module B, Tw_ρ(char(B ⊗ ρ)) = char(B) and Tw_ρ(Ann_Λ(B ⊗ ρ)) = Ann_Λ(B) (Rubin, Euler systems, Lemma VI.1.2); Tw_ρ preserves heights of ideals.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.8/twisting-invariance-of-iwasawa-theorems`
- `EulerSystemsAndKolyvaginSystems:ES.8/rank-one-leopoldt-case`

### ES.8-R3: PadicMeasuresIwasawaAlgebras:L4

Length asymptotics along Hensel perturbations: for Λ = O⟦X⟧, a height-one prime 𝔓 = (g) ≠ ϖΛ with g distinguished, 𝔓_N = (g + p^N) and a finitely generated torsion Λ-module X, length_{Z_p}(X/𝔓_N X) = N · rank_{Z_p}(Λ/𝔓) · ord_𝔓 char(X) + O(1) as N → ∞ (and the analogue for 𝔓 = ϖΛ with 𝔓_N = (X^N + p)); also, for N ≫ 0, 𝔓_N is a height-one prime with Λ/𝔓_N ≅ Λ/𝔓 as rings. This is the module-theoretic step of Mazur–Rubin's proof of Theorem 5.3.10, used again by Howard (Theorem 2.2.10) and Castella–Grossi–Lee–Skinner (Theorem 3.4.1).

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.8/mazur-rubin-lambda-adic-main-theorem`
- `EulerSystemsAndKolyvaginSystems:ES.8/self-dual-lambda-adic-kolyvagin-bound`
- `EulerSystemsAndKolyvaginSystems:ES.8/error-tolerant-self-dual-lambda-adic-bound`
- `EulerSystemsAndKolyvaginSystems:ES.8/height-one-specialization`

### ES.8-R4: PadicMeasuresIwasawaAlgebras:L5

Topological Nakayama's lemma over Λ = O[[Γ]]: a compact Λ-module X with X/𝔐X (or X/JX, J the augmentation ideal) finitely generated over O is finitely generated over Λ. Used for the finite generation of X∞ (Rubin, Lemma VII.4.1).

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.8/x-infinity-finitely-generated`

### ES.8-R5: PadicMeasuresIwasawaAlgebras:L1

The O-algebra automorphisms Tw_ρ of Λ = O[[Γ]] induced by γ ↦ ρ(γ)γ for continuous characters ρ: Γ → O^×, with Tw_ρ ∘ Tw_ρ' = Tw_{ρρ'}, and the involution ι (γ ↦ γ^{-1}); compatibility with the projections Λ → O[Gal(F/K)].

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.8/twisting-by-characters-of-gamma`
- `EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension`

### ES.8-R6: SelmerIwasawaCohomology:L3

For a Z_p-extension K∞/K, 𝐓 = T ⊗ Λ and Σ finite containing p, ∞ and the ramified primes: H^i(K_Σ/K, 𝐓) and H^i(K_v, 𝐓) (v | p) are finitely generated Λ-modules, H²(K_v, 𝐓) is Λ-torsion, and H¹(K_Σ/K, 𝐓) is Λ-torsion-free when T̄^{G_K} = 0 (Mazur–Rubin, Lemmas 5.3.4–5.3.5, after Greenberg and Perrin-Riou); and H²(K_v, 𝐓)/𝔓 ≅ H²(K_v, 𝐓/𝔓𝐓) (cohomological dimension two).

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.8/exceptional-height-one-primes`
- `EulerSystemsAndKolyvaginSystems:ES.8/specialization-control`
- `EulerSystemsAndKolyvaginSystems:ES.8/generic-core-rank`
- `EulerSystemsAndKolyvaginSystems:ES.8/weak-leopoldt-from-lambda-adic-kolyvagin`
- `EulerSystemsAndKolyvaginSystems:ES.8/lambda-adic-ind`

### ES.8-R7: SelmerIwasawaCohomology:L4

Rubin's Corollary I.6.4 in the direction used here: if Leopoldt's conjecture holds for K then S_{Σp}(K, μ_{p^∞}) is finite (already routed to this layer by the review of PAPER-KOLYVAGIN-90, route 6).

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.8/rank-one-leopoldt-case`

### ES.8-R8: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence

Global class field theory in the form: the inertia subgroup at a finite prime v of the Galois group of an abelian pro-p extension of a number field is the image of the pro-p completion of O_v^×; hence Z_p^d-extensions are unramified outside p; and the maximal abelian p-extension unramified everywhere and split at the primes above p of a field corresponds to the p-part of its class group modulo those primes.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.8/admissible-zp-d-extension`
- `EulerSystemsAndKolyvaginSystems:ES.8/rank-one-leopoldt-case`

### ES.8-R9: SelmerIwasawaCohomology:L3

Control at the augmentation ideal for the anticyclotomic ordinary Selmer structure: for E/Q with good ordinary reduction at p ∤ 2N, K imaginary quadratic with D_K prime to Np, E(K)[p] = 0, K∞/K the anticyclotomic Z_p-extension, 𝐓 = T_pE ⊗ Λ with the ordinary condition at p (relaxed away from p on 𝐓, strict on M_E = T_pE ⊗ Λ^∨) and X = H¹_{F_Λ}(K, M_E)^∨: X/(γ − 1)X and the dual of H¹_{F_ord}(K, E[p^∞]) have the same Z_p-rank (kernel and cokernel of the restriction map finite, from E(K∞)[p] = 0 and the local terms). This is the input missing from Castella–Grossi–Lee–Skinner's proof of Corollary 3.4.2 (PAPER-CASTELLA-ETAL-22/E32).

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.8/error-tolerant-self-dual-lambda-adic-bound`

## Restructuring proposals collected

These five inherited proposals remain recommendations for the maintainer. No atlas stage,
edge, review or content file was modified. Their full source records follow; the reconciliation
notes distinguish their stale scheduling language from the assembled state.

### ES.0-S1: rescope

Roadmaps: `EulerSystemsAndKolyvaginSystems`, `EulerSystemsCyclotomicMainConjecture`, `KatoEulerSystems`.

Red-team finding RT-AREA-iwasawa-1/36: the application adapters import this roadmap's carriers and bounds but have no stage edge from it. ES.2 plans the Euler-system carrier with Rubin's Definition II.1.1 hypotheses, the conductor presentation, the Euler polynomial dictionary and twisting (the request of EulerSystemsCyclotomicMainConjecture L0 is met by ES.2/euler-system-module, conductor-presentation, euler-polynomial and twisting); ES.4 plans Rubin's Theorem II.2.2 (ES.4/rubin-bound).

**Proposal:** Add the stage edges EulerSystemsAndKolyvaginSystems:ES.2 → EulerSystemsCyclotomicMainConjecture:L0, ES.2 → KatoEulerSystems:L2, ES.4 → KatoEulerSystems:L4 and ES.8 → KatoEulerSystems:L4; drop EulerSystemsCyclotomicMainConjecture:L0 → KatoEulerSystems:L2 and EulerSystemsCyclotomicMainConjecture:L2 → KatoEulerSystems:L4 unless a KatoEulerSystems node cites a cyclotomic-unit statement. All added edges are acyclic.

### ES.0-S2: rescope

Roadmaps: `EulerSystemsAndKolyvaginSystems`, `HeegnerPointEulerSystems`, `GeneralizedHeegnerCycles`.

Red-team finding RT-AREA-iwasawa-1/10: Howard's abstract self-dual Kolyvagin-system theory had no owner. This packet makes ES.5 its single owner: ES.5/howard-hypotheses (H.0–H.5 and the Kolyvagin-system relations twisted by G_n), ES.5/cassels-structure (Proposition 1.4.1, Theorem 1.4.2, Lemma 1.5.3), ES.5/howard-stub (Proposition 1.5.9) and ES.5/howard-dvr-theorem (Theorem 1.6.1). The Λ-adic Theorem 2.2.10 belongs to ES.8, outside this packet's scope.

**Proposal:** HeegnerPointEulerSystems HE.6 keeps only the verification of H.0–H.5 for T_p(E) (Howard Theorem 1.6.5) and applies ES.5/howard-dvr-theorem; add the stage edges ES.5 → GeneralizedHeegnerCycles:GH.5 and ES.8 → GeneralizedHeegnerCycles:GH.5, and HeegnerPointEulerSystems:HE.6 → HE.8. The follow-up job for ES.8 plans Howard's Theorem 2.2.10 as a generic node.

### ES.0-S3: split

Roadmaps: `EulerSystemsAndKolyvaginSystems`.

ES.4 and ES.6 are each too broad to read as one star.

**Proposal:** ES.4 into three sub-layers: 'Selmer sheaf and core vertices' (selmer-sheaf, sheaf-monodromy, vertex-step, core-vertices, leading-vertices, stub-sheaf, kolyvagin-bound); 'Rubin's error-tolerant bound' (rubin-hypotheses, rubin-bound, variant-bounds); 'Bounded-error localisation' (abundant-localization, howard-descent-with-errors). ES.6 into two: 'Rubin lattice and arithmetic bidual adapters' (rubin-lattice and the arithmetic specializations of exterior-bidual/bidual-functoriality, importing generic algebra from PadicMeasuresIwasawaAlgebras L6) and 'Stark systems and the regulator' (stark-systems, stark-structure, bss-hypotheses, kolyvagin-systems-rank-r, regulator-isomorphism). ES.1 may likewise separate 'Error-tolerant Chebotarev inputs' (reducibility-depth, selmer-field-saturation, abundant-tuples) from the clean theory.

### ES.8-S1: split

Roadmaps: `EulerSystemsAndKolyvaginSystems`.

Confirmed red-team finding RT-AREA-iwasawa-1/35: ES.8 requires ES.7, and through it ES.6, PadicMeasuresIwasawaAlgebras L6 and the Gorenstein homological algebra, although every consumer (EulerSystemsCyclotomicMainConjecture L2, KatoEulerSystems L4, HeegnerPointEulerSystems HE.8, RankZeroOneBSD BSD.7a) uses only rank-one Iwasawa theory. This packet plans ES.8 as the rank-one layer: none of its 35 nodes uses an exterior bidual, a Stark system or a Gorenstein order, and its in-roadmap prerequisites are ES.0–ES.5 only.

**Proposal:** ES.8 'Iwasawa variation and application handoffs' (rank one) requires ES.5 and SelmerIwasawaCohomology:L3 (replace the edge ES.7 → ES.8 by ES.5 → ES.8), keeps its consumers EulerSystemsCyclotomicMainConjecture:L2, HeegnerPointEulerSystems:HE.8, RankZeroOneBSD:BSD.7a and the KatoEulerSystems L4 node, and contains the 35 nodes of this packet. New stage ES.8h 'Higher-rank Iwasawa variation' requires ES.7 and ES.8 and has no consumers: it combines ES.6–ES.7's higher-rank Euler, Stark and Kolyvagin systems over Gorenstein coefficient orders with ES.8's rank-one maps, along the Z_p^d-extension of the BSS II v1 §§6.1–6.4 route under ES.7's recorded hypotheses (reflexivity, H⁰(F, T) = 0, no finite place splitting completely, Hypothesis 6.11), proves that its rank-one specialisation recovers ES.8 (rubin-iwasawa-divisibility and mazur-rubin-lambda-adic-main-theorem), and bounds higher Fitting ideals over the Iwasawa order by containments, not valuation formulas. Both new edges ES.5 → ES.8 and ES.7 → ES.8h, ES.8 → ES.8h are acyclic (RT-AREA-iwasawa-1 fixes report).

### ES.8-S2: rescope

Roadmaps: `EulerSystemsAndKolyvaginSystems`.

ES.8 is large enough to read as two stars: Rubin's Iwasawa theory of Euler systems over Z_p^d-extensions, and the Λ-adic Kolyvagin-system theory over Z_p-extensions.

**Proposal:** Sub-layers for the atlas: ES.8a 'Rubin's Iwasawa theory of Euler systems' with the nodes admissible-zp-d-extension through unramified-at-split-primes-condition (21 nodes; planets: weak Leopoldt, Rubin's divisibility), and ES.8b 'Λ-adic Kolyvagin systems and specialization' with lambda-adic-selmer-structure through error-tolerant-self-dual-lambda-adic-bound (14 nodes; planets: Λ-adic Kolyvagin system, Λ-primitivity, Mazur–Rubin bound, Howard's bound). ES.8b requires ES.8a only through admissible-zp-d-extension (for the Z_p-extension datum, not admissibility), iwasawa-class-of-an-euler-system and lambda-index.

### Reconciled proposal interpretation

- The ES.0-S2 “follow-up job for ES.8” has now supplied the exact node
  `EulerSystemsAndKolyvaginSystems:ES.8/self-dual-lambda-adic-kolyvagin-bound`; it is not another
  missing planning job. The HE.6→HE.8 and ES.5/ES.8→GH.5 application edges remain proposals.
- ES.0-S3's “exterior bidual algebra” sublayer must import the single L6 owner and retain only
  arithmetic contraction/transition adapters here. Its old wording does not authorize general
  exterior-bidual duplication. The unresolved owner contract is ES.0-G7 below.
- ES.8-S1 separates the rank-one stage from a proposed higher-rank ES.8h. The claim that a future
  ES.8h recovers every ES.8 theorem is an acceptance goal of that future plan, not established
  mathematics in this assembly. Its rank-one comparison needs the exact source hypotheses.
- ES.8-S2's ES.8b dependency on admissible-zp-d-extension is on the tower datum only.
  Anticyclotomic admissibility must not be inferred from it. In addition, the class and index
  interfaces from ES.8a are imported with the involution convention above.
- ES.0-S1 routes arithmetic carriers/bounds directly to cyclotomic and Kato consumers; a
  cyclotomic-unit edge to Kato should remain only if it actually supplies such a statement.

## Remaining work and where to resume

Resume the finite-level revision at its independent review, especially the signature/supplier
and ownership gaps below. Do not mark ES.0–ES.7 accepted merely because this assembly compiles.
A supplier fix should be made by the owning roadmap, then imported under exact IDs; changes to
reviewed node mathematics need an independent re-review. No placeholder Prop record may replace
missing arithmetic hypotheses. The aggregate reader reproduces all layer-level remaining items.

### ES.0-G1: Comparison of the two definitions of Stark systems over principal artinian rings

Mazur–Rubin define Y_n with exterior powers of H¹_{F^n}(K, T), Burns–Sakamoto–Sano with exterior biduals. The two agree where H¹_{F^n} is free (in particular at the cofinal set of vertices with vanishing strict dual Selmer module), which is enough to identify the inverse limits under (H.1)–(H.7); a statement of this identification was not located in the parts of the sources read (Burns–Sano I, arXiv:1612.06187, §3–§4 and Sakamoto's 'Stark systems over Gorenstein local rings' are the places to look). Next action: read those sections and add the comparison node.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.6/stark-systems`

### ES.0-G2: Proofs of Rubin's local theorems and of the induction of Chapter V were read at the level of statements

Rubin IV §§6–7 (Propositions 6.1, 6.8, Lemmas 6.7, 7.1, 7.3) and V §2 (the proof of Lemma 2.5, including the general case without W^{G_K} = 0 and H¹(Ω/K, W) = 0) are cited in the proof sketches from their statements and from the reviewed extraction PAPER-KOLYVAGIN-90; their interiors must be decomposed when the roadmap moves to lemma level.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`
- `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`
- `EulerSystemsAndKolyvaginSystems:ES.3/lifting-to-induced-module`

### ES.0-G3: Proofs of the higher-rank derivative theorem and of the core-graph connectivity over Gorenstein rings were not read

The exact correction formula in BSS II §6.4 p.41 has now been read and displayed, with one- and two-prime tests. The complete arguments of §5.4 (core-graph connectivity) and §6.5 (local compatibility) remain statement-level source citations in this target-level pass, not a lemma-level decomposition. The separate bidual-transfer gap names the non-routine supplier input. The inaccessible 2025 accepted version was not collated with arXiv v1.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.7/higher-kolyvagin-derivative`
- `EulerSystemsAndKolyvaginSystems:ES.6/regulator-isomorphism`

### ES.0-G4: Kolyvagin's article was not read

V. A. Kolyvagin, 'Euler systems', The Grothendieck Festschrift II (1990), is not publicly available. As in the reviewed extraction PAPER-KOLYVAGIN-90, Rubin's book is used as the public statement of the method; no claim is made about the wording of Kolyvagin's article.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.3/congruence`
- `EulerSystemsAndKolyvaginSystems:ES.2/rigidity-variants`

### ES.0-G5: Actual arithmetic Lean signatures and adapters are missing

The suggested file lists most arithmetic definitions, API items, tests and all named arithmetic theorems only in block comments. The typed SelmerTriple, Tower and InverseSystem are generic module presentations, not instantiated Galois/Selmer constructions. Give signatures/examples against the supplier carriers and explicit specialization/transport maps; do not fill the missing hypotheses with arbitrary Prop fields. Preserve the pinned discrete corestriction and add its R-linearity, field-subgroup and compact-coefficient adapters from ArithmeticGaloisDuality R02.1/R02.2 and SelmerIwasawaCohomology L1. Compilation of the algebraic portion alone does not meet PROTOCOL §13.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`
- `EulerSystemsAndKolyvaginSystems:ES.0/quotient-category`
- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`
- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-length-linearity`
- `EulerSystemsAndKolyvaginSystems:ES.0/quotient-dual-propagation`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference`
- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank`
- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-independence-of-modulus`
- `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`
- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-formula`
- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2004`
- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-mr2016`
- `EulerSystemsAndKolyvaginSystems:ES.0/hypotheses-implications`
- `EulerSystemsAndKolyvaginSystems:ES.0/example-cyclotomic-twist`
- `EulerSystemsAndKolyvaginSystems:ES.0/example-elliptic`
- `EulerSystemsAndKolyvaginSystems:ES.0/non-example-inadmissible`
- `EulerSystemsAndKolyvaginSystems:ES.1/ray-class-tower`
- `EulerSystemsAndKolyvaginSystems:ES.1/conductor-ideal`
- `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`
- `EulerSystemsAndKolyvaginSystems:ES.1/transverse-condition`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`
- `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`
- `EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality`
- `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-nonvanishing`
- `EulerSystemsAndKolyvaginSystems:ES.1/chebotarev-prescribed-kernels`
- `EulerSystemsAndKolyvaginSystems:ES.1/rubin-prime-selection`
- `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`
- `EulerSystemsAndKolyvaginSystems:ES.1/selmer-field-saturation`
- `EulerSystemsAndKolyvaginSystems:ES.1/abundant-tuples`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.2/classes-unramified-outside-p`
- `EulerSystemsAndKolyvaginSystems:ES.2/conductor-presentation`
- `EulerSystemsAndKolyvaginSystems:ES.2/twisting`
- `EulerSystemsAndKolyvaginSystems:ES.2/euler-factor-change`
- `EulerSystemsAndKolyvaginSystems:ES.2/universal-euler-system`
- `EulerSystemsAndKolyvaginSystems:ES.2/rigidity-variants`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-operators`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-invariance`
- `EulerSystemsAndKolyvaginSystems:ES.3/lifting-to-induced-module`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-class`
- `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`
- `EulerSystemsAndKolyvaginSystems:ES.3/congruence`
- `EulerSystemsAndKolyvaginSystems:ES.3/kolyvagin-system-module`
- `EulerSystemsAndKolyvaginSystems:ES.3/finite-part-formula`
- `EulerSystemsAndKolyvaginSystems:ES.3/euler-to-kolyvagin`
- `EulerSystemsAndKolyvaginSystems:ES.3/two-prime-test`
- `EulerSystemsAndKolyvaginSystems:ES.3/anticyclotomic-derivative`
- `EulerSystemsAndKolyvaginSystems:ES.4/selmer-sheaf`
- `EulerSystemsAndKolyvaginSystems:ES.4/sheaf-monodromy`
- `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`
- `EulerSystemsAndKolyvaginSystems:ES.4/core-vertices`
- `EulerSystemsAndKolyvaginSystems:ES.4/leading-vertices`
- `EulerSystemsAndKolyvaginSystems:ES.4/stub-sheaf`
- `EulerSystemsAndKolyvaginSystems:ES.4/kolyvagin-bound`
- `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`
- `EulerSystemsAndKolyvaginSystems:ES.4/variant-bounds`
- `EulerSystemsAndKolyvaginSystems:ES.4/abundant-localization`
- `EulerSystemsAndKolyvaginSystems:ES.4/howard-descent-with-errors`
- `EulerSystemsAndKolyvaginSystems:ES.5/divisibility-invariants`
- `EulerSystemsAndKolyvaginSystems:ES.5/rank-one-module-theorem`
- `EulerSystemsAndKolyvaginSystems:ES.5/structure-theorem`
- `EulerSystemsAndKolyvaginSystems:ES.5/kolyvagin-dual-selmer`
- `EulerSystemsAndKolyvaginSystems:ES.5/sharpness-examples`
- `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`
- `EulerSystemsAndKolyvaginSystems:ES.5/howard-stub`
- `EulerSystemsAndKolyvaginSystems:ES.5/howard-dvr-theorem`
- `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`
- `EulerSystemsAndKolyvaginSystems:ES.6/bidual-functoriality`
- `EulerSystemsAndKolyvaginSystems:ES.6/stark-systems`
- `EulerSystemsAndKolyvaginSystems:ES.6/stark-structure`
- `EulerSystemsAndKolyvaginSystems:ES.6/bss-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.6/kolyvagin-systems-rank-r`
- `EulerSystemsAndKolyvaginSystems:ES.6/regulator-isomorphism`
- `EulerSystemsAndKolyvaginSystems:ES.6/rubin-lattice`
- `EulerSystemsAndKolyvaginSystems:ES.7/higher-rank-euler-systems`
- `EulerSystemsAndKolyvaginSystems:ES.7/higher-kolyvagin-derivative`
- `EulerSystemsAndKolyvaginSystems:ES.7/fitting-bounds`
- `EulerSystemsAndKolyvaginSystems:ES.7/rubin-brumer-stark`
- `EulerSystemsAndKolyvaginSystems:ES.7/rank-one-comparison`

### ES.0-G6: General coefficient Selmer duality is still only an open supplier request

The cited SelmerIwasawaCohomology L1/L2 duality and Cartier-dual nodes use O-adic lattices/discrete modules. The abstract L2/selmer-data carrier alone does not prove MR04 artinian/global-length identities or BSS self-injective-ring duality. Fulfil the enlarged L2 request and link each generalized coefficient consumer to it; no O-only theorem may discharge a general-R hypothesis.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-triple`
- `EulerSystemsAndKolyvaginSystems:ES.0/quotient-category`
- `EulerSystemsAndKolyvaginSystems:ES.0/cartesian-condition`
- `EulerSystemsAndKolyvaginSystems:ES.0/quotient-dual-propagation`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-torsion-identification`
- `EulerSystemsAndKolyvaginSystems:ES.0/selmer-length-difference`
- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-independence-of-modulus`
- `EulerSystemsAndKolyvaginSystems:ES.0/canonical-selmer-structure`
- `EulerSystemsAndKolyvaginSystems:ES.0/core-rank-formula`
- `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-decomposition`
- `EulerSystemsAndKolyvaginSystems:ES.1/modified-selmer-structures`
- `EulerSystemsAndKolyvaginSystems:ES.1/transverse-duality`
- `EulerSystemsAndKolyvaginSystems:ES.1/reducibility-depth`
- `EulerSystemsAndKolyvaginSystems:ES.4/vertex-step`
- `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`
- `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`
- `EulerSystemsAndKolyvaginSystems:ES.5/kolyvagin-dual-selmer`
- `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`

### ES.0-G7: Single ownership of exterior-bidual algebra

PadicMeasuresIwasawaAlgebras L6 owns the general exterior-bidual, integral-lattice and scalar-change algebra. ES.6/exterior-bidual and bidual-functoriality currently repeat that general theory. Reconcile with the L6 owner, replace generic ES nodes by exact supplier node IDs/request contracts and retain only the arithmetic contraction/Selmer transition specialization. The split proposal must respect this owner. No supplier packet is edited by this review.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`
- `EulerSystemsAndKolyvaginSystems:ES.6/bidual-functoriality`
- `EulerSystemsAndKolyvaginSystems:ES.6/stark-systems`
- `EulerSystemsAndKolyvaginSystems:ES.7/higher-rank-euler-systems`
- `EulerSystemsAndKolyvaginSystems:ES.7/higher-kolyvagin-derivative`

### ES.0-G8: Bidual norm, transfer and invariant descent have no direct supplier contract

BSS II Lemma 6.9, p.40 explicitly omits the delicate comparison of bidual corestriction with the group norm and points to [21, Remark 2.12]. Ordinary covariant bidual functoriality does not supply change from R[Gal(E(n)/K)] to R[Gal(E/K)] or map (9). The precise L6 request now names these maps; add its exact supplier nodes and verify the identities before claiming this proof sketch closes.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.7/higher-rank-euler-systems`
- `EulerSystemsAndKolyvaginSystems:ES.7/higher-kolyvagin-derivative`

### ES.0-G9: Cassels pairing for the residual-reducible error route

ES.4/howard-descent-with-errors claims to use ES.5/cassels-structure without irreducibility, but the latter currently assumes Howard H.1 (absolute residual irreducibility). CGLS Proposition 3.3.2 is the intended weaker statement. Add its precise weak-hypothesis pairing/structure statement, including the residual-invariant and cartesian/self-duality requirements; then route the error proof through it. Until then the advertised direct prerequisite does not suffice.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.5/cassels-structure`
- `EulerSystemsAndKolyvaginSystems:ES.4/howard-descent-with-errors`

### ES.0-G10: Same-rank non-example for stub Kolyvagin systems

The corrected stub_ne_all test compares KS_1 at core rank χ>1 with KS′_χ and cannot witness strict inclusion at the same exterior rank. Produce an admissible same-rank example or replace this test by another discriminating non-example. The regulator theorem uses rank r=χ, not the higher-core-rank KS_1 module.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.6/kolyvagin-systems-rank-r`

### ES.0-G11: Rubin–Stark application and Rubin–Brumer–Stark comparison

ES.7 gives the DK minus-unit construction and a conditional reference to BSS Theorem 7.1, but does not provide a node stating that theorem’s class-group conclusions or a comparison identifying its Rubin–Stark elements with the DK minus-part construction. Read and state the application with all character, tower, coefficient and norm/integrality hypotheses; distinguish general Rubin–Stark systems from the specialized Rubin–Brumer–Stark theorem owned by IntegralIwasawaTheory I.7.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.7/rubin-brumer-stark`
- `EulerSystemsAndKolyvaginSystems:ES.7/fitting-bounds`
- `EulerSystemsAndKolyvaginSystems:ES.7/rank-one-comparison`

### ES.8-G1: No public source identifies X∞ with the Iwasawa Ш² used by Kato's Theorem 13.4

Kato states his imported bound for H²(T)_0 = ker(H²(T) → H²_loc(T)) with H^q(T) = lim H^q(Z[ζ_{p^n}, 1/p], T). ES.8 supplies Rubin's package: X∞ torsion (Theorem II.3.2 under Hyp(K∞, V) and c_{K,∞} non-torsion) and char(X∞) | p^t ind_Λ(c) (Theorem II.3.4), or char(X∞) | ind_Λ(c) under Hyp(K∞, T) (Theorem II.3.3), for X∞ built from restricted Selmer groups, Λ = O[[Gal(Q∞/Q)]] after decomposing Gal(Q(μ_{p^∞})/Q) = Δ × Γ by characters of Δ (twisting, Rubin II.4). The identification of X∞ with lim Ш²(O_{F,Σ}, T) by Poitou–Tate in the tower (local terms at v ∤ p vanish because H¹_ur(K_{∞,w}, W*) = 0 for infinitely decomposed v) and the comparison of Kato's étale H² with Galois H² over O_{F,Σ} were not found in a public text (Rubin's Remark II.3.5 and Mazur–Rubin's Theorem 5.3.6 only name the weak Leopoldt conjecture). Kato's hypotheses (iv)–(v) are irreducibility over G_Q and an element σ ∈ G_{Q(μ_{p^∞})} with dim ker(1 − σ) = 1; Rubin's Hyp(Q∞, V) needs irreducibility over G_{Q∞}. The KatoEulerSystems L4 adapter must prove the comparison and verify Rubin's hypotheses (Rubin's Proposition III.5.8 does so for elliptic curves).

Needed by:

- `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`

### ES.8-G2: Mazur–Rubin's Λ-adic theory is written over Q and the cyclotomic Z_p-extension only

Mazur–Rubin §5.3 fixes K = Q and K∞ = Q∞. The nodes state their results in that setting; the definitions (lambda-adic-selmer-structure, lambda-adic-kolyvagin-systems, height-one-specialization, blind-spot-and-lambda-primitivity) are written for a Z_p-extension of a number field because Howard and Castella et al. use them over imaginary quadratic fields. A version of Theorems 5.3.3 and 5.3.10 over a general number field, which Büyükboduk §4.3 sketches for totally real fields under Rubin–Stark hypotheses, has no read source and is not planned here.

Needed by:

- `EulerSystemsAndKolyvaginSystems:ES.8/euler-to-lambda-adic-kolyvagin`
- `EulerSystemsAndKolyvaginSystems:ES.8/specialization-control`
- `EulerSystemsAndKolyvaginSystems:ES.8/mazur-rubin-lambda-adic-main-theorem`

The ES.8 target-level follow-up work is the lemma-level decomposition of Rubin VII §§5–7;
Kato's H²(T)_0/X∞ comparison; and a source-qualified extension of MR §5.3 beyond Q/Q∞ if a
consumer actually needs it. Higher-rank Iwasawa consequences from BSS are for the proposed
ES.8h and retain the ES.6–ES.7 norm/transfer gap. The source errata and upstream notes are
preserved verbatim as structured-field prose in the reader, scoped to the recorded PDF versions.

## Verification

- `python3 research/blueprint/intake.py check-files` on the four changed deliverables passed:
  **4 files, 0 problems**. `git diff --check` also passed.
- Both packet validators passed with **0 errors and 0 warnings**:
  `python3 scripts/check_blueprint.py research/blueprint/packets/EulerSystemsAndKolyvaginSystems--ES.0.json`
  and the same command for `EulerSystemsAndKolyvaginSystems--ES.8.json`.
- `lean-check research/blueprint/suggested/EulerSystemsAndKolyvaginSystems.lean` completed
  successfully with **91 `sorry` warnings and no other diagnostics**. The shared build's Mathlib
  commit equals the pinned commit; the aggregate imports Mathlib only. The shared Tau Ceti
  checkout is newer than the pin and was not imported; baseline Tau Ceti statements were read
  directly from the pinned commit. This is an algebraic prototype elaboration, not a verification
  of arithmetic declarations still in comments.
- Checked all aggregate internal prerequisites resolve and the combined 119-node graph has no
  cycle. All ES.8 finite-level prerequisites are exact node IDs; none requires ES.6 or ES.7.
- Checked all 119 reader statements and all 592 API/test names and statements against the
  packets; every API/test name occurs in the suggested file, often only in the explicitly
  untyped inventory. Checked distinct imports and preservation of both review objects and all
  mathematical statement/hypothesis/API/test/source/acceptance fields.
- Read the roadmap's reviewed library audit and the listed baseline declarations at the exact
  pins. Cross-part source checks used the hash-matching public Rubin 1999 draft, the
  Mazur–Rubin author PDF (especially §5.3 and Appendix A), and Howard's arXiv v1 for tower
  specialization/self-dual bounds. No claim is made to have rereviewed every proof in ES.0–ES.7.
- Only the three assembly deliverables and the allowed ES.8 part packet are changed. The
  original part readers/suggested files and atlas/content data remain outside this submission.

No compile or other background process remains. The independent finite-level revision can
resume from its review and the exact records above without the assembly's temporary papers or
scripts. All durable requests, gaps, conventions and restructuring records are in these
submitted files; scratch is disposable.
