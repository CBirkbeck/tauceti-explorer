# Independent review: REV-DESIGN-PotentialAutomorphyInfrastructurePartII~2

**Verdict: needs_changes. This review is finished.** Issue #7022; Codex session codex-97pQYJ; 8 October 2026. I did none of either design round. I reviewed the round-2 packet, roadmap, reader and complete suggested file, the preceding review and revision handoff, and the binding worker, blueprint, expansion and upstream instructions.

The revision substantially improves the arithmetic signatures, ordering, supplier requests and source reading. I applied the clear corrections below. Nineteen proposed nodes still have a target-level interface or proof-route problem, so the acceptance requirement that every node be justified is not met. Merely having requests and `sorry` signatures does not establish those interfaces. The partial status records exactly where the revision must continue; it does not leave this review unfinished.

## Counts and scope

| Item | Received | After review |
| --- | ---: | ---: |
| Nodes | 86 | 86 |
| Definitions / constructions / theorems | 12 / 10 / 64 | 12 / 10 / 64 |
| API items / unit tests | 134 / 93 | 134 / 93 |
| Planets | 35 | 35 |
| Baseline declarations | 3 | 3 |
| Supplier requests | 24 | 27 |
| Gaps | 8 | 15 |
| Source findings | 54 | 70 |
| Coverage: planned / partial / closed | 10 / 0 / 0 | 3 / 7 / 0 |
| Packet status | complete | partial |

Individual node judgments: **58 verified, 9 corrected, 19 unverifiable**. None added, removed or marked formalized. All 86 judgments appear below and in `review.checked`. There are 475 source references on nodes. All 134 API entries and all 93 tests were read; each definition/construction retains at least three examples. No new generic definition duplicates a supplier. The 35 planet choices remain appropriate target-level objects/theorems.

The suggested file was read throughout, including imported carriers, helper blocks, all node signatures, API declarations and examples. The review concerns their proposed mathematical content; its compilation does not prove a theorem whose body is `sorry`.

## Response to the first review

| Earlier demand | Round-2 result and independent check |
| --- | --- |
| Replace generic placeholders by arithmetic signatures | The revision now uses Galois representations, polarized data, actual local/global conditions, Hecke modules, ordinary towers, prime ideals and characteristic-zero fibres. The remaining finite-coefficient and component assumptions below still exceed their carriers. |
| Fix PL.2 consuming a later Taylor–Wiles datum | Level structures moved to PL.3. The internal node graph and stage dependencies are acyclic. No stale PL.2 level-structure reference was found. |
| Read Ger19, BG19 and Tho24 refinements | Independently obtained the exact public versions at their recorded hashes and read the cited statements/proofs, including ordinary classicality, the Schur lift proof and strengthened finiteness. These are no longer unread-source gaps. |
| Preserve corrected ordinarity/component/Hecke statements | Checked the isobaric permutation condition, potentially Barsotti–Tate ordinary/nonordinary split representatives, localized Taylor–Wiles polynomial cutouts, finite ordinary isotypic classicality and full multiplier normalization. The new signature repairs below are additional. |
| Distinguish polarized Schur theory and reducibility ideals | The polarized carrier, closed determinant subring, block signs, split ideal and determinant reducibility product are distinguished. The generic R=T route still needed its strong-primitivity hypothesis. |
| Provide exact requests and honest coverage | Supplier scopes were read and requests refined; seven target-level gaps added. Seven layers become partial. The packet has not been accepted simply because these problems now have names. |
| Reconcile reader and packet | Regenerated the reader from the corrected node, API, test, prerequisite, source, request and gap content, and reconciled its conventions and consumer claims. Reader drift is repaired in this review. |

## Clear corrections applied

1. **Ordinary dominance.** `IsOrdinaryOfWeight` now includes `∀ τ, Antitone (lam τ)`, as in Tho15 Definition 2.5, pp.11–12, and BLGGT14 §1.4, p.25. The packet API/proof agrees. Ordered flags alone do not impose dominance on the declared weight.
2. **Generic-fibre nilpotence.** The second generic smoothness conclusion now expresses vanishing after inverting l as `∃ k m, 0 < m ∧ l^k * x^m = 0`. Nilpotence of `l*x` incorrectly fixes the relative exponents. BLGGT14 Lemma 1.3.2, pp.19–20, and component remarks pp.21–24 supply the geometry.
3. **Unitary datum and choices.** Added positive rank, splitting at S(B), and one selected place per conjugate pair. Moved the split/place helpers before their consumers and repaired the place-above-l selection and uniqueness in T. The API restricts the matrix identification to split places outside S(B), where the central simple algebra is split; the general (B,*,O_B) inner form remains supported. Tho12 §6, pp.30–32; Tho15 §4.1, pp.34–35; ANT20 §4.1, p.13. Retargeted adelic/local-point requests from AA.0 to AA.1. A quasi-split hermitian model is constructed in PL.2, not supplied by AA.1's restricted-product machinery.
4. **Hecke evaluation.** Added the support condition on double-coset representatives to the simplified Hecke and Taylor–Wiles V evaluation formulas. Their projections away from the chosen place must be identity, so the l-adic and auxiliary coefficient actions are trivial. Arbitrary representatives require those actions in the formula. Tho12 §6, pp.32–36; Tho15 §4.1–4.3, pp.34–40.
5. **Taylor–Wiles level quotient.** Added `D.MinimalLevel` to the U₀/U₁=Δ theorem. It includes the product-level and spherical-at-Q hypotheses that make the quotient calculation valid. Localized projectors remain in the freeness and coinvariant assertions. Tho12 §5, pp.18–30; Ger19 §4.2, pp.45–50.
6. **Uniform ordinary coefficient bound.** Restricted the O-generator assertion for the characteristic-polynomial subring to the fixed ordinary Λ of Tho15 §3.2, p.13. An arbitrary complete coefficient algebra is a stronger claim than Proposition 3.29, pp.24–25, supplies. Added that setup locator and kept the ANT20 irreducible étale comparison separate.
7. **Generic R=T primitivity.** Both proposed generic R=T signatures now assume strong primitivity, which prevents a residual representation being the semisimplification of a proper induction. The downstream weak-primitive targets explicitly retain their gap. Tho15 Proposition 5.3, p.58; Theorem 4.19/Corollary 4.20, pp.47–48,61–63; ANT20 Theorem 4.1, p.15. This does not prove the published weak-primitive statements false.
8. **Semistable quotient nonemptiness.** The constrained determinant quotient is allowed to be zero; membership in C_O needs a nonempty residual fibre. The existing quotient signature is retained without manufacturing a local-ring instance. NT23 Propositions 2.12–2.14, pp.13–14; the published Proposition 2.14, p.1932, retains the overstatement. E62 gives the explicit rank-one obstruction. Later tangent comparisons assume a chosen semistable lift and thus nonemptiness.
9. **Rigidity versus parity.** Removed an even-µ hypothesis from the rigidity predicate. LTXZZ Definition 3.6.1, p.29, defines it for either parity, with the unramified local condition and pair occurrence retained. The parity-restricted geometry is a separate unresolved input to the R=T proof.
10. **Source-local weight conventions.** Corrected the PL.9 prose and reader to distinguish LLHLM23's HT(ε)=+1 from the common −1 convention. For descending weights the conversion is `λ_common,i = −λ_source,n+1−i − (n−1)`; polynomial genericity stays indexed by source λ+η. Removed an unsupported claim that the extra standing hypotheses of §9.1 automatically govern Theorem 9.2.1. The suggested coefficient/K-type comparison remains unresolved.

