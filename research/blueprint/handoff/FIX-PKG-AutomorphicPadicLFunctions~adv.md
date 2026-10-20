# FIX-PKG-AutomorphicPadicLFunctions~adv — checkpoint

Issue #11493; Codex, session `codex-YWjgf5`; 20 October 2026.
Verdict: **needs_changes**. This is a partial fix checkpoint, not an
independent review or a completed repair. The claim bot confirmed this
session in [issue comment 6298527275](https://github.com/CBirkbeck/tauceti-explorer/issues/11493#issuecomment-6298527275).
Only this issue was claimed.

The new result is a computed integral comparison between the self-dual
L(0) and L(1) normalizations in README 3h.8 and 3h.8a. Conjugation and a
norm twist supply the comparison directly. The previous checkpoint's
proposed functional-equation bridge was unnecessarily indirect. The new
3h.8b includes its CM-period convention, full unit index, depletion factor,
local defects and precise torsion-free cofinite consequence. None of this
supplies the missing general non-self-dual or residual-irreducible
automorphic cofinite argument.

Completion is blocked by unverified general cofinite proofs, the still
uncomputed integral EHLS/Katz dictionary and supplier incorporations absent
from their lower owners. Those owners and packets are outside this job's
four permitted files. No target has been weakened to obtain acceptance.

## Finding → change

| Confirmed finding | Change and remaining boundary |
| --- | --- |
| General automorphic rank-one cofiniteness, 3h.7 | Retained `hsieh_centralValues_cofinite_rankOne` with the residual-irreducibility and local hypotheses. Rechecked Hsieh 2014 Theorem 7.1, pp. 759–760, and the revised Hida Theorem 5.2, pp. 28–29. BHTY's Theorem 4.15 explicitly takes a CM theta representation, and Theorem 5.7 takes a self-dual Hecke character. Neither provides the absolutely irreducible restriction to G_M required here. **Unresolved.** |
| Hecke rank-one cofiniteness, 3h.8 | Replaced `selfDualHeckeValue_functionalEquationComparison` by `selfDualHeckeValue_conjugationComparison`, with a direct integral identity and `selfDualHeckeValues_LZero_cofinite_rankOne`. This advances the positive-root-sign self-dual case on the torsion-free degree-one split tower. Added the distinct `selfDualHeckeValues_finiteBranchTransfer` obligation. The full `HeckeValues_cofinite_rankOne`, including its non-residually-self-dual branch and all required finite branches, is **unresolved**. |
| EHLS/Katz integral comparison, 5.2 | Re-read the source interpolation and period framework. Preserve the previous checkpoint's named ray, character, local-section, pairing-lattice and family-ideal obligations. No computed dictionary or unit follows from the introductory n=1 comparison. **Unresolved; no new assertion inserted.** |
| Lower-owner closure | Rechecked PadicFamilies 5.10 and ALS's generic cochain/comparison contracts. The twenty DR/Katz construction incorporations, ordinary finite-field classification, full dyadic ideal-space refinement and source-specific BSW rational-period compatibility remain necessary. Preserve the separate arithmetic CM-orbit supplier request. **Unresolved outside the permitted edits.** |
| Existing-library overlap in the new comparison | Cite the pinned CM-unit homomorphism, its kernel, subgroup index/cardinality and roots-of-unity reduction results instead of planning that theory. Add five `#check`s for these actual declarations. The Hasse unit index is explicitly distinguished from the full unit index in the special value. **Resolved for the new comparison.** |

The earlier review's avatar signs, level distinction, Hilbert cusp signs,
weight tests, dyadic counts, corrected density, second Katz chamber, EHLS
arithmetic pairs, EW hypotheses and typed anticyclotomic quotient are
preserved. The prior checkpoint's non-residual-self-duality correction is
also preserved. No packet, metadata, reader document, lower package or
previous handoff was edited.

## The normalization computation

Use the notation of README 3h.8b. Hsieh's self-dual restriction gives
χχ^c=|·|_M. A ring-class twist ν is trivial on A_F×, hence ν^c=ν⁻¹.
For λ=χ⁻¹ this identifies λν⁻¹ with (χν)^c|·|_M⁻¹. The Euler-factor
norm shift therefore gives L(1,λν⁻¹)=L(0,χν). Conjugation permutes the
finite primes; it introduces no epsilon or conductor factor. This is a
derivation from the supplier identities, not a newly cited theorem of
Tate's thesis. The archimedean restriction forces k=1, and λ has the
negative infinity type used by BHTY.

Both sources use the CM period of an algebraic differential. Fix the same
CM abelian scheme, a differential nonvanishing integrally at p and the
uniformization by C^Σ/Σ(a). The component period is the ratio of that
differential to the coordinate differential dzσ. Hida–Tilouine (4.4b),
p. 211, and Katz (5.1.45)–(5.1.48), p. 269, specify this normalization;
Hsieh §5.1, (5.2), p. 18, points to precisely those conventions. BHTY
§1.2.1, (1.2), p. 3, uses the CM period of such an integral differential.
Thus both gamma products and period exponents agree for this common
choice. Independent period tuples require their explicit weight-dependent
ratio. Neither π nor a complex period is transported to C_p individually.

With conductor prime to p, the selected p-Gauss factors are all 1. If Aχ
denotes Hsieh's depleted algebraic value, Bλ denotes the value of 3h.8a,
I_M=[OM×:OF×] and E𝔩 is the product of the omitted reciprocal Euler
factors, the exact identity is

```text
E𝔩(χν,0) Bλ(ν⁻¹) = I_M Aχ(ν).
```

This identity never divides by E𝔩. The map u↦u/c(u) identifies the unit
quotient with a subgroup of the roots of unity. Because p is odd,
unramified in F and ordinary for M/F, the pinned reduction theorem makes
that torsion order prime to p. Thus I_M is a p-unit. Inversion preserves
the nonsplit local defects because the relevant local character values
are p-units. At high conductor both components above the split 𝔩 are
ramified and E𝔩=1. The unitary characters on the two sides are conjugate,
so their global root numbers agree for the trace additive character.

Consequently BHTY Theorem 5.7, pp. 37–38, and Lemma 4.12, pp. 26–27,
give the stated eventual valuation of Aχ on the torsion-free tower when
the untwisted root sign is +1 and [F_𝔩:Q_ℓ]=1. Valuation prime 3 is
allowed here; 2 is excluded. This comparison imposes conductor prime to p
and a split tower prime as in the earlier Hsieh application; it does not
shrink the separate full CM-field theorem in 3h.8a. Retain Theorem 5.6's
factor 2 in the squared period relation when following the source proof,
as already recorded in the previous handoff.

For the full maximal pro-ℓ ring-class group, write G≃Δ×Γ only after
choosing a splitting and retaining its finite torsion Δ. Applying the
comparison to χρ on each finite branch ρ requires checking its root sign,
conductor and local-defect hypotheses. A finite union of finite exceptional
sets suffices once all those checks hold; the present result on Γ alone
does not perform them. At ℓ=2, conjugate inversion alone does not imply
triviality on all included base-field ideles.

## Adversarial pass on the touched statements

| Statement or convention | Instances computed or excluded | Result / change |
| --- | --- | --- |
| CM unit quotient and reduction supplier paragraph | Q(i): full index 2, Hasse index 1; Q(ζ₃): full index 3; odd unramified prime versus ramified 3 | The full index is required. Its p-unit proof uses the actual unramified reduction hypothesis. No new CM-unit definition. |
| Self-duality and k=1 | Positive real scalar t: restriction t^(−2k) versus t⁻²; κ=0,1 | k=1 is forced. The inverse type is (−1−κ,κ), matching 3h.8a. A general k cannot be inserted in this self-dual comparison. |
| Conjugation, norm shift and inverse twist | At norm 5, λ-values −1±2i; χ=λ⁻¹; untwisted local pair and local twist (−1,−1) | Correct local L-factors are 5/8 and 5/4 respectively on both sides; the unshifted λ-factor is 1/8. The local twist test makes no assertion that it belongs to a particular global tower. |
| Period convention and scale | κ=0,1 gives exponents 1,3; common scale a; independently scaled tuple; zero differential | Both values change by the same product of a's embedding powers for a common differential. Independent tuples need the extra ratio. Zero excluded; a nonunit scale cannot preserve a unit conclusion. |
| Selected p-Gauss factors | Unramified λ and ν versus a ramified p-character | They equal 1 only under the stated prime-to-p conductor hypothesis. The general ramified normalization in 3h.8a is retained. |
| Depleted/primitive identity | The CM curve y²=x³−x has 8 points over F₅ and 40 over F₂₉, traces −2 and −10; E₂₉=40/29 has v₅=1 | Corrected the potential inference that depletion always preserves valuation. ν=1 can be exceptional. At high ramification E𝔩=1. No arbitrary Euler-zero input is presented as an actual pure self-dual character. |
| Inverse local defect | Unit value a, a=1 and a=1+p; uniformizer away from p | a⁻¹−1=−(a−1)/a gives equal valuations, including ∞ at 1. A nonunit a would fail the argument and is excluded by self-duality at nonsplit primes. |
| Root number comparison | Trace additive character, conjugate local places; sign +1 versus −1 | Root numbers agree under conjugation. The cofinite conclusion explicitly retains sign +1; it makes no unit assertion on a sign −1 branch. |
| `selfDualHeckeValues_LZero_cofinite_rankOne` | Split degree-one tower; degree >1; ν=1; p=2 and p=3; zero value | Theorem 5.7 applies on the cofinite root-sign set; ν=1 can be exceptional. Degree >1 and p=2 excluded. p=3 permitted with sign +1. Zero has infinite valuation, so is not a finite-defect solution. |
| `selfDualHeckeValues_finiteBranchTransfer` | G=Z_ℓ; G=Z_ℓ×Z/ℓZ; branches with changed root sign or defects | Trivial Δ gives the proved comparison case. With nontrivial Δ all ℓ branches must be checked. Their conditions remain an explicit obligation, not an automatic extension. |
| Rank, compactness and coefficient domains | Trivial tower/rank 0; q=1; noncompact group; characteristic p or equal-characteristic DVR; ramified mixed-characteristic coefficient extension | The number-field/torsion-free degree-one tower hypotheses exclude rank 0 and q=1. No statement about noncompact or characteristic-p special-value carriers. The valuation is normalized by v_p(p)=1, so a ramified coefficient field does not change the comparison. |
| Density versus cofiniteness paragraph | Infinite proper subsets of rank-one torsion points; CM-induced representation restricted to G_M | Neither density nor infinite nonvanishing bounds the exceptional set. CM induction has reducible restriction and cannot replace the general π target. Both strong targets remain. |
| Five added Lean library checks | Read their pinned types, then elaborate them; no new variables or `include` blocks | Names resolve with their actual hypotheses. No sorry'd carriers, scalar substitutes, new definitions or examples were added. Existing nine definitions and eighteen proved examples are unchanged. |

The point counts and rational Euler factors above were independently
computed in disposable scratch. They are mathematical witnesses for the
roadmap's conventions, not new implementation tests. These heavy Hecke
special-value carriers do not exist at the pins, so their Checks remain
in the README as required by the current package shape.

## Exact residue and owner requests

1. **General cofinite proofs.** Supply an independent result matching
   `hsieh_centralValues_cofinite_rankOne` and the non-residually-self-dual
   part of `HeckeValues_cofinite_rankOne`. Hida's 27 March 2025 Theorem 5.2
   proves density, and Corollary 5.3 constrains bad levels; neither proves
   finiteness. Wei He version 2, Theorem 1.5, pp. 2–3, also gives density;
   §1.4, p. 4, distinguishes the general strong stability problem. BHTY
   Theorem 6.1, p. 38, gives infinite nonvanishing in the remaining branch.
   Complete the finite-branch transfer above wherever the full target uses
   G rather than Γ. Hung's 2017 JNT paper, DOI
   [10.1016/j.jnt.2016.09.013](https://doi.org/10.1016/j.jnt.2016.09.013),
   remains an unverified lead: the public publisher PDF was inaccessible
   and the institutional thesis endpoint timed out. Its abstract does not
   establish matching hypotheses or an independent proof.
2. **Integral rank-one dictionary.** Compute
   `unitaryRankOne_rayMap`, `unitaryRankOne_characterShift`,
   `unitaryRankOne_localSections`, `unitaryRankOne_periodLattice` and
   `unitaryRankOne_comparisonIdeal` before asserting
   `unitaryRankOne_KatzComparison`. The README retains the actual EHLS
   integral pairing lines and congruence factor. EHLS Theorem 4.6.1 and
   Remark 4.6.2, pp. 78–79, specify local/archimedean factors; §6.7 gives
   the integral lattice framework; Main Theorem 9.2.2, pp. 144–145, does
   not compute this chosen Katz dictionary. A pointwise field-valued
   comparison does not identify the family fractional ideal or make it a
   unit. No guessed correction or norm-half formula was inserted.
3. **Maintainer coordination with lower owners.** The exact twenty
   PadicFamilies incorporation rows are preserved in the previous
   [checkpoint's owner table](FIX-PKG-AutomorphicPadicLFunctions~adv1.md#lower-owner-incorporation-requests)
   and the README supplier contracts. They include the full
   `ordinaryDeligneModule` finite-field classification and the compactified
   ideal-space parity/Artin refinement at p=2. PadicFamilies 5.10 only
   supplies a more restricted coefficient-family/parallel-weight API.
   ALS already owns generic cochains, Hecke correspondences and de Rham
   comparisons; add only `bswESHComparison` with its coefficient-dual,
   Weyl/sign, rational-period and descent compatibilities. The additional
   BHTY `cmShimuraSet_nonEisenstein` / `cmShimuraSet_toricCofinite` chain
   still needs an arithmetic CM-orbit equidistribution and norm-fibre
   separation supplier (Theorem 4.1, Lemma 4.2 and Proposition 4.5,
   pp. 21–23). Generic ordinary-tower density does not supply it. No owner
   was edited or told to depend upward on this package.

## Library and upstream audit

Read the reviewed library-coverage entries for this package and the
PadicMeasuresIwasawaAlgebras exemplar. Rechecked the current
GlobalNumberFields and ProfiniteArithmetic roadmaps, the lower-owner
contracts and current library objects read-only. Audit commits are
TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and current Mathlib
`6b7abb3c7686292736be2955bd3eb9ebf63b456a`. No Lake command was run in
those checkouts. General Hecke-character and ray-group APIs are consumed;
they do not provide the special-value comparison.

Elaboration uses the separate required pins: Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Read the declarations in
Mathlib's `NumberTheory/NumberField/CMField.lean`,
`NumberTheory/NumberField/Ideal/Basic.lean`, `GroupTheory/Index.lean` and
`GroupTheory/Coset/Card.lean`. The kernel is `realUnits`; subgroup index
is the range cardinality, which divides the torsion cardinality; the
reduction result requires a prime unramified over Z with odd residue
characteristic. These are existing suppliers, not new targets. The five
added `#check`s pin precisely that proof route.

## Validation

- Available memory was 80 GB before the single `lean-check`, above the
  20 GB threshold. It exited 0 with only the same two existing `sorry`
  warnings, at lines 40 and 186. No language server or build was started.
  Suggested.lean has 248 lines, nine real-bodied definitions, three
  theorems and eighteen proved examples.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicPadicLFunctions.json`
  reported zero errors and zero warnings for the unchanged 105-node
  packet. It does not certify the new mathematics.
- `python3 research/blueprint/intake.py check-files` on the four permitted
  files reported `4 file(s), 0 problem(s)`. `git diff --check` passed.
  Only the four permitted deliverables changed.

## Source provenance and resume point

The following primary-source PDFs were inspected on 20 October 2026. The
hashes identify the bytes, including unversioned revisions. Only own-word
mathematical statements and locators are submitted. No private book was
needed, no source passage or source file is committed, and no suspicious
instruction was encountered or source-supplied command executed.

| Source | SHA-256 |
| --- | --- |
| [Hsieh 2012, version 1](https://arxiv.org/pdf/1208.4751v1) | `330cbaa073b6998f51647f34eff43b2c4d8293abaf236296477cc1953a9156c5` |
| [BHTY, version 2, 13 March 2026](https://arxiv.org/pdf/2508.19706v2) | `ae96c6cf8703b814488fd822f6d55111f6d251030cbd4c0dd5ec62395b62aeea` |
| [Hida–Tilouine 1993](https://www.numdam.org/item/10.24033/asens.1671.pdf) | `a0caa6b587b0120c0394704576fdcbfd2cfa9af5be00e5a98ecca2cfcd787075` |
| [Katz 1978](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0049/LOG_0014.pdf) | `2eb27c8f827fb9d71049c96ddbeee083c69824861c3878e59e865034bee26599` |
| [Hida 2025 correction](https://www.math.ucla.edu/~hida/EllrevF.pdf) | `a41b6e91efff93dd7e21c774fb790efa19ca88db1667df291d463c0111f73980` |
| [Hsieh 2014](https://emis.muni.cz/journals/DMJDMV/vol-19/24.pdf) | `a662df673725f6abbdb5b3ee272e78973c125cbc5d6fd0ba9307c790e8070718` |
| [Wei He, version 2](https://arxiv.org/pdf/2308.15051v2) | `c90cfc13af00798fe744d251cdff8380b51e7f268737e69e7baf17e7b1cfdcf6` |
| [Castella–Liu–Wan addendum](https://web.math.ucsb.edu/~castella/CLW-addendum.pdf) | `c008624ff05f61c3780f02aaddf1188f4a68ec01cfffb9f1e63bd4d994820fd9` |
| [EHLS, version 5](https://arxiv.org/pdf/1602.01776v5) | `881a496afe0a7f4707fed614a969af481ed737ae1174db1995be3164a90b9569` |

Resume at README 3h.8b and the three numbered residues above. The old
functional-equation bridge should not be reintroduced; verify the direct
conjugation comparison, then settle the missing finite branches and general
cofinite arguments. Finish the actual EHLS/Katz integral dictionary and
arrange lower-owner incorporations through the maintainer. All needed
handoff information is in the repository; disposable scratch can be
deleted after the PR opens.
