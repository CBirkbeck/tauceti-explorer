# Independent review: Integral Hecke actions, determinants and interpolation, Part II

Job: `REV-DESIGN-IntegralHeckeAndGaloisDeterminantsPartII`; issue #3551.
Reviewer: Codex, session `codex-CdIfiC`; 10 October 2026.
Verdict: **needs_changes**. This is a completed independent review, not a checkpoint.

The mathematical scope is appropriate: the ramified operators and prime-to-p local–global
compatibility extend the existing determinant roadmap. All 43 target-level nodes were checked;
24 are verified, 18 corrected, and one has an unproved prerequisite. The packet retains 6
definition nodes, 10 construction nodes, 26 theorem nodes, one comparison, 123 API items, 70
unit tests, and 25 planets. Every definition/construction has at least three tests. No nodes
were added. The seven layers remain in mathematical order; IHR.7 is now explicitly partial.
There are 19 supplier requests and two recorded gaps. The packet status is partial because a
stage is not planned; that describes the plan, not unfinished review work.

Two concrete obligations prevent acceptance. First, the proposed proof of the auxiliary
characters does not establish its global local-prescription theorem. Second, the suggested
file still lists essential declarations only in comments. The remaining supplier requests
are not, by themselves, grounds for rejection; their obligations must be distinguished from
claims that the supplier already proves them.

## Corrections made

1. **Intermediate tame levels (IHR.1).** The pro-ℓ-Iwahori Weyl presentation cannot be used
   unchanged for a torus subgroup that is not Weyl-stable. For GL₂ over a field with residue
   field F₅, the level with torus subgroup F₅× × {1} has a simple-reflection double coset of
   degree 20. Its degree is not a unit in ℤ[1/5], so that operator cannot be a unit. The
   theorem claims torus invertibility, which survives: descend the pro-ℓ-Iwahori torus inverse
   as a bi-invariant function, track the two convolution volumes over ℤ[1/q], then base
   change. No inversion of the tame subgroup index is required. Positive multiplication is
   ACC23 Lemma 2.1.12, p. 914. The local proof now says exactly this.
2. **Siegel inverse (IHR.3).** A larger-level characteristic function is not a unit in the
   pro-ℓ-Iwahori algebra: its square is the subgroup index times itself. Replace the old unit
   argument with the change-of-volume inverse construction in Thorne, §3, Lemma 3.1,
   pp. 7–8. This repairs the proof of the strongly positive operator without averaging over
   a possibly noninvertible index.
3. **Arithmetic normalization (IHR.3).** The proof comparing normalized induction with
   `rec^T` omitted the common factor `|α|^{(1−2n)/2}`. Restore it in both symmetric-function
   comparisons. For normalized induction of two trivial GL₂ characters, geometric Frobenius
   has eigenvalues `q^{1/2}, q^{1/2}` in `rec^T`, which detects the omission. The local group
   representation is composed with `ι_v⁻¹`; the classical-point proof and AG2.5 request now
   use the correctly typed direction. The imaginary quadratic subfield in Theorem 2.3.3(c),
   p. 936, may depend on the place, rather than being one field for all of R.
4. **Factorization scheme (IHR.4).** Freeness of the root algebra over two invariant rings
   alone does not prove freeness between those rings. Cite the graded projectivity and
   freeness argument of Thorne, §2, Lemma 2.1, p. 4. Use the Sylvester Jacobian and relative
   differentials, together with flatness, to prove étaleness (Proposition 2.3, pp. 5–6).
   An ordinary maximal-ideal tangent-space argument alone would miss inseparability.
5. **Ordered resultant (IHR.4–IHR.7).** Keep `resultant(P_conjugate, P_v)` from ACC23 p. 928
   under Satake, including the API statement and the conjugate-unramified proof. The later
   description on p. 964 reverses the factors; the sign is `(-1)^{n²}`. The even-powered
   trace relation and unit criterion are unaffected. The rank-one answer is conjugate root
   minus v-root. Resultant mapping in the Lean prototype now assumes both polynomials are
   monic, ensuring their natural degrees survive specialization.
6. **Integral gluing (IHR.6–IHR.7).** The comparison chooses nilpotent ideals separately at
   each modulus. Uniqueness of determinants does not construct transition maps between
   those quotients. Use the existing upstream IHG.4 `Theorems.compact_determinant_gluing`
   on the compact coefficient algebra modulo the product-kernel ideal, the jointly
   injective quotient maps, and common integral coefficients on the conjugacy-saturated
   Frobenius set. This also repairs weight reduction. A new request identifies this
   existing contract; it does not plan another gluing theorem.
