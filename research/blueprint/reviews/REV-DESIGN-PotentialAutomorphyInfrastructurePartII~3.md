# REV-DESIGN-PotentialAutomorphyInfrastructurePartII~3

**Verdict: accepted. This independent review is finished. The corrected plan remains partial.**

Issue: [#7530](https://github.com/CBirkbeck/tauceti-explorer/issues/7530). Reviewer: Codex — codex-q6ZsYs, 9 October 2026. This session wrote none of the input revision or its earlier reviews. The review covers the roadmap JSON, packet, reader document and entire suggested Lean file, including the revision demands recorded by the previous review. It is submitted as a finished review, not a checkpoint.

Every received node was checked against its stated sources, hypotheses, prerequisites, proof outline, API and tests. After the corrections below, every proposed node is verified, corrected or added with a justification. All three explicit pinned baseline citations are confirmed. No unresolved contradiction remains in the proposed forms. Acceptance does not assert the full generality of every published theorem: PL.6 and PL.7 retain precise open routes, and no layer is closed. No proof is formalized and no file is promoted by this worker.

## Inventory and scope

| Item | Received revision 3 | Reviewed |
| --- | --- | --- |
| Nodes | 90 | 92 |
| Definitions | 12 | 12 |
| Constructions | 12 | 12 |
| Theorems | 66 | 68 |
| API items | 162 | 164 |
| Unit tests | 100 | 101 |
| Planets | 35 | 35 |
| Supplier requests | 29 | 32 |
| Gaps | 15 | 17 |
| Source findings | 70 | 73 |


The node judgments are 48 verified, 42 corrected, two added and zero unverifiable. There are eight planned stages, two partial stages (PL.6 and PL.7), and zero closed stages. All 24 definition/construction nodes retain at least three tests. The 35 planets retain their target-level density; no proof was split into a list of routine lemmas. The two additions are substantive comparison theorems needed by several targets.

The packet contains 483 node source references and 109 distinct external prerequisite references: 104 supplier references, three explicit Mathlib baseline references, and two upstream roadmap references. These are ownership and scope checks, not an assertion that the suppliers' proposed results are already library declarations. The reviewed library-coverage records and the consumed supplier statements were read; missing specializations remain requests to their owners.

## Resolution of the previous review's demands

| Demand | Independent assessment and resulting behavior |
| --- | --- |
| Finite coefficient realizations | Raw automorphic data and chosen finite-E realizations are separate. Integral representations and reductions require the latter; auxiliary characters return finite continuous E′/E and compatible integral/residue maps. Containing embeddings of F is not a field-of-definition theorem. Checked BLGGT14 §2.1, pp.31–35, and Appendix A.2, pp.88–90. Corrected the remaining finite-dimensionality and retained-hypothesis omissions in the Lean interfaces. |
| Geometric lifting components | The revision's descended component witnesses require geometric-integrality certificates. Added local/coefficient finiteness and continuity, embeddings of the enlarged local field at p=l, and a geometric diagonalizability predicate allowing finite coefficient enlargement and integral realization of diagonal characters. Fixed-E diagonalizability is distinguished explicitly. Checked BLGGT14 §1.3, pp.17–24, and §1.4, pp.24–29; exact descent/comparison exports remain R08.3 requests. |
| Ordinary deformation datum and freeness | The NT21 deformation datum, local type matching, ordinary projectors and part (d) of the ordinary freeness result have their own signatures. The datum's 16 API items and three tests are retained. Added subgroup inclusion and normality for U/V diamond operators and their freeness application. Checked Tho12 §6, Lemma 6.3, p.33; NT21 §1.17, Proposition 1.22, and §6, pp.78–82. |
| Integral trace comparison | The revision retains the actual O⊕ε(E/O) coefficient ring, ε↦p^kε fixing O, characteristic-zero absolute irreducibility and integral polarized trace equivariance. Added the missing de Rham self-extension→semistable comparison and bounded-range inverse-limit input as a direct PHT request. Checked NT23 Proposition 2.7, statement pp.8–9 and proof pp.11–12, and Proposition 2.17, p.17. Residually irreducible Carayol equivalence alone does not supply this comparison. |
| Weak versus strong primitivity | General routes remain explicitly strong-primitive and partial. Added a normal-core/Clifford/averaging bridge for semisimple rank n<p, restoring the published small-rank character hypotheses, and a separate finite-image bridge when p∤n, making the strong condition stable under good extensions. Removed unsupported counterexample assertions. Checked Tho15 §5.2, Proposition 5.3, pp.57–58; ANT20 §5, Lemma 5.2, pp.16–17; NT21 Lemma 5.1, p.66, and Theorem 5.2, pp.67–69. Neither new bridge proves the general weak-primitive claims. |
| Odd-multiplier parity | The revision counts the odd local relative dimension N²−1, tangent defect −1, and extra global generator before the parity conclusion. Those contributions cancel in the global dimension comparison. Exact local and global refinements remain with L7 and G7, rather than invoking the even-only local proposition. Checked LTXZZ Definitions 3.4.8/3.5.1, Proposition 3.5.2 and Theorem 3.6.3. |
| LLHLM weights and types | The conversion λ_common=−reverse(λ_source)−(n−1) changes the numerical Hodge–Tate convention for the same representation and keeps its inertial type. The genericity polynomial is indexed by the source weight. Highest-weight duality uses a transported dual-twist lattice; it does not identify arbitrary canonical integral lattices. The automorphic normalization and K-type comparisons remain precise AF.4/AG2.0/AG2.6/L7 requests. Checked LLHLM23 §1.9.2, p.20, Theorems 7.3.2 and 9.2.1, and Remark 9.2.2. |

## Additional corrections made by this review

Finite local extensions now mean finite-dimensional continuous field embeddings, both in potential crystallinity and in potential diagonalizability. Coefficient enlargement outputs carry finite-dimensionality, continuity, characteristic zero and the required residual-characteristic structures. PL.0 retains coefficient characteristic and field-embedding assumptions that Lean section generalization otherwise dropped; PL.1 retains the characteristic-zero assumptions of both fields. The two-adic Taylor–Wiles and relaxed-adequacy interfaces retain the residue characteristic, the adjoint Selmer interface retains coefficient characteristic zero, and the generic Weil–Deligne restriction interface retains continuity.

The diamond quotient V≤U is explicitly normal. Strong residual oddness tests use the actual absolutely irreducible odd-rank extension hypothesis. General generic restriction, R=T and ANT lifting targets consistently require strong primitivity. In the character applications with 2n<p, the added small-rank bridge derives that condition and removes the revision's unnecessary extra assumption. Every use after an image-preserving extension now has the separate image-invariance prerequisite.

The reducible-locus argument no longer applies NT21 Theorem 5.2, which assumes rank at least two, to rank-one blocks in Proposition 5.6. Its rank-one polarized ordinary finiteness input is requested directly from GlobalGaloisDeformations:G7. The request fixes odd p, split S, residual character and multiplier, the ordinary weight algebra, a base lift and the anti-invariant abelian pro-p quotient. Global class field theory makes the chosen p-adic inertia subgroup have finite index; this argument does not assume Leopoldt. The local self-extension comparison needed by the rational pseudodeformation tangent map is separately requested from PadicHodgeTheory:R06.2.

The layer overview preserves an acyclic graph of whole-stage requirements. The fine-grained node graph places the standalone PL.6 determinant-subring and Schur definitions before the PL.2 ordinary datum; it does not require the later PL.6 generic R=T theorem there. This construction order is explicit in both reader and roadmap.

The reader and roadmap were synchronized with every corrected statement, hypothesis, prerequisite, source finding, API item, test and coverage record. The reader's RAECSDC sign specialization is distinguished from the general AG2.0 parity formula. Source locators for Corollary 5.5 and the proof of Corollary 7.2 were repaired. Coverage is partial rather than the received complete status, since two stages still leave general source routes open under the available node budget.

The table below lists changed packet fields. Two further node judgments account for the effects of the corrected geometric diagonalizability predicate on PL.1/pd-criteria and PL.1/pd-operations without changing their packet statements. The complete node-verdict table records those effects individually.

| Node | Changed packet fields |
| --- | --- |
| PL.0/ordinary-of-weight | hypotheses |
| PL.0/iota-ordinary-principal-series | hypotheses |
| PL.0/automorphic-polarized-representation | hypotheses |
| PL.0/iota-ordinary-implies-ordinary | hypotheses |
| PL.0/ordinary-implies-iota-ordinary | hypotheses |
| PL.0/steinberg-weight-zero-iota-ordinary | hypotheses |
| PL.0/isobaric-sum-iota-ordinary | hypotheses |
| PL.0/automorphy-under-twist | hypotheses |
| PL.0/soluble-descent | hypotheses |
| PL.0/induction-descent | hypotheses |
| PL.0/auxiliary-cm-extensions | hypotheses |
| PL.0/auxiliary-characters | hypotheses |
| PL.1/connects-relation | hypotheses, tests, api |
| PL.1/connects-properties | hypotheses |
| PL.1/potentially-diagonalizable | statement, proofSteps, api |
| PL.2/exactness-and-freeness | hypotheses |
| PL.3/taylor-wiles-level-structures | proofSteps, api |
| PL.3/adequate-taylor-wiles-primes | hypotheses |
| PL.3/taylor-wiles-primes-two-adic | hypotheses |
| PL.4/strongly-residually-odd | tests, api |
| PL.4/relaxed-adequacy | hypotheses |
| PL.4/minimal-finiteness | proofSteps |
| PL.4/characteristic-zero-lifts | proofSteps |
| PL.5/ordinary-lifts-prescribed-local | proofSteps |
| PL.6/primitive-representation | acceptance, tests, api, prerequisites |
| PL.6/small-rank-primitivity | new theorem |
| PL.6/strong-primitivity-image-invariance | new theorem |
| PL.6/genericity-under-restriction | statement, hypotheses, proofSteps, prerequisites |
| PL.6/generic-prime-r-equals-t | statement, proofSteps |
| PL.7/ordinary-steinberg-finiteness | proofSteps, prerequisites |
| PL.7/residually-reducible-automorphy-lifting | proofSteps, prerequisites |
| PL.7/two-constituent-automorphy-lifting | proofSteps, prerequisites |
| PL.7/sum-of-characters-finiteness | statement, hypotheses, proofSteps, prerequisites |
| PL.7/ordinary-lifts-every-weight | statement, hypotheses, proofSteps |
| PL.7/unrestricted-ring-dimension-bound | statement, hypotheses, proofSteps |
| PL.7/reducible-locus-small | statement, hypotheses, proofSteps, prerequisites |
| PL.7/generic-primes-large-quotients | statement, hypotheses, proofSteps, prerequisites |
| PL.7/prescribed-type-lifts | statement, hypotheses, proofSteps, prerequisites |
| PL.8/generic-weil-deligne | hypotheses |
| PL.8/adjoint-bloch-kato-selmer-group | hypotheses |
| PL.8/semistable-pseudodeformation-ring | proofSteps |
| PL.8/pseudodeformation-tangent-comparison | proofSteps, prerequisites |


## Baseline and ownership

No baseline citation was removed or replaced. Each `checked` field now records an individual independent statement check at Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`:

| Declaration | Confirmed scope |
| --- | --- |
| [mathlib:Ideal.minimalPrimes](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/MinimalPrime/Basic.lean) | Independently read 2026-10-09. Confirmed at the pinned Mathlib commit: for a commutative semiring and ideal I, this is the set of primes minimal over I. Used on the specified finite model only with a separate geometric-integrality descent certificate; it does not identify arithmetic and geometric components. |
| [mathlib:ringKrullDim](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/KrullDimension/Basic.lean) | Independently read 2026-10-09. Confirmed at the pinned Mathlib commit: a commutative semiring has Krull dimension in WithBot ℕ∞, defined from PrimeSpectrum. The suggested dimension and connectedness interfaces use this extended-natural codomain; no Noetherian or finiteness conclusion is imported. |
| [mathlib:IsLocalRing](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/LocalRing/Defs.lean) | Independently read 2026-10-09. Confirmed at the pinned Mathlib commit: the predicate on a semiring includes nontriviality and the unit-alternative for a+b=1. Completeness, Noetherianity, residue data and coefficient topology are separate requested structures, not consequences of this predicate. |


The Tau Ceti pin is `f790474821cf4256814db967cb154e7af3d0c369`. This packet cites no Tau Ceti declaration as a baseline theorem. Its two upstream imports are consumed roadmap layers: ClassFieldTheory layer 12 supplies the global correspondence, with prescribed-local existence and Grunwald–Wang separately assigned to IG.4; Chebotarev layer 10 supplies Dirichlet density for prescribed finite-image Frobenius classes. Their local roadmap statements were read. This is not a claim that those roadmap texts or all their exports were read as library declarations at the pin.

Supplier scope was checked for the actual consumed statements, including ordinary continuous induction rather than tensor induction (G7), odd and split deformation data rather than arbitrary nonsplit/2-adic variants (GlobalGaloisDeformations), arbitrary-local-field Barsotti–Tate components beyond the current Q_p branch (R08.4), integral patching and determinant bounds (R03/IHG), compact unitary and PEL realizations (AA/AF/AG), and local Langlands/base-change/type specializations (ET/SR). General Galois representations, cohomology, deformation functors, p-adic Hodge theory, endoscopy, Shimura cohomology and generic Serre weights are not replanned here. Owner refinements remain explicit requests; Dwork and generic Serre-weight owners without stage ids remain precise gaps.

## Added target-level bridges


### PL.6/small-rank-primitivity

Let Γ be a profinite group, k a discrete field of prime characteristic p, and ρ:Γ→GL_n(k) a continuous semisimple representation with 0<n<p. Then weak primitivity is equivalent to strong primitivity. This is a deduction supplied by this review, not a claim that the cited papers state the equivalence. In NT21 Theorem 5.2 it applies to the doubled rank 2n<p representation and to every smaller residual character block, also after the specified residual-image-preserving extensions.


1. Strong primitivity implies weak primitivity by its definition. Conversely, suppose ρ is the semisimplification of Ind_H^Γ τ with H proper open. Set d=[Γ:H] and m=dim τ. Induction preserves total composition-factor dimension, so n=dm; positivity implies 1<d≤n<p.

2. Let N be the normal core of H in Γ. The action on Γ/H embeds Γ/N in S_d, so [Γ:N] divides d! and is invertible in k. All the inducing data factor through a common finite quotient: intersect the finitely many conjugates of the open kernel of τ with N.

3. Induction is exact, so replacing τ by its semisimplification preserves the semisimplification of the induced representation. Clifford theory makes the restriction of semisimple τ to N semisimple; Mackey decomposition then makes the restriction of Ind_H^Γ τ^ss to N a finite direct sum of semisimple modules.

4. For any Γ-submodule of Ind_H^Γ τ^ss, take an N-linear projection onto it and average its conjugates over Γ/N. The denominator [Γ:N] is invertible, and normality makes the result Γ-linear. Thus every Γ-submodule is a direct summand, so this induction is semisimple.

5. Consequently ρ is isomorphic to Ind_H^Γ τ^ss itself, contradicting weak primitivity. For character applications, Lemma 5.1 first gives weak primitivity; a diagonal sum is semisimple. The strict rank bound supplies this comparison each time a new doubled representation or constituent block is formed.


Direct prerequisites: `PotentialAutomorphyInfrastructurePartII:PL.6/primitive-representation`, `ArithmeticGaloisRepresentations:G7`.


### PL.6/strong-primitivity-image-invariance

Let Γ be profinite, k a discrete field of prime characteristic p, and ρ:Γ→GL_n(k) continuous and semisimple, with p∤n. If Γ₁ is open and ρ(Γ₁)=ρ(Γ), then ρ|Γ₁ is strongly primitive if and only if ρ is strongly primitive. More precisely, semisimplified induction giving ρ can be tested in the finite image ρ(Γ). This does not identify weak and strong primitivity for arbitrary n prime to p.


1. Set N=ker ρ. If ρ is the semisimplification of Ind_H^Γ τ, all composition factors of the induction are trivial on N. Reduce to a common finite quotient using the open kernel of τ. In a basis adapted to a composition series, N has upper triangular unipotent image, hence a finite p-group image.

2. The induced module is a direct sum indexed by Γ/H. Its N-action permutes these summands. All N-orbits have equal size since N is normal in Γ and Γ acts transitively on Γ/H. Their common size is a power of p. The index d=[Γ:H] divides n and is prime to p, so that orbit size is one. Therefore N⊂H.

3. The composition factors of τ restrict trivially to N: its restriction is a summand of the N-restriction of the induction. Thus τ^ss factors through H/N; induction is exact, so Ind_{H/N}^{Γ/N} τ^ss has semisimplification ρ. Conversely inflate any such proper induction in Γ/N to Γ.

4. Apply this characterization to Γ and Γ₁ with the same finite image. Clifford theory makes the restriction of semisimple ρ to its normal kernel trivial and the representation of its full image is unchanged. Semisimplicity of the restriction follows from the common image. This proves the equivalence.

5. ANT good extensions preserve the semisimple residual image by their disjointness condition. Their hypothesis l∤n therefore supplies this interface for every strong-primitive use of the narrowed generic R=T route.


Direct prerequisites: `PotentialAutomorphyInfrastructurePartII:PL.6/primitive-representation`, `ArithmeticGaloisRepresentations:G7`.


## Source versions and findings

Nineteen primary public versions were independently read at the node, API, proof and source-finding locators. The metadata records exact URLs and SHA-256 hashes. No private source was used. The following version table identifies those readings and the two restricted published collations; it does not claim every page of every paper was read.

| Source | Version URL | SHA-256 |
| --- | --- | --- |
| BLGGT14 | [Annals of Mathematics 179 (2014), 501–609; read in arXiv:1010.2561v4 (9 December 2013)](https://arxiv.org/abs/1010.2561v4) | `c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24` |
| Tho12 | [Journal of the Institute of Mathematics of Jussieu 11 (2012), 855–920; read in arXiv:1107.5989v1 (29 July 2011)](https://arxiv.org/abs/1107.5989v1) | `537af0053745f4206157c0441365218285624d95a25ae408149f287372d9ba55` |
| Tho17 | [Mathematische Zeitschrift 285 (2017), 1–38; read in the author's accepted manuscript dated 16 March 2016 (Apollo, University of Cambridge repository)](https://www.repository.cam.ac.uk/handle/1810/254922) | `f7b706eb2eb69354f5be3ce846193dc75f73ed46a7437eb54451b8f177af74c9` |
| Tho15 | [Journal of the American Mathematical Society 28 (2015), 785–870; read in the author's accepted manuscript dated 16 April 2014 (Apollo, University of Cambridge repository)](https://www.repository.cam.ac.uk/items/2796d161-598e-44da-83fd-2015c26f1dbc) | `76393fcb9a31931789fa4f7c6de9a64275fb02e81e5a3b98c53b8aa1a1834928` |
| ANT20 | [Compositio Mathematica 156 (2020), 2399–2422; read in arXiv:1912.11269v2 (13 August 2020)](https://arxiv.org/abs/1912.11269v2) | `077a344352c80389ce75d5c61a69fba90413303aca911a616fe46dbeb8514bfa` |
| NT23 | [Journal of the European Mathematical Society 25 (2023), 1919–1967; read in arXiv:1912.11265v3 (30 June 2023), whose numbering is used here](https://arxiv.org/abs/1912.11265v3) | `286597946a3efcac15b1f1d610370ca0cb52619b20954f3c5bd7f224c12bcf5f` |
| NT21 | [Publications mathématiques de l'IHÉS 134 (2021), 1–116; read in arXiv:1912.11261v3 (27 September 2021)](https://arxiv.org/abs/1912.11261v3) | `6d50b558a6182a8d1515a6715529a33079807bf405c8db775e4ed252f5a2f379` |
| NT21B | [Publications mathématiques de l'IHÉS 134 (2021), 117–152; read in arXiv:2009.07180v2 (27 September 2021)](https://arxiv.org/abs/2009.07180v2) | `0f08214ebe03344c2e2851be76c49213dc4adf7928ff561610b674c423a2a6bf` |
| NT26 | [Annals of Mathematics 203 (2026); read in arXiv:2212.03595v2](https://arxiv.org/abs/2212.03595v2) | `6a156f7a5567226e0bd2209d5b237cbbc150dc10cfbd9ffd060a3245328cb82c` |
| BCG25 | [Journal of the American Mathematical Society 38 (2025), 509–520; read in arXiv:2309.15944v3 (mathematically identical to the published text, as the extraction PAPER-BOXER-CALEGARI-GEE-25 records)](https://arxiv.org/abs/2309.15944v3) | `abfa9eac9984aa5d0bd5e1700a08993bc3baa6f8435d18f5f0e37f5a84769684` |
| LTXZZ | [Acta Mathematica Sinica, English Series 40 (2024); read in arXiv:2108.06998v1, the version cited by Liu et al., Invent. Math. 228 (2022)](https://arxiv.org/abs/2108.06998v1) | `fce1c9ae227dc1fcbc2fa712ae0034f7454b77595f63b927a7bdc7237f81292a` |
| LLHLM23 | [Inventiones mathematicae 231 (2023), 1277–1488; read in arXiv:2007.05398v2](https://arxiv.org/abs/2007.05398v2) | `3cdae0b192d3ba8d75391fbd2bf40264e23c9d9c69d536ad30b50dddda0d61af` |
| CT14 | [Compositio Mathematica 150 (2014), 729–748; read in the author manuscript lrspi.pdf](https://www.dpmms.cam.ac.uk/~jat58/lrspi.pdf) | `f8609496aff7abb2858694331556a635a353a50a8280d5e05d507948d4aa24f7` |
| GK14 | [arXiv:1208.3179v5 (12 June 2026); this version, not an unchecked version of record](https://arxiv.org/abs/1208.3179v5) | `65cb5797bbe10e328843b5fdc73f2623c80e19fa89ceb72ce6cd296881eb68f9` |
| Che14 | [arXiv:0809.0415v2 (18 July 2013)](https://arxiv.org/abs/0809.0415v2) | `f3c0e0d86e803301c617d3023d425752e30da46673ed5af932647eb284286953` |
| Ger19 | [Mathematische Annalen 373 (2019), 1341–1427; read in the author's preprint dated 12 March 2010, whose numbering (Lemma 2.6.4, Lemma 5.1.6, …) is the one BLGGT14 and Thorne cite and is used here; the published version numbers its statements differently and was not obtained](https://web.archive.org/web/2id_/https://www2.bc.edu/david-geraghty/files/oml.pdf) | `18c3b5081c8c8e6af6001fdaa145cd43a51763c5fd72abf6949dd431704a72f1` |
| BG19 | [Algebra & Number Theory 13 (2019), 333–378; read in arXiv:1708.04885v3 (30 December 2018)](https://arxiv.org/abs/1708.04885v3) | `afe3ab33eedfd50c5fc943020e494b32d6515802723de982ba0da3848f00c587` |
| Tho24 | [Proceedings of the London Mathematical Society (3) 128 (2024), e12584; read in arXiv:2212.03591v2](https://arxiv.org/abs/2212.03591v2) | `372ed2cbe894a75e01f8292963eeb9a50ffe7236098f183e3784aa09c98343b1` |
| LLHLM20 | [Forum of Mathematics, Pi 8 (2020), e5; read in arXiv:1608.06570v4](https://arxiv.org/abs/1608.06570v4) | `cceae9f59d4c8af0a265726c6a35583959b0e1cb0451043ff79170a1def432bd` |


Published collation scope: NT21 Theorem 5.2 and Proposition 5.6, published PDF pp.77–80; NT23 Proposition 3.10 and Theorem 3.11, printed pp.1932–1933, and the later tangent comparison at pp.1945–1946. The NT21 argument omissions persist at the inspected published locations. The NT23 comparison typo identified in E63 is corrected in the published text; its manuscript finding remains version-specific. Tho15 and Tho17 conclusions are restricted to the Cambridge accepted manuscripts. The Tho17 publisher endpoint returned HTML instead of a PDF; the version of record was not read.


| Published collation URL | SHA-256 |
| --- | --- |
| [https://numdam.org/item/10.1007/s10240-021-00127-3.pdf](https://numdam.org/item/10.1007/s10240-021-00127-3.pdf) | `ef76912a84fdf3d0630fe3aaa83548110f9aca9fc50a421401ba5462512dce37` |
| [https://ems.press/content/serial-article-files/32858?nt=1](https://ems.press/content/serial-article-files/32858?nt=1) | `bb106d634bf2f78d650d159710941be575fda4ae16447ac9125e62d2d99c6139` |


All 70 received source findings were rechecked and given an individual `confirmed` verdict with a locator-specific reason. Confirmation is of the documented omission, ambiguity or misprint at the inspected version, not a claim that every affected theorem is false. In particular E27 distinguishes the open general weak-primitive step from the now-resolved small-rank character case, and E54 retains the normalization/standing-assumption qualification rather than asserting that an extra Theorem 9.1.6 hypothesis is automatically necessary for every application. Each finding's correction and effect is preserved in own words in the packet and reader.

Three additional accepted-manuscript misprints were found. The atlas register, author listing and journal landing page were inspected for existing corrections; no correction for these occurrences was found. That search does not establish their presence in the unread version of record.

| Finding | Locator | Independent correction and reason |
| --- | --- | --- |
| E71 | §2.1, Lemma 2.3, PDF p.5 (accepted manuscript of 16 March 2016) | The target of the input r is 𝒢_n(Q̄_p). The inverse-image condition and 𝒢_n⁰ conjugacy are typed only for a 𝒢_n-valued homomorphism; the surrounding polarized dictionary fixes the intended group. |
| E72 | §2.3.3, third property of the potentially crystalline quotient, PDF p.12 (accepted manuscript of 16 March 2016) | Its E-relative dimension is n²+[F⁺_v:Q_p]n(n−1)/2. The integral O-ring has the extra dimension one. Inverting p removes the uniformizer dimension; BLGGT14 §1.4, p.26, gives the generic-fibre dimension without that extra one. |
| E73 | §2.3.4, definition of R_v^fl, PDF p.12 (accepted manuscript of 16 March 2016) | Take the maximal reduced p-torsion-free quotient of R_v^□ first, and invert p only for its generic fibre. In a quotient of R_v^□[1/p], p is a unit; such a nonzero ring cannot be an O-deformation ring with residue field of characteristic p. The subsequent generic-fibre discussion confirms the intended order. |


## Complete node judgments

The following is the complete 92-node review inventory, matching the packet's `review.checked` entries. Sources and reasons are stated in the reviewer's own words; no source passage is reproduced.

| Node | Verdict | Independent justification |
| --- | --- | --- |
| PL.0/ordinary-of-weight | corrected | Tho15: §2, Definition 2.5, PDF pp. 11–12 (manuscript of 16 April 2014) Dominance, increasing graded weights, flag reversal and labelled character tests agree. Retained coefficient-characteristic and field-embedding hypotheses in the proposed signatures; parallel Tate characters alone do not supply the labelled supplier input. |
| PL.0/iota-ordinary-principal-series | corrected | Tho15: §2, Lemma 2.3 and the remark after it, p. 9; proof p. 10 (accepted manuscript) Generic principal-series constituents and the ordered valuation formula agree with geometric Artin reciprocity. Coefficient characteristic and largeness are now explicit in the finite model. |
| PL.0/automorphic-polarized-representation | corrected | BLGGT14: §2.1, definitions following remarks (6)–(7) after Theorem 2.1.1, pp. 34–35 (arXiv v4) Raw automorphic data and chosen finite E-realizations are separate. Integral/residual representations require the latter, and the full multiplier includes the cyclotomic shift. No universal realization follows merely from field embeddings. |
| PL.0/iota-ordinary-implies-ordinary | corrected | Tho15: §2, Theorem 2.4 and its proof, PDF pp. 10–11 The local principal-series comparison gives the ordered ordinary Hodge weights. Its realized automorphic input and labelled de Rham character comparison are requested from their owners. |
| PL.0/ordinary-implies-iota-ordinary | corrected | BLGGT14: §2.1, remark (7) after Theorem 2.1.1, p. 34 (arXiv v4) The converse retains level potentially prime to l and its soluble-base-change argument. The ordinary local comparison does not assert the unrestricted converse. |
| PL.0/steinberg-weight-zero-iota-ordinary | corrected | NT26: §2, Lemma 2.6, PDF p. 12 (arXiv v2) Weight zero and the twisted Steinberg local components give the required valuation sequence; the statement is not extended to arbitrary weights. |
| PL.0/isobaric-sum-iota-ordinary | corrected | CT14: §2.2, Lemma 2.6 and its proof, PDF p. 6 (manuscript of 15 February 2013) The two shifts and the interleaving independent of the embedding over a given l-adic place are retained. The finite model now keeps its coefficient and embedding hypotheses. |
| PL.0/automorphy-under-twist | corrected | BLGGT14: §2.2, Lemma 2.2.1, p. 35 (arXiv v4) Twisting changes the full multiplier by the product of the character and its conjugate. Killing finite inertia of a smooth Hecke character is distinguished from killing the cyclotomic character. |
| PL.0/soluble-descent | corrected | BLGGT14: §2.2, Lemma 2.2.2, p. 35 (arXiv v4) Irreducibility after restriction, the polarized seed and soluble extension are retained. Descent and Frobenius recognition are separate supplier inputs. |
| PL.0/induction-descent | corrected | BLGGT14: §2.2, Lemma 2.2.4 and its proof, pp. 36–37 (arXiv v4) The archimedean polarization lemma, ordinary continuous induction and semisimple recognition are explicit inputs. Induction by itself is not asserted to imply automorphy. |
| PL.0/auxiliary-cm-extensions | corrected | BLGGT14: Appendix A.2, Lemma A.2.1, p. 87 (arXiv v4) The alternative conditions on the disjointness field and prescribed local cyclic extensions match the appendix. The referenced CHT proof input is requested rather than treated as independently proved here. |
| PL.0/auxiliary-characters | corrected | BLGGT14: Appendix A.2, Lemma A.2.5, statement pp. 88–89, proof pp. 89–90 (arXiv v4) The output has an explicit finite E′/E, integral and residual coefficient maps and full local/parity restrictions. The updated signature retains the residual characteristic and field-embedding hypotheses. |
| PL.1/connects-relation | corrected | BLGGT14: §1.3, definition of 'connects' and 'strongly connects', p. 21 (arXiv v4) Both geometric generic fibres are represented by descended primes only with a geometric-integrality certificate. Added finite, continuous local extensions and the coefficient largeness needed at p=l, including after restriction. |
| PL.1/connects-properties | corrected | BLGGT14: §1.3, remarks (1)–(12), p. 21 (arXiv v4) Component maps, coefficient enlargement and sufficiently large local extensions are precise R08.3 requests. Restriction now requires the embeddings of the enlarged local field; arithmetic minimal primes alone are insufficient. |
| PL.1/generic-smooth-points | verified | BLGGT14: §1.3, tangent space formula and definitions of smooth and robustly smooth, p. 17 (arXiv v4) Smoothness uses the adjoint-twist invariant vanishing. Robust smooth points are obtained with the countable finite-extension conditions, and density is stated on the geometric fibre. |
| PL.1/potentially-diagonalizable | corrected | BLGGT14: §1.4, definitions of diagonalizable and potentially diagonalizable, pp. 26–27 (arXiv v4) Separated the fixed-field diagonal witness from geometric diagonalizability. A finite continuous E′/E may contain the diagonal characters and local embeddings, with an integral realization and generic-fibre conjugacy; potential diagonalizability also uses a finite continuous K′/K. |
| PL.1/pd-criteria | corrected | BLGGT14: §1.4, Lemma 1.4.3, statement pp. 28–29, proof p. 29 (arXiv v4) The flag criterion assumes potential crystallinity; the Fontaine–Laffaille criterion keeps the unramified local field and interval length l−2. The geometric predicate now permits the needed diagonal-character coefficient enlargement. |
| PL.1/potentially-barsotti-tate-diagonalizable | verified | GK14: §4.4, Lemma 4.4.1 and proof, PDF pp. 19–20 (arXiv v5) The prime bound l>2 and both ordinary and nonordinary split component representatives are retained. The arbitrary-local-field comparison beyond the supplier’s Q_p branch is an exact R08.4 request. |
| PL.1/pd-operations | corrected | BLGGT14: §1.4, remarks (4) and (5), p. 26 (arXiv v4) Restriction, sums, tensor products, duals and symmetric powers act on the geometric component relation. The finite model permits coefficient enlargement and requests the compatible descent/component maps. |
| PL.2/definite-unitary-group | verified | Tho12: §6, opening paragraphs before Definition 6.1, pp. 30–31 (PDF page = printed page) Positive rank, split distinct division-algebra places, conjugate-place choices and the quasi-split/compact inner form match the source. General adelic arithmetic remains AA.1 work. |
| PL.2/unitary-algebraic-modular-forms | verified | Tho12: §6, set-up and Definition 6.1, pp. 31–32 The AF.5 specialization has integral algebraic coefficients and the correct right action. Tests check weight zero, zero coefficients, scalar change and prime-to-l stabilizers. |
| PL.2/unitary-hecke-algebra | verified | Tho12: §6, text following Definition 6.1, pp. 32–33 The double-coset action uses representatives supported at the Hecke place. Finite Hecke algebras and the Frobenius polynomial are restricted to the actual module and good places. |
| PL.2/exactness-and-freeness | corrected | Tho12: §6, Lemma 6.3, p. 33 The quotient U/V requires V≤U and normality; diamond operators act at level V. Added these hypotheses to the operator and freeness interfaces, retaining prime-to-l arithmetic stabilizers. |
| PL.2/unitary-constituent-galois-representation | verified | Tho12: §6, Theorem 6.5, p. 35 Isobaric constituent comparison uses semisimple Galois representations. A chosen coefficient realization is supplied after finite enlargement instead of assigning every constituent a representation over a fixed E. |
| PL.2/hecke-valued-galois-representation | verified | Tho12: §6, Proposition 6.7, p. 36 The non-Eisenstein residual hypothesis permits representation gluing over the localized Hecke algebra. Full multiplier and local conditions are distinct from the reducible determinant P→T construction. |
| PL.2/unitary-base-change-and-descent | verified | Ger19: §2.2, Proposition 2.2.7, p. 9 The matrix and division-inner-form transfers are specific ET.7a requests. Weak base change, strong compatibility and irreducible-point automorphy are distinguished. |
| PL.2/iwahori-ordinary-parts | verified | Tho12: §8, p. 44 (the subgroups Iw(ṽ^{b,c}) and the levels U(l^{b,c})) Rescaled U operators preserve the integral lattice; factorial limits are taken on finite coefficient quotients before the inverse limit. Torus and diamond normalizations agree with the ordinary tower. |
| PL.2/big-ordinary-hecke-algebra | verified | Tho12: §8, Definition 8.1 and the preceding paragraph, p. 45 The inverse-level limit has the twisted Λ action and localized Hecke algebra. The owned ordinary deformation datum supplies the additional NT21 T_D/P_D/J_D construction rather than hiding it in this limit. |
| PL.2/ordinary-deformation-datum | verified | NT21: §6, definition after Lemma 6.3, p.78; Proposition 6.5 and Lemma 6.6, pp.79–80; proof of Lemma 6.7, pp.81–82 (arXiv:1912.11261v3) The new revision-owned datum includes the soluble CM field, residual polarization, type modules, local levels and matching local conditions. Its no-Steinberg comparison and proper J_D criterion are explicit; three tests distinguish the nonzero and forbidden-type cases. |
| PL.2/ordinary-forms-free-over-lambda | verified | Tho12: §8, Proposition 8.2, p. 46 The fixed finite-level and inverse-limit freeness statements are separated. NT21 part (d) uses the actual datum, constant Λ-rank and localized type compatibility, not an arbitrary Hecke module. |
| PL.2/hida-classicality | verified | Ger19: §2.6, Proposition 2.6.1 and its proof, pp. 18–20 Arithmetic specialization selects the finite-character isotypic part. It does not identify the full classical space at a finite level with that specialization. |
| PL.2/ordinary-hecke-galois-representation | verified | Tho12: §8, Propositions 8.4 and 8.5, p. 47 Universal inertial characters and ordinary flags factor through the ordinary local rings with their Λ structure. Absolute residual irreducibility and the full polarized multiplier are retained. |
| PL.3/thorne-taylor-wiles-datum | verified | Tho12: §4, Definition 4.1 and the remark after it, pp. 15–16 (arXiv:1107.5989v1) Scalar Frobenius eigenspaces are nonzero, the complementary blocks are unramified, and places are split and distinct. The datum is indexed by every positive auxiliary level and permits empty Q where appropriate. |
| PL.3/taylor-wiles-level-structures | corrected | Tho12: §4, Definition 4.1, pp. 15–16 Added the local normality lemma needed for diamonds at U₁ and retained minimal-level hypotheses. The localized polynomial cutouts, Δ quotient, freeness and augmentation agree with the parahoric theory. |
| PL.3/adequate-taylor-wiles-primes | corrected | Tho12: §4, Proposition 4.4, pp. 17–18 (arXiv:1107.5989v1) The original polarized adequacy and corrected GL adequacy forms remain distinct with their generator counts. Added ResChar E l so auxiliary-prime congruences and cohomology use the same prime. |
| PL.3/taylor-wiles-primes-two-adic | corrected | Tho17: §2.4, Proposition 2.21, p. 14, proof pp. 14–15 (author manuscript of 16 March 2016) The local line, oddness condition and p=2 presentation request retain the source hypotheses. Added residual-characteristic compatibility; the impossible source injectivity wording does not enter the proof. |
| PL.3/minimal-r-equals-t | verified | Tho12: §6, 'A patching argument' and Theorem 6.8, p. 37, proof pp. 37–40 (arXiv:1107.5989v1) The actual deformation problem, localized automorphic point and component support feed the module patching theorem. The reduced/near-faithful conclusion is not an arbitrary ring-surjection assertion. |
| PL.3/ordinary-r-equals-t | verified | Tho12: §8, 'Another patching argument', p. 48 (arXiv:1107.5989v1) Ordinary local rings and Λ-free patched modules give the stated arithmetic conclusion through Ihara avoidance. Integral and reduced support conclusions remain distinct. |
| PL.3/revised-adequacy-r-equals-t | verified | Tho17: §7, Proposition 7.2, p. 32 (author manuscript of 16 March 2016) The erratum replaces the residual-image input in the two existing patching theorems. It does not create an unrestricted new R=T theorem. |
| PL.4/minimal-automorphy-lifting | verified | Tho12: §7, Theorem 7.1, pp. 41–42, proof pp. 42–44 (arXiv:1107.5989v1) The residual seed, full multiplier and local component hypotheses are retained in both the original and revised adequacy versions. |
| PL.4/strongly-residually-odd | corrected | Tho17: §3.1, Definition 3.3, p. 16 (author manuscript of 16 March 2016) The even-rank mod-2 dichotomy keeps positive half-rank. Added absolute irreducibility to the extension-independence API and corrected the odd-rank test to say the extra condition is not imposed. |
| PL.4/two-adic-automorphy-lifting | verified | Tho17: §5, Theorem 5.1, p. 23; also Theorem 1.1, p. 2 (author manuscript of 16 March 2016) The corrected adequacy, p=2 presentation and strong residual oddness in even rank retain all finite-place component conditions and the realized automorphic seed. |
| PL.4/relaxed-adequacy | corrected | BCG25: §3, proof of Theorem 3.1, p. 10 (arXiv:2309.15944v3) The BCG H¹(ad) variant lists exactly where the original H¹(ad₀) input is replaced. Added the matching residual characteristic to both proposed lifting interfaces. |
| PL.4/ordinary-automorphy-lifting | verified | BLGGT14: §2.4, Theorem 2.4.1, p. 39 (arXiv:1010.2561v4) The ordinary weight, polarized seed and residual hypotheses match both sources. Level prime to l is concluded under the additional crystallinity hypothesis. |
| PL.4/minimal-finiteness | corrected | Tho12: §10, 'A minimal finiteness theorem' and Theorem 10.1, pp. 54–55, proof pp. 55–56 (arXiv:1107.5989v1) The fixed components, finite ramification set and integral automorphic seed remain explicit. Characteristic-zero output now records a finite continuous E′/E; hyperspecial level is not inferred from unramifiedness merely outside S. |
| PL.4/ordinary-finiteness | verified | BLGGT14: §2.4, Theorem 2.4.2, pp. 39–40 (arXiv:1010.2561v4) The ordinary local conditions and Λ-finiteness/specialized-weight conclusions are kept separate from fixed-component finiteness. The local-global level input remains a recorded source limitation. |
| PL.4/characteristic-zero-lifts | corrected | BLGGT14: §1.5, Proposition 1.5.1, p. 30, set-up pp. 29–30 (arXiv:1010.2561v4) Adjoint-twist invariant vanishing is explicit in the dimension step; Schur alone does not imply it. The characteristic-zero lift is realized after a finite continuous coefficient extension. |
| PL.5/dwork-potential-ordinary-automorphy | verified | BLGGT14: §3.1, Theorem 3.1.2, pp. 41–42 (src PDF, arXiv version; PDF page = printed page) The symplectic semisimplified residual representation, auxiliary primes and multiplier are retained. Family geometry, monodromy, trivialization and ordinary/Steinberg fibres are precise Dwork-owner gaps. |
| PL.5/ordinary-lifts-prescribed-local | corrected | BLGGT14: §3.2, set-up and Proposition 3.2.1, p. 45 The descent field, residual seed, multiplier and prescribed local representations are compatible. Added finite continuous coefficient enlargement to the output and proof sketch. |
| PL.5/tensor-product-trick-lifting | verified | BLGGT14: §4.1, Proposition 4.1.1, p. 50 The regular tensor weights, compatible multipliers and linearly disjoint cyclic extension agree. Auxiliary characters and Dwork potential ordinary automorphy are direct arithmetic inputs. |
| PL.5/pd-automorphy-lifting | verified | BLGGT14: §4.2, Theorem 4.2.1 and the remarks following it, p. 53 Residual irreducibility over F(ζ_l), the constituent-dependent prime bound, regularity and an ordinary/PD polarized residual seed are retained. The tensor-product route imports the explicit character and Dwork inputs. |
| PL.6/schur-residual-representation | verified | Tho15: §3.1, Lemma 3.1, pp. 12–13 (accepted manuscript of 16 April 2014) Schur is imposed on the polarized 𝒢_n carrier, not merely on the GL_n restriction. The constituent and pairing examples test its scalar-centralizer interpretation. |
| PL.6/primitive-representation | corrected | NT21: §5, definition preceding Lemma 5.1, p. 66 (arXiv:1912.11261v3) Weak and semisimplified-induction primitivity remain distinct. Replaced the tensor-induction supplier by ordinary induction, Clifford and Mackey inputs; added the low-rank and image-invariance APIs and a characteristic-seven character test. |
| PL.6/character-sums-primitive | verified | NT21: §5, Lemma 5.1 and proof, p. 66 (arXiv:1912.11261v3) The large-ratio lemma supplies weak primitivity exactly as stated. Strong primitivity for small-rank applications is derived by the added comparison node rather than silently attributed to this lemma. |
| PL.6/small-rank-primitivity | added | Review deduction; ordinary induction/Clifford/Mackey/exactness are the specified G7 supplier inputs. Added a target-level bridge: the inducing subgroup index d satisfies d≤n<p, so its normal-core quotient has order dividing d! prime to p. Clifford and Mackey give semisimplicity on the core; averaging projections gives semisimplicity of the induction and excludes its semisimplification. |
| PL.6/strong-primitivity-image-invariance | added | Review deduction; ordinary induction/Clifford/Mackey/exactness are the specified G7 supplier inputs. Added a second bridge under p∤n. A residual kernel acting trivially on all composition factors acts through a finite unipotent p-group on an induction; its equal coset-orbit sizes divide the prime-to-p index, forcing the inducing subgroup to contain that kernel. Exact induction reduces the test to the common finite image. |
| PL.6/connectedness-dimension | verified | Tho15: §1, Definition 1.7, p. 8 (accepted manuscript of 16 April 2014) The minimum over partitions uses at least two components and local quotient dimensions; arithmetic rank is the radical-generation number. Tests separate connectedness from ordinary Krull dimension. |
| PL.6/polarized-pseudodeformation-subring | verified | Tho15: §3.4, Definition 3.25 and Proposition 3.26, p. 23 (accepted manuscript of 16 April 2014) The closed characteristic-polynomial subring is finite in the Schur situation, with the block-sign invariant and irreducible étale-fibre statements separated. Uniform generator bounds are over the specified ordinary Λ. |
| PL.6/pseudodeformation-restriction-finite | verified | NT21: §5, Lemma 5.3 and proof, p. 70 (arXiv:1912.11261v3) Finite-index determinant restriction uses Φ_p and the integral finite-root argument. No finite topological generation of an arithmetic Galois group is assumed. |
| PL.6/reducibility-ideal | verified | Tho15: §3.5, Definition 3.31, p. 26 (accepted manuscript of 16 April 2014) The strict split ideal in R and the product of partition factorization ideals in P are different constructions. Their prime criteria and examples distinguish actual splitting from generic reducibility. |
| PL.6/reducible-locus-dimension | verified | ANT20: §3.3, set-up and Lemma 3.6 with proof, pp. 11–12 (arXiv:1912.11269v2) The Steinberg place, residual triviality, ordinary Λ and determinant reducibility ideal are explicit. The source factor n is retained in the bound. |
| PL.6/generic-prime | verified | ANT20: §3.3, Definition 3.7, p. 12 (arXiv:1912.11269v2) Characteristic-p dimension, absolute irreducibility of the generic representation and independent local characters are part of the predicate. Admissible large quotients are distinguished from arbitrary primes. |
| PL.6/large-quotients-contain-generic-primes | verified | ANT20: §3.3, Lemma 3.8 and proof, pp. 12–13 (arXiv:1912.11269v2) The finite-Λ large quotient avoids countably many nongeneric loci with the stated dimension bounds. Connectedness is used with the actual local-ring hypotheses. |
| PL.6/genericity-under-restriction | corrected | Tho15: §5.2, hypotheses 1–6 and Proposition 5.3 with proof, p. 58 (accepted manuscript of 16 April 2014) The first clause now agrees with the strong-primitive hypothesis used throughout the signature. Removed the unsupported principal-series counterexample; the source weak formulation remains a gap, and n<p applications use the added bridge. |
| PL.6/reducible-twisting-and-base-change | verified | Tho15: §3.6, Lemmas 3.34 and 3.35, p. 27 (accepted manuscript of 16 April 2014) The permissible scalar twists, determinant-ratio unramifiedness, residual disjointness and ordinary Λ maps are retained. The supported level restriction remains distinct from a blanket base-change claim. |
| PL.6/generic-prime-r-equals-t | corrected | ANT20: §4.1–4.2, standing assumptions (1)–(3) and definition of J, pp. 13–15 (arXiv:1912.11269v2) The proposed theorem is explicitly the strong-primitive form. Removed self-referential proof boilerplate; the full weak source formulation and general d-constituent patching input remain recorded. |
| PL.7/ordinary-steinberg-finiteness | corrected | ANT20: §6, Theorem 6.2 and proof, pp. 19–20 (arXiv:1912.11269v2) The narrowed strong-primitive form survives every residual-image-preserving good extension by the added p∤n bridge. The ANT and later local variants retain their respective Steinberg and coefficient hypotheses. |
| PL.7/residually-reducible-automorphy-lifting | corrected | ANT20: §1, Theorem 1.1, p. 2; §6, Theorem 6.1, pp. 17–18 (arXiv:1912.11269v2) P→T, determinant classicality and the automorphic seed are retained. Strong primitivity is preserved through the good extensions under l∤n; the unrestricted weak source form is left open. |
| PL.7/two-constituent-automorphy-lifting | corrected | Tho15: §7, Theorem 7.1 and the discussion of its hypotheses, pp. 66–67 (accepted manuscript of 16 April 2014) The two adequate potentially automorphic constituents and seed match the source. The proposed strong-primitive route now has its extension-stability input; the general weak form remains a precise gap. |
| PL.7/sum-of-characters-finiteness | corrected | NT21: §5, Theorem 5.2, p. 67 (arXiv v3); set-up pp. 66–67, proof pp. 67–69 Restored the source character hypotheses without an extra strong-primitivity assumption. For the auxiliary doubled representation 2n<p, the large-ratio lemma and the new small-rank bridge apply, and also apply to every smaller character block. |
| PL.7/ordinary-lifts-every-weight | corrected | NT21: §5, Corollary 5.4 and its proof, p. 70 (arXiv v3) The ramification domain is S∪Σ and weights satisfy the multiplier relation. The characteristic-zero point argument now returns an integral lift over a finite continuous E′/E. |
| PL.7/unrestricted-ring-dimension-bound | corrected | NT21: §5, Corollary 5.5 and its proof, p. 70 (arXiv v3) The bound uses the exact character finiteness and Schur/adjoint-vanishing route. Removed the redundant strengthened character hypothesis and corrected the polarized-domain source locator. |
| PL.7/reducible-locus-small | corrected | NT21: §5, Proposition 5.6, p. 71 (arXiv v3); data pp. 70–71, proof pp. 71–72 Proper character blocks use the small-rank bridge. Dimension-one blocks are routed to a new precise polarized ordinary class-field finiteness request, not to NT21 Theorem 5.2, whose rank is at least two. |
| PL.7/generic-primes-large-quotients | corrected | NT21: §5, Theorem 5.7, pp. 72–73 (arXiv v3); assumptions and the definition of generic primes p. 72, proof p. 73 The large quotient, countable local-character constraints and actual generic-prime predicate agree. Removed the redundant strong-primitive input and corrected primitivity wording for the roots of unity. |
| PL.7/global-lifts-schur | verified | BG19: §5.1, Corollary 5.1.1 and its proof, pp. 38–39 (arXiv v3) The Schur property is retained together with adjoint-twist invariant vanishing or its sufficient cyclotomic condition. The source’s automatic scalar-invariant calculation is not used. |
| PL.7/prescribed-type-lifts | corrected | NT21: §5, Proposition 5.8, pp. 73–74 (arXiv v3); set-up p. 73, proof pp. 74–75 Since p>n, weak primitivity and semisimplicity imply the stronger predicate here. Restored the source hypothesis, retained the split/inert auxiliary fields and explicit realization enlargement. |
| PL.8/generic-weil-deligne | corrected | NT23: §1, Definition 1.1, p. 5 (arXiv v3) Genericity is vanishing of Hom(WD,WD(1)), including monodromy. Coefficient restriction is continuous; the Weil–Deligne carrier and LLC comparison are supplied by their owners. |
| PL.8/bloch-kato-at-generic-places | verified | NT23: §1, the two paragraphs after Definition 1.1, p. 5 (arXiv v3) Above p the f/g comparison retains de Rham/semistable hypotheses; away from p genericity removes the extra local restriction. Local duality and its hypotheses remain explicit. |
| PL.8/adjoint-bloch-kato-selmer-group | corrected | NT23: Introduction, pp. 1–2, with Theorem A, p. 2 (arXiv v3) Added characteristic-zero coefficients so quadratic fixed parts and rational Hochschild–Serre, including p=2, are valid. The local Selmer conditions use the polarized adjoint action. |
| PL.8/semistable-pseudodeformation-ring | corrected | NT23: §2.3, Proposition 2.12 and Lemma 2.13, p. 13 (arXiv v3) The constrained quotient may be zero when the residual fibre is empty. The conjugate-self-dual action, interval symmetry and inverse-limit conditions are explicit; coefficient realization in a characteristic-zero point is finite and continuous. |
| PL.8/polarized-integral-trace-equivariance | verified | NT23: Proposition 2.7 pp.7–9; §2.4, Proposition 2.16 and proof, pp.16–17 (arXiv:1912.11265v3) The trace-map intertwining is at the integral torsion level before invariants or inversion of p. Its multiplier-twisted duality and ε-scaling operations are owned by the specified determinant comparison. |
| PL.8/pseudodeformation-tangent-comparison | corrected | NT23: §2.2, Proposition 2.7, pp. 8–9 (arXiv v3); proof pp. 11–12 Uniform integral bounds and the new integral equivariance node precede the rational comparison. Added the exact semistable self-extension and bounded-range inverse-limit request; crystalline⇒semistable⇒de Rham does not give that converse. |
| PL.8/adjoint-selmer-vanishing | verified | NT23: Introduction, Theorem A and the remark after it, p. 2 (arXiv v3) The enormous-image detection, bounded-torsion patching and Brochard criterion feed the rational tangent comparison. This is not asserted from a formal kernel-zero template. |
| PL.8/pseudodeformation-ring-regular-at-automorphic-point | verified | NT21B: §2, proof of Theorem 2.1 (case p > 2), p. 13 (arXiv v2) The point is characteristic zero with an absolutely irreducible realized representation. The localized ring is its coefficient field; this does not identify the integral completed ring with a field. |
| PL.8/ordinary-tangent-vectors-h1g | verified | NT21: §2.18.1, Theorem 2.27 and its proof, pp. 42–43 (arXiv v3) The ordinary flag deformation has constant inertial characters and lies in the geometric local condition through the labelled separated-weight extension input. This input is distinct from the semistable self-extension comparison. |
| PL.9/rigid-residual-representation | verified | LTXZZ: §3.6, standing assumptions and Definition 3.6.1, p. 29 (arXiv:2108.06998v1; PDF page = printed page) Rigidity itself permits both multiplier parities. Inertial unramifiedness and unique Frobenius eigenvalue-pair occurrence are explicit; the even-parity local geometry is not used before parity is proved. |
| PL.9/rigid-parity-dimension-count | verified | LTXZZ: §3.5 Definition 3.5.1, Proposition 3.5.2 and equation (3.21), pp.27–28; Lemma 3.6.6 pp.32–33 and Theorem 3.6.3 proof p.35 (arXiv:2108.06998v1) The odd local chart forces z=0 and x=y, giving relative dimension N²−1 and tangent defect −1. With T=S, each such place adds one presentation generator, cancelling the local loss; depth then forces the multiplier parity. Exact nonsplit local/global supplier extensions are requested. |
| PL.9/rigid-r-equals-t | verified | LTXZZ: §3.6, Theorem 3.6.3, p. 30 (arXiv:2108.06998v1) The revised parity node is invoked before the even-sign ramified geometry. The middle-degree concentration, coefficient lattice, residual image and prime bound feed the actual integral patching/freeness statement. |
| PL.9/rigidity-for-almost-all-primes | verified | LTXZZ: §4.1, definition of r_{A,ℓ} and Proposition 4.1.1, p. 36 (arXiv:2108.06998v1) The symmetric-power input uses elliptic étale cohomology, and the automorphic supercuspidal argument uses the full Weil representation. Nonsplit-place deformation finiteness remains a recorded supplier extension. |
| PL.9/source-common-weight-conversion | verified | LLHLM23: §1.9.2 p.20; §2.1.2 pp.23–26; Theorem 2.5.4 p.36; Theorem 7.3.2 p.111; §9.1 pp.133–136 and Theorem 9.2.1 p.137 (arXiv:2007.05398v2) The negative reversed multiset gives λ_common=−reverse(λ_source)−(n−1), an involution preserving dominance. Highest-weight duality uses a transported lattice; numerical sign conversion keeps the representation, inertial type and source polynomial fixed. The automorphic dictionary is precisely requested. |
| PL.9/generic-local-domain-lifting | verified | LLHLM23: §9.2, Theorem 9.2.1, p. 137 (arXiv:2007.05398v2; PDF page = printed page) The local rings are domains or zero under the indicated genericity. The common signature converts numerical HT weights and retains source polynomial/type labels; no automorphic realization or coefficient-module equality is inferred from numerical conversion alone. |
| PL.9/generic-change-of-weight-lifting | verified | LLHLM23: §9.2, Remark 9.2.2, p. 137 (arXiv:2007.05398v2) The changed polynomial is not explicit in the source. The definite-unitary Serre-weight route retains p∤2n, F⁺≠Q and splitting at p, with its exact missing-owner input; these are not silently imposed on the base theorem. |


## Follow-ups and questions for the orchestrator

Keep PL.6 and PL.7 partial. The general weak-primitive generic restriction/R=T and ANT routes require a new argument outside the rank-below-characteristic bridge. The proposed strong-primitive targets are accepted; strengthening them to the full published forms requires further review. The two target-level additions should remain prerequisites of their consumers.

Route the three added requests to their existing owners: G7 continuous-induction/Clifford/finite-image interfaces (request 30), GlobalGaloisDeformations:G7 rank-one polarized ordinary finiteness (request 31), and PadicHodgeTheory:R06.2 semistable self-extensions and bounded-range inverse limits (request 32). Exact hypotheses, outputs and consumers are in the packet. Keep the existing geometric component, finite realization, type normalization, odd-multiplier local/global count and integral determinant refinements with their respective owners. Do not count them as completed library exports.

The remaining gaps, with their consumer nodes, are:

| Gap | Consumers |
| --- | --- |
| 1. The self-dual Dwork family: results of Barnet-Lamb–Geraghty–Harris–Taylor used by BLGGT14 Theorem 3.1.2 | PL.5/dwork-potential-ordinary-automorphy, PL.7/sum-of-characters-finiteness |
| 2. The generic Serre weight theorem (Le–Le Hung–Levin–Morra, Theorem 9.1.6) | PL.9/generic-change-of-weight-lifting |
| 3. The Ihara-avoidance R = T theorem with a potentially crystalline type at p (input of Le–Le Hung–Levin–Morra, Theorem 9.2.1) | PL.9/generic-local-domain-lifting |
| 4. Finiteness and the dimension bound at places not split in F | PL.9/rigidity-for-almost-all-primes, PL.9/rigid-r-equals-t |
| 5. Primitivity in Thorne 2015, Proposition 5.3 | PL.6/genericity-under-restriction, PL.6/generic-prime-r-equals-t, PL.7/ordinary-steinberg-finiteness, PL.7/residually-reducible-automorphy-lifting, PL.7/two-constituent-automorphy-lifting, PL.7/sum-of-characters-finiteness, PL.7/prescribed-type-lifts |
| 6. Allen–Newton–Thorne Theorem 4.1 for more than two constituents, and the case S(B) = ∅ | PL.6/generic-prime-r-equals-t, PL.2/definite-unitary-group |
| 7. Finiteness under the weakened hypothesis of Thorne 2024, Theorem 7.5 | PL.7/ordinary-steinberg-finiteness |
| 8. Statements used only as other sources cite them | PL.0/soluble-descent, PL.0/auxiliary-cm-extensions, PL.0/auxiliary-characters, PL.1/potentially-barsotti-tate-diagonalizable, PL.1/pd-operations, PL.2/unitary-constituent-galois-representation, PL.2/unitary-base-change-and-descent, PL.2/hecke-valued-galois-representation, PL.4/relaxed-adequacy, PL.8/bloch-kato-at-generic-places, PL.8/semistable-pseudodeformation-ring, PL.9/rigid-residual-representation, PL.9/rigid-r-equals-t |
| 9. Finite coefficient realizations and enlargement | PL.0/automorphic-polarized-representation, PL.0/auxiliary-characters, PL.2/unitary-constituent-galois-representation |
| 10. Geometric rather than arithmetic lifting components | PL.1/connects-relation, PL.1/connects-properties, PL.1/potentially-diagonalizable, PL.1/pd-criteria, PL.1/pd-operations |
| 11. Newton–Thorne deformation datum and ordinary Hecke construction | PL.2/big-ordinary-hecke-algebra, PL.2/ordinary-forms-free-over-lambda |
| 12. Integral trace equivariance and square-zero coefficient comparison | PL.8/pseudodeformation-tangent-comparison |
| 13. Labelled rank-one de Rham characters in the ordinary definition | PL.0/ordinary-of-weight, PL.8/ordinary-tangent-vectors-h1g |
| 14. Odd-multiplier level-raising geometry before the parity conclusion | PL.9/rigid-residual-representation, PL.9/rigid-r-equals-t |
| 15. LLHLM source weights and common Hodge–Tate convention | PL.9/generic-local-domain-lifting, PL.9/generic-change-of-weight-lifting |
| 16. Rank-one polarized ordinary finiteness in the reducible-locus proof | PL.7/reducible-locus-small, PL.7/generic-primes-large-quotients |
| 17. Semistable self-extensions in the rational tangent comparison | PL.8/pseudodeformation-tangent-comparison |


The orchestrator should arrange stage ids for the already-routed Dwork and generic GL3 Serre-weight owners and generate follow-up work for the precise partial-stage remainders. It should retain the version-specific scope of the source findings, especially E63 and E71–E73. This reviewer did not change upstream roadmaps, supplier packets, issue labels or atlas data.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/PotentialAutomorphyInfrastructurePartII.json` reports zero errors and zero warnings. The final structural check confirms the node and stage graphs are acyclic, internal references resolve, all 92 nodes have one review judgment, all 73 source findings have the review's verdict, all 24 definition/construction nodes have at least three tests, and packet/API/test/source/coverage inventories agree with the reader and suggested file. `git diff --check` passes. The intake file check reports six allowed files and zero problems.

`lean-check research/blueprint/suggested/PotentialAutomorphyInfrastructurePartII.lean` exited successfully at the pinned shared Mathlib build on the final suggested file. Its 883 warnings are all `declaration uses 'sorry'`; there are no other warnings or errors. Elaboration checks the types of proposed interfaces, not the missing proofs or the correctness of imported owner results. No language server, project build or dependency update was run.
