# Checkpoint: PKG-ArithmeticStatisticsPartII (#10372)

Worker: Codex, session **codex-4mtfdR**, 2026-10-18. **Blocked on the package destination; this is not a completed package submission.** The full prepared package is preserved below because worker scratch is deleted after submission. No change to the existing integral-orbit package or its accepted review is included.

## The decision needed

The issue names `packages/ArithmeticStatisticsPartII/{README.md,Suggested.lean,metadata.toml}`. Those paths already contain the unrelated integral-orbit roadmap, split from ArithmeticStatistics in #10251 (commit `270eb2332`) and independently accepted/fixed in #10293 (commit `3861c021b`). Its `review.json` is accepted for the integral-orbit contents. Overwriting the three named files would erase that package and attach its accepted review to different mathematics.

The accepted input to this job instead has 42 targets about random Γ-groups, seven layers RG.0–RG.6. Both [the design handoff](DESIGN-ArithmeticStatisticsPartII.md) and [its independent review handoff](REV-DESIGN-ArithmeticStatisticsPartII.md) already identify the collision and propose **ArithmeticStatisticsPartIIRandomGammaGroups** as the new name. They leave the decision to the maintainer.

WORKERS.md says **“Edit only the files the issue names, plus your own scratch space.”** I requested clarification in the worker conversation about placing the new package at the proposed distinct name; no answer had arrived when this checkpoint was prepared. The handoff is an authorized output; a new package directory is not. I have therefore preserved the prepared files in this handoff instead of overwriting accepted work or choosing an unauthorized destination.

This PR must remain a **draft checkpoint** until that decision is made. The queue's completion test checks that all four outputs exist; three already exist for the other roadmap, and this handoff would supply the fourth. A normal automatic merge could consequently mark this random-group job complete while leaving the integral-orbit package in its place. Resolve the destination and queue outputs before marking the package complete.

## Resume without repeating the work

1. Obtain the maintainer's choice of destination, preferably `ArithmeticStatisticsPartIIRandomGammaGroups`, preserving the accepted integral-orbit package. Update the job's authorized output paths and downstream references through the maintainer's normal process. This worker did not edit the queue, packet, roadmap record, review or issue labels.
2. Extract the three payloads below. The prepared Lean namespace and module header already use `TauCetiRoadmap.ArithmeticStatisticsPartIIRandomGammaGroups`. If a different name is chosen, change both consistently. The payload hashes below detect accidental loss during extraction.
3. Read the current upstream roadmaps and Tau Ceti again if their commits have advanced. The package already imports the generic free-group, normal-generation, relation-module and lower-p-series work described below; retain those ownership boundaries.
4. Run `lean-check` on the installed `Suggested.lean`, the sorry-data checker, `intake.py check-files` on the final four authorized outputs, and `git diff --check`. The prepared Lean payload has already elaborated successfully at the specified pins. Independent package review is still required.
5. Replace this checkpoint handoff with a completed handoff once the package is installed, then submit the completed package for its independent review. Do not treat the existing integral-orbit `review.json` as a review of this work.

The payloads are fenced with four backticks. They can be extracted to a worker's own scratch directory with this Python pattern, supplying `scratch` according to that worker's instructions:

```python
from pathlib import Path
import re
handoff = Path('research/blueprint/handoff/PKG-ArithmeticStatisticsPartII.md').read_text()
for name, language in [('README.md', 'markdown'), ('Suggested.lean', 'lean'), ('metadata.toml', 'toml')]:
    marker = '## Payload: ' + name + '\n\n'
    tail = handoff.split(marker, 1)[1]
    payload = tail.split('````' + language + '\n', 1)[1].split('\n````', 1)[0] + '\n'
    (scratch / name).write_text(payload)
```

## What is prepared

- A complete prose draft with all **42 accepted targets**, their hypotheses, proof routes, locators, Checks and examples, arranged in seven upstream-style layers. It has **127 API bullets**: five generic API entries from the 132-entry input are supplied by the existing owners instead of replanned here. All 68 input Checks remain, with one additional minimal-normal positive/negative control (69 bullets across the definition/construction Checks blocks).
- An **185-line** compact `Suggested.lean`: actual light definitions, representative theorem signatures and examples only. It uses no sorry-defined data or unconstructed heavy carriers. The heavy constructions retain their complete statements and tests in the README and appear in its closing comment by name.
- `metadata.toml` with `topic = "math.NT"`.
- Additional packaging corrections: relation lists are ordered tuples with repetitions, including Γ=1; eventual positivity of arithmetic family denominators is part of the conjecture; the algebra-limit and finite-branching steps of countable additivity are explicit; level-predecessor comparisons require ℓ>1; the weighted moment proof defines its lift-count maps and limit. The unconditional arithmetic distribution remains a conjecture.

## Validation and limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticStatisticsPartII.json`: **0 errors, 0 warnings**, 42 nodes, 132 input API entries, 68 input Checks, 29 planets, 28 baseline declarations, seven planned layers and no closed layers. The accepted packet is unchanged.
- `lean-check` on the exact Lean payload: **exit 0**, **27 warnings**, every warning `declaration uses sorry`. No other warnings or errors. The supplied shared build uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; 85 GB memory was available before the final check. Elaboration checks signatures, not proofs.
- `python3 scripts/check_sorry_data.py` on the exact Lean payload: **exit 0**.
- Structural audit: all 42 prose subsections present; each of the 16 definition/construction blocks has at least four discriminating Checks; no packet identifiers, review narrative, higher-layer bookkeeping ids or local paths in the prepared README. The checks and numerical script below are audits, not formalized proofs.
- The 28 accepted baseline declaration contexts were read at the pins. In particular the actual `Measure.map`, `IsSimpleGroup`, `AddContent.measure` and `AddContent.measure_eq` declarations were checked, rather than relying on their documentation mentions. The current Tau Ceti five-term exactness declarations were also read directly.
- Intake file validation and `git diff --check` for this checkpoint are recorded in the PR. The package is not installed at an authorized destination, so there is no claim that intake has checked the eventual installed package paths.
- The published Inventiones version of LWZB was not compared. Koch and Neukirch–Schmidt–Wingberg were not read: their precise equivariant duality/unit statements remain named supplier contracts, quoted indirectly by LWZB. The function-field repair uses the complete curve and its Picard group; no affine-units-equal-constants claim remains. The one Feit–Thompson gap remains conditional through (SZΓ), and the twelve exact supplier requests remain visible through the contracts.

## Ownership audit against current upstream