7. **Decomposed level (IHR.7).** In ACC23 §2.1.2, p. 912, the semidirect product describes
   `K̃ ∩ P`, not the ambient open level `K̃`. Fix the API and construction proof accordingly.
   Hyperspecial levels need not have a full Iwahori decomposition relative to P. Factor
   identification at R now explicitly uses the full twisted Weil determinant, along with
   separated constituent spectra, rather than claiming one Frobenius polynomial determines
   inertia.
8. **Tests and scope.** Wrong-normalization and inertia inequalities require a faithful
   coefficient specialization; different tame characters require `q>2`. Qualify these
   examples. The rank-one global Hecke test now describes the subalgebra generated by the
   actual permitted translations, and the semilocal example requires both refinements to
   occur. Distinct roots alone do not prove their occurrence in an arbitrary global image.
   Match the Weil-Artin comparison to current ClassFieldTheory's finite-ℚ_ℓ scope and
   topological abelianization; the torus operators retain their broader characteristic scope.

The suggested file also had missing finite-residue hypotheses in its Hecke-pair and index
claims; an arbitrary DVR can have infinite residue field. Add `Finite` explicitly to the
local theorem sections. Replace a valuation depending on a bare field by the restriction of
Mathlib's `Ring.ordFrac` for the specified DVR and fraction field. The local-field valuation
already exists in Tau Ceti and is cited rather than re-planned. The modulus character now
uses the actual invertibility witness for q and its valuation formula. The old compilation
note about an unavailable Tau Ceti import is replaced by the genuine-import check result.

## Gaps requiring revision

**G1: auxiliary characters.** ACC23 Lemma 3.2.1(2)–(3), pp. 956–957, needs finite-order
characters separating finitely many Frobenius spectra, unramified at a prescribed finite set,
with disjoint rational-prime ramification for the two auxiliary characters. The algebraic
avoidance-of-eigenvalue-ratios argument is valid once an odd-prime-order character with
arbitrary unramified local prescriptions is available. The old Kummer/Chebotarev paragraph
did not prove the needed independence or construct that character. Current ClassFieldTheory
layers 11–12 give reciprocity and norm-subgroup existence, and its scope explicitly excludes
Grunwald–Wang local prescription. Current Chebotarev layer 10 gives density, not the missing
existence assertion. Record the exact odd-order contract, find a freely readable theorem
with its hypotheses, and supply the deduction, including the enlarged avoidance set for the
second character. This is a proof gap, not a claim that ACC23's existence statement is false.

**G2: Lean coverage.** The file's omission ledger is useful evidence of missing work, but a
comment does not meet PROTOCOL §13's signature requirement. It omits all four IHR.2 theorem
signatures, the unitary tame level and its API/tests, most unitary transfer theorems, the full
étale factorization theorem, the inertia theorems, every IHR.5 and IHR.6 declaration, and all
IHR.7 global constructions and theorems. The local matrix representation is only a prototype
for `E_v`, not the determinant law and its complete API. Finish these declarations against
honest imported carriers, retaining the exact hypotheses. Do not replace them by `Prop`
fields or assume conclusions as parameters. Compilation currently validates only the
signatures that are actually present.

## Sources and baseline