## Baseline and ownership audit

Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`; pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. Every listed Mathlib declaration was opened at that commit and its statement read. No baseline entry was removed or replaced.

| Declaration and pinned source | Exact scope needed |
| --- | --- |
| [Ideal.minimalPrimes](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/MinimalPrime/Basic.lean) | Minimal elements among prime ideals above the given ideal, for a commutative semiring. Suitable for arithmetic irreducible components; it does not identify them with geometric components after field extension. |
| [ringKrullDim](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/KrullDimension/Basic.lean) | Dimension of the prime spectrum, valued in `WithBot ℕ∞`. Arithmetic finite dimensions and quotient inequalities need their own hypotheses; no conversion to an ordinary natural number is implicit. |
| [IsLocalRing](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/LocalRing/Defs.lean) | Nontrivial local semiring structure. Completeness, Noetherianness, residue-field identification and a nonempty constrained deformation condition are separate. |

The packet has no Tau declaration in its baseline. Its upstream CFT.12/Che.10 statement uses were read at the Tau pin. The upstream Multiquadratic and GlobalNumberFields documents were read in full. No upstream document or library audit was edited.

The original 107 external references were checked: 102 resolved supplier nodes/stages, three Mathlib entries and two upstream references. In addition, AA.1 and the AG2.7/R06.2 stage scopes used in the refined requests were read. This verifies ownership and statement scope, not implementation. The reviewed library audit has no entry building this new roadmap or its parent; its relevant generic arithmetic, linear-algebra, representation and patching results are imported. G7 and AG2 lack implementations, and the R03.5 patching request is not a built theorem.

AA.0 owns restricted-product preliminaries; AA.1 owns adelic points/local projections once a group is given. PL.2 owns the definite unitary arithmetic specialization. AF owns generic algebraic coefficients/forms; IHG owns determinants and Cayley–Hamilton machinery; local rings and abstract patching stay with their named owners. New requests extend existing owners instead of creating duplicate nodes. The uncreated Dwork/Serre-weight directions and the four restructure proposals remain honest proposals, not usable imported theorems.

## Required next revision and orchestrator routing

1. **Finite realizations (PL.0/PL.2).** `RACP.galoisRep`, `residualRep`, constituent realizations and auxiliary characters cannot be total over arbitrary finite E from `IsLargeForF` alone. AG2.2/AG2.7 must provide an explicit finite E′, realization/lattice data and residual base change, or the carriers must be restricted to E-realized data. BLGGT14 §2.1, pp.31–35, and Lemma A.2.5, pp.88–90, work over Q̄_l. The new request specifies the finite enlargement and independence maps.
2. **Geometric components (PL.1).** BLGGT14 §§1.3–1.4, pp.21,26–29, uses components over Q̄_l. Finite-E minimal primes need an E′ over which their selected component quotients are geometrically integral, plus compatible base-change and independence comparisons from R08.3. Add the absent l=p D_C problem. Merely renaming arithmetic components cannot justify the operations or diagonalizability criteria.
3. **Ordinary deformation datum (PL.2).** Add a construction node for NT21 §6, pp.79–82: D, U(D,c), M_D, ordinary forms, T_D, P_D, J_D and comparison maps, with API/tests. The missing item is part (d) of this packet's ordinary-freeness node; the source does not have a “Proposition 6.5(d)”. Give that target its Lean statement.
4. **Integral trace comparison (PL.8).** State the NT23 Proposition 2.7 square-zero O⊕εE/O comparison and ε-scaling maps, and the integral Gal(F/F⁺)-equivariance of §2.4, pp.19–20. A rational trace map alone does not imply the required integral self-dual specialization. Request the generic determinant comparison from IHG.1 and own the polarized specialization here.
5. **Weak primitivity (PL.6/PL.7).** Resolve the strong-versus-weak route before calling the source weak-primitive lifting/finiteness targets justified. Either establish the needed semisimple induction comparison or explicitly strengthen every affected target and intended application. The source claim and the corrected narrower proposed theorem are currently distinguished. The large-ratio character application also needs a full strong-primitivity argument.
6. **Multiplier parity (PL.9).** LTXZZ Proposition 3.5.2, p.27, assumes even µ, while Theorem 3.6.3, pp.30–35, deduces parity later. The proposed upper-dimension repair did not supply the odd-µ tangent dimension and Taylor–Wiles generator count. Route the precise arbitrary-µ ramified condition to L7; establish its contribution before using the even-µ geometry. Keep the nonsplit-place presentation request to G7.
7. **Weights/types (PL.9).** Supply the conversion of LLHLM source weights to the common convention, including algebraic coefficients, residual Serre weights, K-types and polynomial indices. Theorem 9.2.1, p.137, retains the source-local hypotheses; the extra §9.1 inputs of Theorem 9.1.6, pp.133–136, belong to the change-of-weight route. Do not identify the two λ variables in the current suggested signatures.

The labelled nonparallel character and separated-weight extension input is additionally a precise request to PHT R06.2, not a deduction from its parallel cyclotomic special case. Each of the seven partial layers has explicit `remaining` targets. PL.3–PL.5 remain planned with recorded lemma-level supplier work. No layer is marked closed.

These are concrete revision tasks for the orchestrator. No answer from the maintainer is needed to complete this review. The next design revision should address them in the same roadmap and retain the independently adjudicated version limits.

## Source reading and adjudication

All nineteen listed public PDFs were independently obtained at the packet's recorded SHA-256 hashes. Node locators, API/proof uses and all existing source findings were read in those versions. This is a target-focused review, not a claim to have extracted every statement in nineteen papers. The metadata retains earlier source-reading history where applicable. No restricted book or passage was copied into a deliverable. All results and findings here are in my own words.

| ID | Exact public version used |
| --- | --- |
| BLGGT14 | [Annals of Mathematics 179 (2014), 501–609; read in arXiv:1010.2561v4 (9 December 2013)](https://arxiv.org/abs/1010.2561v4) |
| Tho12 | [Journal of the Institute of Mathematics of Jussieu 11 (2012), 855–920; read in arXiv:1107.5989v1 (29 July 2011)](https://arxiv.org/abs/1107.5989v1) |
| Tho17 | [Mathematische Zeitschrift 285 (2017), 1–38; read in the author's accepted manuscript dated 16 March 2016 (Apollo, University of Cambridge repository)](https://www.repository.cam.ac.uk/handle/1810/254922) |
| Tho15 | [Journal of the American Mathematical Society 28 (2015), 785–870; read in the author's accepted manuscript dated 16 April 2014 (Apollo, University of Cambridge repository)](https://www.repository.cam.ac.uk/items/2796d161-598e-44da-83fd-2015c26f1dbc) |
| ANT20 | [Compositio Mathematica 156 (2020), 2399–2422; read in arXiv:1912.11269v2 (13 August 2020)](https://arxiv.org/abs/1912.11269v2) |
| NT23 | [Journal of the European Mathematical Society 25 (2023), 1919–1967; read in arXiv:1912.11265v3 (30 June 2023), whose numbering is used here](https://arxiv.org/abs/1912.11265v3) |
| NT21 | [Publications mathématiques de l'IHÉS 134 (2021), 1–116; read in arXiv:1912.11261v3 (27 September 2021)](https://arxiv.org/abs/1912.11261v3) |
| NT21B | [Publications mathématiques de l'IHÉS 134 (2021), 117–152; read in arXiv:2009.07180v2 (27 September 2021)](https://arxiv.org/abs/2009.07180v2) |
| NT26 | [Annals of Mathematics 203 (2026); read in arXiv:2212.03595v2](https://arxiv.org/abs/2212.03595v2) |
| BCG25 | [Journal of the American Mathematical Society 38 (2025), 509–520; read in arXiv:2309.15944v3 (mathematically identical to the published text, as the extraction PAPER-BOXER-CALEGARI-GEE-25 records)](https://arxiv.org/abs/2309.15944v3) |
| LTXZZ | [Acta Mathematica Sinica, English Series 40 (2024); read in arXiv:2108.06998v1, the version cited by Liu et al., Invent. Math. 228 (2022)](https://arxiv.org/abs/2108.06998v1) |
| LLHLM23 | [Inventiones mathematicae 231 (2023), 1277–1488; read in arXiv:2007.05398v2](https://arxiv.org/abs/2007.05398v2) |
| CT14 | [Compositio Mathematica 150 (2014), 729–748; read in the author manuscript lrspi.pdf](https://www.dpmms.cam.ac.uk/~jat58/lrspi.pdf) |
| GK14 | [arXiv:1208.3179v5 (12 June 2026); this version, not an unchecked version of record](https://arxiv.org/abs/1208.3179v5) |
| Che14 | [arXiv:0809.0415v2 (18 July 2013)](https://arxiv.org/abs/0809.0415v2) |
| Ger19 | [Mathematische Annalen 373 (2019), 1341–1427; read in the author's preprint dated 12 March 2010, whose numbering (Lemma 2.6.4, Lemma 5.1.6, …) is the one BLGGT14 and Thorne cite and is used here; the published version numbers its statements differently and was not obtained](https://web.archive.org/web/2id_/https://www2.bc.edu/david-geraghty/files/oml.pdf) |
| BG19 | [Algebra & Number Theory 13 (2019), 333–378; read in arXiv:1708.04885v3 (30 December 2018)](https://arxiv.org/abs/1708.04885v3) |
| Tho24 | [Proceedings of the London Mathematical Society (3) 128 (2024), e12584; read in arXiv:2212.03591v2](https://arxiv.org/abs/2212.03591v2) |
| LLHLM20 | [Forum of Mathematics, Pi 8 (2020), e5; read in arXiv:1608.06570v4](https://arxiv.org/abs/1608.06570v4) |

The EMS version of record of NT23 was additionally read at Proposition 2.14 and its context/proof, pp.1932–1933, and Proposition 3.1 and its proof, pp.1945–1946: [published PDF](https://ems.press/content/serial-article-files/32858?nt=1), SHA-256 `bb106d634bf2f78d650d159710941be575fda4ae16447ac9125e62d2d99c6139`. E62 persists there; E63 is corrected there. The AMS Tho15 publisher PDF refused the request with HTTP 403. This is recorded in `sourceVersions`, and E65 concerns only the accepted manuscript. Other uncollated publisher versions are explicitly excluded from the findings' scope. No blanket claim about every version of record is made.

All 54 received findings have this review's individual confirmed verdict and reasoning in the packet. Confirmation applies to their corrected, narrowed form:

* E27 retains the missing semisimple-induction step. The unestablished SL₂ counterexample is removed; weak primitivity is not declared false by that example.
* E42 is a proof gap: the cyclotomic twist on the scalar invariant line cannot simply be dropped. Its former Artinian rank-one counterexample is removed. In a Schur context, appropriate H⁰ vanishing or the indicated cyclotomic-field exclusion supplies the lift proof. The review does not claim that BG19's corollary is false.
* E54 retains the source notation/sign ambiguity. It no longer claims that the additional §9.1 standing hypotheses are automatically required by §9.2.
* Previously narrowed E2 remains scoped to the actual Proposition 6.1 occurrence; the absent additional Lemma 5.7 occurrence is excluded.

The 16 added findings are 14 misprints and two errors. Each has a locator, own-word assertion, repair, argument, effect, search/version limits and this review's verdict. E60 is already registered; E63 is already corrected in print. None is advertised as a new publisher error without collation.

| Finding | Exact locator | Repair and scope |
| --- | --- | --- |
| E55 | Tho17: §2.4, proof of Proposition 2.21, p.15 (accepted manuscript of 16 March 2016) | Replace injectivity by nonzero, hence surjective onto that one-dimensional target; its kernel is one-dimensional. Effect: nothing. No correction found in the exact public version and atlas register inspected; the version of record was not collated for this review. |
| E56 | BCG25: §3, proof of Theorem 3.1, p.10 (arXiv:2309.15944v3; two citations) | Use Tho17 Theorem 5.1, or, for the odd-prime version, Tho12 Theorem 7.1 with the corrected Tho17 Corollary 7.3. Effect: nothing. No correction found in the exact public version and atlas register inspected; the version of record was not collated for this review. |
| E57 | BCG25: §2, proof of Theorem 2.1, p.7 (arXiv:2309.15944v3) | Use Theorem 10.2 for the ordinary ring; Theorem 10.1 is the fixed-component theorem. Effect: nothing. No correction found in the exact public version and atlas register inspected; the version of record was not collated for this review. |
| E58 | Tho12: §10, proof of Theorem 10.1, p.56 (arXiv:1107.5989v1) | The residual maximal ideal contains that kernel. Effect: nothing. No correction found in the exact public version and atlas register inspected; the version of record was not collated for this review. |
| E59 | Tho12: §10, proof of Theorem 10.2, p.57 (arXiv:1107.5989v1) | Use the places S_M above S, together with the newly selected auxiliary place. Effect: nothing. No correction found in the exact public version and atlas register inspected; the version of record was not collated for this review. |
| E60 | NT21: §5, proof of Corollary 5.5, p.72 (arXiv:1912.11261v3) | Use G_{F⁺,S} for the 𝒢_n-valued residual homomorphism. Effect: nothing. Also recorded as PAPER-NEWTON-THORNE-21/E20 (published-page concordance); independently checked here in arXiv v3 p.72. |
| E61 | ANT20: §6, proof of Theorem 6.2, p.20 (arXiv:1912.11269v2) | Use S − (S_l ∪ {v₀}). Effect: nothing. No correction found in the exact public version and atlas register inspected; the version of record was not collated for this review. |
| E62 | NT23: §2.3, Proposition 2.14, p.13 (arXiv:1912.11265v3); version of record, JEMS 25 (2023), §2.3, Proposition 2.14, p.1932 (proof p.1933) | Allow the zero constrained quotient, or assume the residual determinant admits a Cayley–Hamilton model in the stable category before calling the representing ring an object of C_O. Effect: a stated result. The missing nonempty-residual-fibre hypothesis remains in the EMS version of record inspected on 8 October 2026; no correction found in the atlas register or publisher article listing. |
| E63 | NT23: §3, proof of Proposition 3.1, p.25 (arXiv:1912.11265v3) | Give f domain ⊕ M_U and codomain M_I; give g domain M_I and codomain ⊕ M_U. Effect: nothing. Already corrected in the version of record: JEMS 25 (2023), proof of Proposition 3.1, p.1946. The finding applies to arXiv v3 only. |
| E64 | BLGGT14: §2.1, polarized automorphic-pair definition, p.32 (arXiv:1010.2561v4) | Use χ in that sign condition. Effect: nothing. No correction found in the exact public version and atlas register inspected; the version of record was not collated for this review. |
| E65 | Tho15: Notation, p.4 (accepted manuscript of 16 April 2014) | It has n weights counted with multiplicity; distinctness additionally requires regularity. Effect: a stated result. Confirmed in the accepted manuscript only. The AMS publisher PDF request returned HTTP 403 on 8 October 2026, so no claim is made about the version of record. |
| E66 | Ger19: §2.4, Remark 2.4.6, p.14 (author preprint of 12 March 2010) | It is an anti-isomorphism, or an isomorphism into the opposite algebra; it gives an isomorphism on the commutative Hecke subalgebras used there. Effect: nothing. No correction found in the exact public version and atlas register inspected; the version of record was not collated for this review. |
| E67 | Ger19: §2.7, weak-admissibility argument, p.23 (author preprint of 12 March 2010) | Use t_N(D)=t_H(D), and use the induced filtration on D′ in the subobject formula. Effect: nothing. No correction found in the exact public version and atlas register inspected; the version of record was not collated for this review. |
| E68 | Ger19: §3.1, paragraph before Lemma 3.1.1, p.29 (author preprint of 12 March 2010) | Use upper triangular in place of diagonal. Effect: nothing. No correction found in the exact public version and atlas register inspected; the version of record was not collated for this review. |
| E69 | ANT20: §3.2, proof of Lemma 3.4, p.10 (arXiv:1912.11269v2) | The determinant is scalar-valued in A. Effect: nothing. No correction found in the exact public version and atlas register inspected; the version of record was not collated for this review. |
| E70 | Tho24: §7, proof of Lemma 7.3, p.42 (arXiv:2212.03591v2) | Choose n/2 < p < n in the relevant integer range. Effect: nothing. No correction found in the exact public version and atlas register inspected; the version of record was not collated for this review. |

For E62 the counterexample is F=ℚ, p>2, S={p}, residual rank-one cyclotomic character and interval [0,0]. Semistable representations with all Hodge–Tate weights zero are unramified: weak admissibility forces Newton slopes zero and hence N=0. Their lattice subquotients are unramified. The residual cyclotomic character has nontrivial inertia, so the stable residual fibre is empty. Every object of C_O has a reduction map to k, preventing it from representing this empty functor. The corrected zero quotient/nonemptiness distinction leaves applications with a chosen semistable lift intact.

For E65 the trivial rank-two representation is de Rham with weights 0,0, so multiplicities cannot be replaced by distinctness without regularity. This counterexample concerns the accepted manuscript's general assertion, not its regular automorphic applications or an unread publisher text.

## Per-node judgments

“Verified” means the proposed statement and route match the exact source and read supplier scopes, subject to explicitly requested inputs. “Corrected” means a clear repair was applied in this review. “Unverifiable” means the precise target-level issue listed in the note remains; it is not a claim that the source theorem is false. Independent compilation verifies none of these proof routes by itself.

| Node | Verdict | Check / remaining limitation |
| --- | --- | --- |
| `PL.0/ordinary-of-weight` | corrected | Tho15 Definition 2.5 pp.11–12 and BLGGT §1.4 p.25 checked; added dominance to IsOrdinaryOfWeight. Flag order, Tate/supersingular examples and dual shift agree. Labelled character and extension inputs remain a precise R06.2 request. |
| `PL.0/iota-ordinary-principal-series` | verified | Tho15 Lemma 2.3 pp.10–11, CT14 Lemma 2.5 pp.5–6 and Ger19 §5.1 pp.59–62 checked; generic principal-series constituents and the ordered geometric-Artin valuation convention agree. |
| `PL.0/automorphic-polarized-representation` | unverifiable | BLGGT §2.1 pp.31–35 gives the full multiplier and the source definitions. The total fixed-E RACP Galois/residual carrier assumes a field of definition not provided by IsLargeForF; the coefficient-enlargement gap remains. |
| `PL.0/iota-ordinary-implies-ordinary` | verified | Tho15 Theorem 2.4/Corollary 2.6 pp.11–12 and Ger19 Lemma 5.2.1 p.63 checked; local principal-series comparison has the indicated ordinary Hodge weights. Uses the requested automorphic realization input. |
| `PL.0/ordinary-implies-iota-ordinary` | verified | BLGGT §2.1 remark (7) p.34 and Ger19 Propositions 5.3.1/5.4.1 pp.64,66 checked; potentially prime-to-l level permits the soluble-base-change comparison. No unrestricted converse is asserted. |
| `PL.0/steinberg-weight-zero-iota-ordinary` | verified | NT26 Lemma 2.6 pp.12–13 checked; the Steinberg criterion is weight zero with the stated generic local components, not an arbitrary-weight statement. |
| `PL.0/isobaric-sum-iota-ordinary` | verified | CT14 Lemma 2.6 pp.6–7 checked; both shifted summands and the local-place-independent interleaving are necessary. The revised two-summand API matches that equivalence. |
| `PL.0/automorphy-under-twist` | verified | BLGGT Lemma 2.2.1 pp.35–36 checked; the proof kills finite inertia of the smooth Hecke character, not the algebraic cyclotomic character. The full multiplier twists by ψψ^c. |
| `PL.0/soluble-descent` | verified | BLGGT Lemma 2.2.2 pp.35–36 checked; irreducibility after restriction is retained, with soluble descent and semisimple Galois recognition separately imported. |
| `PL.0/induction-descent` | verified | BLGGT Lemmas 2.2.3–2.2.4 pp.36–37 checked; archimedean polarization, continuous induction and Frobenius recognition are explicit supplier inputs, not implied by induction alone. |
| `PL.0/auxiliary-cm-extensions` | verified | BLGGT A.2.1–A.2.3 pp.86–88 checked; the alternative hypotheses in the corollary are retained. Prescribed local cyclic extensions are requested from IG.4, with CHT proof inputs honestly secondary. |
| `PL.0/auxiliary-characters` | unverifiable | BLGGT A.2.5 pp.88–90 checked, including parity and full local residual restrictions. The Lean output stays in fixed E although the existence theorem allows coefficient enlargement; explicit E′-valued realization remains missing. |
| `PL.1/connects-relation` | unverifiable | BLGGT §§1.3–1.4 pp.21,26–29 checked. Finite-E minimal primes lack the required geometric-component comparison, and D_C at l=p has no signature; both are target-level interface gaps. |
| `PL.1/connects-properties` | unverifiable | BLGGT §1.3 pp.21–24 and §1.4 pp.26–29 checked; the source conjugacy/restriction/strong connection assertions concern geometric components. The finite-E relation has not been identified with them. |
| `PL.1/generic-smooth-points` | corrected | BLGGT Lemma 1.3.2 pp.19–20 and remarks pp.21–24 checked. Replaced nilpotence of l*x by vanishing after inverting l, expressed as ∃ k,m>0, l^k*x^m=0. Generic LLC and local duality remain imported. |
| `PL.1/potentially-diagonalizable` | unverifiable | BLGGT §1.4 pp.26–29 and Lemma 1.4.1 checked. Crystalline characters and the lattice-change definition agree in prose, but the Lean diagonal component relation still uses unverified finite-E arithmetic components. |
| `PL.1/pd-criteria` | unverifiable | BLGGT Lemma 1.4.3 pp.28–29 checked, including potential crystallinity and the unramified Fontaine–Laffaille range. The source criterion is sound; its conclusion in the current finite-E component predicate is not yet justified. |
| `PL.1/potentially-barsotti-tate-diagonalizable` | verified | GK14 Lemma 4.4.1 pp.19–20 checked with pp.5–6 conventions: ordinary and nonordinary split lifts both occur. The plan keeps l>2 and precisely requests the arbitrary-local-field component comparison from R08.4. |
| `PL.1/pd-operations` | unverifiable | BLGGT component remarks §§1.3–1.4 checked; restriction, direct sums, tensors and symmetric powers use compatible geometric component maps. The current finite-E relation has no comparison supplying these operations. |
| `PL.2/definite-unitary-group` | corrected | Tho12 §6 pp.30–32, Tho15 §4.1 pp.34–35 and ANT20 §4.1 p.13 checked. Enforced positive rank and split, distinct chosen S(B) places; repaired conjugate-place choices and the API’s restriction outside S(B). Retargeted adelic arithmetic to AA.1. |
| `PL.2/unitary-algebraic-modular-forms` | verified | Tho12 §6 pp.31–33 and Ger19 §2.1–2.3 pp.4–11 checked. Specialization of AF.5 uses the actual integral coefficient module and local action; four tests check zero/weight-zero/base-change/smallness behaviour. |
| `PL.2/unitary-hecke-algebra` | corrected | Tho12 §6 pp.32–36 and Tho15 §4.1–4.3 pp.34–40 checked. Hecke coset evaluation now requires representatives supported at the Hecke place so the coefficient action is trivial; finiteness and Frobenius polynomial remain correctly restricted. |
| `PL.2/exactness-and-freeness` | verified | Tho12 Lemmas 6.3–6.4 pp.33–35 and Ger19 §2.1–2.2 checked. Prime-to-l stabilizers, normal smaller level and O[U/V] freeness at the smaller level are all present. |
| `PL.2/unitary-constituent-galois-representation` | unverifiable | Tho12 Theorem 6.5 pp.35–36 and Ger19 pp.34–35 checked; semisimple isobaric constituent comparison is appropriate. A fixed E cannot contain every constituent Galois representation without an explicit realization/enlargement input. |
| `PL.2/hecke-valued-galois-representation` | verified | Tho12 Propositions 6.6–6.7 pp.36–37 and Tho15 §4.3 checked. Non-Eisenstein residue, Carayol/determinant gluing and full multiplier hypotheses distinguish this R→T from the reducible P→T theory. |
| `PL.2/unitary-base-change-and-descent` | verified | CT14 Proposition 2.9 p.8 and Tho12 §§6,10 checked; the matrix and division-inner-form transfer is a specific ET.7a request. Weak/strong base-change compatibility is kept as an input, not a claimed proof of Labesse. |
| `PL.2/iwahori-ordinary-parts` | verified | Ger19 §§2.3–2.4 pp.11–16 and Tho12 §8 pp.43–46 checked; rescaled integral U operators and factorial limits on finite coefficient quotients match the revised inverse-limit ordinary projector. |
| `PL.2/big-ordinary-hecke-algebra` | unverifiable | Ger19 §§2.4–2.6 pp.12–22 and Tho12 §8 checked. The tower and ordinary Λ action are supplied, but NT21 §6 pp.79–82 deformation datum/T_D/P_D/J_D has no owned construction/API node; it is target-level work. |
| `PL.2/ordinary-forms-free-over-lambda` | unverifiable | Ger19 Proposition 2.5.3 pp.17–19, Tho12 Proposition 8.2 pp.45–46 and NT21 Proposition 6.5 pp.81–82 checked. The first three parts have arithmetic forms; NT21 part (d) lacks its datum and Lean statement. |
| `PL.2/hida-classicality` | verified | Ger19 Definition 2.6.3/Lemma 2.6.4 p.21 and proof pp.21–22 checked. The finite-character isotypic specialization is retained; the plan does not equate it with the whole classical level space. |
| `PL.2/ordinary-hecke-galois-representation` | verified | Tho12 Propositions 8.4–8.5 pp.46–48 and Ger19 §2.7 pp.23–29 checked; ordinary flags and universal inertial characters factor through the correct local ordinary rings with the Λ structure. |
| `PL.3/thorne-taylor-wiles-datum` | verified | Tho12 Definition 4.1/Lemma 4.2 pp.12–14 checked. The revised datum has nonzero scalar Frobenius eigenspaces, unramified complementary blocks, distinct split places and a predicate for every level N; empty Q is tested. |
| `PL.3/taylor-wiles-level-structures` | corrected | Tho12 §5 pp.18–30 and Ger19 §4.2 pp.45–50 checked. Added MinimalLevel to U₀/U₁=Δ and supported coset representatives to twV_apply. Polynomial cutouts, freeness and coinvariants retain the localized projectors. |
| `PL.3/adequate-taylor-wiles-primes` | verified | Tho12 Proposition 4.4 pp.15–17 and Tho17 Proposition 7.1 p.31 checked; the original component-group and corrected GL adequacy formulations remain separate, with the q−q₀ generator count. |
| `PL.3/taylor-wiles-primes-two-adic` | verified | Tho17 Proposition 2.21 pp.14–15 checked; the local line, sign and p=2 presentation extension are precisely requested. E55 corrects an impossible injectivity label in the source proof without changing the argument. |
| `PL.3/minimal-r-equals-t` | verified | Tho12 Theorem 6.8/Corollary 6.9 pp.37–42 checked. Arithmetic type, component support, localized Hecke point and actual Taylor–Wiles module patching replace the earlier arbitrary-surjection template. |
| `PL.3/ordinary-r-equals-t` | verified | Tho12 Theorem 8.6/Corollary 8.7 pp.48–53 and Ger19 Theorem 4.3.1 p.51 checked. Ordinary local rings, Λ-free patched modules and Ihara avoidance are explicit; no universal nilpotent-kernel assertion remains. |
| `PL.3/revised-adequacy-r-equals-t` | verified | Tho17 Proposition 7.2 p.32 checked against its erratum setup. It replaces the adequacy input in the two preceding arithmetic patching statements rather than asserting a new blanket R=T. |
| `PL.4/minimal-automorphy-lifting` | verified | Tho12 Theorem 7.1 pp.42–43, BLGGT Theorem 2.3.1 p.38 and Tho17 Corollary 7.3 p.32 checked. Full multiplier conversion, seed and local component hypotheses agree with the revised forms. |
| `PL.4/strongly-residually-odd` | verified | Tho17 Definition 3.3 pp.17–18 checked. Even rank has positive half-rank in the congruence/sign dichotomy, and the mod-2 polarized carrier rather than a free Prop is used; tests distinguish the forms. |
| `PL.4/two-adic-automorphy-lifting` | verified | Tho17 Theorem 5.1 pp.21–24 checked; p=2 and p∣n use the revised adequacy and strong residual oddness at even rank, with every finite-place component comparison retained. |
| `PL.4/relaxed-adequacy` | verified | BCG25 proof of Theorem 3.1 pp.9–10 checked against the original Tho17 adequacy uses. The H¹(ad) relaxation is an explicitly attributed variant, with its uses listed; E56 repairs the source cross-reference. |
| `PL.4/ordinary-automorphy-lifting` | verified | Tho12 Theorem 9.1 pp.53–54 and BLGGT Theorem 2.4.1 p.39 checked. Both source versions retain seed, ordinary weight and residual hypotheses; prime-to-l level is conditional on crystallinity. |
| `PL.4/minimal-finiteness` | verified | Tho12 Theorem 10.1 pp.54–56 and BLGGT Theorem 2.3.2 pp.38–39 checked. Fixed components, integral seed, finite ramification set and coefficient ring are specified; the local–global level bridge remains an honest source-input limitation. |
| `PL.4/ordinary-finiteness` | verified | Tho12 Theorem 10.2 pp.56–58 and BLGGT Theorem 2.4.2 pp.39–40 checked. ss-ordinary local finiteness and the Λ/specialized weights are not confused with the fixed-component case. |
| `PL.4/characteristic-zero-lifts` | verified | BLGGT Proposition 1.5.1 pp.29–30 checked; the invariant vanishing, local nonempty components and positive dimension are explicit. This does not rely on the unjustified scalar vanishing in BG19. |
| `PL.5/dwork-potential-ordinary-automorphy` | verified | BLGGT Theorem 3.1.2 pp.42–44 checked. Semisimplified symplectic residue, auxiliary prime and multiplier are retained; the Dwork sheaves/trivialization/ordinary and Steinberg fibres are an explicit missing-owner gap. |
| `PL.5/ordinary-lifts-prescribed-local` | verified | BLGGT Proposition 3.2.1 pp.44–47 checked; the descent, prescribed local lifts and residual seed have matching fields/multiplier. The F₂⁺ correction and prime-to-l local conditions are retained. |
| `PL.5/tensor-product-trick-lifting` | verified | BLGGT Proposition 4.1.1 pp.50–53 checked. The tensor factors have the stated weight regularity, compatible multiplier and linearly disjoint cyclic extension; character and Dwork inputs are routed, not silently assumed proved. |
| `PL.5/pd-automorphy-lifting` | verified | BLGGT Theorem 4.2.1 pp.53–54 checked. Residual irreducibility over F(ζ_l), l≥2(d+1), regularity and the residual ordinarily/PD automorphic polarized pair are all retained. |
| `PL.6/schur-residual-representation` | verified | Tho15 Definition 3.2/Lemmas 3.3–3.4 pp.12–13 checked. Schur is imposed on the polarized 𝒢_n representation; three constituent/pairing tests and the scalar centralizer API use that same carrier. |
| `PL.6/primitive-representation` | verified | Tho15 §5.2 pp.57–58 and NT21 Lemma 5.1 p.67 checked. Weak primitivity and semisimplified-induction strong primitivity are distinct actual predicates; the packet does not identify them. |
| `PL.6/character-sums-primitive` | verified | NT21 Lemma 5.1 p.67 checked. The large-ratio argument proves the weak primitive statement. Strong primitivity for every later character application remains a separate recorded argument, not this lemma’s conclusion. |
| `PL.6/connectedness-dimension` | verified | Tho15 Definition 1.7/Proposition 1.8 pp.6–7 checked. Minimal-prime intersections, at least two components, local dimension and arithmetic-rank conventions match the commutative-algebra API and examples. |
| `PL.6/polarized-pseudodeformation-subring` | corrected | Tho15 §3.2 p.13, Definitions 3.25–3.27/Lemma 3.28/Proposition 3.29 pp.23–25 and ANT20 Proposition 3.2 pp.8–10 checked. Restricted the uniform O-generator bound to the fixed ordinary Λ. Closed determinant subring, block signs and irreducible étale fibres remain distinct. |
| `PL.6/pseudodeformation-restriction-finite` | verified | NT21 Lemma 5.3 p.67 and Che14 pp.14,41–43 checked. Φ_p, finite-index restriction and the integral finite-root coefficient argument give the intended finite ring map; no finite topological generation of G_F,S is claimed. |
| `PL.6/reducibility-ideal` | verified | Tho15 Definition 3.31/Proposition 3.32 pp.25–26 and ANT20 Proposition 2.5/Lemma 3.4 pp.6–7,10–11 checked. Strict split ideal in R and product-of-partitions determinant ideal in P remain separate, with correct prime criterion/tests. |
| `PL.6/reducible-locus-dimension` | verified | ANT20 Lemmas 3.5–3.6 pp.10–12 checked. The bound uses the extended determinant reducibility ideal and one Steinberg place with all residual triviality/ordinary coefficient hypotheses; factor n is retained. |
| `PL.6/generic-prime` | verified | ANT20 Definition 3.7 p.12 checked. Generic primes have the specified dimension/characteristic, absolutely irreducible fraction representation and independent local characters; admissible large quotients are distinguished from arbitrary primes. |
| `PL.6/large-quotients-contain-generic-primes` | verified | ANT20 Lemmas 3.8–3.9 pp.12–13 and Tho15 Lemma 1.9 pp.7–8 checked. Finite-Λ quotients, dimension and countable nongeneric loci are explicit; the connectedness comparison is not asserted for arbitrary rings. |
| `PL.6/genericity-under-restriction` | verified | Tho15 Proposition 5.3 pp.57–59 checked. The planned statement correctly uses strong primitivity so semisimplified residual induction is ruled out. E27 records the weak-source proof gap without an unverified counterexample. |
| `PL.6/reducible-twisting-and-base-change` | verified | Tho15 Lemmas 3.36/3.38/3.40 pp.28–30 and Corollary 4.14/Proposition 4.18 pp.41,45–46 checked. Permitted scalar twists, determinant-ratio unramifiedness, disjoint extension and Λ/base-change maps are retained. |
| `PL.6/generic-prime-r-equals-t` | corrected | ANT20 Theorem 4.1 p.15 and Tho15 Theorem 4.19/Corollary 4.20 pp.47–48,61–63 checked. Strengthened both proposed signatures to strong primitivity. The weak-source formulation and d-constituent/split-B comparison remain precisely recorded open targets. |
| `PL.7/ordinary-steinberg-finiteness` | unverifiable | ANT20 Theorem 6.2 pp.19–20, NT26 Proposition 3.9 p.21 and Tho24 Theorem 7.5 pp.44–45 checked. The original finiteness and claimed weakened variant are separated; weak primitivity still cannot use the strengthened generic R=T route. |
| `PL.7/residually-reducible-automorphy-lifting` | unverifiable | ANT20 Theorem 6.1/1.1 pp.1–2,18–19 checked. P→T and determinant classicality are correct, but the source weak-primitive target does not follow from the strong-primitive generic R=T theorem now planned. |
| `PL.7/two-constituent-automorphy-lifting` | unverifiable | Tho15 Theorem 7.1 pp.69–70 checked. Two residual constituents, their potential automorphy and the seed are retained. The weak-primitive target still needs its generic restriction input or explicit strengthening. |
| `PL.7/sum-of-characters-finiteness` | unverifiable | NT21 Theorem 5.2 pp.67–70 checked. Dwork/Steinberg input is honestly a gap; the planned generic R=T step additionally needs strong primitivity, for which the large-ratio character application has no complete argument here. |
| `PL.7/ordinary-lifts-every-weight` | verified | NT21 Corollary 5.4 p.70 checked. Corrected ramification domain S∪Σ and multiplier-compatible weights are used. The finite-ring characteristic-zero point argument is an explicit prerequisite rather than an S-only lifting assertion. |
| `PL.7/unrestricted-ring-dimension-bound` | verified | NT21 Corollary 5.5 pp.71–72 and BG19 Corollary 5.1.1 pp.38–39 checked. The Schur lift/dimension argument records the necessary adjoint invariant-vanishing correction rather than claiming automatic vanishing. |
| `PL.7/reducible-locus-small` | verified | NT21 Proposition 5.6 pp.72–73 checked. The reducible-locus bound uses the stated finite-Λ quotient, local degree and ratios, plus the determinant partition criterion; it is not an arbitrary deformation-ring inequality. |
| `PL.7/generic-primes-large-quotients` | verified | NT21 Theorem 5.7 pp.73–74 checked. Large characteristic-p quotient, actual generic character constraints and countable bad-locus construction match the strengthened precision of the generic-prime API. |
| `PL.7/global-lifts-schur` | verified | BG19 Corollary 5.1.1 pp.38–39 checked. The planned lift includes Schur and H⁰(ad r̄(1))=0 or a sufficient cyclotomic condition; E42 narrows the source criticism to the failed invariant calculation. |
| `PL.7/prescribed-type-lifts` | unverifiable | NT21 Proposition 5.8 pp.74–75 checked. The split/inert auxiliary field and Schur dimension inputs are stated, but the weak-primitive source target still has the generic R=T gap; field-of-definition extensions are also explicit inputs. |
| `PL.8/generic-weil-deligne` | verified | NT23 Definition 1.1 pp.2–3 and BLGGT Lemma 1.3.2 checked. Genericity is vanishing of Hom(WD,WD(1)), including N; R01.2 is the carrier owner, with local LLC equivalence requested. |
| `PL.8/bloch-kato-at-generic-places` | verified | NT23 §1 pp.2–4 and local tangent discussion pp.7–9 checked. The p-adic comparison has de Rham/semistable hypotheses, while away from p genericity removes the extra H¹ restriction; local duality is precisely imported. |
| `PL.8/adjoint-bloch-kato-selmer-group` | verified | NT23 §1–2 and NT21 §2.3 pp.25–30 checked. Rational restriction to the quadratic extension uses Hochschild–Serre over E, including p=2, and takes the specified conjugate-self-dual invariant part. |
| `PL.8/semistable-pseudodeformation-ring` | corrected | NT23 Propositions 2.12–2.14 pp.13–14 and §2.4 pp.18–20 checked. Clarified possible zero constrained quotient and residue-fibre nonemptiness; stable Cayley–Hamilton models, self-dual multiplier and empty-interval tests agree with that convention. |
| `PL.8/pseudodeformation-tangent-comparison` | unverifiable | NT23 Proposition 2.7 pp.7–9 and Propositions 2.15–2.17 pp.14–20 checked. Integral bounded-denominator maps are present in prose, but the proposed file omits the scaling-map interface and integral Gal-equivariance needed for the self-dual comparison. |
| `PL.8/adjoint-selmer-vanishing` | verified | NT23 Theorem 4.1 pp.26–27 and bounded-torsion patching §§4.1–4.4 checked. Enormous-image prime detection, Brochard criterion and rational tangent comparison are separately requested; this is not a formal kernel-zero claim. |
| `PL.8/pseudodeformation-ring-regular-at-automorphic-point` | verified | NT21B Theorem 2.1 pp.5–8 checked against NT23 tangent/vanishing input. The characteristic-zero automorphic point and absolutely irreducible Galois realization are essential; the localized ring is E, not its integral completion. |
| `PL.8/ordinary-tangent-vectors-h1g` | verified | NT21 Theorem 2.27 pp.42–43 and Ger19 Definition 3.3.1/Lemma 3.3.2 pp.36–37 checked. Lifted ordinary flags with constant inertial characters give H¹_g through the precise requested finite-local-E de Rham extension theorem. |
| `PL.9/rigid-residual-representation` | corrected | LTXZZ Definition 3.6.1 p.29 and local definitions pp.12,24–28 checked. Removed µ even from the rigidity predicate, retained explicit unramifiedness and pair occurrence, and separated the parity-restricted local geometry from the unrestricted predicate. |
| `PL.9/rigid-r-equals-t` | unverifiable | LTXZZ Theorem 3.6.3 pp.30–35 checked. The proposed odd-µ repair did not establish its local tangent dimensions/Taylor–Wiles count before applying the even-µ geometry; nonsplit-place global presentation is also still a requested extension. |
| `PL.9/rigidity-for-almost-all-primes` | verified | LTXZZ Corollary 4.1.2 p.36, Proposition 4.2.3 p.38 and Theorem 4.2.6 pp.39–40 checked. Uses the full Weil representation for the supercuspidal argument and symmetric powers of elliptic cohomology; nonsplit-place finiteness is an explicit gap. |
| `PL.9/generic-local-domain-lifting` | unverifiable | LLHLM23 Theorem 9.2.1 p.137, Theorem 7.3.2 pp.111–112 and LLHLM20 Proposition 6.0.2 pp.98–99 checked. Domain-or-zero/local-type and patching scope are explicit, but the +1-to−1 labelled weight/polynomial conversion is absent from the common-convention signature. |
| `PL.9/generic-change-of-weight-lifting` | unverifiable | LLHLM23 Remark 9.2.2 p.137 and Theorem 9.1.6 pp.133–136 checked. Generic Serre weights and the changed polynomial are recorded missing inputs; the suggested weight/K-type conversion still shares the unresolved sign issue. |

## Complete change inventory

No node IDs changed in this review. Sixteen existing packet nodes have fields changed beyond their review judgments:

| Node | Fields changed |
| --- | --- |
| `PL.0/ordinary-of-weight` | api, proofSteps |
| `PL.2/definite-unitary-group` | api, prerequisites, proofSteps |
| `PL.2/unitary-hecke-algebra` | api, proofSteps |
| `PL.3/taylor-wiles-level-structures` | api, proofSteps |
| `PL.6/polarized-pseudodeformation-subring` | api, hypotheses, proofSteps, sources |
| `PL.6/generic-prime-r-equals-t` | hypotheses, prerequisites, proofSteps, statement |
| `PL.7/ordinary-steinberg-finiteness` | prerequisites, proofSteps |
| `PL.7/residually-reducible-automorphy-lifting` | proofSteps |
| `PL.7/two-constituent-automorphy-lifting` | proofSteps |
| `PL.7/sum-of-characters-finiteness` | proofSteps |
| `PL.7/prescribed-type-lifts` | proofSteps |
| `PL.8/semistable-pseudodeformation-ring` | proofSteps, statement |
| `PL.9/rigid-residual-representation` | api, hypotheses, statement |
| `PL.9/rigid-r-equals-t` | proofSteps |
| `PL.9/generic-local-domain-lifting` | hypotheses, proofSteps, statement |
| `PL.9/generic-change-of-weight-lifting` | proofSteps |

Other packet changes: replaced the review object; reconciled the summary, changed status and seven coverage entries; refined existing AG2.2/R08.3/local-parity and unitary requests; added three requests and seven gaps; adjudicated E1–E54, narrowing E27/E42/E54; added E55–E70; recorded own reading dates and NT23 publisher collation/Tho15 refusal in source versions. Existing hashes and earlier version metadata are retained.

Roadmap changes: retargeted unitary adelic prerequisites to AA.1; reconciled PL.2, PL.6 and PL.9 descriptions with the corrected signatures and open interfaces. No layer or owner is created. Suggested-file changes are the dominance, nilpotence, unitary choices/rank, helper ordering, Hecke support, level quotient, fixed ordinary coefficients, strong primitivity and ownership/limitation comments described above. Reader changes regenerate every node/API/test/source/request/gap section, replace source section summaries by a compact bibliography, reconcile conventions, coverage and acceptance claims, and explain compilation limitations. The review and this job's handoff are new files. No shared atlas/library/source register or unrelated job file changed.

## Validation

* `python3 scripts/check_blueprint.py research/blueprint/packets/PotentialAutomorphyInfrastructurePartII.json`: **0 errors, 0 warnings**, 86 nodes, 134 API entries, 93 tests, 35 planets, 27 requests and 15 gaps.
* `lean-check research/blueprint/suggested/PotentialAutomorphyInfrastructurePartII.lean`: **exit 0**, pinned Mathlib; **815 warnings, all for declarations using sorry**, no errors or other warnings. Final subsequent edits are comments only and do not alter the elaborated declarations. Memory was checked before compiling; no build, cache download or language server was started.
* Explicit inventory checks: unique complete 86-node review judgments, 70 individually adjudicated source findings, at least three examples per definition/construction, exact packet/reader field correspondence, valid internal DAG and resolved original supplier references. The packet checker corroborates the structural constraints; source and signature correctness were checked independently as above.
* `python3 research/blueprint/intake.py check-files` on all six deliverables: **6 files, 0 problems**.
* `git diff --check`: clean. Only the five authorized deliverables and this job's required handoff changed.

The errata-only checker was also tried on the packet and declines its blueprint protocol because it expects `errata-v1`; it is not a packet validation tool. The authoritative packet checker passes, and the source-issue fields and version evidence were checked directly. No extra errata-protocol file or unrelated deliverable was created.

The independent review is ready for submission. Its next step is a design revision of the seven target-level problems, followed by a fresh independent review.