Read the current upstream ProfiniteProPGroups README (introduction and Layers 0, 3, 4) and Suggested.lean, and ProfiniteCohomology README (including the five-term interface) and Suggested.lean as the two package models. Searched the entire current roadmaps, Completed collection and current Tau Ceti by mathematical objects/operators as well as names. No existing random admissible Γ-group, non-extension-closed level-completion, Property-E probability, chief-pair counting or λ-invariant implementation was found. A limited open-Mathlib-PR search for profinite completions and chief factors found generic completion work, including [#44627](https://github.com/leanprover-community/mathlib4/pull/44627) and [#44652](https://github.com/leanprover-community/mathlib4/pull/44652), without an identified replacement for these Γ-specific targets; this was not an exhaustive audit of all open PRs.

Current upstream checkout: `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; its Mathlib: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. These were read only; no Lake command was run there. The reviewed library-coverage record for ArithmeticStatistics ST.5 says not built and gives no implementation evidence; the packet's planned/conjectural status is not treated as a library implementation.

Specific removals/deferrals from the package draft:

| Generic material | Supplier retained in the boundaries/contracts | New work retained here |
| --- | --- | --- |
| `GammaGroup.IsPrimeTo` | Tau Ceti supernatural order; ProfiniteProPGroups Layers 0–1 | Γ-action and equivariant map/closure adapters |
| Free pro-C construction | Current `TauCeti.freeProC`, `freeProC.lift`, `freeProC.hom_ext`; ProfiniteProPGroups Layer 4 | Permutation Γ-action on the basis and the admissible retract; level classes here do not require extension closure |
| `relationRank`, `relationRank_eq_finrank_H2`, `finrank_pMultiplicator` | ProfiniteProPGroups Layer 5; current `TauCeti.card_add_finrank_H2_of_isClosed`, `TauCeti.presentedProP.card_add_finrank_cohomFp_two` | Equivariant p-cover quotient, nucleus and probability formulas |
| `pClass` and lower p-series | ProfiniteProPGroups Layer 8 | Equivariant nucleus and the exact-class r−ν correction |
| Generic normal generation modulo Rᵖ[R,F] | Current `TauCeti.IsProP.topologicalClosure_normalClosure_eq_iff_quotient_pLowerCentralStep` | Y-relation generation and its Γ-action constraints |
| Five-term exactness/transgression | ProfiniteCohomology Layer 5; current `TauCeti.ContCohomology.fiveTerm_exact_H1N`, `fiveTerm_exact_H2Q` | Γ-natural application to the presentation quotient |
| Admissibility and Property E themselves | IG.4 exact contracts | Level restriction, completion, relation criterion and probability support |
| Abelian probability measures and arithmetic function-field moment theorem | ArithmeticStatistics ST.5 | Comparison of the nonabelian limit measure with the supplied abelian law and moments |

The generic predicates `IsPrimeTo`, `IsAdmissible` and `HasPropertyE` in the design's prototype were also removed from the suggested Lean file as owned elsewhere. No material was moved upward in the tier order. ArithmeticStatistics ST.5 is a supplier, not a consumer that introduces a cycle; the future distinct random-Γ-group package can depend on it.

## Sources actually read

All locators in the payload refer to the specified arXiv versions and printed pages. Primary PDF files were downloaded only to worker scratch. The cleared Ribes–Zalesskii text was read in place and never copied or extracted to another file.

| Source | Portions read in this run | PDF SHA-256 |
| --- | --- | --- |
| [LWZB](https://arxiv.org/pdf/1907.05002v2) | Part I §§1–7, pp. 1–37, in full; §§8–10, pp. 37–41, consulted for the ST.5 bridge | `7f1e85da49b23f80fc7abe9a68dbc5384ab216dfa5d55cd5e3223ba3268abed9` |
| [LW20](https://arxiv.org/pdf/1708.08509v2) | pp. 4–16, 17–21, 23–29, and Lemma 12.5, p. 34 | `49f8dc52d96bd168723e8b92e7ce3c3734261d923684c2b9202c0bc84cd350fe` |
| [BW17](https://arxiv.org/pdf/1604.03433v2) | §3, pp. 5–7; Lemma 4.8 and proof, pp. 10–11 | `c6651041ab6ec5f2cf8361f8277908022f1ad06ab1672af313e2b8b47bf00341` |
| [BBH](https://arxiv.org/pdf/1803.04047v1) | Definitions 2.1–2.3, p. 2; Lemma 2.8, p. 5; Theorem 2.22 and proof, pp. 9–11; §3, pp. 13–14 | `6b1412a086eaa005165ca392500a6c7711d64333ed4b41f962f45a0237764fd4` |
| [WW](https://arxiv.org/pdf/1907.11201v2) | §§3.2–3.3, pp. 6–7; Theorem 4.1 and proof, pp. 8–9; Proposition 6.6, p. 13 | `971229c3a88254d108acf865e687e60be45e90f280924f9a2b734b8d4b099232` |
| Ribes–Zalesskii, *Profinite Groups*, second edition (cleared library copy) | Theorem 2.3.15 and proof, printed pp. 40–41 | Read in place; no copy retained |

## Per-target adversarial pass

The table covers every retained target. Numerical checks are explicitly finite computations; structural checks use the source arguments and the hypotheses in the payload.

| Section | Target | Instances and hypothesis/convention checks |
| --- | --- | --- |
| 0.1 | Γ-groups and their equivariant maps | Γ=1, inversion on C₃, factor swap on C₃²; equivariance and full Γ-orbit closure matter. |
| 0.2 | The map Y | C₃ sign, C₄ sign and inner action on S₃ fix the sign, right cosets and non-homomorphism control. |
| 0.3 | The coprime conjugacy hypothesis (SZ) | Solvable C₂ and Γ=1; trivial C₂ acting on C₂ gives a nonprincipal cocycle when coprimality fails. |
| 0.4 | Sections of G ⋊ Γ and the fibres of Y (Lemmas 3.4–3.6) | Three sections for C₃⋊C₂; finite coprime exactness is extended to closed subgroups by compactness, not by applying a finite lemma to an infinite kernel. |
| 0.5 | Admissible Γ-groups: closure properties and the abelian criterion | C₃ sign is admissible, C₃ trivial is not; C₄ sign fails prime-to order; normal fixed kernels are central. |
| 1.1 | Level-𝒞 closure and the pro-𝒞 completion of a Γ-group | Empty level, elementary abelian exponent-two level versus C₄, and maximal pro-3 completion; finite word functions replace quotient lifting. |
| 1.2 | The free pro-|Γ|′ Γ-group F_n(Γ) | n=0 and Γ=1; C₃ sign gives 9 equivariant maps for n=2; the regular module has nonzero invariants. |
| 1.3 | The free admissible Γ-group 𝓕_n (Lemma 3.1, Remark 3.2) | Γ=1 is trivial; Γ=C₂ gives free rank n at p=3, rather than the rank-2n ambient free Γ-group. |
| 1.4 | Homomorphisms out of 𝓕_n (Corollary 3.8, Corollary 3.10, finiteness) | C₄ sign has two Y-values but only the trivial map from the pro-odd admissible free group; retain prime-to hypothesis. |
| 1.5 | Property E relative to a level: restriction and completion | Heisenberg order 27 over C₃² and Q₈ over C₂² give admissible groups lacking Property E. |
| 1.6 | Property E as the shape of the relations (Proposition 3.13) | Abelian admissible targets have no relevant trivial-kernel-action central obstruction; use the closed-subgroup Y lemma for infinite relation kernels. |
| 2.1 | The space 𝒫 of admissible Γ-groups | Non-level cylinders are empty; Γ=1 gives a singleton space; use a countable nested level tower for set size, separation and disjoint open decompositions. |
| 2.2 | Random Γ-groups X_{u,n} and their laws μ_{u,n} (Definition 3.15) | n=1,u=0 at C₃ level has trivial quotient probability 2/3; n+u=1 tail and uniform finite Haar pushforward; Property-E obstruction forces zero. |
| 3.1 | Products of irreducible F-groups (Liu–Wood §§5–7) | C₃ powers give 3^m−1 surjections; A₅ powers give 120m; irreducibility tests normal operator-stable subgroups. |
| 3.2 | The fundamental short exact sequence and the multiplicities m(𝒞, n, H, G) | Isomorphism presentation gives R=1 and m=0; elementary C₃ level and H=1 gives m=n; do not drop trivial-action C_p factors. |
| 3.3 | Generation by Y-relations (Proposition 4.3, Remark 4.4) | F₃ vector spanning probabilities; u=−1 gives a zero factor, not a signed negative probability; distinguish F⋊Γ-generation from free Γ-maps. |
| 3.4 | H-extensions of Γ-groups and the Möbius function of sub-extensions | H=1, E=F_p² with scalar Γ-action gives Möbius μ(0,E)=p; strict-superextension recursion and literal subgroups, not isomorphism classes. |
| 3.5 | Counting surjections of H-extensions (Lemma 4.6) | Trivial extension and C₃ sign lift counts; off-level extensions have zero lifts; equal Y fibres give the normalization. |
| 3.6 | Multiplicities through extensions (Proposition 4.7, Corollary 4.8, Remark 4.9) | H=1 at elementary C₃ level recovers m=n and the automorphism divisor 2; operators on nonabelian kernels include E⋊Γ. |
| 3.7 | The λ-invariants λ(𝒞, H, G) | λ=1 for H=1, λ=1/3 at elementary C₃ level over H=C₃, λ=1 at full abelian level; trivial-action Heisenberg λ=2 needs h^m−1. |
| 3.8 | Limits of truncated products (Liu–Wood Lemma 8.11) | a>1 excludes the divergent a=1 case; x=0 gives product 1; finitely many signed or zero initial factors are retained. |
| 3.9 | The finite-level distribution and its limit (Theorem 4.12) | Heisenberg-level H=C₃² has true mass 0 while the unrestricted formal product is about 0.002698; every divisor has positive cardinality. |
| 4.1 | Chief factor pairs of finite groups (Liu–Wood §6) | C₃, C₄ and the identity test minimal normality; S₃ and A₄ distinguish chief factors and their conjugation images from composition factors. |
| 4.2 | Γ-chief factor pairs (Definition 5.1, Lemma 5.2, Corollary 5.3) | G=1 removes the factors of Γ; C₃ sign gives (C₃,C₂), C₃ trivial gives (C₃,1); Γ=1 agrees with ordinary chief pairs. |
| 4.3 | Multiplicity bounds at level ℓ (Lemma 5.4) | Explicit ℓ>1 makes the predecessor defined; finite faithful operator images and the prime-to-|Γ| outer quotient determine the bound. |
| 4.4 | A uniform lower bound for the generation factors (Corollary 5.9) | Zero products stay zero; nonzero spanning products dominate an Euler product; c depends on u,ℓ and the predecessor, not H,n. |
| 4.5 | Interchanging limits and sums over the level tower (Lemma 5.10) | Nonnegativity, positive persistence and n≥max(1,1−u); Fatou permits individual thresholds in H, followed by a summable majorant. |
| 4.6 | No escape of mass: countable additivity of μ_u (Theorem 5.12) | Coordinatewise level masses sum to one before extending to the algebra; choose levels first, then finite cell subsets; finite branching gives a group in every decreasing set. |
| 4.7 | The limiting measures μ_u and μ_Γ | Empty and full space normalization; elementary-level mass 0.840189 at u=1; Property-E obstruction remains zero after extension. |
| 4.8 | Convergence of the random Γ-groups (Theorem 1.2) | Fatou supplies the open-set liminf direction; elementary versus full abelian C₃ masses are distinct; all-integer-u tail retained. |
| 4.9 | μ_u on V_{𝒞,H} for arbitrary 𝒞 (Definition 5.14, Theorem 5.15) | Fixed finite kernels have finitely many extension classes even at infinite C; finite obstruction witnesses stabilize; define negative-u zero branches before rearranging products. |
| 5.1 | Moments at finite n (Lemma 6.1) | A=1 gives moment 1; C₃ sign gives (3^n−1)/3^{n+1} at u=1; no division by a zero Y-cardinality. |
| 5.2 | The moments of μ_u (Theorem 6.2) | C₃ sign moments 1/3 and 1; Heisenberg Γ=C₄ and C₂² moments 1/9 and 1/27; weighted interchange is separate from weak convergence. |
| 5.3 | Finite-index sublattices over Z_p[Γ] for p ∤ |Γ| | 3^k Z₃ sign lattices are isomorphic; the lattice generated by 1+σ and 2 in Z₂[C₂] gives the noncoprime failure; Nakayama is only over commutative Z_p. |
| 5.4 | The abelianization: the Cohen–Lenstra–Martinet distribution (§7.1) | Augmentation quotient, not regular module; all-prime u=0 finite-group masses vanish; finite-prime u=1 agrees with the CLM law. |
| 5.5 | The p-covering group, p-multiplicator and nucleus | C_p cover is C_{p²}, multiplicator and nucleus C_p; H=1 uses rank-zero cover while a redundant rank-n cover has C_p^n; pair-invariance of N*. |
| 5.6 | The pro-p specialization: Boston–Bush–Hajir (Lemma 7.2, Theorem 7.4) | C₃ at u=1 has the abelian pro-3 mass; C₃ at u=−1 has Property E but no prescribed n−1 relation presentation; both conditional-rank normalizations included. |
| 5.7 | The p-class-c specialization (Theorem 7.5) | At c=1, ν=r and the formula is the p-rank law; distinguish r below class c from r−ν at exact class c; H=1 handled through its minimal cover. |
| 6.1 | The Liu–Wood–Zureick-Brown conjecture (Conjecture 1.3), as a proposition | Marked Γ-extensions, radical-discriminant ordering and Δ fixed; H=1 detects an empty denominator family; eventual denominator positivity is explicit. |
| 6.2 | The Galois groups lie in the support of μ_Γ | Smallness plus bounded primitive quotients implies finite level completions; complete and affine class fields have separate contracts; compatibility does not assert positive mass. |
| 6.3 | Function-field moments agree with the moments of μ_Γ | C₃ sign gives moment 1/3; coprimality in q and q−1 and q-first limsup/liminf order retained. |
| 6.4 | p-class tower groups occur in the model (Lemma 3.17, Proposition 3.22) | Real quadratic p=3 gives n+1 Y-tuples; Γ=1 still permits tuples of any prescribed length by repetitions; complete-curve Picard degree and constant units replace the false affine-unit shortcut. |

## Lean–README signature checks

| Lean signature | README location and checked scope |
| --- | --- |
| `yMap_mul` | §0.2; arbitrary action by automorphisms, conjugation by the second factor |
| `yMap_eq_yMap_iff` | §0.2; all Γ coordinates, right coset criterion h g⁻¹ fixed |
| `card_eq_card_fixedPoints_mul_card_range_yMap` | §0.2; finite G, no coprimality needed |
| `closedNormalClosure_le_iff` | §0.1; target closed, normal and Γ-stable; actual closure definition |
| `coprimeH1Trivial_of_isSolvable` | §0.3; Γ finite and solvable, finite coprime kernels |
| `crossedHom_principal_of_commGroup` | §0.3; finite abelian kernel, coprime orders, no solvability requirement on Γ |
| `CoprimeH1Trivial.card_sections` | §0.4; (SZΓ), finite coprime H; section data as crossed homomorphisms |
| `CoprimeH1Trivial.fixedPoints_surjective` | §0.4; finite source, surjective equivariant homomorphism, coprimality |
| `map_haarProb_uniform` | §2.2; compact source with Borel measure, continuous surjective homomorphism, finite discrete target |
| `exists_tendsto_prod_one_sub` | §3.8; real a>1, convergent real x_n, integer cutoffs tending to infinity |
| `exists_isMinimalNormal_le` | §4.1; finite G, nontrivial normal N; no hidden simplicity assumption on G |

The C₃/C₄ examples pin the cardinalities and sign convention, the noncoprime C₂ control excludes unrestricted H¹-vanishing, and the S₃ example excludes treating Y as a homomorphism. The examples themselves have sorry proofs, as required for suggested signatures.

## Reproducible finite computation

The following standalone Python uses only the standard library. It checks associativity and the involution on the 27-element Heisenberg model, its fixed/Y cardinalities and the absence of commuting lifts; it also checks exact matrix-product fractions and the extension weights. The floating products merely witness the reported approximate numbers.

```python
from fractions import Fraction as Q
from itertools import product,permutations
from math import prod
E=list(product(range(3),repeat=3))
def mul(g,h):
 a,b,c=g;x,y,z=h
 return ((a+x)%3,(b+y)%3,(c+z+a*y)%3)
def inv(g):a,b,c=g;return((-a)%3,(-b)%3,(-c+a*b)%3)
def sig(g):a,b,c=g;return((-a)%3,(-b)%3,c)
assert all(mul(mul(g,h),k)==mul(g,mul(h,k)) for g,h,k in product(E,repeat=3))
assert all(sig(mul(g,h))==mul(sig(g),sig(h)) for g,h in product(E,repeat=2))
fixed=[g for g in E if sig(g)==g]; Y={mul(inv(g),sig(g)) for g in E}
liftsX=[g for g in E if g[:2]==(1,0)];liftsY=[g for g in E if g[:2]==(0,1)]
assert len(fixed)==3 and len(Y)==9
assert not any(mul(g,h)==mul(h,g) for g,h in product(liftsX,liftsY))
assert Q(2)*(Q(1,18)+4*Q(1,9))==1
assert 2*Q(1,1)==2
C3=prod(1-3.0**(-i) for i in range(1,100))
C3u1=prod(1-3.0**(-i) for i in range(2,100))
err=Q(1,48)*C3*prod(1-2*3.0**(-i) for i in range(1,100))
assert abs(err-0.002698477835)<1e-12
for n in [1,2,3]:
 for u in [-1,0,1]:
  if n+u<1:continue
  probability=prod(Q(1)-Q(3)**(j-n-u) for j in range(n))
  if u<0: assert probability==0
  print('matrix',n,u,probability)
print('Heisenberg fixed',len(fixed),'Y',len(Y),'commuting lift pairs',0)
print('lambda(sign)',Q(2)*(Q(1,18)+4*Q(1,9)),'lambda(trivial)',2)
print('C3',C3,'C3u1',C3u1,'unqualified product',err)
print('C3 masses u1 abelian',C3u1/6,'elementary',C3u1*Q(3,16))
```

Observed output:

```text
matrix 1 0 2/3
matrix 1 1 8/9
matrix 2 -1 0
matrix 2 0 16/27
matrix 2 1 208/243
matrix 3 -1 0
matrix 3 0 416/729
matrix 3 1 16640/19683
Heisenberg fixed 3 Y 9 commuting lift pairs 0
lambda(sign) 1 lambda(trivial) 2
C3 0.5601260779279484 C3u1 0.8401891168919232 unqualified product 0.0026984778350159487
C3 masses u1 abelian 0.1400315194819872 elementary 0.1575354594172356
```

## Payload integrity

- `README.md`: 144596 bytes; SHA-256 `5cfcc19dd80d69b9e66b20a7334a6888b731079d851759a9533cb5a706d9ed98`.
- `Suggested.lean`: 8777 bytes; SHA-256 `13f06053e9e4208925534a9abfaafd6b7f8cb44fd71f637d9f18b97fb1a2f0b0`.
- `metadata.toml`: 18 bytes; SHA-256 `d303572d699e7ef5619039e39ca2cc23feb22354dad61e5014fe05151078b2a7`.
- Accepted packet at preparation: SHA-256 `88b97e478df263a2194fcec63887c4c422842682cccaf8897b8076dff91e42a6`.

## Payload: README.md

````markdown
# Roadmap: arithmetic statistics, Part II — random Γ-groups

**Summary.** Construct the random nonabelian Cohen–Lenstra–Martinet model for a finite group Γ: free admissible Γ-groups, quotients by Haar-random Y-relations, their limiting probability measures, explicit finite-completion probabilities and surjection moments. Compare the abelian and pro-p specializations with Cohen–Lenstra–Martinet and Boston–Bush–Hajir, and formulate the arithmetic distribution conjecture separately from the proved group-theoretic model. The main source is Liu–Wood–Zureick-Brown [LWZB], Part I; the finite operator-group counting and tightness arguments use Liu–Wood [LW20]. All results for arbitrary Γ that use conjugacy of coprime complements carry the explicit hypothesis (SZΓ).

## Scope and ownership

This roadmap owns equivariant random quotients, completions for classes closed under products and subquotients without extension closure, the topology on their isomorphism classes, irreducible operator-group counts, chief factor pairs with their automorphism actions, and the λ-invariants determining the distribution. The arithmetic endpoints identify the model's moments and support; they do not prove the number-field distribution conjecture.

ArithmeticStatistics ST.5 owns the abelian Cohen–Lenstra measures, Cohen–Martinet predicted moments, conjugacy of coprime abelian complements, and the function-field moment theorem. InverseGaloisAndArithmeticFundamentalGroups IG.4 owns admissibility, Property E relative to a full category, the Galois action and arithmetic Property E. Here their definitions are used through the contracts below; the new results concern level completions, random presentations, and their probabilities.

Generic profinite foundations, supernatural order, Frattini theory, generating rank, free pro-C groups, pro-p presentation theory and the lower p-series belong to Tau Ceti's ProfiniteProPGroups Layers 0, 1, 3, 4, 5 and 8. Tau Ceti supplies the free group as `TauCeti.freeProC`, with `freeProC.lift` and `freeProC.hom_ext`; the new free Γ-group equips this supplied carrier with a permutation action. Its `FiniteGroupClass` requires extension closure. The level classes used here need not have that property: for example, the class generated by C₂ contains elementary abelian 2-groups but not C₄. Thus its generic pro-C completion cannot replace the level completion.

Tau Ceti also supplies normal generation modulo Rᵖ[R,F] in `TauCeti.Topology.Algebra.Group.Profinite.ProP.NormalGeneration`, notably `TauCeti.IsProP.topologicalClosure_normalClosure_eq_iff_quotient_pLowerCentralStep`, and the cohomological relation count in `TauCeti.Topology.Algebra.Group.Profinite.ProP.Relation.Rank`, notably `TauCeti.card_add_finrank_H2_of_isClosed` and `TauCeti.presentedProP.card_add_finrank_cohomFp_two`. These supply the generic relation module and its rank; the work here adds compatible Γ-actions, the p-cover nucleus and the distribution calculation. ProfiniteCohomology Layer 5 owns the five-term sequence and transgression; ClassFieldTheory Layer 12 owns the Hilbert class field correspondence. The exact Galois duality and function-field contracts below belong to ArithmeticGaloisDuality and FunctionFieldArithmetic.

## Conventions

Γ is a finite discrete group, with a fixed finite generating tuple (γ₁,…,γ_d). A Γ-group is a profinite group with a continuous action by automorphisms; finite groups have the discrete topology. Continuous homomorphisms and isomorphisms preserve Γ-actions. Γ-subgroups are closed and Γ-stable. In an operator group, irreducibility excludes nontrivial proper **normal** operator-stable subgroups. An arbitrary operator-stable subgroup need not be normal.

Powers and commutator subgroups in profinite presentation quotients mean their closed generated subgroups. Write [S] for the closed normal Γ-subgroup generated by S, and Y(g)=(g⁻¹γ_j(g))_j. The notation [Y(S)] means the normal Γ-closure of all coordinates. Put y(G)=|Y(G)| for finite G, so y(G)=[G:G^Γ], and h_F(A)=|End_F(A)| for a finite F-group. Fibres of Y are right cosets G^Γg. With C₂ acting on additive C₃ by inversion, Y(a)=−2a=a; with inversion on C₄, Y(C₄)={0,2}. In a nonabelian group the formula is Y(gh)=h⁻¹Y(g)h·Y(h), coordinatewise. This fixes both the sign and the side of the coset convention.

A pro-|Γ|′ group has all finite quotient orders coprime to |Γ|. Admissibility means this property together with topological generation by all g⁻¹γ(g). Property E is always relative to a specified category. A finite admissible group need not have Property E. Having Property E is necessary for the support formulas below; it does not guarantee positive mass for every integer u.

For a collection C of finite Γ-groups, C̄ is its closure under finite products, Γ-subgroups and Γ-quotients. A group of level C is an inverse limit of groups in C̄. Completion is denoted G^C. Let C_ℓ consist of all Γ-groups of order at most ℓ coprime to |Γ|. Set U_{C,H}={G:G^C≅H}, and V_{C,H}={G:G^C≅H} also for infinite C; the different letter distinguishes basic cylinders from possibly closed countable intersections. The representatives H in these expressions must themselves have level C. All counts and sums are over isomorphism classes with the specified operators or projection to H, not over choices of labelled groups.

The integer u is fixed. Finite random models use n≥1 and n+u≥1, and limiting statements use this cofinal tail of n. A relation list is an ordered tuple of length n+u, with repetitions permitted. All Haar measures have mass one. Cardinalities in probability formulas are interpreted as positive real numbers before division: automorphism groups contain the identity, and y(G)≥1. An infinite product starts at its stated integer, including a zero factor when present; negative-u formulas do not cancel that zero. Products over arbitrary level classes are defined as limits along increasing finite level classes. On the nonzero branch their factors lie in [0,1]; an obstructed branch is assigned its zero cylinder limit before any rearrangement. At all primes the abelian law is on a profinite product. In particular, for Γ=C₂ and u=0 it gives mass zero to finite abelian groups, since the product of the factors (1−1/p) over odd primes vanishes.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use Mathlib's `MulDistribMulAction`, `MulDistribMulActionHom`, `FixedPoints.subgroup`, `SemidirectProduct`, `OpenNormalSubgroup`, `Subgroup.topologicalClosure` and `ProfiniteGrp`. For a profinite group G, `TauCeti.profiniteOrder G` records its supernatural order; `TauCeti.maximalProPQuotient` and `TauCeti.IsProP` provide the maximal pro-p quotient. `TauCeti.haarProb` is normalized Haar probability, and `TauCeti.haarProb_eq_uniformOn_univ` identifies it with the uniform law on a finite group. Mathlib's `Subgroup.exists_right_complement'_of_coprime` supplies existence of finite coprime complements; it is not a theorem asserting their conjugacy.

The analytic inputs are `Measure.map`, `ProbabilityMeasure`, uniqueness of Haar probability (`Measure.isHaarMeasure_eq_of_isProbabilityMeasure`), `IncidenceAlgebra.mu`, dominated convergence for sums (`tendsto_tsum_of_dominated_convergence`), Fatou's inequality (`lintegral_liminf_le`), `AddContent.measure` and `AddContent.measure_eq`, and the open-set form of Portmanteau (`tendsto_of_forall_isOpen_le_liminf`). The lattice argument uses `Module.Projective.of_split`, Maschke's complement theorem `MonoidAlgebra.Submodule.exists_isCompl` and Nakayama over the commutative ring ℤ_p via `Submodule.le_of_le_smul_of_le_jacobson_bot`. Number-field family finiteness uses `NumberField.finite_of_discr_bdd` after bounding discriminants in fixed degree from the radical discriminant.

The profinite inverse-limit contract is that finite quotients recover a profinite group, closed normal quotients are profinite, and a compatible system of nonempty finite sets has a point. Tau Ceti exposes the last assertion as `TauCeti.exists_forall_map_eq_of_finite` and its compact-Hausdorff version `TauCeti.exists_forall_map_eq_of_compact_t2`. This is used for sections and compatible isomorphisms, including inverse limits whose transition maps are not all surjective.

### From the profinite roadmaps

ProfiniteProPGroups Layer 4 supplies a free pro-C group on any finite set for the extension-closed class of finite groups prime to |Γ|, its evaluation map into each pro-|Γ|′ target, uniqueness on generators and functoriality under permutations of the basis. It also supplies free pro-p groups. Layer 3 supplies d(G)=dim_Fp G/Φ(G) and Gaschütz lifting of generating tuples. Layer 5 supplies H²(F,F_p)=0 for free pro-p F and the normal-generation criterion through R/Rᵖ[R,F]; for a rank-n presentation of a finite p-group H, its dimension is r(H)+n−d(H), with r(H)=dim_Fp H²(H,F_p). Layer 8 supplies P₀(G)=G and P_{i+1}(G)=closure(P_i(G)^p[P_i(G),G]), the p-class, and the central-tower quotient comparisons. These contracts are independent of Γ.

ProfiniteCohomology Layer 5 supplies the exact sequence

```text
0 → H¹(G/N,F_p) → H¹(G,F_p) → H¹(N,F_p)^G
  → H²(G/N,F_p) → H²(G,F_p),
```

natural for automorphisms of the pair (G,N). Its naturality supplies the Γ-action used here. The supplied signatures include `TauCeti.ContCohomology.fiveTerm_exact_H1N` and `TauCeti.ContCohomology.fiveTerm_exact_H2Q`.

### From admissibility and arithmetic statistics

InverseGaloisAndArithmeticFundamentalGroups IG.4 supplies the preceding admissibility predicate, and Property E in this precise generality: for a full isomorphism-closed category K of Γ-groups, H belongs to K and every Γ-surjection H→G lifts to a Γ-surjection H→G̃ along every nonsplit central extension C_p→G̃→G in K with trivial Γ-action on C_p. Nonsplitting is as groups; a Γ-splitting is equivalent in the coprime setting used here. Categories here include all pro-|Γ|′ groups, pro-p groups and groups of level C.

The coprime-complement contract separates existence from conjugacy. Conjugacy is available when Γ is solvable, when the normal group is solvable, and for abelian kernels by averaging. General Γ-conjugacy is assumed only through (SZΓ), defined in Layer 0. The unrestricted finite statement can be obtained using Feit–Thompson; this roadmap does not supply that theorem or treat it as a library result. Every theorem using the unrestricted statement retains (SZΓ), so the model has no dependence on an unstated odd-order theorem.

ArithmeticStatistics ST.5 supplies its abelian measures and moments, the abelian complement-conjugacy lemma, and the function-field moment theorem with the iterated limsup/liminf and coprimality conditions displayed in Layer 6. This roadmap proves the comparison with its nonabelian probability measure.

### From arithmetic duality and class field theory

ArithmeticGaloisDuality R02.3 supplies the equivariant injection H²(G̃,F_p)→(V/K^{×p})^∨, where G̃ is the maximal everywhere-unramified pro-p Galois group and V={a∈K×:(a)=b^p for a fractional ideal b}. It supplies the complete-curve function-field analogue. For a totally real Γ-extension K/ℚ with p∤|Γ| and μ_p⊄K it also supplies an F_p[Γ]-injection O_K×/O_K×p→F_p[Γ]/(Σ_γγ). These are the exact inputs used in [LWZB], Lemma 3.17, pp. 17–19, attributed there to Koch, Theorem 11.3, and Neukirch–Schmidt–Wingberg, Corollary 8.7.3. The contracts, including equivariance, are required; neither is inferred from a dimension inequality without operators.

ClassFieldTheory Layer 12 identifies the maximal unramified abelian extension split at infinite places with Cl(O_K), naturally under field automorphisms. FunctionFieldArithmetic FA.4 identifies the split-above-∞ abelian group with the finite affine class group of the integral closure of F_q[t]. For the complete curve C_K the pro-p abelian group is the p-adic completion of Pic(C_K)(F_q), including the ℤ_p degree component. Its units are the finite constant units. These complete-curve and affine statements have different roles in Layer 6. FA.4 also supplies smallness: only finitely many everywhere-unramified extensions of a fixed bounded degree over a global function field with finite constants, with the same conclusion after imposing split infinity.

## How to read the build

Layer 0 fixes the Γ-action and Y-relations. Layer 1 constructs level completions and the free admissible Γ-group. Layer 2 turns the quotient construction into a random variable on a space of groups. Layer 3 derives finite-level probabilities from operator-group generation and extension counts. Layer 4 proves tightness, countable additivity and weak convergence, then computes arbitrary-level values. Layer 5 gives moments and the abelian and p-group specializations. Layer 6 states the arithmetic conjecture and proves the consistency and comparison theorems supplied by the preceding layers.

## Layer 0: Γ-actions, Y and coprime sections

### 0.1 Γ-groups and their equivariant maps

Let Γ be a finite group. A Γ-group is a profinite group G (a compact, Hausdorff, totally disconnected topological group) with an action of Γ on G by continuous group automorphisms; as Γ is finite and discrete, the action map Γ × G → G is then continuous. A morphism of Γ-groups is a continuous Γ-equivariant homomorphism; Hom_Γ(G, H), Sur_Γ(G, H) and Aut_Γ(G) denote the morphisms, the surjective morphisms and the automorphisms. A Γ-subgroup is a closed Γ-stable subgroup; a Γ-quotient is the target of a surjective morphism. For S ⊆ G, [S]_G is the smallest closed normal Γ-subgroup of G containing S, and G is Γ-generated by S when the closed subgroup generated by {γ(s) : γ ∈ Γ, s ∈ S} is G. G is an irreducible Γ-group when it is non-trivial and its only closed normal Γ-subgroups are 1 and G (for an action that contains the inner automorphisms, every Γ-stable subgroup is normal and the condition reads: no proper non-trivial Γ-subgroups). For finite H, h_Γ(H) = |Hom_Γ(H, H)|. G^Γ is the closed subgroup of Γ-fixed points and H ⋊ Γ the semidirect product for the action. The same vocabulary is used for an arbitrary group F acting on a finite group (an F-group), as in Liu–Wood §2.2.

Assume Γ is a finite group; groups acted on are profinite (finite groups carry the discrete topology).

Model a Γ-group as a profinite group with Mathlib's MulDistribMulAction Γ G and continuity of each γ (ContinuousConstSMul); continuity of the joint action follows because Γ is finite and discrete.

Model morphisms as continuous elements of Mathlib's MulDistribMulActionHom G →*[Γ] H; Sur_Γ and Aut_Γ are the surjective and invertible ones.

Define [S]_G as the topological closure of the normal closure of the Γ-orbit of S; it is Γ-stable because Γ acts by continuous automorphisms that preserve normal closures and closures.

The semidirect product H ⋊ Γ is Mathlib's SemidirectProduct for the homomorphism Γ → MulAut H given by the action.

- `GammaGroup.Hom`: Hom_Γ(G, H): the continuous elements of Mathlib's MulDistribMulActionHom G →*[Γ] H, closed under composition and containing the identity.
- `GammaGroup.Hom.comp_assoc`: Composition of morphisms is associative and unital, so Γ-groups form a category.
- `GammaGroup.countSur`: For finite G and H, |Sur_Γ(G, H)| as a natural number: the cardinality of the surjective elements of G →*[Γ] H.
- `GammaGroup.isClosed_fixedPoints`: G^Γ = FixedPoints.subgroup Γ G is a closed subgroup of G.
- `GammaGroup.closedNormalClosure`: [S]_G, the topological closure of the normal closure of ⋃_γ γ(S).
- `GammaGroup.closedNormalClosure_le_iff`: [S]_G ≤ N iff S ⊆ N, for every closed normal Γ-subgroup N of G.
- `GammaGroup.map_closedNormalClosure`: For a morphism φ, φ([S]_G) ⊆ [φ(S)]_H, with equality when φ is surjective (compactness makes the image of a closure closed).
- `GammaGroup.homEquivSemidirect`: Hom_Γ(G, H) is in bijection with the continuous homomorphisms G ⋊ Γ → H ⋊ Γ that commute with the projections to Γ and restrict to the identity on Γ.
- `GammaGroup.hEnd`: h_Γ(H) = |Hom_Γ(H, H)|; for an abelian irreducible H the ring End_Γ(H) is a finite field, so h_Γ(H) is a power of the prime p with pH = 0.

**Checks.**

- For Γ = Z/2 acting on Z/3 by inversion: G^Γ = 1, h_Γ(Z/3) = 3 and |Sur_Γ(Z/3, Z/3)| = 2.
- For Γ = 1, Hom_Γ is the set of continuous homomorphisms and [S]_G is the closed normal subgroup generated by S.
- For Γ = Z/2 swapping the factors of (Z/3)² and S = {(1, 0)}, [S] is all of (Z/3)², while the closed normal subgroup generated by S alone is Z/3 × 0.
- For a finite discrete group G, G is pro-n′ iff Nat.Coprime (Nat.card G) n.

For Γ = 1 the notions are those of profinite groups and their continuous homomorphisms. Γ-equivariant homomorphisms G → H correspond to homomorphisms G ⋊ Γ → H ⋊ Γ over Γ that are the identity on Γ.

([LWZB] §1.7, p. 9; [LW20] §2.2, p. 4.) *Needs:* `MulDistribMulAction`; `MulDistribMulActionHom`; `FixedPoints.subgroup`; `SemidirectProduct`; `OpenNormalSubgroup`; `Subgroup.topologicalClosure`; `ProfiniteGrp`; `TauCeti.profiniteOrder`; ProfiniteProPGroups (the supplier contract above).

### 0.2 The map Y

Fix a tuple (γ_1, …, γ_d) of generators of Γ. For a Γ-group G define Y : G → G^d by Y(g) = (g⁻¹γ_1(g), …, g⁻¹γ_d(g)), write Y(G) for its image, and for S ⊆ G write [Y(S)] for the closed normal Γ-subgroup generated by the coordinates of the Y(s), s ∈ S. Y is continuous, Y(1) = 1, Y(gh) = h⁻¹Y(g)h · Y(h) coordinatewise, and Y(g) = Y(h) iff hg⁻¹ ∈ G^Γ; hence the fibres of Y are the right cosets G^Γ g, the partition of G into fibres does not depend on the generating tuple, and for finite G, |G| = |G^Γ| · |Y(G)| (LWZB Lemma 3.5). Morphisms commute with Y. Using all elements of Γ as the tuple, Y(g) is the principal crossed homomorphism σ ↦ g⁻¹σ(g).

Assume (γ_1, …, γ_d) generates Γ; G is a Γ-group.

h⁻¹γ(h) = g⁻¹γ(g) is equivalent to γ(hg⁻¹) = hg⁻¹; quantifying over the generators gives hg⁻¹ ∈ G^Γ, because a generating tuple fixes an element iff Γ does.

The fibre through g is therefore the right coset G^Γ g, which gives |G| = |G^Γ||Y(G)| for finite G (LWZB Lemma 3.5).

Twisted multiplicativity: (gh)⁻¹γ(gh) = h⁻¹(g⁻¹γ(g))h · h⁻¹γ(h).

Naturality: φ(g)⁻¹γ(φ(g)) = φ(g⁻¹γ(g)) for a Γ-equivariant homomorphism φ.

- `yMap`: yMap Γ G g = fun γ ↦ g⁻¹ * (γ • g), the version indexed by all of Γ; the d-tuple version is its restriction to the chosen generators.
- `yMap_apply`: yMap Γ G g γ = g⁻¹ * (γ • g).
- `yMap_one`: yMap Γ G 1 = 1.
- `yMap_mul`: yMap Γ G (g * h) γ = h⁻¹ * yMap Γ G g γ * h * yMap Γ G h γ.
- `yMap_eq_yMap_iff`: yMap Γ G g = yMap Γ G h ↔ h * g⁻¹ ∈ FixedPoints.subgroup Γ G.
- `yMap_eq_one_iff`: yMap Γ G g = 1 ↔ g ∈ FixedPoints.subgroup Γ G.
- `yMap_map`: For a Γ-equivariant homomorphism φ, yMap Γ H (φ g) = φ ∘ yMap Γ G g.
- `card_eq_card_fixedPoints_mul_card_range_yMap`: For finite G, Nat.card G = Nat.card (FixedPoints.subgroup Γ G) * Nat.card (Set.range (yMap Γ G)).
- `continuous_yMap`: yMap Γ G is continuous for the product topology on Γ → G.

**Checks.**

- Γ = Z/2 acting on Z/3 by inversion: Y(g) = −2g, Y(Z/3) = Z/3, so |Y(Z/3)| = 3 = [Z/3 : 1].
- If Γ acts trivially then Y(G) = {1}, so |Y(G)| = 1 (the case Z/p with trivial action in Proposition 3.13).
- Γ = Z/2 acting on Z/4 by inversion: G^Γ = {0, 2} and Y(Z/4) = {0, 2}, so 4 = 2 · 2 as Lemma 3.5 requires.
- Y is not a homomorphism: for Γ = Z/2 acting on S_3 by conjugation by (12), the transposition g = (23) has Y(g²) = 1 while Y(g)² ≠ 1, Y(g) being a 3-cycle; Y(S_3) = A_3 has 3 = [S_3 : C(12)] elements.

The fibre partition is the same for every generating tuple (the criterion hg⁻¹ ∈ G^Γ does not mention the tuple), which is the content of LWZB Lemma 3.9's independence statement at the level of sets.

([LWZB] (3.3) and Lemma 3.5, pp. 13–14; [LWZB] §3.2, p. 15.) *Needs:* §0.1 Γ-groups and their equivariant maps; `FixedPoints.subgroup`.

### 0.3 The coprime conjugacy hypothesis (SZ)

For a finite group Γ, (SZ_Γ) is the proposition: for every finite group N of order prime to |Γ| with an action of Γ by automorphisms, every crossed homomorphism c : Γ → N (c(στ) = c(σ)·σ(c(τ))) is principal, c(σ) = g⁻¹σ(g) for some g ∈ N; equivalently the non-abelian H¹(Γ, N) is a point; equivalently all complements of N in N ⋊ Γ are N-conjugate. (SZ_Γ) holds when Γ is solvable, and for each abelian N without hypothesis on Γ; for all Γ it is equivalent, given Schur–Zassenhaus existence, to the conjugacy half of the Schur–Zassenhaus theorem, whose proof in general uses the Feit–Thompson theorem. A profinite version follows by compactness: if (SZ_Γ) holds then for every |Γ|′-Γ-group N every continuous crossed homomorphism Γ → N is principal.

Assume Γ finite; N finite (respectively pro-|Γ|′ for the profinite form) with gcd(|N|, |Γ|) = 1.

Crossed homomorphisms c correspond to sections σ ↦ (c(σ), σ) of N ⋊ Γ → Γ, principal ones to the N-conjugates of the trivial section; this gives the equivalence of the three formulations.

Abelian N: average a crossed homomorphism over Γ, using that multiplication by |Γ| is invertible on N; equivalently import ArithmeticStatistics ST.5. Mathlib's internal Subgroup.exists_smul_eq concerns quotient-difference transitivity, not this public complement statement.

For solvable Γ use the solvable-quotient case of finite Schur–Zassenhaus conjugacy (induction over the solvable complement). Ribes–Zalesskii, Theorem 2.3.15, pp. 40–41, states the profinite conclusion and reduces it to finite Schur–Zassenhaus; its unrestricted finite input is kept separate from the elementary solvable case.

General Γ: one of |N|, |Γ| is odd, hence the corresponding group is solvable by Feit–Thompson, and the solvable cases apply. Unconditional conjugacy for arbitrary Γ therefore requires a separate Feit–Thompson input. Every use here instead retains (SZΓ).

Profinite form: the sets of g ∈ N/U trivializing c mod U are non-empty finite and compatible over the open normal Γ-stable U, so their inverse limit is non-empty (as in IG.4’s coprime-complement contract).

- `CoprimeH1Trivial`: The proposition (SZ_Γ), stated with crossed homomorphisms Γ → N for every finite N of order prime to |Γ| with a MulDistribMulAction of Γ.
- `coprimeH1Trivial_iff_conj`: (SZ_Γ) holds iff, for every such N, every complement of N in N ⋊ Γ is N-conjugate to Γ.
- `coprimeH1Trivial_of_isSolvable`: If Γ is solvable then (SZ_Γ) holds.
- `crossedHom_principal_of_commGroup`: For abelian N of order prime to |Γ|, every crossed homomorphism Γ → N is principal, with no hypothesis on Γ.
- `CoprimeH1Trivial.profinite`: Under (SZ_Γ), every continuous crossed homomorphism Γ → N into a |Γ|′-Γ-group N is principal.
- `CoprimeH1Trivial.card_sections`: Under (SZ_Γ), for finite |Γ|′ H the sections of H ⋊ Γ → Γ form one H-orbit with stabilizer H^Γ, so there are [H : H^Γ] of them.

**Checks.**

- (SZ_Γ) holds for Γ = Z/2 (solvable); for N = Z/3 with inversion every a ∈ Z/3 is the value c(σ) of a crossed homomorphism (c(σ²) = a + σ(a) = 0), and c(σ) = −2g = g⁻¹σ(g) for g = a, since −2 ≡ 1 mod 3.
- For Γ = 1 the proposition holds trivially: the only crossed homomorphism is constant 1.
- Without coprimality the statement fails: Γ = Z/2 acting trivially on N = Z/2 has the crossed homomorphism id, which is not principal because g⁻¹σ(g) = 1.
- For abelian N, averaging agrees with ArithmeticStatistics ST.5 applied to N ⋊ Γ.

(SZ_Γ) holds for Γ = Z/2, Z/4, (Z/2)², D_8 and S_3, which covers every Γ in the test cases of Layer 5. Dropping coprimality breaks it: Γ = Z/2 acting trivially on N = Z/2 has the non-principal crossed homomorphism id : Γ → N.

([LWZB] §2, p. 10, and the proof of Lemma 3.6, p. 14; [LWZB] Remark after Definition 3.15, p. 17; [RZ10] Theorem 2.3.15 and proof, pp. 40–41.) *Needs:* §0.1 Γ-groups and their equivariant maps; `Subgroup.exists_right_complement'_of_coprime`; `Group.IsSolvable`; ArithmeticStatistics ST.5; IG.4 (the supplier contract above).

### 0.4 Sections of G ⋊ Γ and the fibres of Y

Assume (SZ_Γ). (a) For a |Γ|′-Γ-group G, sending g to the g-conjugate of the trivial section induces a bijection between Y(G) and the continuous sections of G ⋊ Γ → Γ; the sections form one G-conjugacy class with stabilizer G^Γ. (b) (Lemma 3.4) For a closed Γ-subgroup E of a |Γ|′-Γ-group G, Y(E) = Y(G) ∩ E^d. (c) (Lemma 3.6) For an exact sequence 1 → N → G → H → 1 of finite |Γ|′-Γ-groups: 1 → N^Γ → G^Γ → H^Γ → 1 is exact; |Y(N)| = |Y(G)|/|Y(H)|; and |Y(G) ∩ π⁻¹(x)| = |Y(G)|/|Y(H)| for every x ∈ Y(H), where π also denotes G^d → H^d.

Assume (SZ_Γ) (§0.3), or the special case it covers (Γ solvable, or all groups involved abelian); E, N, G and H are pro-|Γ|′ (finite in (c)).

(a) Conjugating the trivial section by (g, 1) gives γ_i ↦ (g⁻¹γ_i(g), γ_i); two such agree on the generators iff they agree everywhere, so the induced map from Y(G) is injective; surjectivity is (SZ_Γ) in its profinite form.

(b) A section with image in E ⋊ Γ is a section of E ⋊ Γ → Γ, and conversely; apply (a) to E and to G.

(c) The long exact sequence of pointed sets 1 → N^Γ → G^Γ → H^Γ → H¹(Γ, N) has H¹(Γ, N) = 1 by (SZ_Γ), giving exactness; with §0.2 (|X| = |X^Γ||Y(X)|) this gives |Y(N)| = |Y(G)|/|Y(H)|.

For the fibre count, fix g over h with Y(h) = x; z ↦ (g, …, g)·z·(γ_1(g)⁻¹, …, γ_d(g)⁻¹) preserves Y(G) and carries π⁻¹(x) onto N^d, so each fibre has |Y(G) ∩ N^d| = |Y(N)| elements by (b).

Γ = Z/2, 1 → Z/3 → Z/3 × Z/3 → Z/3 → 1 with inversion on both factors: |Y| = 9, 3, 3 and every fibre has 3 elements. Γ = Z/2 acting on Z/4 by inversion is not |Γ|′: there |Y(Z/4)| = 2 while Hom_Γ(𝓕_1, Z/4) has one element, so the hypothesis cannot be dropped.

([LWZB] Paragraph after (3.3), Lemma 3.4, Lemma 3.6, pp. 13–14; [LWZB] Proof of Lemma 3.6(3), p. 14.) *Needs:* §0.2 The map Y; §0.3 The coprime conjugacy hypothesis; IG.4 (the supplier contract above); `SemidirectProduct`.

### 0.5 Admissible Γ-groups: closure properties and the abelian criterion

Call a Γ-group admissible when it is pro-|Γ|′ and topologically generated by {g⁻¹γ(g) : g ∈ G, γ ∈ Γ} (the definition of IG.4’s admissibility and Galois-action contract). Then: (a) Γ-quotients and finite products of admissible Γ-groups are admissible; (b) (Lemma 3.9) an admissible G is Γ-generated by the coordinates of Y(G) for any generating tuple of Γ; (c) (Lemma 3.12) if G̃ is admissible and N a closed normal Γ-subgroup on which Γ acts trivially, then N is central in G̃; (d) (rigidity) if E is admissible and D a closed Γ-subgroup with Y(D) = Y(E), then D = E; (e) (§7.1) a finite abelian |Γ|′-Γ-group H is admissible iff H^Γ = 1; (f) the Γ-coinvariants G/[g⁻¹γ(g)] of an admissible G are trivial, and an admissible Γ-group has no non-trivial Γ-quotient with trivial Γ-action.

Assume Γ finite; for (e) the hypothesis (SZ_Γ) is not needed because H is abelian.

(a) A surjection carries the generators g⁻¹γ(g) onto generators of the same form; for products use the coordinates.

(b) Expand g⁻¹σ(g) for σ = σ_1⋯σ_s a word in the generators as the product of σ_1⋯σ_{k−1}(g⁻¹σ_k(g)), each factor a Γ-translate of a coordinate of Y(g).

(c) For n ∈ N: (g⁻¹γ(g)) n (g⁻¹γ(g))⁻¹ = g⁻¹γ(g n g⁻¹)g = n because Γ fixes g n g⁻¹ ∈ N; the generators of G̃ centralize N, hence G̃ does.

(d) By (b), E is generated by the Γ-translates of the coordinates of Y(E) = Y(D) ⊆ D^d, and D is a Γ-subgroup.

(e) As |H| is prime to |Γ|, e = |Γ|⁻¹Σ_γ γ is an idempotent endomorphism of H with image H^Γ, and x − e(x) = |Γ|⁻¹Σ_γ (x − γx) lies in the subgroup S generated by the (γ − 1)h, while e kills S. Hence H = H^Γ ⊕ S, so H = S (admissible) iff H^Γ = 0. This is the additive form of the argument of §7.1, which uses Lemma 3.6(1).

(f) The coinvariant quotient has trivial Γ-action, so all g⁻¹γ(g) lie in the kernel, which is therefore everything.

Γ = Z/2: Z/3 with inversion is admissible, Z/3 with trivial action is not (its Y-image is trivial). Γ = Z/3 acting on (Z/2)² through multiplication by a primitive cube root of unity in F_4 is admissible (no non-zero fixed vector). Z/4 with inversion is not admissible for Γ = Z/2: it is not pro-odd.

([LWZB] Lemma 3.9 and Lemma 3.12, pp. 14–15; [LWZB] §7.1, p. 34, first paragraph; [LWZB] Proof of Theorem 4.12, p. 25.) *Needs:* IG.4 (the supplier contract above); §0.2 The map Y; §0.4 Sections of G ⋊ Γ and the fibres of Y; §0.1 Γ-groups and their equivariant maps.

### Examples

For Γ=C₂ acting by inversion on C₃, a crossed homomorphism is determined by any a∈C₃, and a=−2a expresses it as a principal crossed homomorphism. There are three sections of C₃⋊C₂→C₂, two Γ-equivariant automorphisms of C₃ and three endomorphisms. The fixed subgroup is trivial. On C₄ the same action has two fixed points and two Y-values; the coprime exactness assertions do not apply.

### Dependencies

Mathlib's action, semidirect-product, subgroup-closure and finite-group APIs; Tau Ceti's supernatural order; admissibility and abelian complement conjugacy from IG.4 and ST.5. The nonabelian section results use (SZΓ).

## Layer 1: Level completions and free admissible groups

### 1.1 Level-𝒞 closure and the pro-𝒞 completion of a Γ-group

For a set 𝒞 of (isomorphism classes of) finite Γ-groups let 𝒞̄ be the smallest set of isomorphism classes of finite Γ-groups containing 𝒞 and closed under finite direct products, Γ-subgroups and Γ-quotients. For a Γ-group G, its pro-𝒞 completion is G^𝒞 = lim_M G/M over the closed normal Γ-subgroups M of G with G/M ∈ 𝒞̄ (LWZB (3.11)), with the canonical surjection η : G → G^𝒞; G is of level 𝒞 when η is an isomorphism. For ℓ ≥ 1, 𝒞_ℓ is the set of |Γ|′-Γ-groups of order at most ℓ. The construction is a functor from Γ-groups to Γ-groups of level 𝒞, left adjoint to the inclusion: every morphism from G to a Γ-group of level 𝒞 factors uniquely through η. It preserves surjections; ker η is the intersection of the M above; (G^𝒞)^𝒟 = G^𝒟 when 𝒟̄ ⊆ 𝒞̄; a finite Γ-group lies in 𝒞̄ iff it is of level 𝒞. 𝒞̄ need not be closed under extensions, so for most 𝒞 (groups of bounded order, groups of bounded p-class) this is not the pro-C completion of an extension-closed class.

Assume 𝒞 a set of finite Γ-groups; G a Γ-group.

The family of M with G/M ∈ 𝒞̄ is closed under finite intersections, because G/(M ∩ M′) embeds Γ-equivariantly in G/M × G/M′ and 𝒞̄ is closed under products and Γ-subgroups; so the inverse limit is over a directed system of finite Γ-quotients.

The limit of the finite discrete quotients is profinite with the induced Γ-action; η is surjective by compactness (an inverse limit of surjections of compact Hausdorff groups).

Universal property: a morphism f : G → L with L of level 𝒞 has, for each M_L with L/M_L ∈ 𝒞̄, preimage M = f⁻¹(M_L) with G/M ↪ L/M_L, hence G/M ∈ 𝒞̄; the compatible maps G/M → L/M_L assemble to G^𝒞 → L^𝒞 = L.

Surjections are preserved: for f : F → H surjective, the image of F^𝒞 → H^𝒞 is closed and dense (LWZB, the standard argument after (3.11)).

For 𝒞 the class of all finite p-Γ-groups (p ∤ |Γ|) the completion is the maximal pro-p quotient TauCeti.maximalProPQuotient with its induced action, because that class is closed under extensions as well.

For a finite 𝒞 and a Γ-group G topologically Γ-generated by d elements, G is topologically generated as an ordinary group by at most d|Γ| elements. The group of word functions in that many variables on the finitely many underlying groups in 𝒞 embeds in the finite product of their evaluations on all tuples. Every group in 𝒞̄ satisfies these word identities, so every such generated finite quotient of G is a quotient of that finite word-function group. Their orders are uniformly bounded; the directed finite quotients stabilize, hence G^𝒞 is finite. This avoids assuming maps to arbitrary quotients lift to members of 𝒞.

- `levelClosure`: 𝒞̄ as a predicate on finite Γ-groups up to isomorphism: the least predicate containing 𝒞 and closed under finite products, Γ-subgroups and Γ-quotients.
- `levelCompletion`: G^𝒞 together with the canonical continuous surjective Γ-homomorphism η_G : G → G^𝒞.
- `levelCompletion.lift`: For f : G → L with L of level 𝒞, the unique morphism f̄ : G^𝒞 → L with f̄ ∘ η_G = f.
- `levelCompletion.lift_unique`: Two morphisms G^𝒞 → L agreeing after η_G are equal.
- `levelCompletion.map`: A morphism f : G → G′ induces f^𝒞 : G^𝒞 → G′^𝒞 with map_id and map_comp.
- `levelCompletion.map_surjective`: If f is surjective so is f^𝒞.
- `levelCompletion.ker_eta`: ker η_G is the intersection of the closed normal Γ-subgroups M with G/M ∈ 𝒞̄.
- `IsOfLevel`: G is of level 𝒞 iff η_G is an isomorphism; for finite G iff G ∈ 𝒞̄.
- `levelCompletion.completion_of_le`: (G^𝒞)^𝒟 ≅ G^𝒟 when 𝒟̄ ⊆ 𝒞̄.
- `levelCompletion.finite_of_finite_class`: If 𝒞 is finite and G is topologically Γ-generated by finitely many elements, G^𝒞 is finite: the finite group of word functions on 𝒞 bounds every finite generated quotient of level 𝒞.
- `levelCompletion.eq_maximalProPQuotient`: For 𝒞 the finite p-Γ-groups, G^𝒞 is TauCeti.maximalProPQuotient p G with the induced action.

**Checks.**

- Γ = 1, 𝒞 = {Z/2}: 𝒞̄ is the elementary abelian 2-groups and the completion of the free profinite group on two generators is (Z/2)².
- 𝒞 = ∅ or 𝒞 = {1}: 𝒞̄ = {1} and G^𝒞 = 1 for every G.
- Γ = 1, 𝒞 = {Z/2}: Z/4 is not of level 𝒞 (Z/4 ∉ 𝒞̄) and (Z/4)^𝒞 = Z/2, so this is not the completion with respect to an extension-closed class.
- For 𝒞 the finite 3-Γ-groups and G = Ẑ_odd with σ = −1 (Γ = Z/2), G^𝒞 = Z_3 with σ = −1, the maximal pro-3 quotient.

Every Γ-group of level 𝒞 is pro-𝒞̄ and every finite member of 𝒞̄ is of level 𝒞. For 𝒞 ⊆ 𝒞_ℓ, U_{𝒞,H} is a union of the sets U_{𝒞_ℓ,H′} (used in Layer 2).

([LWZB] §3.2, (3.11), p. 15; [LW20] §2.4, p. 5; [LWZB] §5.2, p. 27, and §7.2.2, p. 36.) *Needs:* §0.1 Γ-groups and their equivariant maps; ProfiniteProPGroups (the supplier contract above); `TauCeti.maximalProPQuotient`; `ProfiniteGrp`.

### 1.2 The free pro-|Γ|′ Γ-group F_n(Γ)

For n ≥ 0, F_n(Γ) is the free pro-|Γ|′ group on the finite set {x_{i,γ} : 1 ≤ i ≤ n, γ ∈ Γ} (the free pro-C group for the extension-closed class C of finite groups of order prime to |Γ|), with σ ∈ Γ acting by the automorphism induced by the permutation x_{i,γ} ↦ x_{i,σγ} of the basis. Put x_i = x_{i,1}. Universal property: for every |Γ|′-Γ-group G and g_1, …, g_n ∈ G there is a unique morphism of Γ-groups F_n(Γ) → G with x_i ↦ g_i (then x_{i,γ} ↦ γ(g_i)). Its abelianization is (Ẑ′[Γ])^n with Ẑ′ = ∏_{p∤|Γ|} Z_p.

Assume n ≥ 0; Γ finite.

Take the free pro-C group of ProfiniteProPGroups Layer 4 for C the finite groups of order prime to |Γ|, a class closed under subgroups, quotients and extensions.

Functoriality of the free object in its basis gives an action of the symmetric group of {1..n} × Γ, which restricts to Γ acting on the second coordinate by left multiplication.

The equivariant universal property is the plain universal property applied to x_{i,γ} ↦ γ(g_i), whose equivariance is checked on the basis.

The abelianization is the free pro-|Γ|′ abelian group on the basis, i.e. (Ẑ′)^{n|Γ|} = Ẑ′[Γ]^n as a Γ-module.

- `freeGammaGroup`: F_n(Γ) as a Γ-group, with generators of i γ = x_{i,γ}.
- `freeGammaGroup.smul_of`: σ • of i γ = of i (σ * γ).
- `freeGammaGroup.lift`: For a |Γ|′-Γ-group G and g : Fin n → G, the unique morphism with of i 1 ↦ g i.
- `freeGammaGroup.lift_of`: lift g (of i γ) = γ • g i.
- `freeGammaGroup.hom_ext`: Two morphisms out of F_n(Γ) agreeing on the x_i are equal.
- `freeGammaGroup.abelianization`: F_n(Γ)^ab ≅ Ẑ′[Γ]^n as Γ-modules.

**Checks.**

- F_0(Γ) is the trivial group.
- For Γ = 1, F_n(1) is the free profinite group on n generators of ProfiniteProPGroups Layer 4.
- For finite |Γ|′-Γ-groups G, |Hom_Γ(F_n(Γ), G)| = |G|^n; for Γ = Z/2, G = Z/3 with inversion and n = 2 this is 9.
- F_n(Γ) is not admissible for n ≥ 1, Γ ≠ 1: its abelianization Ẑ′[Γ]^n has invariants (Ẑ′)^n ≠ 0, so F_n(Γ) is not admissible: an admissible Γ-group has abelianization without non-zero invariants (the averaging argument of §0.5 (e)).

F_0(Γ) is trivial; for Γ = 1, F_n(1) is the free profinite group on n generators.

([LWZB] §3.1, p. 13; [LWZB] Proof of Corollary 3.10, p. 15.) *Needs:* ProfiniteProPGroups (the supplier contract above); §0.1 Γ-groups and their equivariant maps.

### 1.3 The free admissible Γ-group 𝓕_n

𝓕_n = 𝓕_n(Γ) is the closed Γ-subgroup of F_n(Γ) generated by the elements x_i⁻¹γ_j(x_i) (1 ≤ i ≤ n, 1 ≤ j ≤ d). Under (SZ_Γ): (Lemma 3.1) 𝓕_n is admissible, and there is a surjective morphism of Γ-groups π : F_n(Γ) → 𝓕_n with π ∘ ι = id, where ι is the inclusion and π(x_i) = y_i for elements y_i ∈ 𝓕_n with Y(y_i) = Y(x_i); (Remark 3.2) as a pro-|Γ|′ group 𝓕_n is free on {x_i⁻¹σ(x_i) : 1 ≤ i ≤ n, σ ∈ Γ ∖ 1}, it is Γ-generated by n elements, and every pro-|Γ|′ Γ-group generated by elements h_i⁻¹γ(h_i) (1 ≤ i ≤ n, γ ∈ Γ) is a Γ-quotient of 𝓕_n. 𝓕_n does not depend on the generating tuple (Lemma 3.9).

Assume (SZ_Γ) for the retraction and for admissibility; n ≥ 1.

The x_i⁻¹γ(x_i) for all γ lie in 𝓕_n (§0.5(b) expansion), so 𝓕_n contains every x_i⁻¹σ(x_i).

Freeness (Remark 3.2(1)): after the change of basis x_{i,σ} ↦ x_i⁻¹x_{i,σ} (σ ≠ 1) of F_n, the elements x_i⁻¹σ(x_i) are part of a basis, and the closed subgroup they generate is Γ-stable because σ(x_i⁻¹τ(x_i)) = (x_i⁻¹σ(x_i))⁻¹(x_i⁻¹στ(x_i)).

Lemma 3.1: by §0.4(b) with G = F_n and E = 𝓕_n, Y(x_i) ∈ Y(F_n) ∩ 𝓕_n^d = Y(𝓕_n), so y_i exists; comparing coordinates shows that 𝓕_n is generated by the y_i⁻¹γ(y_i), i.e. admissible; π is the morphism x_i ↦ y_i, and π ∘ ι = id because both fix the generators x_i⁻¹γ_j(x_i) = y_i⁻¹γ_j(y_i).

Remark 3.2(3): x_i ↦ h_i defines F_n → H, whose restriction to 𝓕_n is onto because H is generated by the h_i⁻¹γ(h_i).

- `freeAdmissible`: 𝓕_n as a closed Γ-subgroup of F_n(Γ), with its Γ-group structure.
- `freeAdmissible.isAdmissible`: Under (SZ_Γ), 𝓕_n is admissible.
- `freeAdmissible.retraction`: The Γ-quotient map π : F_n(Γ) → 𝓕_n with π ∘ ι = id.
- `freeAdmissible.yMap_retraction`: Y(π(x_i)) = Y(x_i).
- `freeAdmissible.isFree`: As a pro-|Γ|′ group, 𝓕_n is free on {x_i⁻¹σ(x_i) : σ ≠ 1}, of rank n(|Γ| − 1).
- `freeAdmissible.surjects`: A pro-|Γ|′ Γ-group generated by the h_i⁻¹γ(h_i) (i ≤ n) is a Γ-quotient of 𝓕_n via x_i ↦ h_i.
- `freeAdmissible.indep_generators`: Two generating tuples of Γ give the same closed subgroup 𝓕_n of F_n(Γ).

**Checks.**

- Γ = Z/2: 𝓕_1 ≅ Ẑ_odd with σ acting by −1; its maximal pro-3 quotient is Z_3 with σ = −1.
- The abelianization of 𝓕_n has Ẑ′-rank n(|Γ| − 1), matching Remark 3.2(1) and Corollary 3.10.
- For Γ = 1, 𝓕_n is trivial (generated by x_i⁻¹x_i = 1).
- For Γ = Z/2 and n = 1, F_1 has abelianization of Z_3-rank 2 at p = 3 while 𝓕_1 has rank 1, so x_1 ∉ 𝓕_1.

For Γ = Z/2 = ⟨σ⟩, 𝓕_1 is procyclic on y = x⁻¹σ(x) with σ(y) = y⁻¹, so 𝓕_1 ≅ Ẑ_odd with σ = −1. 𝓕_n is never F_n for Γ ≠ 1 and n ≥ 1: x_1 ∉ 𝓕_n.

([LWZB] §3.1, Lemma 3.1, Remark 3.2, p. 13, and proof of Lemma 3.1, p. 14.) *Needs:* §1.2 The free pro-|Γ|′ Γ-group F_n(Γ); §0.4 Sections of G ⋊ Γ and the fibres of Y; §0.5 Admissible Γ-groups: closure properties and the abelian criterion; §0.3 The coprime conjugacy hypothesis.

### 1.4 Homomorphisms out of 𝓕_n

Assume (SZ_Γ). (a) (Corollary 3.8) For every pro-|Γ|′ Γ-group G, the map Y(G)^n → Hom_Γ(𝓕_n, G) sending (Y(g_1), …, Y(g_n)) to the restriction to 𝓕_n of the morphism F_n → G with x_i ↦ g_i is well defined and bijective. (b) Consequently |Hom_Γ(𝓕_n, H)| = [H : H^Γ]^n for finite |Γ|′-Γ-groups H, and for finite admissible H, |Sur_Γ(𝓕_n, H)|·[H : H^Γ]^{−n} ≤ 1 and → 1 as n → ∞ (LWZB (4.18)). (c) For a set 𝒞 of finite |Γ|′-Γ-groups and finite H of level 𝒞, morphisms (𝓕_n)^𝒞 → H correspond to morphisms 𝓕_n → H, hence to Y(H)^n. (d) (Corollary 3.10) 𝓕_n^ab ≅ (Ẑ′[Γ]/(Σ_{g∈Γ} g))^n as Γ-modules, with Ẑ′ = ∏_{p∤|Γ|} Z_p, and (𝓕_n^ab)^Γ = 0. (e) For finite 𝒞, (𝓕_n)^𝒞 is finite.

Assume (SZ_Γ); G pro-|Γ|′ in (a) — the statement fails for Γ = Z/2 acting on Z/4 by inversion.

(a) Injectivity: two maps x_i ↦ g_i, g_i′ agree on 𝓕_n iff they agree on the generators x_i⁻¹γ_j(x_i), i.e. iff Y(g_i) = Y(g_i′). Surjectivity: extend a morphism 𝓕_n → G along the retraction π of §1.3.

(b) §0.2 gives |Y(H)| = [H : H^Γ]; non-surjective morphisms land in proper Γ-subgroups H′, each with |Y(H′)| < |Y(H)| by §0.5(d), so their number is at most Σ_{H′} |Y(H′)|^n = o(|Y(H)|^n).

(c) Universal property of the level-𝒞 completion (§1.1).

(d) The inclusion 𝓕_n → F_n and retraction F_n → 𝓕_n induce maps on profinite abelianizations whose composite is the identity. Thus 𝓕_n^ab embeds as a direct summand of F_n^ab = Ẑ′[Γ]^n. Its image, generated by the differences γ(x_i) − x_i, is the augmentation ideal I^n. Averaging with |Γ|⁻¹Σg gives Ẑ′[Γ] = I ⊕ Ẑ′·Σg, I ≅ Ẑ′[Γ]/(Σg), and I^Γ = 0.

(e) Apply the finite-word-function argument of §1.1 to the finitely Γ-generated group 𝓕_n. The special retraction argument of LWZB p. 17 also works here, but is not used for arbitrary G.

Γ = Z/2, H = Z/3 with inversion: |Hom_Γ(𝓕_n, Z/3)| = 3^n and |Sur_Γ(𝓕_n, Z/3)| = 3^n − 1. Γ = Z/2, G = Z/4 with inversion: |Y(Z/4)| = 2 but Hom_Γ(𝓕_1, Z/4) = {1} since 𝓕_1 is pro-odd, so (a) needs G pro-|Γ|′.

([LWZB] Corollary 3.8, Lemma 3.9 and Corollary 3.10, pp. 14–15; [LWZB] Paragraph before Definition 3.15, pp. 16–17; [LWZB] (4.18) in the proof of Theorem 4.12, p. 25.) *Needs:* §1.3 The free admissible Γ-group 𝓕_n; §1.1 Level-𝒞 closure and the pro-𝒞 completion of a Γ-group; §0.2 The map Y; §0.5 Admissible Γ-groups: closure properties and the abelian criterion.

### 1.5 Property E relative to a level: restriction and completion

Property E is taken in the general form of LWZB Definition 2.3: for a full subcategory 𝒦 of Γ-groups, H ∈ 𝒦 has Property E for 𝒦 if every Γ-surjection H → G lifts to a Γ-surjection H → G̃ along every non-split central extension 1 → Z/p → G̃ → G → 1 in 𝒦 with trivial Γ-action on Z/p (IG.4’s Property E contract, with the general-category contract specified above). For a set 𝒞 of finite |Γ|′-Γ-groups, 'Property E at level 𝒞' means Property E for the Γ-groups of level 𝒞. Then: (a) if 𝒦′ ⊆ 𝒦 are full subcategories and H ∈ 𝒦′ has Property E for 𝒦, it has Property E for 𝒦′; (b) if a Γ-group X has Property E for a full subcategory containing all Γ-groups of level 𝒞 and X itself, then X^𝒞 has Property E at level 𝒞; (c) for p ∤ |Γ| and X with Property E for the pro-p Γ-groups, X^𝒞 has Property E at level 𝒞 for every set 𝒞 of finite p-Γ-groups; (d) for finite H it suffices to test extensions G̃ of finite Γ-groups G that are Γ-quotients of H, and every lift H → G̃ of a surjection whose composite with G̃ → G is onto is itself onto (a weak lift is proper).

Assume the full subcategories are closed under isomorphism; extensions tested inside the subcategory.

(a) Fewer extensions are tested in 𝒦′.

(b) Given a Γ-surjection X^𝒞 → G and a non-split central G̃ → G of level 𝒞, compose with η : X → X^𝒞, lift to X → G̃ by Property E of X, and factor through X^𝒞 because G̃ is of level 𝒞 (§1.1).

(c) The level-𝒞 groups for a set of p-Γ-groups are pro-p, so (b) applies with the pro-p subcategory.

(d) A lift H → G̃ whose image maps onto G either is onto or has image meeting Z/p trivially, which would split the extension over G.

Γ = Z/2, p = 3, H = F_3² with σ = −1 lacks Property E at the level of 3-Γ-groups of 3-class ≤ 2: the Heisenberg group of order 27 with σ acting by −1 on generators (hence trivially on the centre) is a non-split central extension, and |H| = 9 < 27. Γ = Z/3, H = (Z/2)² with a nontrivial Z/3-action is admissible but lacks Property E for any level containing Q_8 with its compatible Z/3-action, since |H| = 4 < 8.

([LWZB] Definition 2.3 and (2.4), p. 11; [LWZB] §3.2, p. 15, first example; [LWZB] Proof of Proposition 3.22, p. 19.) *Needs:* IG.4 (the supplier contract above); §1.1 Level-𝒞 closure and the pro-𝒞 completion of a Γ-group; §0.1 Γ-groups and their equivariant maps.

### 1.6 Property E as the shape of the relations

Assume (SZ_Γ). Let n ≥ 1, 𝒞 a set of finite |Γ|′-Γ-groups and φ : (𝓕_n)^𝒞 → H a Γ-surjection. Then ker φ = [Y(ker φ)] (the closed normal Γ-subgroup of (𝓕_n)^𝒞 generated by the coordinates of Y(ker φ)) iff H has Property E at level 𝒞. In particular, for every S ⊆ 𝓕_n the group (𝓕_n)^𝒞/[Y(S)] — and so every (X_{u,n})^𝒞 of Layer 2 — has Property E at level 𝒞.

Assume (SZ_Γ); 𝒞 consists of |Γ|′-groups so that §0.4 applies to the kernels.

(⇒) Let θ : H → G be a Γ-surjection with a non-split central extension G̃ → G of level 𝒞, and ϖ = θ ∘ φ. Choose g̃_i ∈ G̃ over ϖ(π(x_i)); non-splitness makes G̃ Γ-generated by the g̃_i⁻¹γ_j(g̃_i), giving a surjection ρ : (𝓕_n)^𝒞 → G̃ over ϖ.

From 1 → ker ρ → ker ϖ → Z/p → 1 with |Y(Z/p)| = 1 (trivial action) and Lemma 3.4: Y(ker φ) ⊆ Y((𝓕_n)^𝒞) ∩ (ker ϖ)^d = Y(ker ϖ) = Y(ker ρ) ⊆ (ker ρ)^d; so ρ factors through (𝓕_n)^𝒞/[Y(ker φ)] = H. The closed-subgroup form of Lemma 3.4 applies even when these kernels are infinite.

(⇐) If [Y(ker φ)] ⊊ ker φ, put M = ker φ/[Y(ker φ)] and E = (𝓕_n)^𝒞/[Y(ker φ)]. Γ acts trivially on M, E is admissible, so E centralizes M (§0.5(c)).

A maximal proper subgroup D of M gives 1 → N → H̃ → H → 1 with N = M/D simple, central, hence Z/p with trivial action; it is split only if H̃ = N × H, contradicting admissibility of H̃, and non-split contradicts Property E of H.

For Γ = Z/3 and H = (Z/2)² with nontrivial action, the kernel of any surjection (𝓕_1)^𝒞 → H, 𝒞 ∋ Q_8, is not generated by Y-relations, matching the failure of Property E. For abelian 𝒞 and admissible H, every Γ-quotient has Property E at level 𝒞. Indeed an abelian pro-|Γ|′ extension E with trivial Γ-action on its kernel decomposes by averaging as E^Γ ⊕ I_Γ E; if the quotient G has G^Γ = 0, I_Γ E maps isomorphically to G and gives a Γ-section. Non-split abelian extensions exist (Z/9 → Z/3), but do not meet these kernel-action conditions.

([LWZB] Lemma 3.12 and Proposition 3.13 with proof, pp. 15–16.) *Needs:* §1.5 Property E relative to a level: restriction and completion; §1.4 Homomorphisms out of 𝓕_n; §0.4 Sections of G ⋊ Γ and the fibres of Y; §0.5 Admissible Γ-groups: closure properties and the abelian criterion; IG.4 (the supplier contract above).

### Examples

Take Γ=C₂ and C={C₃ with inversion}. Then C̄ consists of elementary abelian 3-groups with scalar inversion, and 𝓕_n^C=F₃^n. Its Γ-surjections to C₃ number 3^n−1. Taking the class generated by C₂ with Γ=1 gives exponent-two completion, whereas maximal pro-2 completion also detects C₄. These computations distinguish product/subquotient closure from extension closure.

### Dependencies

Layer 0; ProfiniteProPGroups Layers 0 and 4 for inverse limits and free groups. Property E is supplied by IG.4 and applied to the categories specified here. No finite-only section lemma is applied directly to an infinite group.

## Layer 2: The space of groups and random quotients

### 2.1 The space 𝒫 of admissible Γ-groups

𝒫 = 𝒫_Γ is the set of isomorphism classes of admissible |Γ|′-Γ-groups X such that X^𝒞 is finite for every finite set 𝒞 of finite |Γ|′-Γ-groups. For such 𝒞 and a finite |Γ|′-Γ-group H, the basic open set is U_{𝒞,H} = {X ∈ 𝒫 : X^𝒞 ≅ H}; 𝒫 carries the topology generated by these sets, its Borel σ-algebra, the algebra 𝒜 of sets generated by the basic opens, and, for an arbitrary set 𝒞, the sets V_{𝒞,H} = {X : X^𝒞 ≅ H}. Facts: U_{𝒞,H} = ∅ unless H is of level 𝒞; for each ℓ, the sets U_{𝒞_ℓ,H} (H of level 𝒞_ℓ) are pairwise disjoint and cover 𝒫, and each U_{𝒞,H} with 𝒞 ⊆ 𝒞_ℓ is a union of them; the level-tower map X ↦ ([X^{𝒞_ℓ}])_{ℓ≥1} is injective, so 𝒫 is a set and its topology is the subspace topology from a countable product of countable discrete sets — in particular second countable and Hausdorff, every open set is a countable disjoint union of basic opens, and V_{𝒞,H} = ⋂_i U_{𝒟_i,H} for any exhaustion 𝒟_1 ⊆ 𝒟_2 ⊆ ⋯ of 𝒞 by finite sets with H of level 𝒟_i.

Assume Γ finite; isomorphism classes of finite Γ-groups of bounded order form a finite set.

Each X ∈ 𝒫 is the inverse limit of its completions X^{𝒞_ℓ}, since every open normal subgroup contains an open normal Γ-stable one (intersect the finitely many Γ-translates) and so every finite Γ-quotient of X has level 𝒞_ℓ for some ℓ.

Injectivity of the tower map: if X^{𝒞_ℓ} ≅ X′^{𝒞_ℓ} for all ℓ, the sets of isomorphisms at level ℓ are finite, non-empty and form an inverse system under the completion maps (§1.1), so a compatible system of isomorphisms exists and X ≅ X′.

For 𝒞 ⊆ 𝒞_ℓ, X^𝒞 = (X^{𝒞_ℓ})^𝒞, so U_{𝒞,H} is the union of U_{𝒞_ℓ,H′} over the level-𝒞_ℓ classes H′ with H′^𝒞 ≅ H; the level-ℓ sets are disjoint because X^{𝒞_ℓ} has one class.

Countability: there are countably many pairs (𝒞, H) up to isomorphism; an open set is the union of the level sets it contains, and choosing, along the nested sequence of level partitions, the first cylinders contained in the open set gives a countable disjoint union. A single finite level is not required for an arbitrary open set.

- `GammaGroupSpace`: 𝒫 as a type, realized as the image of the level-tower map in ∏_ℓ (finite Γ-groups of level 𝒞_ℓ up to isomorphism).
- `GammaGroupSpace.basicOpen`: U_{𝒞,H} for a finite set 𝒞 and a finite Γ-group H.
- `GammaGroupSpace.isOpen_basicOpen`: Each U_{𝒞,H} is open and closed.
- `GammaGroupSpace.basicOpen_eq_empty`: U_{𝒞,H} = ∅ unless H is of level 𝒞.
- `GammaGroupSpace.levelPartition`: For each ℓ the sets U_{𝒞_ℓ,H} over level-𝒞_ℓ classes H partition 𝒫.
- `GammaGroupSpace.basicOpen_eq_iUnion`: For 𝒞 ⊆ 𝒞_ℓ, U_{𝒞,H} = ⋃_{H′ : H′^𝒞 ≅ H} U_{𝒞_ℓ,H′}.
- `GammaGroupSpace.tower_injective`: Two points of 𝒫 with isomorphic completions at every level 𝒞_ℓ are equal.
- `GammaGroupSpace.secondCountable`: 𝒫 is second countable and Hausdorff; its Borel σ-algebra is generated by the basic opens.
- `GammaGroupSpace.isOpen_eq_iUnion_basicOpen`: Every open set is a countable disjoint union of basic opens.
- `GammaGroupSpace.vSet`: V_{𝒞,H} for arbitrary 𝒞, equal to ⋂_i U_{𝒟_i,H} for an exhaustion by finite sets.

**Checks.**

- For Γ = 1, 𝒫 has exactly one point.
- For any Γ, V_{all,1} = {[1]} and U_{{1},1} = 𝒫.
- U_{𝒞,H} = ∅ when H is not of level 𝒞: for Γ = Z/2, 𝒞 = {Z/3 with σ = −1} and H = Z/9 with σ = −1 no X has X^𝒞 ≅ H, every level-𝒞 group being elementary abelian of exponent 3.
- For Γ = Z/2 and 𝒞 the abelian 3-Γ-groups, the non-empty V_{𝒞,H} with H finite are indexed by the finite abelian 3-groups with σ = −1, the index set of ArithmeticStatistics ST.5; their union is the set of X with finite abelian 3-completion.

For Γ = 1 an admissible group is generated by elements g⁻¹g = 1, so 𝒫 is a single point. The trivial class lies in U_{𝒞_ℓ,1} for every ℓ and {[1]} = ⋂_ℓ U_{𝒞_ℓ,1} = V_{all,1}.

([LWZB] §3.2, p. 16; [LWZB] §5.3, p. 30, and §5.4, p. 31; [LW20] §1, p. 1, and §3, p. 5.) *Needs:* §1.1 Level-𝒞 closure and the pro-𝒞 completion of a Γ-group; §0.5 Admissible Γ-groups: closure properties and the abelian criterion; `MeasureTheory.Measure.map`; `MeasureTheory.ProbabilityMeasure`.

### 2.2 Random Γ-groups X_{u,n} and their laws μ_{u,n}

For n ≥ 1 and an integer u > −n, let S = (s_1, …, s_{n+u}) be distributed by the product of n + u copies of the Haar probability measure of the compact group 𝓕_n (TauCeti.haarProb), and put X_{u,n} = 𝓕_n/[Y(S)] (u = 1 by default: X_{Γ,n} = X_{1,n}). Its law μ_{u,n} is the Borel probability measure on 𝒫 with μ_{u,n}(A) = Prob([X_{u,n}] ∈ A). For finite 𝒞, (X_{u,n})^𝒞 ≅ (𝓕_n)^𝒞/[Y(S̄)] with S̄ the image of S in the finite group (𝓕_n)^𝒞, and the image of Haar measure is the uniform measure; so μ_{u,n}(U_{𝒞,H}) = Prob((𝓕_n)^𝒞/[Y(r_1, …, r_{n+u})] ≅ H) for independent uniform r_j ∈ (𝓕_n)^𝒞. Every (X_{u,n})^𝒞 has Property E at level 𝒞. Layer 3 proves the cylinder limits; Layer 4 constructs their probability-measure extension μ_u.

Assume (SZ_Γ) (through Layer 1); n ≥ 1, u > −n.

X_{u,n} is admissible (a Γ-quotient of 𝓕_n) and its level-𝒞 completions are quotients of the finite (𝓕_n)^𝒞, so [X_{u,n}] ∈ 𝒫.

Completion commutes with the quotient: (𝓕_n/[Y(S)])^𝒞 = (𝓕_n)^𝒞/[Y(S̄)] by the universal property, since a map to a level-𝒞 group killing Y(S) factors through (𝓕_n)^𝒞.

The pushforward of Haar probability along a continuous surjection onto a finite group is uniform (invariance plus uniqueness, TauCeti.haarProb_eq_uniformOn_univ and Mathlib's uniqueness of Haar probability measures).

Measurability: each event {X^𝒞 ≅ H} is a union of fibres of S ↦ S̄, hence clopen in 𝓕_n^{n+u}; the basic opens generate the Borel σ-algebra (§2.1), so S ↦ [X_{u,n}] is measurable.

Property E: §1.6 applied to (𝓕_n)^𝒞 → (𝓕_n)^𝒞/[Y(S̄)].

- `RandomGammaGroup.relations`: The random tuple S, with law the (n + u)-fold product of TauCeti.haarProb on 𝓕_n.
- `RandomGammaGroup.quotient`: X_{u,n} = 𝓕_n/[Y(S)] as a Γ-group-valued random variable, and its class in 𝒫.
- `RandomGammaGroup.law`: μ_{u,n} as a probability measure on 𝒫 (Mathlib's Measure.map along the class map).
- `RandomGammaGroup.measurable_class`: The class map 𝓕_n^{n+u} → 𝒫 is measurable.
- `RandomGammaGroup.completion_quotient`: (𝓕_n/[Y(S)])^𝒞 ≅ (𝓕_n)^𝒞/[Y(S̄)] for finite 𝒞.
- `RandomGammaGroup.law_basicOpen`: μ_{u,n}(U_{𝒞,H}) equals the probability for n + u independent uniform elements of (𝓕_n)^𝒞.
- `RandomGammaGroup.map_haarProb_uniform`: The image of TauCeti.haarProb under a continuous surjection onto a finite group is the uniform measure ProbabilityTheory.uniformOn univ.
- `RandomGammaGroup.propertyE_completion`: Almost surely, every (X_{u,n})^𝒞 has Property E at level 𝒞.

**Checks.**

- Γ = Z/2, n = 1, u = 0: X_{0,1} ≅ Ẑ_odd/rẐ_odd and μ_{0,1}(U_{𝒞,1}) = 2/3 for 𝒞 = {Z/3 with σ = −1}.
- u = 1 − n (one Y-relation tuple): μ_{1−n,n}-almost surely the quotient is 𝓕_n/[Y(s)], Γ-generated by n elements with one Y-relation tuple; for n = 1, Γ = Z/2 it is Ẑ_odd/sẐ_odd.
- Γ = Z/3, H = (Z/2)² with nontrivial action: μ_{u,n}(U_{𝒞,H}) = 0 for every 𝒞 containing Q_8 with its compatible Z/3-action, although H is an admissible quotient of 𝓕_1.
- For finite 𝒞, the image law of S̄ is the uniform measure on ((𝓕_n)^𝒞)^{n+u}.

Γ = Z/2, n = 1, u = 0: 𝓕_1 ≅ Ẑ_odd with σ = −1 and Y(r) = −2r, so X_{0,1} ≅ Ẑ_odd/rẐ_odd and Prob(the maximal pro-3 quotient of X_{0,1} is trivial) = Prob(r ∈ Z_3^×) = 2/3.

([LWZB] Definition 3.15 and (3.16), p. 17; [LW20] §4, p. 6.) *Needs:* §1.3 The free admissible Γ-group 𝓕_n; §1.4 Homomorphisms out of 𝓕_n; §1.6 Property E as the shape of the relations; §2.1 The space 𝒫 of admissible Γ-groups; `TauCeti.haarProb`; `TauCeti.haarProb_eq_uniformOn_univ`; `MeasureTheory.Measure.isHaarMeasure_eq_of_isProbabilityMeasure`; `MeasureTheory.Measure.map`.

### Examples

With Γ=C₂, n=1, u=0, the 3-primary completion of the free admissible group is additive ℤ₃ with inversion. A single Haar relation has Y(s)=−2s, and the quotient is trivial exactly when s is a unit, with probability 2/3. For u=0 and arbitrary n, completion at C={C₃ with inversion} gives the cokernel of an n×n uniform F₃ matrix.

### Dependencies

Layers 0–1; normalized Haar probability and uniform finite quotients; Mathlib's product measurable spaces, pushforwards and probability measures. The class-space topology is constructed here from its completion cylinders.

## Layer 3: Operator groups, extensions and finite-level probabilities

### 3.1 Products of irreducible F-groups

Let F be a group and G_1, …, G_k pairwise non-isomorphic finite irreducible F-groups, R = ∏ G_i^{m_i}. (a) (Liu–Wood Lemmas 5.3–5.5, Corollary 5.6) every normal F-subgroup of R is ∏ N_i with N_i a normal F-subgroup of G_i^{m_i}, and it is R iff each projection to G_i^{m_i} is onto. (b) (Lemma 5.8) for G non-abelian, a normal F-subgroup of G^m is G^m iff all m projections to G are non-trivial; for G abelian, iff its projection to the first m − 1 factors is onto and its projection to the last factor does not factor through that projection. (c) (Theorem 5.1) for N ≥ 1 independent uniform x_1, …, x_N ∈ R, Prob([x_1, …, x_N]_F = R) = ∏_{G_i abelian} ∏_{j=0}^{m_i−1}(1 − h_F(G_i)^j |G_i|^{−N}) ∏_{G_i non-abelian}(1 − |G_i|^{−N})^{m_i}. (d) (Theorem 7.1) |Sur_F(R, G_j)| = h_F(G_j)^{m_j} − 1 for G_j abelian and m_j·|Aut_F(G_j)| for G_j non-abelian. (e) (Lemma 5.11) for a finite group G, N ⊴ G and M the intersection of the maximal proper G-normal subgroups of N, N/M is, under conjugation, a product of irreducible G/M-groups, and its abelian factors are G/N-groups. (f) (Lemma 6.1) if (E, π) is an extension of a finite group H whose kernel G is a finite irreducible E-group, then G ≅ T^m for a finite simple group T and m ≤ |H|. (g) (Remark 5.2) for abelian irreducible G and m maximal such that G^m is F-generated by one element, h_F(G)^m = |G|.

Assume F an arbitrary group acting by automorphisms; the G_i finite.

(a) A normal F-subgroup projecting to 1 or G_i in each coordinate is isomorphic to the product of a subset of the factors (Liu–Wood Lemma 5.3, induction on the number of factors); F-maps between non-isomorphic irreducibles with normal image are trivial (Lemma 5.4), which separates the isotypic parts (Lemma 5.5).

(b) Induction on m: πm(ker π) is 1 or G; if it were 1 then π would be injective on N and πm would factor through π, impossible for non-abelian G by a conjugation argument (Liu–Wood Lemma 5.8).

(c) Independence across isotypic parts (Corollary 5.7); for G^m condition on the first k projections: a bad choice of the (k+1)-st coordinates is one given by an F-map G^k → G, and there are h_F(G)^k of them (Corollaries 5.9–5.10).

(d) Restrict surjections to the factors and use (a) and Lemma 5.4 (Liu–Wood Lemmas 7.2–7.3).

(e) The maximal proper G-normal subgroups M_i of N give an embedding N/M ↪ ∏ (N/M)/M_i onto each factor; apply (a). On an abelian factor conjugation by N is trivial.

(f) For T = Z/p, H acts irreducibly on F_p^m so m ≤ |H|; for T non-abelian the normal copies of T are the factors and H permutes them transitively.

(g) Apply (c) with N = 1: the probability is positive for m_i = m and zero for m + 1.

F = 1, G = Z/3: N ≥ m uniform vectors of F_3^m span with probability ∏_{j<m}(1 − 3^{j−N}); |Sur(F_3^m, Z/3)| = 3^m − 1. F = 1, G = A_5: |Sur(A_5^m, A_5)| = m·|Aut(A_5)| = 120m.

([LW20] Theorem 5.1, Lemmas 5.3–5.5, 5.8, Corollaries 5.6–5.10, Lemma 5.11, pp. 7–10; [LW20] Lemma 6.1, pp. 10–11, and Theorem 7.1 with Lemmas 7.2–7.3, pp. 14–15.) *Needs:* §0.1 Γ-groups and their equivariant maps.

### 3.2 The fundamental short exact sequence and the multiplicities m(𝒞, n, H, G)

Let n ≥ 1, 𝒞 a finite set of finite |Γ|′-Γ-groups, H a finite Γ-group of level 𝒞 and ϖ : (𝓕_n)^𝒞 → H a Γ-surjection with kernel N. Let M be the intersection of the maximal proper (𝓕_n)^𝒞-normal Γ-subgroups of N, F = (𝓕_n)^𝒞/M and R = N/M. The fundamental short exact sequence of (𝒞, n, ϖ) is 1 → R → F → H → 1 (LWZB (4.1)); it is induced by 1 → R → F ⋊ Γ → H ⋊ Γ → 1 (4.2), and R is a finite product of irreducible F ⋊ Γ-groups whose abelian factors are H ⋊ Γ-groups. 𝒜_H is the set of isomorphism classes of non-trivial finite abelian irreducible |Γ|′-(H ⋊ Γ)-groups — 'non-trivial' refers to the group, so Z/p with trivial action (p ∤ |Γ|) belongs to 𝒜_H, with |Y(Z/p)| = 1 — and 𝒩 the set of isomorphism classes of finite |Γ|′-Γ-groups isomorphic as groups to T^j with T non-abelian simple. For G ∈ 𝒜_H, m(𝒞, n, ϖ, G) is the multiplicity of G in R as an H ⋊ Γ-group; for G ∈ 𝒩 it is the sum of the multiplicities in R of the irreducible F ⋊ Γ-group structures on G compatible with its Γ-action. These numbers depend only on (𝒞, n, H, G) (§3.6) and are non-zero for finitely many G.

Assume 𝒞 finite, so (𝓕_n)^𝒞 is finite (§1.4 (e)).

Normal subgroups of (𝓕_n)^𝒞 ⋊ Γ contained in N are exactly the (𝓕_n)^𝒞-normal Γ-subgroups of N, so §3.1 (e) applies to N ⊴ (𝓕_n)^𝒞 ⋊ Γ and gives R as a product of irreducible F ⋊ Γ-groups.

Abelian factors: conjugation by R is trivial on them, so the F ⋊ Γ-action factors through H ⋊ Γ.

A subgroup of (𝓕_n)^𝒞 generated as a normal Γ-subgroup by elements of N equals N iff its image in F equals R, because a proper one would lie in a maximal proper (𝓕_n)^𝒞-normal Γ-subgroup of N (Liu–Wood §4, the argument before (4.2)).

Finiteness of the support: each irreducible factor is characteristically simple, hence a power of a simple group lying (as a group) in the subgroup-and-quotient closure of 𝒞 (Liu–Wood Corollary 6.12), with exponent at most |H ⋊ Γ| (§3.1(f)).

- `fundamentalSES`: The sequence 1 → R → F → H → 1 attached to (𝒞, n, ϖ), with R = N/M and F = (𝓕_n)^𝒞/M.
- `fundamentalSES.R_eq_prod`: R is isomorphic, as an F ⋊ Γ-group, to a finite product of irreducible F ⋊ Γ-groups.
- `fundamentalSES.abelian_factor_through`: On each abelian irreducible factor the F ⋊ Γ-action factors through H ⋊ Γ.
- `fundamentalSES.generates_iff`: A normal Γ-subgroup of (𝓕_n)^𝒞 contained in N equals N iff its image in F is R.
- `abelianIrreducibles`: 𝒜_H, including Z/p with trivial action for p ∤ |Γ|.
- `nonabelianSimplePowers`: 𝒩, the |Γ|′-Γ-groups isomorphic to T^j with T non-abelian simple.
- `multiplicity`: m(𝒞, n, ϖ, G) for G ∈ 𝒜_H ∪ 𝒩.
- `multiplicity_finiteSupport`: Only finitely many G ∈ 𝒜_H ∪ 𝒩 have m(𝒞, n, ϖ, G) ≠ 0.

**Checks.**

- Γ = Z/2, H = 1, 𝒞 = {Z/3 with σ = −1}: (𝓕_n)^𝒞 = F_3^n with σ = −1, M = 0, R = F = F_3^n and m(𝒞, n, 1, Z/3) = n.
- If ϖ is an isomorphism then N = R = 1 and every multiplicity is 0.
- Excluding Z/p with trivial action from 𝒜_H loses the factors that detect Property E: for Γ = Z/2, p = 3, 𝒞 the 3-Γ-groups of 3-class ≤ 2 and H = F_3² with σ = −1, R contains Z/3 with trivial action (the commutator of two σ-anti-invariant generators).
- For Γ = Z/2, p odd, H = (𝓕_n)_p^𝒞/[Y(S)] and 𝒞 a large finite set of p-Γ-groups, R is the p-multiplicator of §5.5.

For a sufficiently large finite set 𝒞 of p-Γ-groups (Γ = Z/2, p odd, H with Y-generated relation kernel), the fundamental sequence is the p-covering-group sequence (LWZB Lemma 7.2, Layer 5).

([LWZB] §4, (4.1)–(4.2), p. 20, and Remark 4.9, p. 23; [LW20] §4, (4.1), pp. 6–7.) *Needs:* §3.1 Products of irreducible F-groups; §1.1 Level-𝒞 closure and the pro-𝒞 completion of a Γ-group; §1.4 Homomorphisms out of 𝓕_n.

### 3.3 Generation by Y-relations

Assume (SZ_Γ). Let F be a Γ-group, G_1, …, G_k pairwise non-isomorphic finite irreducible F ⋊ Γ-groups (of order prime to |Γ|) and R = ∏ G_i^{m_i}. For integers n, u with n + u ≥ 1 and r_1, …, r_{n+u} independent uniform elements of R, Prob([Y(r_1), …, Y(r_{n+u})]_{F⋊Γ} = R) = ∏_{G_i abelian} ∏_{j=0}^{m_i−1}(1 − h_{F⋊Γ}(G_i)^j |Y(G_i)|^{−n−u}) · ∏_{G_i non-abelian}(1 − |Y(G_i)|^{−n−u})^{m_i}, where [·]_{F⋊Γ} is the normal F ⋊ Γ-subgroup generated by the coordinates. (Remark 4.4) For an abelian irreducible F ⋊ Γ-group G and m maximal such that G^m is F ⋊ Γ-generated by the coordinates of one Y(g), h_{F⋊Γ}(G)^m = |Y(G)|.

Assume (SZ_Γ) (for the count of maps in the abelian case, through Corollary 3.8); the G_i of order prime to |Γ|.

Normal F ⋊ Γ-subgroups of R split along the isotypic parts (§3.1 (a)), so the probability factors over the G_i^{m_i}.

Y(y) has all coordinates trivial iff y ∈ G^Γ, which for uniform y has probability |Y(G)|⁻¹ (§0.2).

Non-abelian G: by §3.1(b), G^m is generated iff each projection receives a nontrivial Y-coordinate, giving (1 − |Y(G)|^{−n−u})^m.

Abelian G: condition on the first m − 1 projections generating G^{m−1} as an F ⋊ Γ-group. A proper F ⋊ Γ-submodule of G^m projecting onto G^{m−1} is the graph of an F ⋊ Γ-homomorphism G^{m−1} → G. There are h_{F⋊Γ}(G)^{m−1} such maps, giving distinct bad last arrays of Y-coordinates because the first arrays generate. The last arrays are uniform on Y(G)^{n+u}, by the equal-fibre property of Y, so the conditional failure probability is h^{m−1}|Y(G)|^{−n−u}. Iterate in m. This counts operator-equivariant graphs, rather than treating Γ-equivariant free-group maps as F ⋊ Γ-equivariant maps.

Remark 4.4: apply the formula with n + u = 1 for m and m + 1.

Γ = Z/2, F = 1, R = (Z/3 with σ = −1)^m: the probability is ∏_{j<m}(1 − 3^{j−n−u}), the probability that n + u uniform vectors span F_3^m. A factor Z/p with trivial action has |Y(Z/p)| = 1 and contributes the factor 1 − 1 = 0 when m ≥ 1: trivial-action factors are never generated by Y-relations.

([LWZB] Proposition 4.3 with proof and Remark 4.4, p. 21.) *Needs:* §3.1 Products of irreducible F-groups; §0.2 The map Y; §1.4 Homomorphisms out of 𝓕_n.

### 3.4 H-extensions of Γ-groups and the Möbius function of sub-extensions

For a Γ-group H, an H-extension is a pair (E, π) of a Γ-group E and a Γ-surjection π : E → H; a morphism (E, π) → (E′, π′) is a Γ-homomorphism f with π′ ∘ f = π, and Sur_{Γ,H}, Aut_{Γ,H} are the surjective morphisms and automorphisms. (E, π) is admissible if E is. A sub-H-extension of (E, π) is a closed Γ-subgroup E′ ≤ E with π(E′) = H; for finite E these form a finite poset 𝓔^E_H under inclusion with top element E, and ν(D, E) is its Möbius function: ν(E, E) = 1 and ν(D, E) = −Σ_{D ⊊ D′ ⊆ E} ν(D′, E) for D ≠ E. For G ∈ 𝒜_H, 𝓔(G, H) is the set of isomorphism classes of admissible H-extensions with ker π ≅ G as H ⋊ Γ-groups (under conjugation); for G ∈ 𝒩, the admissible H-extensions with ker π ≅ G as Γ-groups and ker π an irreducible E ⋊ Γ-group. 𝓔_𝒞(G, H) ⊆ 𝓔(G, H) consists of those with E of level 𝒞; it is finite for arbitrary 𝒞 when G and H are fixed and finite.

Assume H a finite Γ-group; E finite for the poset and the Möbius function.

The Möbius function is Mathlib's IncidenceAlgebra.mu of the finite poset 𝓔^E_H, evaluated at (D, E).

Möbius inversion on 𝓔^E_H: if g(D) = Σ_{D′ ≤ D} f(D′) for every D, then f(E) = Σ_D ν(D, E) g(D).

For fixed finite G and H, every extension E has order |G||H|. There are finitely many group laws, Γ-actions and surjections to H on a set of that order, hence finitely many isomorphism classes in 𝓔_𝒞(G,H), independently of how 𝒞 is presented.

- `HExtension`: An H-extension (E, π) of Γ-groups.
- `HExtension.Hom`: Morphisms of H-extensions, with Sur_{Γ,H} and Aut_{Γ,H}.
- `HExtension.subExtensions`: The finite poset 𝓔^E_H of closed Γ-subgroups of E mapping onto H, ordered by inclusion.
- `HExtension.mobius`: ν(D, E) = IncidenceAlgebra.mu ℤ 𝓔^E_H D E.
- `HExtension.mobius_self`: ν(E, E) = 1.
- `HExtension.sum_mobius`: For D ≠ E, Σ_{D ≤ D′ ≤ E} ν(D′, E) = 0.
- `HExtension.mobius_inversion`: If g(D) = Σ_{D′ ≤ D} f(D′) for all D, then f(E) = Σ_D ν(D, E) g(D).
- `HExtension.extSet`: 𝓔(G, H) for G ∈ 𝒜_H ∪ 𝒩.
- `HExtension.extSetLevel`: 𝓔_𝒞(G, H), the members of level 𝒞.
- `HExtension.finite_extSetLevel`: 𝓔_𝒞(G, H) is finite for every 𝒞 at fixed finite G,H, and Aut_{Γ,H}(E, π) is finite for finite E.

**Checks.**

- For (H, id), 𝓔^H_H = {H} and ν(H, H) = 1.
- Γ = Z/2, H = 1, E = Z/3 with σ = −1: 𝓔^E_H = {0 < Z/3}, ν(Z/3, Z/3) = 1, ν(0, Z/3) = −1.
- Γ = Z/2, H = 1, E = F_3² with σ = −1: the strict-superextension recursion gives ν = −1 on each of the four lines and ν(0, E) = 3 (the Möbius function of the subspace lattice); summing over incomparable lines would make the recursion circular.
- ν agrees with Mathlib's IncidenceAlgebra.mu on 𝓔^E_H; for H=1 and E=F_p^k with a scalar Γ-action, so every subspace is Γ-stable, its value at (0,E) is (−1)^k p^{k(k−1)/2} at (0, E).

The extension sets are the index sets of the sums (4.10)–(4.11) defining λ.

([LWZB] §4.1, pp. 21–22, before Lemma 4.6 and before Proposition 4.7; [LW20] §2.3, p. 5.) *Needs:* §0.1 Γ-groups and their equivariant maps; §0.5 Admissible Γ-groups: closure properties and the abelian criterion; §1.1 Level-𝒞 closure and the pro-𝒞 completion of a Γ-group; `IncidenceAlgebra.mu`.

### 3.5 Counting surjections of H-extensions

Assume (SZ_Γ). Let n ≥ 1, 𝒞 a finite set of finite |Γ|′-Γ-groups, H a finite Γ-group of level 𝒞, ρ : (𝓕_n)^𝒞 → H an H-extension structure and (E, π) a finite H-extension. Then |Sur_{Γ,H}(ρ, π)| = Σ_{D ∈ 𝓔^E_H} ν(D, E) (|Y(D)|/|Y(H)|)^n if E is admissible of level 𝒞, and 0 otherwise.

Assume (SZ_Γ); all groups finite and pro-|Γ|′.

(𝓕_n)^𝒞 is admissible of level 𝒞, so its Γ-quotients are admissible of level 𝒞; this gives the vanishing case.

For a sub-H-extension D, morphisms (𝓕_n)^𝒞 → D over H correspond to elements of Y(D)^n lying over the element of Y(H)^n determined by ρ (§1.4 (a), (c)); by §0.4 (c) there are (|Y(D)|/|Y(H)|)^n of them.

Each such morphism is a surjection onto its image, a unique sub-H-extension D′ ≤ D: (|Y(D)|/|Y(H)|)^n = Σ_{D′ ≤ D} |Sur_{Γ,H}(ρ, D′)|.

Möbius inversion on 𝓔^E_H (§3.4).

Γ = Z/2, H = 1, E = Z/3 with σ = −1: |Sur_Γ((𝓕_n)^𝒞, Z/3)| = 3^n − 1 = ν(E, E)·3^n + ν(0, E)·1.

([LWZB] Lemma 4.6 with proof, p. 22.) *Needs:* §3.4 H-extensions of Γ-groups and the Möbius function of sub-extensions; §1.4 Homomorphisms out of 𝓕_n; §0.4 Sections of G ⋊ Γ and the fibres of Y.

### 3.6 Multiplicities through extensions

Assume (SZ_Γ). Let 1 → R → F → H → 1 be the fundamental sequence of (𝒞, n, ϖ) with H admissible. (1) For an irreducible abelian F ⋊ Γ-group G, |Sur_{F⋊Γ}(R, G)| = |Aut_{F⋊Γ}(G)| Σ_{(E,π)∈𝓔_𝒞(G,H)} Σ_{D∈𝓔^E_H} ν(D, E)(|Y(D)|/|Y(H)|)^n / |Aut_{Γ,H}(E, π)| when the F ⋊ Γ-action on G factors through H ⋊ Γ, and 0 otherwise. (2) For G ∈ 𝒩 with pairwise non-isomorphic compatible irreducible F ⋊ Γ-structures G_1, …, G_k, Σ_i |Sur_{F⋊Γ}(R, G_i)|/|Aut_{F⋊Γ}(G_i)| equals the same double sum over 𝓔_𝒞(G, H). (Corollary 4.8) Hence for G ∈ 𝒜_H, (h_{H⋊Γ}(G)^{m} − 1)/(h_{H⋊Γ}(G) − 1) = Σ_{(E,π)∈𝓔_𝒞(G,H)} Σ_D ν(D, E)(|Y(D)|/|Y(H)|)^n/|Aut_{Γ,H}(E, π)| with m = m(𝒞, n, ϖ, G), and for G ∈ 𝒩, m(𝒞, n, ϖ, G) equals that sum. (Remark 4.9) The multiplicities depend only on (𝒞, n, H, G).

Assume (SZ_Γ); 𝒞 finite; H admissible of level 𝒞.

|Sur_{F⋊Γ}(R, G)| is |Aut_{F⋊Γ}(G)| times the number of F ⋊ Γ-subgroups M of R with R/M ≅ G; for abelian R/M the action factors through H ⋊ Γ.

Sorting these M by the isomorphism class of the H-extension F/M → H, and using that every surjection of H-extensions from (𝓕_n)^𝒞 onto such an extension factors through F (Liu–Wood Proposition 8.7), the count is Σ_{(E,π)} |Sur_{Γ,H}((𝓕_n)^𝒞 → H, π)|/|Aut_{Γ,H}(E, π)|; then apply §3.5.

Non-abelian case: group together the H-extensions whose kernels have the same Γ-structure.

Corollary 4.8: write R = ∏ G_i^{m_i} and use §3.1 (d): |Sur_{F⋊Γ}(R, G_i)| = h^{m_i} − 1 (abelian), m_i|Aut_{F⋊Γ}(G_i)| (non-abelian).

Γ = Z/2, H = 1, 𝒞 = {Z/3 with σ = −1}: 𝓔_𝒞(Z/3, 1) has one element with |Aut_{Γ,1}| = 2, so (3^m − 1)/2 = (3^n − 1)/2 and m = n.

([LWZB] Proposition 4.7, Corollary 4.8 and Remark 4.9 with proofs, pp. 22–24; [LW20] Propositions 8.7 and 8.9, pp. 17–20.) *Needs:* §3.2 The fundamental short exact sequence and the multiplicities m(𝒞, n, H, G); §3.5 Counting surjections of H-extensions; §3.1 Products of irreducible F-groups; §3.4 H-extensions of Γ-groups and the Möbius function of sub-extensions.

### 3.7 The λ-invariants λ(𝒞, H, G)

For a set 𝒞 of finite |Γ|′-Γ-groups and finite admissible H of level 𝒞, define λ(𝒞,H,G) = (h_{H⋊Γ}(G) − 1) Σ_{(E,π)∈𝓔_𝒞(G,H)} |Aut_{Γ,H}(E,π)|⁻¹ for G ∈ 𝒜_H, and λ(𝒞,H,G) = Σ_{(E,π)∈𝓔_𝒞(G,H)} |Aut_{Γ,H}(E,π)|⁻¹ for G ∈ 𝒩 (LWZB (4.10)–(4.11)). For finite 𝒞 these have finite support. Under (SZ_Γ), writing h = h_{H⋊Γ}(G) and m = m(𝒞,n,H,G), the abelian asymptotic valid for every G is λ = lim_n (h^m − 1)|Y(G)|^{−n}; it can be written lim_n h^m|Y(G)|^{−n} only when |Y(G)| > 1. The non-abelian asymptotic is λ = lim_n m|Y(G)|^{−n}. Here multiplicities are considered for all sufficiently large n. Also λ > 0 iff 𝓔_𝒞(G,H) ≠ ∅, and λ > 0 with |Y(G)| > 1 implies m → ∞. λ is nondecreasing in 𝒞. For arbitrary 𝒞, λ is the increasing limit along any finite exhaustion (Definition 5.14), independent of the exhaustion, with finite nonnegative rational values. If H has Property E at level 𝒞, λ vanishes on trivial-action Z/p.

Assume H of level 𝒞; for (4.17), (SZ_Γ) and H admissible.

Finiteness of support: an irreducible kernel of an extension of level 𝒞 is a power of a simple group in the subgroup-and-quotient closure of 𝒞 (Liu–Wood Corollary 6.12) with exponent at most |H ⋊ Γ| (Liu–Wood Lemma 6.1).

Use §3.6 with h^m − 1, not h^m, on the abelian side. Among the sub-H-extensions D of an admissible E, only D = E has |Y(D)| = |Y(E)|; divide by |Y(G)|^n to get the leading extension count. Removing the subtracted 1 requires |Y(G)| > 1. When Y(G) = 1 every proper D would have smaller positive Y-cardinality and cannot occur: the unscaled identity h^m − 1 = λ remains, and m need not tend to infinity. The non-abelian argument has no added 1.

Monotonicity in 𝒞 follows because 𝓔_𝒞(G,H) grows with 𝒞. For fixed finite G,H, all E have order |G||H|, so only finitely many Γ-equivariant H-extension classes occur even when 𝒞 is infinite. Every class of level 𝒞 is already of level some finite subset of 𝒞. Thus the increasing sequence of weighted sums stabilizes, and its finite rational limit is independent of the exhaustion; finite support in G is asserted only for finite 𝒞.

Property E: a non-split central extension of H by Z/p of level 𝒞 admits no surjection from H (by order), so under Property E there is none, and split ones are not admissible; hence 𝓔_𝒞(Z/p, H) = ∅.

- `lambdaInv`: λ(𝒞, H, G) for finite 𝒞 and G ∈ 𝒜_H ∪ 𝒩, as a nonnegative rational.
- `lambdaInv_eq_tendsto`: For abelian G, λ = lim_n (h^m − 1)|Y(G)|^{−n}; when |Y(G)| > 1 also λ = lim_n h^m|Y(G)|^{−n}. For non-abelian G, λ = lim_n m|Y(G)|^{−n}.
- `lambdaInv_pos_iff`: λ(𝒞, H, G) > 0 iff 𝓔_𝒞(G, H) ≠ ∅.
- `lambdaInv_finiteSupport`: For finite 𝒞, λ(𝒞, H, G) = 0 for all but finitely many G.
- `lambdaInv_mono`: λ(𝒞, H, G) ≤ λ(𝒞′, H, G) when 𝒞 ⊆ 𝒞′.
- `lambdaInvInf`: For arbitrary 𝒞 and fixed finite H,G, λ is the finite nonnegative rational increasing limit along a finite exhaustion (Definition 5.14). The sequence stabilizes because the possible H-extensions with kernel G form a finite set; its limit is independent of the exhaustion.
- `lambdaInv_trivial_of_propertyE`: Under Property E at level 𝒞, λ(𝒞, H, Z/p) = 0 for trivial-action Z/p.

**Checks.**

- Γ = Z/2, H = 1, 𝒞 = {Z/3 with σ = −1}, G = Z/3 with σ = −1: one extension with |Aut| = 2 and h = 3, so λ = (3 − 1)/2 = 1.
- For 𝒞 the abelian |Γ|′-Γ-groups and H abelian with H^Γ = 1, λ(𝒞, H, G) = 1 for each G with trivial H-action and G^Γ = 1 (LWZB §7.1).
- Γ = Z/2, H = Z/3 with σ = −1, G = Z/3 with trivial H-action and σ = −1: at level 𝒞 = {Z/3^−} the only extension is F_3² → Z/3 with |Aut_{Γ,H}| = 6, so λ = 2/6 = 1/3; at the level of all abelian 3-Γ-groups Z/9 → Z/3 (|Aut_{Γ,H}| = 3) also occurs and λ = 2(1/6 + 1/3) = 1.
- Γ = Z/2, p odd, 𝒞 all finite p-Γ-groups, and H admitting a Y-presentation: for G = Z/p with trivial H-action and σ = −1, λ = p^{r(H)−d(H)} (LWZB Theorem 7.4). For σ = +1, λ = 0 by Property E; these two actions must not be interchanged.
- λ is not the limit of the multiplicities themselves: for H = 1 above m(𝒞, n, 1, G) = n → ∞ while λ = lim 3^n·3^{−n} = 1.
- For 𝒞 = {1} and H = 1 every 𝓔_𝒞(G, H) is empty and all λ vanish.
- For Γ = Z/2, H = F_3² with σ = −1 and the finite level in §3.9, trivial-action G = Z/3 has m = 1 and λ = 2. Thus (3^m − 1)|Y(G)|^{−n} = 2, while 3^m|Y(G)|^{−n} = 3; for the level {1}, m = λ = 0 but 3^m = 1.

The λ-invariants are the parameters of the limiting formulas (4.14), (5.13) and Theorem 5.15.

([LWZB] (4.10)–(4.11), p. 24, (4.17), p. 25, and Definition 5.14, p. 31; [LW20] §3.1, pp. 5–6, and Remark 8.13.) *Needs:* §3.4 H-extensions of Γ-groups and the Möbius function of sub-extensions; §3.6 Multiplicities through extensions; §3.2 The fundamental short exact sequence and the multiplicities m(𝒞, n, H, G); §3.1 Products of irreducible F-groups; §0.5 Admissible Γ-groups: closure properties and the abelian criterion; §0.3 The coprime conjugacy hypothesis; §1.5 Property E relative to a level: restriction and completion.

### 3.8 Limits of truncated products

Let a > 1, x_n → x in ℝ and y_n → ∞ (positive integers). Then f(x) = ∏_{i≥1}(1 − x a^{−i}) is continuous in x and lim_n ∏_{i=1}^{y_n}(1 − x_n a^{−i}) = ∏_{i≥1}(1 − x a^{−i}). Similarly (1 − c_n)^{m_n} → e^{−λ} when m_n c_n → λ and c_n → 0.

Assume a > 1 real.

Only finitely many factors can have |x_n a^{−i}| ≥ 1/2 for n large (x_n is bounded); treat them directly.

For the rest take logarithms: |log(1 − t) + t| ≤ t² for |t| ≤ 1/2, so the tails are dominated by a summable sequence C a^{−i} uniformly in n; apply Tannery's theorem (Mathlib's tendsto_tsum_of_dominated_convergence) and exponentiate.

The exponential limit is the standard (1 − c_n)^{m_n} = exp(m_n log(1 − c_n)).

With x_n = 1, a = 3, y_n = n this gives ∏_{i≤n}(1 − 3^{−i}) → ∏_{i≥1}(1 − 3^{−i}) ≈ 0.5601.

([LW20] Lemma 8.11, p. 20.) *Needs:* `tendsto_tsum_of_dominated_convergence`.

### 3.9 The finite-level distribution and its limit

Assume (SZ_Γ). Let 𝒞 be a finite set of finite |Γ|′-Γ-groups, H a finite admissible Γ-group of level 𝒞, n ≥ 1 and u > −n. If Sur_Γ(𝓕_n,H) is empty the probability is 0. Otherwise, with m = m(𝒞, n, H, G), Prob((X_{u,n})^𝒞 ≅ H) = |Sur_Γ(𝓕_n, H)| / (|Aut_Γ(H)| |Y(H)|^{n+u}) · ∏_{G∈𝒜_H} ∏_{k=0}^{m−1}(1 − h_{H⋊Γ}(G)^k |Y(G)|^{−n−u}) · ∏_{G∈𝒩}(1 − |Y(G)|^{−n−u})^m   (4.13). If H has Property E at level 𝒞, then as n → ∞ this tends to |Aut_Γ(H)|⁻¹|Y(H)|^{−u} ∏_{G∈𝒜_H} ∏_{i≥1}(1 − λ(𝒞, H, G) h_{H⋊Γ}(G)^{−i} |Y(G)|^{−u}) · ∏_{G∈𝒩} exp(−|Y(G)|^{−u} λ(𝒞, H, G))   (4.14), a product with finitely many nontrivial G-indexed blocks (each abelian block is an infinite product). If H lacks Property E at level 𝒞, the probability (4.13) is 0 for every n. The Property E hypothesis on the limiting product is essential, as the example below shows.

Assume (SZ_Γ); 𝒞 finite of |Γ|′-groups; H finite admissible of level 𝒞; n ≥ 1, u > −n.

(4.15): the probability is the sum over closed normal Γ-subgroups N of (𝓕_n)^𝒞 with quotient ≅ H of Prob([Y(r_1, …, r_{n+u})] = N), r_j uniform (§2.2).

(4.16): Prob(Y(r_j) ∈ N^d for all j) = |Y(H)|^{−n−u}, by §0.2 and §0.4.

Conditionally on that event, [Y(r)] = N iff the images of the Y(r_j) generate R in the fundamental sequence, and Y(r) mod M has the law of Y(r′) for uniform r′ ∈ R; apply §3.3 and Remark 4.9.

The number of N is |Sur_Γ(𝓕_n, H)|/|Aut_Γ(H)| (§1.4 (c)); this gives (4.13).

Limits: the union of the supports of m over all n is finite, by the chief-factor and simple-power bound in §3.7 (§3.2); by (4.17) of §3.7 and §3.8 each factor converges; |Sur_Γ(𝓕_n, H)||Y(H)|^{−n} → 1 (4.18).

Property E: then λ(𝒞, H, G) ≠ 0 forces |Y(G)| ≥ 2 (trivial-action Z/p has λ = 0), which is what the limit of the factor with h^m = 1 + λ·|Y(G)|^n requires. Without Property E some trivial-action Z/p occurs with m ≥ 1 for every n, its k = 0 factor is 1 − 1 = 0, and the probability vanishes, as §1.6 also shows.

Γ = Z/2, H = 1, 𝒞 = {Z/3 with σ = −1}: (4.13) = ∏_{k<n}(1 − 3^{k−n−u}) and (4.14) = ∏_{i>u}(1 − 3^{−i}), the Cohen–Lenstra probability of a trivial 3-part. Γ = Z/2, p = 3, 𝒞 = {Z/9 with inversion, the exponent-3 Heisenberg group of order 27 with σ(x) = x⁻¹ and σ(y) = y⁻¹}, H = F_3² with σ = −1: for n ≥ 2, m(sign) = n and λ(sign) = 1 from F_3³ and the four classes of Z/9 × Z/3 over H (|Aut_{Γ,H}| = 18 and 9); m(trivial) = 1 and λ(trivial) = 2 from the Heisenberg extension (|Aut_{Γ,H}| = 1). Thus the true probability is 0 for every n; the same formal product without the Property E restriction at u = 0 is (1/48)∏_{i≥1}(1 − 3^{−i})∏_{i≥1}(1 − 2·3^{−i}) ≈ 0.002698. Here h^m = 3 and h^m − 1 = λ = 2 for the trivial-action factor. The finite level meets Theorem 4.12's hypothesis; all groups of 3-class ≤ 2 form an infinite class.

([LWZB] Theorem 4.12 with proof, (4.13)–(4.18), pp. 24–25; [LW20] Theorem 8.1, (8.2)–(8.3), pp. 15–16.) *Needs:* §2.2 Random Γ-groups X_{u,n} and their laws μ_{u,n}; §3.2 The fundamental short exact sequence and the multiplicities m(𝒞, n, H, G); §3.3 Generation by Y-relations; §3.6 Multiplicities through extensions; §3.7 The λ-invariants λ(𝒞, H, G); §3.8 Limits of truncated products; §1.4 Homomorphisms out of 𝓕_n; §1.6 Property E as the shape of the relations; §0.4 Sections of G ⋊ Γ and the fibres of Y.

### Examples

For H=1 and C={C₃ with inversion}, the fundamental kernel is F₃^n, h=3, y=3 and λ=1. With n+u random Y-relations the exact probability of a trivial quotient is ∏_{j=0}^{n−1}(1−3^{j−n−u}); for u≥0 its limit is ∏_{i≥u+1}(1−3^{−i}). For u<0 and n+u≥1 the exact product contains a zero factor, as a matrix with fewer columns than rows cannot be surjective. The limit retains that zero.

### Dependencies

Layers 0–2; finite operator-group theory developed in this layer; Mathlib incidence algebra, finite counting and elementary analysis of products. All nonabelian Y-generation and section counts carry (SZΓ).

## Layer 4: Chief factors, no escape of mass and the limit measure

### 4.1 Chief factor pairs of finite groups

A chief series of a finite group G is a chain 1 = G_0 ◁ G_1 ◁ ⋯ ◁ G_r = G of normal subgroups of G with each G_{i+1}/G_i a minimal normal subgroup of G/G_i. For a minimal normal subgroup M of G, ρ_M : G → Aut(M) is conjugation. A chief factor pair is a pair (M, A) of finite groups with M an irreducible A-group and A acting faithfully (so A ≤ Aut(M)); (M, A) ≅ (M′, A′) if some isomorphism α : M → M′ carries A onto A′ under α_* : Aut(M) → Aut(M′). CF(G) is the set of isomorphism classes of the pairs (G_{i+1}/G_i, ρ_{G_{i+1}/G_i}(G/G_i)) of a chief series; it does not depend on the series (Liu–Wood Lemma 6.3, a Jordan–Hölder theorem for chief factor pairs). For a set T of finite groups, CF(T) = ∪_{G∈T} CF(G). Properties: CF(G × J) = CF(G) ∪ CF(J); CF(G/N) ⊆ CF(G); if T is closed under subgroups and quotients then CF(T̄) = CF(T) for its closure T̄ under products, subgroups and quotients (Lemma 6.11); a simple group in T̄ lies in the subgroup-and-quotient closure of T (Corollary 6.12); for finite T, CF(T̄) is finite and, if every member of T has order ≤ ℓ, A/Inn(M) has order ≤ ℓ − 1 for every (M, A) ∈ CF(T̄) (Corollary 6.13).

Assume G finite; chief factors are characteristically simple, so each is T^k for a simple group T.

Independence of the series: induction on |G|; if G_1 ≠ I_1 compare both series through G_1 × I_1, whose two orders of quotients give isomorphic chief factor pairs (Liu–Wood Lemma 6.3).

Products and quotients: concatenate chief series of G × 1 and 1 × J; refine a series through N for G/N.

Subgroups (Lemma 6.11): a chief series of J ≤ G passes through the G_i ∩ J, and the pairs between 1 and G_1 ∩ J arise from a subgroup J′ of a group G′ ∈ T realizing (G_1, ρ(G)); by induction CF(J) ⊆ CF(T).

Corollary 6.12: (T, Inn T) ∈ CF(T̄) for simple T ∈ T̄. Corollary 6.13: if (M, A) ∈ CF(G) with |G| ≤ ℓ then |M||A/Inn M| ≤ ℓ (abelian M) or |A| ≤ ℓ (non-abelian M), so |A/Inn M| ≤ ℓ/2.

- `IsMinimalNormal`: N is a minimal non-trivial normal subgroup of G.
- `ChiefSeries`: A chain of normal subgroups of a finite group whose successive quotients are minimal normal in the quotient.
- `ChiefSeries.exists`: Every finite group has a chief series; every normal subgroup lies on one.
- `ChiefFactorPair`: A pair (M, A) with A ≤ Aut(M) acting irreducibly, and its isomorphism relation.
- `chiefFactors`: CF(G), the finite set of isomorphism classes of chief factor pairs of a chief series.
- `chiefFactors_eq_of_chiefSeries`: Two chief series of G give the same multiset of chief factor pairs (Liu–Wood Lemma 6.3).
- `chiefFactors_prod`: CF(G × J) = CF(G) ∪ CF(J).
- `chiefFactors_quotient_subset`: CF(G/N) ⊆ CF(G).
- `chiefFactors_closure`: For T closed under subgroups and quotients, CF(T̄) = CF(T).
- `simple_mem_subquotientClosure`: A simple group in T̄ lies in the subgroup-and-quotient closure of T.
- `finite_chiefFactors_closure`: For finite T, CF(T̄) is finite, and |A/Inn M| ≤ ℓ − 1 when the orders in T are at most ℓ.

**Checks.**

- The whole C₃ is minimal normal, while its identity subgroup is not. The whole C₄ is not minimal normal because its order-two subgroup is proper and nontrivial.
- CF(S_3) = {(Z/3, Aut(Z/3) ≅ Z/2), (Z/2, 1)}.
- CF(1) = ∅.
- A_4 has chief series 1 ◁ V_4 ◁ A_4 with pairs (V_4, Z/3) and (Z/3, 1): a chief factor need not be simple (V_4 contributes two composition factors Z/2 but one chief factor pair).
- For a finite p-group P ≠ 1, CF(P) = {(Z/p, 1)} and every chief series has log_p|P| steps, the length of a composition series in Mathlib's sense.

Mathlib's CompositionSeries.jordan_holder concerns factors of a Jordan–Hölder lattice, not chief factors with their conjugation images in Aut(M). Independence of chief pairs is proved by the normal-subgroup induction in Liu–Wood Lemma 6.3; no reduction to that lattice theorem is assumed.

([LW20] §6, pp. 10–14: the definitions before Lemma 6.3, Lemma 6.3, Lemma 6.10, Lemma 6.11, Corollaries 6.12–6.13; [LWZB] §5.1, pp. 25–26.) *Needs:* `IsSimpleGroup`.

### 4.2 Γ-chief factor pairs

For a finite |Γ|′-Γ-group G, CF_Γ(G) is the set of (M, A) ∈ CF(G ⋊ Γ) with gcd(|M|, |Γ|) = 1 — the chief factor pairs of G ⋊ Γ coming from the normal subgroup G — and CF_Γ(𝒞) = ∪_{G∈𝒞} CF_Γ(G) for a set 𝒞 of finite |Γ|′-Γ-groups. (Lemma 5.2) If 𝒞 is closed under Γ-subgroups and Γ-quotients then CF_Γ(𝒞̄) = CF_Γ(𝒞). (Corollary 5.3) If every member of 𝒞 has order at most ℓ, then for each (M, A) ∈ CF_Γ(𝒞̄) the largest divisor of |A/Inn(M)| prime to |Γ| is less than ℓ, and CF_Γ(𝒞̄) is finite.

Assume (SZ_Γ), used in Lemma 5.2 to conjugate the images of Γ.

Γ-quotients and finite products create no new pairs, as for CF.

Γ-subgroups J ≤ G ∈ 𝒞: take a chief series of G ⋊ Γ through G and the induced series of J ⋊ Γ through the G_i ∩ J; the pairs between 1 and G_1 ∩ J are realized by a Γ′-subgroup of some G′ ∈ 𝒞, where Γ′ is a conjugate of Γ obtained from Schur–Zassenhaus conjugacy inside ρ^{−1}(α_*(A)); twisting the Γ-action on G′ by that conjugation keeps it in 𝒞 (LWZB Lemma 5.2).

Corollary 5.3: follow Liu–Wood Corollary 6.13 in G ⋊ Γ, discarding the factor of |Γ|.

- `gammaChiefFactors`: CF_Γ(G) ⊆ CF(G ⋊ Γ).
- `mem_gammaChiefFactors_iff`: (M, A) ∈ CF_Γ(G) iff it arises from a chief series of G ⋊ Γ passing through G, at a step below G.
- `gammaChiefFactors_closure`: CF_Γ(𝒞̄) = CF_Γ(𝒞) for 𝒞 closed under Γ-subgroups and Γ-quotients.
- `finite_gammaChiefFactors`: CF_Γ(𝒞̄) is finite when the orders in 𝒞 are bounded.
- `gammaChiefFactors_outer_lt`: The prime-to-|Γ| part of |A/Inn(M)| is less than ℓ.

**Checks.**

- Γ = Z/2, G = Z/3 with σ = −1: G ⋊ Γ = S_3 and CF_Γ(G) = {(Z/3, Z/2)}.
- CF_Γ(1) = ∅, although CF(1 ⋊ Γ) = CF(Γ) is non-empty for Γ ≠ 1.
- For Γ = 1, CF_Γ(G) = CF(G).
- For Γ = Z/2 and G = Z/3 with trivial action, CF(G × Γ) = {(Z/3, 1), (Z/2, 1)} but CF_Γ(G) = {(Z/3, 1)}: the factor of Γ is excluded.

For Γ = 1, CF_Γ(G) = CF(G).

([LWZB] Definition 5.1, Lemma 5.2 with proof, Corollary 5.3, pp. 26–27.) *Needs:* §4.1 Chief factor pairs of finite groups; §1.1 Level-𝒞 closure and the pro-𝒞 completion of a Γ-group; §0.3 The coprime conjugacy hypothesis.

### 4.3 Multiplicity bounds at level ℓ

Assume (SZ_Γ). Let ℓ>1 and H be a finite Γ-group of level 𝒞_ℓ and H̃ = H^{𝒞_{ℓ−1}}. If M is a product of isomorphic abelian simple groups, the number of G ∈ 𝒜_H with G ≅ M as groups and m(𝒞_ℓ, n, H, G) ≠ 0 for some n is at most Σ_{(M,A)∈CF_Γ(𝒞_ℓ)} |Sur(H̃ ⋊ Γ, A)|. If M is a product of isomorphic non-abelian simple groups, the number of isomorphism classes of level-𝒞_ℓ H-extensions (E, π) with ker π ≅ M an irreducible E ⋊ Γ-group is at most Σ_{(M,A)∈CF_Γ(𝒞_ℓ)} |Sur(H̃ ⋊ Γ, A/Inn(M))|. The operators include both E and Γ.

Assume (SZ_Γ); ℓ>1; 𝒞_ℓ the |Γ|′-Γ-groups of order ≤ ℓ.

An abelian factor G of R gives (G, ρ_G(F ⋊ Γ)) ∈ CF_Γ(𝒞_ℓ) and a surjection H ⋊ Γ → ρ_G(F ⋊ Γ); the map (G, φ) ↦ ((M, A), ρ) is injective (an equal image gives an H ⋊ Γ-isomorphism).

A non-abelian extension (E, π) maps to ((ker π, ρ(E ⋊ Γ)), the induced H ⋊ Γ → A/Inn(M)); E ⋊ Γ is the fibre product of H ⋊ Γ → A/Inn(M) ← A, so the map is injective.

By §4.2 (Corollary 5.3) every surjection H ⋊ Γ → A/Inn(M) factors through H̃ ⋊ Γ.

The bounds depend only on (ℓ, H̃), not on H or n — the input to Corollary 5.9.

([LWZB] Lemma 5.4 with proof, (5.5)–(5.8), pp. 27–28.) *Needs:* §4.2 Γ-chief factor pairs; §3.2 The fundamental short exact sequence and the multiplicities m(𝒞, n, H, G); §3.4 H-extensions of Γ-groups and the Möbius function of sub-extensions.

### 4.4 A uniform lower bound for the generation factors

Assume (SZ_Γ). For a finite Γ-group H of level 𝒞_ℓ let P_{u,n}(U_{𝒞_ℓ,H}) = ∏_{G∈𝒜_H} ∏_{k<m}(1 − h_{H⋊Γ}(G)^k |Y(G)|^{−n−u}) ∏_{G∈𝒩}(1 − |Y(G)|^{−n−u})^m (m = m(𝒞_ℓ, n, H, G)), the product in (4.13) without its prefactor, whenever a Γ-surjection 𝓕_n → H exists. Put P_{u,n} = 0 otherwise; in particular it is 0 for non-admissible H. This convention only adds zero cases to the bound. For ℓ > 1, integers u, and a finite Γ-group H̃ of level 𝒞_{ℓ−1}, there is c(u, ℓ, H̃) > 0 such that for all n ≥ 1 with u > −n and every H of level 𝒞_ℓ with H^{𝒞_{ℓ−1}} ≅ H̃, either P_{u,n}(U_{𝒞_ℓ,H}) = 0 or P_{u,n}(U_{𝒞_ℓ,H}) ≥ c(u, ℓ, H̃).

Assume (SZ_Γ).

Abelian factors: by Remark 4.4 each non-zero abelian product is a product of distinct factors 1 − p^{−i}, hence ≥ ∏_{k≥1}(1 − 2^{−k}); Lemma 5.4 bounds the number of G involved by a constant depending only on (ℓ, H̃) (Liu–Wood Lemma 9.5).

Non-abelian factors: bound Σ_G m(𝒞_ℓ, n, H, G)|Y(G)|^{−n} using Corollary 4.8, Lemma 4.6, Corollary 3.8 and Lemma 5.4, uniformly in n; then (1 − |Y(G)|^{−n−u})^m ≥ exp(−C·m|Y(G)|^{−n−u}) gives a positive bound (Liu–Wood Lemmas 9.5–9.6).

For abelian 𝒞 the bound is the Cohen–Lenstra constant ∏_{i≥1}(1 − p^{−i}) raised to the number of primes involved.

([LWZB] Corollary 5.9 and the paragraph after it, pp. 28–29; [LW20] Lemmas 9.5–9.6, pp. 23–26.) *Needs:* §4.3 Multiplicity bounds at level ℓ; §3.6 Multiplicities through extensions; §3.3 Generation by Y-relations; §3.5 Counting surjections of H-extensions.

### 4.5 Interchanging limits and sums over the level tower

Assume (SZ_Γ). Let f_n(H, ℓ) ≥ 0 be defined for n ≥ n_0, ℓ ≥ 1 and finite Γ-groups H of level 𝒞_ℓ, with: (1) f_n(H, ℓ) = g_n(H, ℓ) P_{u,n}(U_{𝒞_ℓ,H}); (2) 0 ≤ g_n(H, ℓ) ≤ g(H, ℓ) < ∞ and g_n(H, ℓ) → g(H, ℓ) for all n; (3) for ℓ>1, Σ_{H : H^{𝒞_{ℓ−1}} ≅ H̃} f_n(H, ℓ) = f_n(H̃, ℓ − 1); (4) if f_n(H, ℓ) > 0 then f_{n′}(H, ℓ) > 0 for all n′ ≥ n (persistence of positivity). Then lim_n f_n(H, ℓ) exists for all (H, ℓ) and Σ_{H of level 𝒞_ℓ} lim_n f_n(H, ℓ) = lim_n f_n(1, 1). For u < 0 take n_0 = 1 − u.

Assume (SZ_Γ) through Corollary 5.9; the four hypotheses above.

Existence of lim_n f_n: by (1), (2) and the convergence of P_{u,n} in the proof of Theorem 4.12.

Induction on ℓ; the case ℓ = 1 is the trivial group alone. By (3) it suffices to interchange limit and sum over the H above a fixed H̃.

Let Λ consist of H that have f_n(H,ℓ) > 0 for some n. For each H ∈ Λ, persistence (4), convergence of g_n and Corollary 5.9 give f_n(H,ℓ) ≥ ½c(u,ℓ,H̃)g(H,ℓ) for all sufficiently large n, with threshold allowed to depend on H. Fatou for the nonnegative sum, followed by (3) and the induction hypothesis, yields Σ_{H∈Λ} g(H,ℓ) ≤ (2/c) lim_n f_n(H̃,ℓ−1) < ∞. Thus the summable majorant is g on Λ and 0 outside Λ; no uniform threshold in H is required.

Dominated convergence for sums (Mathlib's tendsto_tsum_of_dominated_convergence) gives the interchange.

Both the probability and weighted-moment applications satisfy (4): adding a generator and one Y-relation that kills its admissible orbit identifies 𝓕_{n+1}/[Y(S ∪ {y})] with 𝓕_n/[Y(S)] when Y(y) = Y(x_{n+1}), so an event of positive probability at n stays positive at n + 1. The g_n in both applications are nonnegative counts divided by positive denominators, so the explicitly stated nonnegativity condition also holds.

([LWZB] Lemma 5.10 with proof, pp. 29–30.) *Needs:* §4.4 A uniform lower bound for the generation factors; §3.9 The finite-level distribution and its limit; `tendsto_tsum_of_dominated_convergence`; `MeasureTheory.lintegral_liminf_le`.

### 4.6 No escape of mass: countable additivity of μ_u

Assume (SZ_Γ). For every integer u, the set function μ_u(A) = lim_n μ_{u,n}(A) on the algebra 𝒜 generated by the basic opens exists and is countably additive on 𝒜, with μ_u(𝒫) = 1. In particular Σ_{H of level 𝒞_ℓ} μ_u(U_{𝒞_ℓ,H}) = 1 for every ℓ. The all-integer version is obtained by applying the same tightness argument on the tail n≥max(1,1−u); [LWZB] Theorem 5.12 states the u≥0 version.

Assume (SZ_Γ); u any integer, with X_{u,n} defined for n > −u.

Existence of the limit on basic opens is §3.9 (limit 0 when Property E fails).

Tightness: apply §4.5 with f_n(H, ℓ) = μ_{u,n}(U_{𝒞_ℓ,H}) and g_n(H) = |Sur_Γ(𝓕_n, H)|/(|Aut_Γ(H)||Y(H)|^{n+u}), whose limit is |Aut_Γ(H)|⁻¹|Y(H)|^{−u} for admissible H by (4.18) (and 0 otherwise). Writing p_ℓ(H) for the cylinder limit, this gives Σ_H p_ℓ(H) = 1 at every level.

An element B of 𝒜 is a Boolean combination of finitely many cylinders, hence a union of cells at one sufficiently large level ℓ. On the countable partition at that level, the probability vectors p_{n,ℓ}(H)=μ_{u,n}(U_{𝒞_ℓ,H}) converge coordinatewise to p_ℓ, and both have total mass 1. A finite subset of cells carrying p_ℓ-mass at least 1−ε shows that Σ_H|p_{n,ℓ}(H)−p_ℓ(H)|→0. Therefore the mass of any union of cells converges to the corresponding sum of p_ℓ. This defines μ_u(B)=lim_n μ_{u,n}(B); finite additivity passes to the limit, and μ_u(𝒫)=1. Finite intersections of arbitrary cylinders need not themselves be single cylinders; the partition argument does not require that assertion.

First use total mass 1 at each level and finite additivity to obtain countable additivity for unions of cylinders at one fixed level. For continuity at the empty set, suppose decreasing B_j ∈ 𝒜 have empty intersection but μ_u(B_j) ≥ ε. Each B_j is a union of cells at some level. First choose cofinally increasing levels 𝒞_{ℓ_j}, with ℓ_j ≥ j, fine enough that B_j is a union of cells at that level. At that chosen level take a finite union K_j of cells contained in B_j with μ_u(B_j ∖ K_j) < ε·2^{−j−1}. The finite intersections of the K_j then have positive content, so their cylinder tree has an infinite branch by finite branching. Choose compatible representatives and quotient maps along that branch; their inverse limit is an admissible group in 𝒫 with the prescribed finite-level completions. It lies in every B_j, a contradiction. This is the decreasing-set argument of Liu–Wood Theorem 9.1, pp. 26–27; countably many arbitrary algebra sets need not share one fixed finite level.

μ_u(𝒫) = 1 for every u; for Γ = Z/2 and 𝒞 the abelian 3-Γ-groups, the masses of the V_{𝒞,H} sum to 1 (the Cohen–Lenstra mass formula, ArithmeticStatistics ST.5, for u ≥ 0).

([LWZB] Theorem 5.12 with proof, p. 30; [LW20] Theorem 9.1, pp. 26–27; Theorem 9.2 and Corollary 9.7, pp. 21–28.) *Needs:* §4.5 Interchanging limits and sums over the level tower; §3.9 The finite-level distribution and its limit; §2.1 The space 𝒫 of admissible Γ-groups; §1.4 Homomorphisms out of 𝓕_n.

### 4.7 The limiting measures μ_u and μ_Γ

Assume (SZ_Γ). For each integer u, μ_u is the unique Borel probability measure on 𝒫 extending the countably additive content μ_u on 𝒜 (Carathéodory); μ_Γ = μ_1. The basic opens and the algebra 𝒜 generate the Borel σ-algebra, so μ_u is determined by its values on basic opens, and μ_u(V_{𝒞,H}) = lim_i μ_u(U_{𝒟_i,H}) for an exhaustion of an arbitrary 𝒞 by finite sets.

Assume (SZ_Γ).

𝒜 is a ring of sets (in particular a set semiring) and μ_u is σ-additive, hence σ-subadditive, on it (§4.6); Mathlib's AddContent.measure gives a measure on the σ-algebra generated by 𝒜, which is the Borel σ-algebra (§2.1), agreeing with μ_u on 𝒜 (AddContent.measure_eq).

Uniqueness: two finite measures agreeing on the π-system 𝒜 that generates the σ-algebra coincide.

Continuity from above gives μ_u(V_{𝒞,H}) as the decreasing limit.

- `limitMeasure`: μ_u as a MeasureTheory.ProbabilityMeasure on 𝒫.
- `limitMeasure_basicOpen`: μ_u(U_{𝒞,H}) = lim_n μ_{u,n}(U_{𝒞,H}).
- `limitMeasure_ext`: A finite Borel measure on 𝒫 agreeing with μ_u on basic opens is μ_u.
- `limitMeasure_vSet`: μ_u(V_{𝒞,H}) = lim_i μ_u(U_{𝒟_i,H}) for an exhaustion of 𝒞.
- `muGamma`: μ_Γ = μ_1.
- `limitMeasure_eq_zero_of_not_propertyE`: μ_u(U_{𝒞,H}) = 0 if H is not admissible or lacks Property E at level 𝒞.

**Checks.**

- μ_u(𝒫) = 1 for every integer u, including u < 0.
- For Γ = Z/2 and 𝒞 the abelian 3-Γ-groups, H ↦ μ_0(V_{𝒞,H}) on finite abelian 3-groups with σ = −1 is the Cohen–Lenstra measure μ_{3,0} of ArithmeticStatistics ST.5.
- For Γ = Z/2, μ_1(U_{{Z/3^−},1}) = ∏_{i≥2}(1 − 3^{−i}) ≈ 0.840.
- For Γ = Z/2, p = 3, 𝒞 = {Z/9 with inversion, the exponent-3 Heisenberg group of order 27 with σ(x)=x⁻¹, σ(y)=y⁻¹} and H = F_3² with σ = −1, μ_0(U_{𝒞,H}) = 0. The product without the Property E restriction at u = 0 would give approximately 0.002698. For the infinite class of all 3-Γ-groups of 3-class ≤2, use V_{𝒞,H}; its μ_0-value is also 0.

μ_u(U_{𝒞,H}) = lim_n μ_{u,n}(U_{𝒞,H}) for every finite 𝒞 and H.

([LWZB] §5.3, p. 30, first sentences; [LW20] §3, p. 5.) *Needs:* §4.6 No escape of mass: countable additivity of μ_u; §2.1 The space 𝒫 of admissible Γ-groups; `MeasureTheory.AddContent.measure`; `MeasureTheory.AddContent.measure_eq`; `MeasureTheory.ProbabilityMeasure`.

### 4.8 Convergence of the random Γ-groups

Assume (SZ_Γ). For every finite group Γ, the laws μ_{1,n} of X_{Γ,n} = 𝓕_n/[Y(S)] (S a tuple of length n+1) converge weakly to the probability measure μ_Γ on 𝒫 as n → ∞; more generally μ_{u,n} → μ_u for every integer u. Explicitly (5.13), for a finite set 𝒞 of finite |Γ|′-Γ-groups and a finite admissible Γ-group H of level 𝒞 with Property E at level 𝒞, μ_Γ(U_{𝒞,H}) = |Aut_Γ(H)|⁻¹ [H : H^Γ]⁻¹ ∏_{G∈𝒜_H} ∏_{i≥1}(1 − λ(𝒞, H, G) h_{H⋊Γ}(G)^{−i} [G : G^Γ]⁻¹) ∏_{G∈𝒩} exp(−λ(𝒞, H, G)/[G : G^Γ]); if H is not admissible or lacks Property E at level 𝒞, μ_Γ(U_{𝒞,H}) = 0. The formula is asserted only on Property E groups.

Assume (SZ_Γ).

Every open set U ⊆ 𝒫 is a countable disjoint union of basic opens U_j (§2.1); μ_Γ(U) = Σ_j lim_n μ_{1,n}(U_j) ≤ liminf_n Σ_j μ_{1,n}(U_j) = liminf_n μ_{1,n}(U) by Fatou's lemma for sums.

Weak convergence follows from the open-set criterion of the Portmanteau theorem (Mathlib's MeasureTheory.tendsto_of_forall_isOpen_le_liminf; the filter atTop is countably generated).

(5.13) is (4.14) with u = 1 and |Y(G)| = [G : G^Γ] (§0.2); the vanishing case is the last clause of §3.9.

Γ = Z/2, 𝒞 = {Z/3 with σ = −1}, H = Z/3: here λ = 1/3 and μ_Γ(U_{𝒞,H}) = (1/6)∏_{i≥3}(1 − 3^{−i}) = (3/16)∏_{i≥2}(1 − 3^{−i}), the real-quadratic (u = 1) Cohen–Lenstra probability that the 3-rank is exactly 1. Γ = Z/2, 𝒞 = {Z/9 with inversion, the exponent-3 Heisenberg group of order 27 with σ(x)=x⁻¹, σ(y)=y⁻¹}, H = F_3² with σ = −1: μ_Γ(U_{𝒞,H}) = 0. For the full infinite class of 3-class ≤2 groups the same statement uses V_{𝒞,H}.

([LWZB] Theorem 1.2, p. 2, and §5.3 with (5.13), p. 30.) *Needs:* §4.7 The limiting measures μ_u and μ_Γ; §3.9 The finite-level distribution and its limit; §2.2 Random Γ-groups X_{u,n} and their laws μ_{u,n}; §0.2 The map Y; `MeasureTheory.tendsto_of_forall_isOpen_le_liminf`; `MeasureTheory.lintegral_liminf_le`; §2.1 The space 𝒫 of admissible Γ-groups.

### 4.9 μ_u on V_{𝒞,H} for arbitrary 𝒞

Assume (SZ_Γ). Let 𝒞 be an arbitrary set of finite |Γ|′-Γ-groups, H a finite admissible Γ-group of level 𝒞 with Property E at level 𝒞, and u an integer. With λ extended to 𝒞 by finite exhaustion (Definition 5.14), μ_u(V_{𝒞,H}) = |Aut_Γ(H)|⁻¹|Y(H)|^{−u} ∏_{G∈𝒜_H} ∏_{i≥1}(1 − λ(𝒞, H, G) h_{H⋊Γ}(G)^{−i}|Y(G)|^{−u}) ∏_{G∈𝒩} exp(−|Y(G)|^{−u} λ(𝒞, H, G)). If H lacks Property E at level 𝒞, μ_u(V_{𝒞,H}) = 0.

Assume (SZ_Γ); H finite admissible of level 𝒞.

V_{𝒞,H} = ⋂_i U_{𝒟_i,H} for an exhaustion 𝒟_1 ⊆ 𝒟_2 ⊆ ⋯ with H of level 𝒟_i, so μ_u(V_{𝒞,H}) = lim_i μ_u(U_{𝒟_i,H}) by continuity from above (§4.7, which needs Theorem 5.12 for this u).

Each μ_u(U_{𝒟_i,H}) is the product (4.14); its factors are non-increasing in i and λ(𝒟_i, H, G) increases to λ(𝒞, H, G) (§3.7), so the limit is the product with the limiting λ's (Liu–Wood Lemma 11.3 with Lemma 8.11).

Level-𝒟_i groups are of level 𝒞, so Property E at level 𝒞 gives Property E at level 𝒟_i once H is of level 𝒟_i (§1.5 (a)), and the formula follows. If H lacks Property E at level 𝒞, the obstructing extension G̃ → G is finite, hence of level 𝒟_i for large i; then μ_u(U_{𝒟_i,H}) = 0 and V_{𝒞,H} ⊆ U_{𝒟_i,H}, because X^𝒞 ≅ H gives X^{𝒟_i} ≅ H^{𝒟_i} = H.

Γ = Z/2, p = 3, 𝒞 all finite 3-Γ-groups, H = F_3² with σ = −1: μ_u(V_{𝒞,H}) = 0. For abelian 𝒞 this is the formula of §7.1 (§5.4).

([LWZB] Definition 5.14 and Theorem 5.15, p. 31; [LW20] Lemma 11.3, pp. 28–29.) *Needs:* §4.7 The limiting measures μ_u and μ_Γ; §3.7 The λ-invariants λ(𝒞, H, G); §3.9 The finite-level distribution and its limit; §3.8 Limits of truncated products; §1.5 Property E relative to a level: restriction and completion.

### Examples

For S₃ the chief pairs are (C₃,C₂) and (C₂,1), the first retaining inversion on C₃. For Γ=C₂ acting on C₃ by inversion, Γ-chief factors select only (C₃,C₂) from C₃⋊Γ. At elementary abelian 3-level, μ₀(U_{C,1})=∏_{i≥1}(1−3^{−i})≈0.560126; μ₁(U_{C,1})=∏_{i≥2}(1−3^{−i})≈0.840189. These are cylinder masses, not the probability that the full profinite group is trivial.

### Dependencies

Layers 0–3; compact inverse limits of finite sets; dominated convergence and Fatou; extension of nonnegative content to a measure and the open-set Portmanteau criterion. Positive persistence in §4.5 is required for the interchange argument, including its applications to moments.

## Layer 5: Moments, abelianization and p-class towers

### 5.1 Moments at finite n

Assume (SZ_Γ). For a finite admissible Γ-group A and integers n ≥ 1, u > −n: E|Sur_Γ(X_{u,n}, A)| = |Sur_Γ(𝓕_n, A)| · |Y(A)|^{−n−u}, and this tends to [A : A^Γ]^{−u} as n → ∞.

Assume (SZ_Γ); A finite admissible (in particular of order prime to |Γ|).

A Γ-surjection X_{u,n} → A is a Γ-surjection φ : 𝓕_n → A whose kernel contains the coordinates of every Y(s_j); so E|Sur_Γ(X_{u,n}, A)| = Σ_φ Prob(Y(s_j) ∈ (ker φ)^d for all j).

Each probability is |Y(A)|^{−n−u} by (4.16) (§0.2 with §0.4).

|Sur_Γ(𝓕_n, A)||Y(A)|^{−n} → 1 (§1.4 (b)) and |Y(A)| = [A : A^Γ].

Γ = Z/2, A = Z/3 with σ = −1, u = 1: E|Sur_Γ(X_{1,n}, A)| = (3^n − 1)/3^{n+1} → 1/3.

([LWZB] Lemma 6.1 with proof, p. 31.) *Needs:* §2.2 Random Γ-groups X_{u,n} and their laws μ_{u,n}; §1.4 Homomorphisms out of 𝓕_n; §0.2 The map Y; §0.4 Sections of G ⋊ Γ and the fibres of Y.

### 5.2 The moments of μ_u

Assume (SZ_Γ). For every integer u and every finite admissible Γ-group A, X ↦ |Sur_Γ(X, A)| is a locally constant function on 𝒫 and ∫ |Sur_Γ(X, A)| dμ_u(X) = [A : A^Γ]^{−u}. In particular the μ_Γ-moment is [A : A^Γ]^{−1}, and for abelian A with A^Γ = 1 it is |A|^{−1}.

Assume (SZ_Γ); A finite admissible; u any integer (this uses Theorem 5.12 for all u).

For ℓ ≥ |A|, |Sur_Γ(X, A)| = |Sur_Γ(X^{𝒞_ℓ}, A)|, so the function is constant on each U_{𝒞_ℓ,H} and the integral is Σ_H |Sur_Γ(H, A)| μ_u(U_{𝒞_ℓ,H}).

Apply §4.5 to f_n(H, ℓ) = E(|Sur_Γ(X_{u,n}, A)| · 1[X_{u,n}^{𝒞_ℓ} ≅ H]); conditioning on Y(S̄) as in the proof of LWZB Theorem 6.2 gives f_n = g_n P_{u,n}(U_{𝒞_ℓ,H}) with g_n = |Y(A^{𝒞_ℓ})|^{n+u}|Sur_Γ(ρ, π_A)||Sur_Γ((𝓕_n)^{𝒞_ℓ}, H)||Sur_Γ(H, A^{𝒞_ℓ})| / (|Y(A)|^{n+u}|Y(H)|^{n+u}|Aut_Γ(H)|), Here π_A:A→A^{𝒞_ℓ} is completion, τ:(𝓕_n)^{𝒞_ℓ}→A^{𝒞_ℓ} is any Γ-surjection and ρ=τ∘η_{𝓕_n}; the lift count is independent of τ by §3.5. If no such τ exists, the counts are zero. For admissible H the displayed limit is valid and g_n is bounded by it; for nonadmissible H, Sur_Γ(𝓕_n,H) is empty for every n, so set g_n=g=0 instead. The admissible limit is |Y(A^{𝒞_ℓ})|^u |Sur_Γ(H,A^{𝒞_ℓ})| / (|Y(A)|^u |Y(H)|^u |Aut_Γ(H)|), by §3.5 and §1.4.

Monotone positivity holds as in §4.5; the sum over H of lim_n f_n is lim_n E|Sur_Γ(X_{u,n}, A)| = [A : A^Γ]^{−u} (§5.1), and for ℓ ≥ |A| the left side is Σ_H |Sur_Γ(H, A)|μ_u(U_{𝒞_ℓ,H}).

Γ = Z/2, A = Z/3 with σ = −1: the μ_1-moment is 1/3 and the μ_0-moment is 1, i.e. averages 4/3 and 2 of |Cl[3]| for real and imaginary quadratic fields, the Davenport–Heilbronn values. Γ = Z/4 acting on the Heisenberg group of order 27 through a fixed-point-free action of order 4 on its abelianization (trivially on the centre): A^Γ is the centre, so the moment is 1/9 (LWZB §1.5). Γ = (Z/2)² acting faithfully and admissibly on the Heisenberg group of order 27: A^Γ = 1 and the moment is 1/27 (LWZB §1.5).

([LWZB] Theorem 6.2 with proof, (6.3)–(6.5), pp. 31–33; [LWZB] §1.5, pp. 8–9.) *Needs:* §5.1 Moments at finite n; §4.5 Interchanging limits and sums over the level tower; §4.7 The limiting measures μ_u and μ_Γ; §4.6 No escape of mass: countable additivity of μ_u; §3.5 Counting surjections of H-extensions.

### 5.3 Finite-index sublattices over Z_p[Γ] for p ∤ |Γ|

Let p be a prime not dividing |Γ| and L = (Z_p[Γ]/(Σ_{g∈Γ} g))^n. Every Γ-stable Z_p-submodule N ⊆ L of finite index is isomorphic to L as a Z_p[Γ]-module. More generally, two Z_p[Γ]-lattices (finitely generated, Z_p-free) M ⊆ M′ with M′/M finite are isomorphic.

Assume p ∤ |Γ|.

Lattices are projective Z_p[Γ]-modules: a Z_p-linear splitting of Z_p[Γ] ⊗ M → M, averaged over Γ (|Γ| is a unit), is Z_p[Γ]-linear (Mathlib's Module.Projective.of_split).

Reductions agree in the Grothendieck group: for T = M′/M finite, the snake lemma for multiplication by p on 0 → M → M′ → T → 0 gives an exact sequence 0 → T[p] → M/pM → M′/pM′ → T/pT → 0, and T[p], T/pT have the same composition factors (from 0 → T[p] → T → T → T/pT → 0).

F_p[Γ] is semisimple (Maschke, Mathlib's MonoidAlgebra.Submodule.exists_isCompl), so M/pM ≅ M′/pM′.

Lift an isomorphism M/pM → M′/pM′ to φ : M → M′ by projectivity over Z_p[Γ]. Restrict scalars to the commutative ring Z_p: M′ = range φ + pM′ and (p) lies in its Jacobson radical, so Mathlib's Submodule.le_of_le_smul_of_le_jacobson_bot gives surjectivity. Equal finite Z_p-ranks give injectivity. No commutative-ring Nakayama lemma is applied to the noncommutative group algebra.

For Γ = Z/2, p = 3, n = 1: L = Z_3 with σ = −1 and every non-zero Γ-submodule 3^kZ_3 is isomorphic to L. The hypothesis p ∤ |Γ| is needed: for Γ = Z/2, p = 2, the sublattice of Z_2[Γ] spanned by 1 + σ and 2 has finite index but its reduction mod 2 is the trivial module twice, not F_2[Γ].

([LWZB] §7.1, p. 34, second paragraph.) *Needs:* `Module.Projective.of_split`; `MonoidAlgebra.Submodule.exists_isCompl`; `Submodule.le_of_le_smul_of_le_jacobson_bot`.

### 5.4 The abelianization: the Cohen–Lenstra–Martinet distribution (§7.1)

Assume (SZ_Γ). Let 𝒞 be the set of all finite abelian |Γ|′-Γ-groups (or those whose orders involve only a fixed set of primes not dividing |Γ|), and H a finite abelian |Γ|′-Γ-group with H^Γ = 1. Then: (a) in the fundamental sequences 1 → R → F → H → 1 at finite abelian levels approximating 𝒞 the H-action on R is trivial and F^Γ = R^Γ = H^Γ = 1, so m(𝒞, n, H, G) = 0 unless G ∈ 𝒜_H has trivial H-action; (b) for G with trivial H-action and G^Γ = 1, the exhaustion multiplicity m(𝒞, n, H, G) = n·m_G (m_G maximal with G^{m_G} cyclic as a Γ-module, h_Γ(G)^{m_G} = |G|) and λ(𝒞, H, G) = 1; (c) μ_u(V_{𝒞,H}) = |Aut_Γ(H)|^{−1} |H|^{−u} ∏_{p∤|Γ|} ∏_{G} ∏_{i≥1}(1 − h_Γ(G)^{−i}|G|^{−u}), the middle product over the non-trivial irreducible F_p[Γ]-modules G (restricted to the chosen primes). For u = 1 this is the Cohen–Lenstra–Martinet distribution of the prime-to-|Γ| class groups of totally real Γ-fields; for Γ = Z/2 and u = 0, 1 its p-parts are the Cohen–Lenstra measures μ_{p,u}.

Assume (SZ_Γ) (abelian H needs it only through the general machinery); H^Γ = 1.

(a) In an abelian level the kernel R is abelian with trivial F-conjugation, hence trivial H-action; (𝓕_n^ab)^Γ = 0 (§1.4 (d)) gives F^Γ = 1.

(b) Use m for infinite 𝒞 in the exhaustion sense of Definition 5.14. For a finite-index closed Γ-subgroup N of (𝓕_n)^𝒞, N ≅ (𝓕_n)^𝒞 one prime at a time (§5.3), so the maximal quotient of N that is a product of copies of G has G^{n m_G}, giving m = n·m_G; by (4.17) λ = lim h^{n m_G}|G|^{−n} = 1 (Remark 4.4 with |Y(G)| = |G| because G^Γ = 1).

(c) Insert (b) into §4.9; |Y(H)| = |H| because H^Γ = 1; the trivial F_p[Γ]-module has m = 0 and λ = 0.

For Γ = Z/2 the only non-trivial irreducible F_p[Γ]-module is F_p with σ = −1, h_Γ = p, so the p-part is |Aut H|^{−1}|H|^{−u}∏_{i>u}(1 − p^{−i}) = μ_{p,u}(H) (ArithmeticStatistics ST.5). For general Γ, compare Wang–Wood arXiv v2, §3.2–3.3 and Proposition 6.6, p. 13. Their Theorem 4.1, pp. 8–9, makes the weight |H| for totally real Γ-fields over ℚ because the decomposition group at the sole real place is trivial. The comparison is at each finite set of allowed primes; the global law is its compatible product. No probability law on finite abelian groups at all primes is asserted when u = 0.

Γ = Z/2, H = Z/3 with σ = −1, 𝒞 the abelian 3-Γ-groups, u = 1: μ_1(V_{𝒞,H}) = (1/6)∏_{i≥2}(1 − 3^{−i}) = μ_{3,1}(Z/3). For abelian H with H^Γ = 1 the moment |H|^{−1} of §5.2 equals the predicted Cohen–Martinet moment ∏_v |H^{σ_v}|^{−1} of ArithmeticStatistics ST.5 for totally real fields (every σ_v = 1).

([LWZB] §7.1, pp. 34–35; [WW] §3.2–3.3, pp. 6–7; Theorem 4.1, pp. 8–9; Proposition 6.6, p. 13.) *Needs:* §4.9 μ_u on V_{𝒞,H} for arbitrary 𝒞; §5.3 Finite-index sublattices over Z_p[Γ] for p ∤ |Γ|; §3.7 The λ-invariants λ(𝒞, H, G); §1.4 Homomorphisms out of 𝓕_n; §0.5 Admissible Γ-groups: closure properties and the abelian criterion; ArithmeticStatistics ST.5; §1.5 Property E relative to a level: restriction and completion.

### 5.5 Equivariant p-covers and the nucleus

Let p be a prime and H a finite p-group with generator rank d = d(H) = dim_{F_p} H/Φ(H). For n ≥ d and a surjection ϖ : F → H from a free pro-p group of rank n with kernel N, put N* = N^p[N, F], F′ = F/N* and R′ = N/N* (LWZB (7.1)); R′ is elementary abelian and central in F′, and F′ is the largest quotient of F mapping onto H with kernel elementary abelian with trivial F′-action. For n = d, call F′ the p-covering group of H and R′ its p-multiplicator. Use d(H), r(H), P_i, Q_i and cl_p from the supplier contracts. The quotient construction adds its Γ-action and the nucleus to that presentation interface. If cl_p(H) = c, using a minimal presentation n = d, the nucleus of H is P_c(F′) ≤ R′ and ν(H) = dim_{F_p} P_c(F′) is the nuclear rank. When a group Γ of order prime to p acts on H and ϖ is Γ-equivariant, N, N*, F′, R′ and P_c(F′) are Γ-stable and the constructions are Γ-equivariant; for 𝒞 the p-Γ-groups of p-class at most c, (𝓕_n)^𝒞 = Q_c((𝓕_n)_p).

Assume H a finite p-group; for the Γ-structure, p ∤ |Γ|.

N* = N^p[N,F] is normal in F and invariant under automorphisms of the pair (F,N), hence Γ-stable when the presentation is equivariant. It need not be characteristic under arbitrary automorphisms of N. Its quotient R′ is elementary abelian and central in F′.

Independence of the presentation: two surjections from free pro-p groups of rank d differ by an automorphism of F (Gaschütz lifting of generators, ProfiniteProPGroups Layer 3), so F′ is unique up to isomorphism over H.

Naturality of the supplied five-term sequence gives the Γ-action on the relation quotient and makes its dimension formula compatible with the equivariant cover. Its splitting as F_p-vector spaces is not asserted to be canonical; when p∤|Γ| the finite Γ-module sequence splits by Maschke.

Q_c((𝓕_n)_p) is universal for maps to finite p-Γ-groups of p-class ≤ c, hence is (𝓕_n)^𝒞 by §1.1. For nontrivial H, Gaschütz lifting splits a redundant presentation as its minimal p-cover times a central elementary abelian factor of rank n − d; P_c of that factor is trivial for c ≥ 1. Thus the nucleus and ν(H) used in the p-class formula agree with those from the minimal presentation. For H = 1 use the minimal rank-zero cover and handle the redundant presentation separately.

- `pCoveringGroup`: F′ for a presentation of rank n ≥ d, with its map to H.
- `pMultiplicator`: R′ = N/N^p[N, F], an elementary abelian central subgroup of F′.
- `pCoveringGroup_unique`: F′ is unique up to isomorphism over H and is the largest quotient of F over H with elementary abelian kernel on which F′ acts trivially.
- `nucleus`: P_c(F′) for c = cl_p(H) and the minimal presentation of rank d(H); for nontrivial H its value agrees with that from a redundant presentation.
- `nuclearRank`: ν(H) = dim_{F_p} P_c(F′).
- `pCoveringGroup_equivariant`: For Γ of order prime to p acting on H and on F compatibly, F′, R′ and the nucleus are Γ-stable.
- `levelCompletion_pClass`: For 𝒞 the p-Γ-groups of p-class ≤ c, (𝓕_n)^𝒞 = Q_c((𝓕_n)_p).

**Checks.**

- H = Z/p: d = 1, r = 1, the p-covering group is Z/p², the multiplicator and the nucleus are pZ/p² ≅ Z/p, cl_p = 1 and ν = 1.
- H = (Z/p)²: d = 2 and r = 3 = d(d + 1)/2.
- H = 1: d = r = 0 and the minimal rank-zero cover is F′ = 1. For a redundant rank-n presentation, N = F and F′ = R′ = (Z/p)^n, so dim R′ = n.
- The p-multiplicator is not the Schur multiplier: for H = Z/p, H_2(H, Z) = 0 while R′ ≅ Z/p.
- r(H) agrees with ProfiniteProPGroups' relation rank dim H²(H, F_p) for every finite p-group H.

For H = (Z/p)^d, r(H) = d(d + 1)/2, the sanity value in ProfiniteProPGroups Layer 5.

([LWZB] §7.2.1, (7.1) and the paragraph before Theorem 7.4, pp. 34–35; §7.2.2, pp. 35–36; [LW20] Lemma 12.5 with proof, p. 34.) *Needs:* ProfiniteProPGroups (the supplier contract above); §1.1 Level-𝒞 closure and the pro-𝒞 completion of a Γ-group; `TauCeti.IsProP`; ProfiniteCohomology (the supplier contract above); §1.4 Homomorphisms out of 𝓕_n.

### 5.6 The pro-p specialization: Boston–Bush–Hajir

Let Γ = Z/2 = ⟨σ⟩, p an odd prime and u an integer. (Lemma 7.2) If H is an admissible p-Γ-group and ϖ : (𝓕_n)_p → H a Γ-surjection whose kernel is generated as a closed normal Γ-subgroup by the coordinates of Y(S) for a finite S, then for every finite set 𝒞 of p-Γ-groups with H of level 𝒞 the fundamental sequence is (F′)^𝒞 → H induced by (7.1), and for 𝒞 large enough it is (7.1). (Theorem 7.4) Let 𝒞 be the set of all finite p-Γ-groups and H a finite p-Γ-group. If H ≅ (𝓕_n)^𝒞/[Y(S)] for some n and some tuple S of length n+u, then μ_u(V_{𝒞,H}) = |Aut_Γ(H)|^{−1}|Y(H)|^{−u} ∏_{i ≥ 1+u+d(H)−r(H)} (1 − p^{−i}); otherwise μ_u(V_{𝒞,H}) = 0. For u = 0 and u = 1 these are the Boston–Bush–Hajir measures predicted for the p-class tower groups of imaginary and real quadratic fields.

Assume (SZ_Γ) holds (Γ = Z/2 is solvable); p odd.

Lemma 7.2: by the Y-generation of the kernel, σ acts by −1 on every irreducible factor G of R; as G is an irreducible p-group-module it is Z/p with trivial H-action, so F′ → H factors through F; conversely F → H factors through the largest level-𝒞 quotient of F′.

Theorem 7.4: by §4.9 only G = Z/p (trivial H-action, σ = −1) has λ ≠ 0, with |Y(G)| = h_{H⋊Γ}(G) = p; m(𝒞, n, H, G) = r(H) − d(H) + n (Liu–Wood Lemma 12.5 with §5.5), so λ = p^{r(H)−d(H)} by (4.17).

The index change gives the displayed product. For the zero case distinguish two obstructions. Failure of admissibility or Property E gives measure 0 by §4.9. If H has Property E at the pro-p level, its presentation kernel has only sign factors, and its least number of Y-relation tuples in rank n is r(H) + n − d(H), by generation in R/R*. An exact n + u presentation is possible only if r(H) − d(H) ≤ u (padding by redundant tuples is allowed); if this fails, the displayed product contains the i = 0 factor and is 0. Property E characterizes the existence of some Y-presentation, not a presentation with a prescribed n + u tuples.

For u = 0 compare Boston–Wood arXiv v2, §3, pp. 5–7, and Lemma 4.8, pp. 10–11: the formula is conditional on generator rank d and must be multiplied by its Cohen–Lenstra rank probability p^{−d²}C_p/η_d², where C_p=∏_{i≥1}(1−p^{−i}) and η_d=∏_{i=1}^d(1−p^{−i}). For u = 1 compare Boston–Bush–Hajir arXiv v1, Definitions 2.2–2.3, p. 2, Lemma 2.8, p. 5, and Theorem 2.22 with proof, pp. 9–11; their Meas is also conditional on rank. The real-quadratic rank weight is p^{−d(d+1)}∏_{i≥1}(1−p^{−i})/(∏_{i=1}^{d}(1−p^{−i})∏_{i=1}^{d+1}(1−p^{−i})). Multiplication gives precisely the displayed μ_1 formula. Property E supplies inversion on the relation module, and the bound r−d≤u supplies the allowed number of relations.

H = Z/3 (σ = −1), u = 1: d = r = 1 and μ_1(V_{𝒞,H}) = (1/6)∏_{i≥2}(1 − 3^{−i}) = μ_{3,1}(Z/3), consistent with §5.4 because a cyclic 3-class group has trivial 3-class field tower beyond it. H = 1: μ_u(V_{𝒞,1}) = ∏_{i≥1+u}(1 − p^{−i}), the Cohen–Lenstra probability of a trivial p-part. H = F_3² with σ = −1 is not of the stated form (it lacks Property E), so μ_u(V_{𝒞,H}) = 0. H = Z/3 with inversion has Property E at the pro-3 level and r = d = 1. At u = −1 it has no rank-n presentation by n − 1 Y-tuples and has μ_{−1}-mass 0, since the product starts at i = 0. This distinguishes Property E from the fixed-relation-count support condition.

([LWZB] Lemma 7.2, Remark 7.3 and Theorem 7.4 with proofs, pp. 35–36; [LW20] Lemma 12.5, p. 34; [BW17] §3, pp. 5–7; Lemma 4.8 with proof, pp. 10–11; [BBHREAL] Definitions 2.2–2.3, p. 2; Lemma 2.8, p. 5; Theorem 2.22 with proof, pp. 9–11; §3, pp. 13–14.) *Needs:* §5.5 The p-covering group, p-multiplicator and nucleus; §4.9 μ_u on V_{𝒞,H} for arbitrary 𝒞; §3.2 The fundamental short exact sequence and the multiplicities m(𝒞, n, H, G); §3.7 The λ-invariants λ(𝒞, H, G); §1.6 Property E as the shape of the relations.

### 5.7 The p-class-c specialization

Let Γ = Z/2, p odd, u an integer, c ≥ 1, and 𝒞 the set of finite p-Γ-groups of p-class at most c. For H of the form (𝓕_n)^𝒞/[Y(S)] with S a tuple of length n+u: (1) if cl_p(H) < c then m(𝒞, n, H, G) = r(H) + n − d(H) and μ_u(V_{𝒞,H}) = |Aut_Γ(H)|^{−1}|Y(H)|^{−u} ∏_{i ≥ 1+u+d(H)−r(H)}(1 − p^{−i}); (2) if cl_p(H) = c then m(𝒞, n, H, G) = r(H) − ν(H) + n − d(H) and μ_u(V_{𝒞,H}) = |Aut_Γ(H)|^{−1}|Y(H)|^{−u} ∏_{i ≥ 1+u+d(H)+ν(H)−r(H)}(1 − p^{−i}). If H is not of this form, μ_u(V_{𝒞,H}) = 0. For u = 0, 1 these are the Boston–Bush–Hajir measures on p-class-c quotients.

Assume Γ = Z/2; p odd; c ≥ 1.

(𝓕_n)^𝒞 = Q_c((𝓕_n)_p) (§5.5).

If cl_p(H) < c, P_c(F′) = 1 because P_{c−1}(F′) lies in the elementary abelian central kernel; so F′ is of p-class ≤ c and the fundamental sequence is (7.1) (Remark 7.3).

If cl_p(H) = c, P_c((𝓕_n)_p) ≤ N and the fundamental sequence is F′/P_c(F′) → H with kernel R′/P_c(F′), of dimension r(H) − ν(H) + n − d(H).

Insert the multiplicities into §4.9 as in Theorem 7.4.

For the zero case repeat the two-obstruction argument of §5.6 at the class-c level. Under Property E the necessary Y-relation count is n + r − d when cl_p(H) < c, and n + r − ν − d when cl_p(H) = c. Failure of the corresponding bound makes an i = 0 factor occur; absence of Property E gives measure 0 independently.

For the BBH comparison use the same conditional-rank normalization as in §5.6, replacing r by h_c = r−ν at exact p-class c and by r below class c. Boston–Wood Lemma 4.8 and Boston–Bush–Hajir Theorem 2.22 calculate these two cases. The Y-presentation support is read at the class-c level, not inferred merely from Property E without the rank bound.

c = 1: the p-class-1 groups are the elementary abelian p-Γ-groups; for H = F_p^d (σ = −1), ν(H) = r(H) and μ_u(V_{𝒞,H}) = |GL_d(F_p)|^{−1}p^{−du}∏_{i≥1+u+d}(1 − p^{−i}), the Cohen–Lenstra probability that the p-rank is d.

([LWZB] §7.2.2 and Theorem 7.5, pp. 35–36; [BW17] §3, pp. 5–7; Lemma 4.8 with proof, pp. 10–11; [BBHREAL] Definitions 2.2–2.3, p. 2; Lemma 2.8, p. 5; Theorem 2.22 with proof, pp. 9–11; §3, pp. 13–14.) *Needs:* §5.6 The pro-p specialization: Boston–Bush–Hajir; §5.5 The p-covering group, p-multiplicator and nucleus; §4.9 μ_u on V_{𝒞,H} for arbitrary 𝒞.

### Examples

For Γ=C₂, A=C₃ with inversion and u=1, the finite-n surjection moment is (3^n−1)/3^{n+1}, with limit 1/3. Since each nonzero F₃ character is surjective, E|Hom(X,C₃)|=4/3; with u=0 the corresponding value is 2. At abelian 3-level the mass of C₃ for u=1 is (1/6)∏_{i≥2}(1−3^{−i}). At elementary abelian 3-level it is (1/6)∏_{i≥3}(1−3^{−i}), a larger mass: the latter cylinder allows cyclic groups of higher exponent in its inverse image. This distinguishes a level projection from the full abelian pro-3 group.

### Dependencies

Layers 0–4; ST.5 for the existing abelian measures; semisimple F_p[Γ]-modules and projective ℤ_p-lattices; ProfiniteProPGroups Layers 3, 5 and 8 and the five-term sequence for the p-cover interface.

## Layer 6: Arithmetic distribution and the Galois interface

### 6.1 The Liu–Wood–Zureick-Brown conjecture (Conjecture 1.3), as a proposition

Let the base field Q be ℚ, or F_q(t) with q prime to |Γ|, and Δ = 2|Γ| for Q = ℚ, Δ = q(q − 1)|Γ| for Q = F_q(t). A Γ-extension K/Q is a Galois extension with an identification Gal(K/Q) ≅ Γ; it is totally real when it is split completely above ∞. K^# is the maximal extension of K unramified everywhere, split completely above ∞, all of whose finite subextensions have degree prime to Δ; Gal(K^#/K) is an admissible Γ-group through a Schur–Zassenhaus section, well defined up to isomorphism (IG.4’s admissibility and Galois-action contract, under (SZ_Γ)). rDisc(K) is the norm of the radical of the discriminant ideal of K/Q, and E_Γ(D, Q) the finite set of isomorphism classes of totally real Γ-extensions with rDisc(K) = D. LWZBConjecture(Γ, Q) is the proposition: for every finite set 𝒞 of finite Γ-groups of order prime to Δ and every finite admissible Γ-group H of order prime to Δ, (i) Σ_{D≤B} #{K ∈ E_Γ(D, Q) : Gal(K^#/K)^𝒞 ≅ H^𝒞} / Σ_{D≤B} |E_Γ(D, Q)| → μ_Γ(U_{𝒞,H^𝒞}) as B → ∞, and (ii) Σ_{D≤B} Σ_{K∈E_Γ(D,Q)} |Sur_Γ(Gal(K^#/K), H)| / Σ_{D≤B} |E_Γ(D, Q)| → ∫|Sur_Γ(X, H)| dμ_Γ = [H : H^Γ]^{−1}. The conjecture is a proposition, and is not an assumption in the group-theoretic theorems. Include eventual positivity of the denominator in this proposition: an empty family cannot satisfy the moment prediction even for H=1. If one field exists, the denominator is positive for every sufficiently large cutoff.

Assume (SZ_Γ) for the Γ-action on Gal(K^#/K) and for μ_Γ; q prime to |Γ| in the function-field case.

E_Γ(D, Q) is finite: the discriminant of K/Q is bounded in terms of D and |Γ|, and Hermite's theorem (Mathlib's NumberField.finite_of_discr_bdd) or its function-field analogue applies.

The event in (i) is defined by the level-completion functor and the finite target H^𝒞; the assertion that the arithmetic groups lie in 𝒫 is a separate consistency theorem below, not an input to defining this proposition. No theorem about the conjectured frequencies is assumed.

The right sides are μ_Γ of a basic open (§4.8) and the moment of §5.2; both statements are propositions about limits of explicit finite averages.

- `LWZBConjecture`: The proposition LWZBConjecture(Γ, Q), the conjunction of (i) and (ii) over all admissible test data.
- `LWZBConjecture.basicOpen`: Form (i) for given (𝒞, H).
- `LWZBConjecture.moment`: Form (ii) for given H.
- `totallyRealFamily`: E_Γ(D, Q), the totally real Γ-extensions of Q with radical discriminant norm D.
- `finite_totallyRealFamily`: E_Γ(D, Q) is finite (Hermite).
- `LWZBConjecture.abelian`: Form (i) at abelian levels is the Cohen–Lenstra–Martinet prediction (u = 1) for the prime-to-Δ class groups of totally real Γ-fields ordered by radical discriminant.
- `LWZBConjecture.bostonBushHajir`: For Γ = Z/2 and Q = ℚ, form (i) at p-levels is the Boston–Bush–Hajir prediction for the p-class tower groups of real quadratic fields.

**Checks.**

- For H = 1, (ii) is the identity 1 = 1 (|Sur_Γ(X, 1)| = 1).
- Γ = Z/2, Q = ℚ, H = Z/3 with σ = −1: (ii) predicts that the average of |Sur(Cl(K)[3^∞], Z/3)| over real quadratic K ordered by radical discriminant is 1/3, i.e. the average of |Cl(K)[3]| is 4/3.
- At abelian levels, (ii) is ArithmeticStatistics ST.5 for totally real fields (every σ_v = 1, moment |H|^{−1}), with fields ordered by radical discriminant instead of discriminant.
- The proposition with E_Γ ordered by discriminant instead of radical discriminant is a different statement, and its abelian part is known to fail for Z/4-fields (Bartel–Lenstra); the ordering is part of the definition.

The proposition is well formed for every finite Γ; it is consistent with the support of μ_Γ (§6.2).

([LWZB] §1.2, pp. 2–3, the definitions before Conjecture 1.3 and Conjecture 1.3; [LWZB] §1.6, p. 9.) *Needs:* IG.4 (the supplier contract above); §4.8 Convergence of the random Γ-groups; §5.2 The moments of μ_u; `NumberField.finite_of_discr_bdd`.

### 6.2 Arithmetic admissibility, Property E and finite completions

Assume (SZ_Γ). Let K/Q be a totally real Γ-extension (Q = ℚ or F_q(t)) and 𝒞 a finite set of finite Γ-groups of order prime to Δ. (a) Gal(K^#/K)^𝒞 is a finite admissible Γ-group with Property E at level 𝒞, and the class of Gal(K^#/K) lies in 𝒫. This is a compatibility theorem with the support restrictions; it does not assert positive μ_Γ-mass for every such group or every cylinder. (b) μ_Γ(U_{𝒞,H}) = 0 unless H is admissible with Property E at level 𝒞, so form (i) of the conjecture predicts positive frequency only for groups the Galois side allows. (c) Gal(K^#/K)^ab is the prime-to-Δ part of the class group (Cl(O_K) for Q = ℚ; the prime-to-q(q−1)|Γ| part of Cl(O_K), O_K the integral closure of F_q[t], for Q = F_q(t)); hence at abelian levels form (i) is the Cohen–Lenstra–Martinet prediction with u = 1 (§5.4).

Assume (SZ_Γ); K a Γ-extension of ℚ or F_q(t); K/Q is split completely above ∞ (the totally real family of Conjecture 1.3).

(a) Admissibility is LWZB Proposition 2.2 and Property E for Δ′-Γ-groups is Theorem 2.5 (IG.4’s admissibility and Galois-action contract and IG.4/unramified-property-e); §1.5 (b) passes Property E to the level-𝒞 completion.

Finiteness uses smallness, not an unsupported lift of maps to quotients of 𝒞. Unramified extensions of bounded degree are finite in number (Hermite over number fields; the bounded-degree finite étale-cover statement over a finite constant field is supplied by FunctionFieldArithmetic FA.4). Therefore G = Gal(K^#/K), and every quotient of G, has finitely many open subgroups of each index. For finite 𝒞, Liu–Wood Corollary 6.13 bounds the orders of all possible chief factors of finite quotients of G^𝒞. For a maximal open subgroup, take its finite faithful primitive quotient P. A minimal normal subgroup M of P is transitive and is a chief factor allowed by the finite level. Its centralizer is semiregular, so |C_P(M)| is at most the permutation degree, which is at most |M|, and |P|≤|M||Aut(M)|. Thus all maximal open subgroups of G^𝒞 have bounded index. There are finitely many by smallness, making the Frattini subgroup open. Lift generators of the finite Frattini quotient; a proper closed subgroup lies in a maximal open subgroup, so the lifts generate G^𝒞. Apply §1.1's finite-word-function argument to conclude G^𝒞 is finite. This works for every finite level, placing G in 𝒫 without asserting G itself is finitely generated.

(b) is the support clause of §4.8.

(c) is class field theory: the maximal unramified abelian extension split completely at the infinite places is the Hilbert class field (ClassFieldTheory Layer 12) or, over F_q(t), the extension with Galois group Cl(O_K) (FunctionFieldArithmetic:FA.4); restrict to the prime-to-Δ part.

For Γ = Z/2 and Q = ℚ, Gal(K^#/K)^ab is the odd part of the class group of the real quadratic field K, and its abelian level-3 predictions are the u = 1 Cohen–Lenstra probabilities. For Γ = Z/2, p = 3 and H = F_3² with σ = −1, at the finite level of the Layer 3 counterexample no totally real Γ-field has Gal(K^#/K)^𝒞 ≅ H, consistently with μ_Γ(U_{𝒞,H}) = 0. The full infinite class of 3-class ≤2 groups uses V_{𝒞,H}.

([LWZB] §2, Proposition 2.2 and Theorem 2.5, pp. 10–13; [LWZB] §1.2, p. 3, and §1.5, p. 6; [LW20] Corollary 6.13, p. 14.) *Needs:* IG.4 (the supplier contract above); §1.5 Property E relative to a level: restriction and completion; §4.8 Convergence of the random Γ-groups; §5.4 The abelianization: the Cohen–Lenstra–Martinet distribution; §6.1 The Liu–Wood–Zureick-Brown conjecture; ClassFieldTheory (the supplier contract above); FunctionFieldArithmetic FA.4; `NumberField.finite_of_discr_bdd`; §4.1 Chief factor pairs of finite groups; §1.1 Level-𝒞 closure and the pro-𝒞 completion of a Γ-group; ArithmeticGaloisDuality R02.3.

### 6.3 Function-field moments agree with the moments of μ_Γ

Assume (SZ_Γ). Let H be a finite admissible Γ-group and q range over prime powers with gcd(q, |Γ||H|) = 1 and gcd(q − 1, |H|) = 1. The function-field moment theorem ArithmeticStatistics ST.5 gives lim_{b→∞} limsup_{q→∞} R_b(q) = lim_{b→∞} liminf_{q→∞} R_b(q) = [H : H^Γ]^{−1} for the averages R_b(q) of |Sur_Γ(Gal(K^#/K), H)| over E_Γ(q^n, F_q(t)), n ≤ b. By §5.2 this common value is ∫|Sur_Γ(X, H)| dμ_Γ(X). Hence form (ii) of the conjecture holds over F_q(t) in the iterated limit, q → ∞ first, for every such H; for abelian H with H^Γ = 1 this is the Cohen–Lenstra–Martinet moment |H|^{−1} of ArithmeticStatistics ST.5.

Assume (SZ_Γ) (ST.5 states the moment theorem under the same hypothesis); the coprimality conditions on q.

Read the right side of the ST.5 theorem, [H : H^Γ]^{−1}.

Identify it with the μ_Γ-moment by §5.2 with u = 1.

The inner limit in q is read with lim sup and lim inf, because the existence of lim_{q→∞} R_b(q) is not proved (ST.5 records this).

Γ = Z/2, H = Z/3 with σ = −1: the iterated function-field average of |Sur(Cl(O_K), Z/3)| is 1/3 = ∫|Sur_Γ(X, Z/3)|dμ_Γ. The comparison is an identity of numbers; it asserts nothing about the number-field case of the conjecture.

([LWZB] Theorem 1.4 and Corollary 1.5, pp. 3–4.) *Needs:* ArithmeticStatistics ST.5; §5.2 The moments of μ_u; §6.1 The Liu–Wood–Zureick-Brown conjecture.

### 6.4 p-class tower groups occur in the model

Assume (SZ_Γ). Let K/Q be a totally real Γ-extension (Q = ℚ or F_q(t)) and p ∤ Δ a prime with μ_p ⊄ K. Let G_{K,p} be the maximal pro-p quotient of Gal(K^#/K) (the Galois group of the maximal unramified pro-p extension of K split completely above ∞) and G̃_{K,p} the Galois group of the maximal unramified pro-p extension of K. (Lemma 3.17) For the presentations ρ : F → G̃_{K,p} of [LWZB] §3.3 (F = (F_n)_p over ℚ, F = (F_{n+1})_p over F_q(t), the extra generator mapping to a decomposition group at an infinite place), N = ker ρ and N* = [N, F]N^p, there is an F_p[Γ]-surjection F_p[Γ]^{n+1} → N/N*. (Proposition 3.22) If n is so large that G_{K,p} = [Y({h_1, …, h_n})] for some h_i ∈ G_{K,p}, then G_{K,p} ≅ (𝓕_n)_p/[Y(S)] for a tuple S∈((𝓕_n)_p)^{n+1}, with repetitions allowed. So every p-class tower group of a totally real Γ-field is of the shape of the random groups X_{1,n}.

Assume (SZ_Γ); p ∤ Δ; μ_p ⊄ K; K/Q is split completely above ∞ (the totally real family of Conjecture 1.3).

G_{K,p} is finitely presented and admissible (Koch, Chapter 11; IG.4/unramified-gamma-groups), so the h_i exist for n large.

Lemma 3.17: by the five-term sequence (ProfiniteCohomology Layer 5) and H²(F, F_p) = 0 for free pro-p F (ProfiniteProPGroups Layer 5), (N/N*)^∨ = H¹(N, F_p)^F is an extension of H²(G̃_{K,p}, F_p) by the image of restriction, which is (N/(N ∩ Φ(F)))^∨; F_p[Γ] is semisimple, so it splits.

Use the Γ-equivariant ArithmeticGaloisDuality contract: H²(G̃_{K,p},F_p) embeds in (V/K^{×p})^∨. Over number fields V/K^{×p} is an extension of Cl(O_K)[p] by units mod p; the unit module embeds in the augmentation quotient of F_p[Γ]. Semisimplicity identifies the class-group p-torsion and mod-p modules and cancels their dual constituents against H¹(G̃_{K,p},F_p) in the five-term sequence. The regular module F/Φ(F) plus one augmentation quotient then bounds (N/N*)^∨ constituent by constituent, yielding F_p[Γ]^{n+1} → N/N*. Over function fields use complete-curve constants and Pic(C_K)[p], with the p-adically completed Picard group in unramified abelianization; the degree component contributes a trivial module to H¹. Constant units mod p vanish under μ_p ⊄ K, so regular rank n + 1 suffices. Affine O_K-units have rank |Γ| − 1 and cannot be replaced by constants. The required equivariant duality, unit-module and complete-curve inputs are the supplier contracts stated above.

Proposition 3.22: G_{K,p} has Property E for pro-p Γ-groups (Theorem 2.5 with §1.5 (c)), so R = ker ϖ = [Y(R)] by §1.6 and (R/R*)^Γ = 0; the surjection of Lemma 3.17 then factors through (F_p[Γ]/(Σg))^{n+1} → R/R*, which is Γ-generated by Y-coordinates of n + 1 elements; lift them to a tuple S in R (generation theory: elements generate R as a closed normal subgroup iff their images generate R/R*, ProfiniteProPGroups Layer 5).

For Γ = Z/2, Q = ℚ and p odd with K real quadratic, the 3-class tower group of K is a quotient of (𝓕_n)_3 ≅ the free pro-3 group of rank n (σ inverting the generators) by n + 1 Y-relations. The conclusion is about the shape of G_{K,p}; it does not assert that G_{K,p} is finite.

([LWZB] §3.3, Lemma 3.17 and Proposition 3.22 with proofs, pp. 17–20.) *Needs:* IG.4 (the supplier contract above); §1.5 Property E relative to a level: restriction and completion; §1.6 Property E as the shape of the relations; §1.3 The free admissible Γ-group 𝓕_n; ProfiniteProPGroups (the supplier contract above); ProfiniteCohomology (the supplier contract above); ArithmeticGaloisDuality R02.3; ClassFieldTheory (the supplier contract above); FunctionFieldArithmetic FA.4.

### Examples

For real quadratic fields Γ=C₂ and odd p, the marked Γ-action on the odd part of the class group is inversion. The model's moment for C₃ is 1/3, and the corresponding 3-torsion expectation is 4/3. This identifies the numerical prediction, while the distribution conjecture remains a proposition. For Γ=1 the free admissible group is trivial; the prescribed relation tuples can still have length n+1 because repetitions are allowed.

### Dependencies

Layers 0–5; ArithmeticStatistics ST.5, IG.4, ArithmeticGaloisDuality R02.3, ClassFieldTheory Layer 12 and FunctionFieldArithmetic FA.4 through the exact contracts above. The group-theoretic assertions carry (SZΓ); the function-field comparison has its stated restrictions on q and q−1.

## Downstream consumers

ArithmeticStatistics uses the explicit group-valued model to refine its abelian class-group heuristics. IG.4 uses the admissibility and Property E comparisons to distinguish possible unramified Γ-groups from groups that have zero mass at an obstructing finite level. The p-class tower interface identifies the Boston–Bush–Hajir distributions as projections of one measure rather than unrelated rank-conditioned models. The arithmetic conjecture concerns the indicated field families and ordering; it is not an additional input to any probability theorem above.

## References

- [LWZB] Yuan Liu, Melanie Matchett Wood and David Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions*, [arXiv:1907.05002v2](https://arxiv.org/abs/1907.05002v2), Part I, §§1–7, printed pp. 1–37. The locators here refer to this version, rather than the differently paginated journal article.
- [LW20] Yuan Liu and Melanie Matchett Wood, *The free group on n generators modulo n+u random relations as n goes to infinity*, [arXiv:1708.08509v2](https://arxiv.org/abs/1708.08509v2), §§2–9, Lemmas 11.3 and 12.5.
- [RZ10] Luis Ribes and Pavel Zalesskii, *Profinite Groups*, second edition, Springer, 2010, [Theorem 2.3.15, pp. 40–41](https://doi.org/10.1007/978-3-642-01642-4). The coprime-conjugacy hypothesis records the finite theorem's logical input separately.
- [BW17] Nigel Boston and Melanie Matchett Wood, *Nonabelian Cohen–Lenstra Heuristics over Function Fields*, [arXiv:1604.03433v2](https://arxiv.org/abs/1604.03433v2), §3, pp. 5–7, and Lemma 4.8, pp. 10–11.
- [BBHREAL] Nigel Boston, Michael R. Bush and Farshid Hajir, *Heuristics for p-class towers of real quadratic fields*, [arXiv:1803.04047v1](https://arxiv.org/abs/1803.04047v1), Definitions 2.1–2.3, p. 2, Lemma 2.8, p. 5, Theorem 2.22, pp. 9–11, and §3, pp. 13–14.
- [WW] Weitong Wang and Melanie Matchett Wood, *Moments and interpretations of the Cohen–Lenstra–Martinet heuristics*, [arXiv:1907.11201v2](https://arxiv.org/abs/1907.11201v2), §§3.2–3.3, pp. 6–7, Theorem 4.1, pp. 8–9, and Proposition 6.6, p. 13.
````

## Payload: Suggested.lean

````lean
import Mathlib
import TauCeti.RepresentationTheory.Compact.Haar

/-!
# ArithmeticStatisticsPartIIRandomGammaGroups: representative target signatures

The roadmap is README.md. This file records light definitions and representative theorem
signatures statable against the pinned APIs; it is not exhaustive. The map `Y` uses all elements
of the acting group, its fibres are right cosets of the fixed subgroup, and coprime conjugacy is
an explicit hypothesis. Free groups, level completions, the space of groups and its probability
measures are specified in the README rather than represented by unconstructed carriers here.
-/

namespace TauCetiRoadmap.ArithmeticStatisticsPartIIRandomGammaGroups

open MeasureTheory Filter Topology

/-! ## Layer 0: Γ-actions, Y and coprime sections -/

section Actions

variable (Γ : Type*) [Group Γ] (G : Type*) [Group G] [MulDistribMulAction Γ G]

/-- The principal crossed homomorphism attached to `g`, indexed by every element of `Γ`. -/
def yMap (g : G) : Γ → G := fun γ => g⁻¹ * (γ • g)

/-- The finite equivariant surjection count; all maps between finite discrete groups are continuous. -/
noncomputable def countSur (H : Type*) [Group H] [MulDistribMulAction Γ H] : ℕ :=
  Nat.card {f : G →*[Γ] H // Function.Surjective f}

/-- The number of equivariant endomorphisms of a finite operator group. -/
noncomputable def hEnd : ℕ := Nat.card (G →*[Γ] G)

/-- The closed normal subgroup generated by the full `Γ`-orbit of `S`. -/
def closedNormalClosure [TopologicalSpace G] [IsTopologicalGroup G] (S : Set G) : Subgroup G :=
  (Subgroup.normalClosure (⋃ γ : Γ, (fun g => γ • g) '' S)).topologicalClosure

/-- Twisted multiplicativity of `Y`, with conjugation by the second argument. -/
theorem yMap_mul (g h : G) (γ : Γ) :
    yMap Γ G (g * h) γ = h⁻¹ * yMap Γ G g γ * h * yMap Γ G h γ := by
  sorry

/-- The fibre through `g` is the right coset `G^Γ g` (LWZB Lemma 3.5). -/
theorem yMap_eq_yMap_iff (g h : G) :
    yMap Γ G g = yMap Γ G h ↔ h * g⁻¹ ∈ FixedPoints.subgroup Γ G := by
  sorry

/-- The index of the fixed subgroup counts the `Y`-values in a finite group. -/
theorem card_eq_card_fixedPoints_mul_card_range_yMap [Finite G] :
    Nat.card G = Nat.card (FixedPoints.subgroup Γ G) * Nat.card (Set.range (yMap Γ G)) := by
  sorry

/-- Normal `Γ`-closure is characterized by containment in closed normal `Γ`-subgroups. -/
theorem closedNormalClosure_le_iff [TopologicalSpace G] [IsTopologicalGroup G] (S : Set G)
    (N : Subgroup G) [N.Normal] (hN : IsClosed (N : Set G))
    (hΓ : ∀ γ : Γ, ∀ n ∈ N, γ • n ∈ N) :
    closedNormalClosure Γ G S ≤ N ↔ S ⊆ N := by
  sorry

end Actions

section Conjugacy

variable (Γ : Type*) [Group Γ] [Finite Γ]

/-- `(SZΓ)`: every crossed homomorphism into a finite coprime `Γ`-group is principal. -/
def CoprimeH1Trivial : Prop :=
  ∀ (N : Type) [Group N] [Finite N] [MulDistribMulAction Γ N],
    Nat.Coprime (Nat.card N) (Nat.card Γ) →
    ∀ c : Γ → N, (∀ σ τ : Γ, c (σ * τ) = c σ * σ • c τ) →
      ∃ g : N, ∀ σ : Γ, c σ = g⁻¹ * σ • g

/-- Solvable complements give coprime conjugacy without an odd-order theorem. -/
theorem coprimeH1Trivial_of_isSolvable [Group.IsSolvable Γ] : CoprimeH1Trivial Γ := by
  sorry

/-- Averaging proves the abelian-kernel case for every finite acting group. -/
theorem crossedHom_principal_of_commGroup (N : Type*) [CommGroup N] [Finite N]
    [MulDistribMulAction Γ N] (hN : Nat.Coprime (Nat.card N) (Nat.card Γ)) (c : Γ → N)
    (hc : ∀ σ τ : Γ, c (σ * τ) = c σ * σ • c τ) :
    ∃ g : N, ∀ σ : Γ, c σ = g⁻¹ * σ • g := by
  sorry

/-- Under coprime conjugacy the section count is the `Y`-image cardinality. -/
theorem CoprimeH1Trivial.card_sections (hSZ : CoprimeH1Trivial Γ) (H : Type)
    [Group H] [Finite H] [MulDistribMulAction Γ H]
    (hH : Nat.Coprime (Nat.card H) (Nat.card Γ)) :
    Nat.card {c : Γ → H // ∀ σ τ : Γ, c (σ * τ) = c σ * σ • c τ} =
      Nat.card (Set.range (yMap Γ H)) := by
  sorry

/-- Fixed points are right exact for finite coprime extensions (LWZB Lemma 3.6). -/
theorem CoprimeH1Trivial.fixedPoints_surjective (hSZ : CoprimeH1Trivial Γ)
    {G H : Type} [Group G] [Group H] [Finite G] [MulDistribMulAction Γ G]
    [MulDistribMulAction Γ H] (hG : Nat.Coprime (Nat.card G) (Nat.card Γ))
    (π : G →*[Γ] H) (hπ : Function.Surjective π) :
    ∀ h ∈ FixedPoints.subgroup Γ H, ∃ g ∈ FixedPoints.subgroup Γ G, π g = h := by
  sorry

end Conjugacy

section Checks

/-- The cyclic group of order three; its automorphism group acts by identity and inversion. -/
abbrev C3 := Multiplicative (ZMod 3)

/-- The cyclic group of order four; its inversion action supplies a noncoprime control. -/
abbrev C4 := Multiplicative (ZMod 4)

example : hEnd (MulAut C3) C3 = 3 := by sorry
example : countSur (MulAut C3) C3 C3 = 2 := by sorry
example : countSur (MulAut C3) C3 PUnit = 1 := by sorry
example : Nat.card (Set.range (yMap (MulAut C3) C3)) = 3 := by sorry
example (σ : MulAut C3) (hσ : ∀ g, σ g = g⁻¹) :
    yMap (MulAut C3) C3 (Multiplicative.ofAdd 1) σ = Multiplicative.ofAdd 1 := by sorry
example : Nat.card (FixedPoints.subgroup (MulAut C4) C4) = 2 := by sorry
example : Nat.card (Set.range (yMap (MulAut C4) C4)) = 2 := by sorry
example : closedNormalClosure (MulAut C3) C3 ({Multiplicative.ofAdd 1} : Set C3) = ⊤ := by
  sorry
example : closedNormalClosure (MulAut C3) C3 (∅ : Set C3) = ⊥ := by sorry
example : CoprimeH1Trivial (MulAut C3) := by sorry
example : CoprimeH1Trivial PUnit := by sorry
example : ¬ ∃ g : Multiplicative (ZMod 2), ∀ σ : Multiplicative (ZMod 2), σ = g⁻¹ * g := by
  sorry
example : ¬ ∀ g h : Equiv.Perm (Fin 3),
    yMap (MulAut (Equiv.Perm (Fin 3))) (Equiv.Perm (Fin 3)) (g * h) =
      yMap (MulAut (Equiv.Perm (Fin 3))) (Equiv.Perm (Fin 3)) g *
      yMap (MulAut (Equiv.Perm (Fin 3))) (Equiv.Perm (Fin 3)) h := by
  sorry

end Checks

/-! ## Layer 1: Level completions and free admissible groups -/

/-! ## Layer 2: The space of groups and random quotients -/

/-- A continuous finite quotient sends normalized Haar measure to uniform probability. -/
theorem map_haarProb_uniform {G Q : Type*} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [MeasurableSpace G] [BorelSpace G]
    [Group Q] [Finite Q] [TopologicalSpace Q] [DiscreteTopology Q] [MeasurableSpace Q]
    [MeasurableSingletonClass Q] (f : G →* Q) (hf : Continuous f)
    (hs : Function.Surjective f) :
    Measure.map f (TauCeti.haarProb G) = ProbabilityTheory.uniformOn Set.univ := by
  sorry

/-! ## Layer 3: Operator groups, extensions and finite-level probabilities -/

/-- The truncated products converge continuously in their parameter (LW Lemma 8.11). -/
theorem exists_tendsto_prod_one_sub {a : ℝ} (ha : 1 < a) :
    ∃ F : ℝ → ℝ, Continuous F ∧ ∀ (x : ℕ → ℝ) (x₀ : ℝ) (y : ℕ → ℕ),
      Tendsto x atTop (𝓝 x₀) → Tendsto y atTop atTop →
      Tendsto (fun n => ∏ i ∈ Finset.Icc 1 (y n), (1 - x n * (a ^ i)⁻¹))
        atTop (𝓝 (F x₀)) := by
  sorry

/-! ## Layer 4: Chief factors, no escape of mass and the limit measure -/

/-- A minimal nontrivial normal subgroup, before retaining its ambient conjugation action. -/
def IsMinimalNormal {G : Type*} [Group G] (N : Subgroup G) : Prop :=
  N.Normal ∧ N ≠ ⊥ ∧ ∀ M : Subgroup G, M.Normal → M ≤ N → M = ⊥ ∨ M = N

/-- Every nontrivial normal subgroup of a finite group contains a minimal normal subgroup. -/
theorem exists_isMinimalNormal_le {G : Type*} [Group G] [Finite G] (N : Subgroup G)
    [N.Normal] (hN : N ≠ ⊥) : ∃ M : Subgroup G, IsMinimalNormal M ∧ M ≤ N := by
  sorry

example : IsMinimalNormal (⊤ : Subgroup C3) := by sorry
example : ¬ IsMinimalNormal (⊥ : Subgroup C3) := by sorry
example : ¬ IsMinimalNormal (⊤ : Subgroup C4) := by sorry

/-! ## Layer 5: Moments, abelianization and p-class towers -/

/-! ## Layer 6: Arithmetic distribution and the Galois interface -/

/-
The README specifies the Γ-group morphism bundle; levelClosure, levelCompletion and IsOfLevel;
freeGammaGroup and freeAdmissible; GammaGroupSpace and its cylinders; RandomGammaGroup and its
law; fundamentalSES and multiplicity; HExtension and its incidence function; lambdaInv;
ChiefSeries, ChiefFactorPair and gammaChiefFactors; limitMeasure; the equivariant p-cover,
nucleus and nuclearRank; and LWZBConjecture with its marked field families. Their full APIs,
checks and theorem statements remain in the README. Their constructions require carriers and
interfaces beyond the pinned APIs.
-/

end TauCetiRoadmap.ArithmeticStatisticsPartIIRandomGammaGroups
````

## Payload: metadata.toml

````toml
topic = "math.NT"
````