Source prose in this review and the packet is in our own words; no source passage has been
stored. The published version of [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf),
§2.1.9, pp. 913–916; §2.2.5, pp. 921–931; §2.2.20, pp. 931–935; §2.3,
pp. 935–941; Theorem 2.4.8, pp. 946–948; and §3, pp. 953–964, supplies the
node locators. The normalization is §1.2, pp. 905–909. Checked the cited parts of
[Flicker](https://jolt.centre-mersenne.org/item/10.5802/jolt.640.pdf), Theorem 2.1,
pp. 471–474, Theorem 3.1/Proposition 3.3/Corollary 3.4, pp. 475–479, and the
Bernstein presentation, §4, pp. 479–488; and [Thorne](https://arxiv.org/abs/2207.04925v1),
§2, Lemma 2.1/Propositions 2.2–2.3, pp. 4–6, and §3, Lemma 3.1, pp. 7–8.
The designer's arXiv-v2 comparisons remain provenance, not a new claim that this reviewer
checked every v2 passage.

All 18 existing source issues have individual verdicts. Their published observations are
confirmed; E2's proposed repair and E17's purported completed proof are corrected. Added
E19 (normalization in the proof), E20 (direction of `ι_v`), and E21 (resultant order), with
individual verdicts. Searches of the published article page, author research pages and the
title with erratum/corrigendum found no posted correction of these passages on 10 October
2026; this does not claim exhaustive knowledge of author correspondence.

Every original baseline declaration exists at Mathlib `082e2d3` / Tau Ceti `f790474`.
No citation was removed. Four descriptions needed precision: GL is matrix units over a
semiring, resultant mapping preserves specified size arguments, the Bézout lemma needs a
nonzero size, and Jordan–Chevalley is additive over a perfect field with finite-dimensional
module. The two existing valuation declarations were added as baseline citations.

| Pinned declaration | Source module and line | Obligation checked |
|---|---|---|
| `Matrix.GeneralLinearGroup` | `GeneralLinearGroup/Defs.lean:43` | Matrix units; unit determinant only in the commutative-ring setting |
| `IsDiscreteValuationRing` | `DiscreteValuationRing/Basic.lean:58` | Local PID, not a field |
| `IsLocalRing.ResidueField` | `ResidueField/Defs.lean:30` | Quotient by the maximal ideal |
| `Matrix.BlockTriangular` | `Matrix/Block.lean:61` | Entries below the block order vanish |
| `IsHeckeTriple` | `HeckeRing/Defs.lean:75` | Commensurability and commensurator conditions |
| `HeckeRing` | `HeckeRing/Defs.lean:189` | Hecke coset-module carrier |
| `HeckeCosetModule.instRingHeckeRing` | Tau Ceti `HeckeRing/Associativity.lean:485` | Convolution ring under the Hecke-triple hypothesis |
| `MonoidAlgebra` | `MonoidAlgebra/Defs.lean:76` | Finitely supported coefficients with convolution |
| `Multiset.esymm` | `MvPolynomial/Symmetric/Defs.lean:70` | Elementary symmetric functions |
| `Multiset.prod_X_sub_X_eq_sum_esymm` | `Polynomial/Vieta.lean:87` | Alternating coefficients of the root product |
| `Polynomial.Monic` | `Polynomial/Degree/Defs.lean:60` | Leading coefficient one |
| `Polynomial.resultant` | `Resultant/Basic.lean:134` | Sylvester determinant, explicit degree arguments |
| `Polynomial.resultant_map_map` | `Resultant/Basic.lean:140` | Fixed sizes; monic factors preserve natural degree |
| `Polynomial.isUnit_resultant_iff_isCoprime` | `Resultant/Basic.lean:885` | Monic first polynomial |
| `Polynomial.exists_mul_add_mul_eq_C_resultant` | `Resultant/Basic.lean:874` | Size bounds and a nonzero size |
| `Polynomial.resultant_eq_prod_roots_sub` | `Resultant/Basic.lean:405` | Monic split polynomials over a field |
| `Module.End.exists_isNilpotent_isSemisimple` | `JordanChevalley.lean:76` | Additive decomposition; perfect field, finite dimension |
| `NumberField.IsCMField` | `NumberField/CMField.lean:71` | Totally complex quadratic extension; characteristic zero |
| `Polynomial.reverse` | `Polynomial/Reverse.lean:217` | Reflection in the natural degree |
| `Matrix.aeval_self_charpoly` | `Matrix/Charpoly/Basic.lean:216` | Commutative ring and finite matrix index |
| `Ring.ordFrac` | `OrderOfVanishing/Basic.lean:324` | Fraction-field order of vanishing for the DVR prototype |
| `TauCeti.normalizedValuation` | Tau Ceti `LocalField/NormalizedValuation.lean:101` | Existing local-field normalization, uniformizer value one |

The reviewed audit has no dedicated entry for this Part II. Its neighbouring automorphic
entries do not establish these ramified integral Hecke operators. Current Tau Ceti was
checked as well: Hecke convolution and normalized valuation already exist; no complete
ramified roadmap API was found. Screened the nine newer upstream roadmaps' suggested files
(including OperatorTheory's subpackages) for the proposed notions; LocalGaloisGroups does
not take ownership of the Weil-Artin comparison. ClassFieldTheory remains its owner.
Read the relevant current ClassFieldTheory, Chebotarev and determinant roadmap contracts.
In particular, current IHG.4 already provides the compact gluing repair, which is imported.

The existing PA.0 ramified-Satake descent request is a stage-level dependency needing the
mathematical objects of IHR.1/IHR.3/IHR.5. The packet's ownership proposals remain proposals;
this review does not edit PA or change any upstream roadmap. Resolve that ownership in the
bundle's prerequisite graph before packaging. Keep the present ramified normalization in
Part II, even if a later general Bernstein-centre owner supplies its local embedding.

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/IntegralHeckeAndGaloisDeterminantsPartII.json`:
  **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/IntegralHeckeAndGaloisDeterminantsPartII.lean`:
  **exit 0**, genuine Tau Ceti import, pinned libraries, only `declaration uses sorry` warnings.
- No formal proofs, upstream changes, promotion or new Lean project were made.

The issue does not permit editing the existing reader document. A revision must synchronize
it with these packet corrections and G1/G2; its present definitive-document label cannot
make obsolete proofs authoritative. The handoff identifies the revision entry points and
the outstanding ownership decision.
