# Independent review: ClassicalSerreModularity R27.5

**Verdict: accepted after correction.** Reviewer: Codex, session `codex-0N2KsT`, job `REV-ClassicalSerreModularity--R27.5` (#9932), 16 October 2026. This session did not write BP-ClassicalSerreModularity--R27.5 (#9929).

This accepts a complete planning pass. R27.5 remains **planned**, with three open requests and three corresponding gaps; neither closure nor formal implementation is claimed. The unresolved exports are stated precisely and their mathematical reductions are justified. There is no unresolved contradiction in the corrected consumer plan.

## Inventory and disposition

| Item | Reviewed result |
|---|---|
| New theorem nodes | 3: two corrected, one verified |
| Reused internal milestones | 3, retaining their R27.3 packet identifiers |
| Definitions / constructions | 0 / 0 |
| Definition API items / unit tests | 0 / 0, appropriate because no definitions are introduced |
| Planets | 3, retained |
| Baseline declarations | 5 confirmed; none removed or replaced |
| Requests / gaps | 3 / 3, all open |
| Stage coverage | 1 planned; 0 closed |
| Suggested Lean | 55 lines, five concrete matrix examples; unchanged |
| Source issues | E3 independently confirmed in the identified author copy |
| Nodes added / removed | 0 / 0 |

The three planets, Characteristic-two modularity, Even-conductor modularity and Serre modularity theorem, describe the actual theorem targets. The compact Lean file is allowed to omit the arithmetic endpoints: the required representation, local-weight, compatible-system and modularity-witness carriers are not available at the pins. The individual `suggestedCoverage` entries record these README targets. There are no placeholder predicates or admitted data definitions.

## Corrections made

1. **Normalise the intermediate coefficient-three input.** KW I Theorem 5.1 imposes 2≤k≤p+1 on every odd-characteristic lifting input. The original plan normalised the first representation but then applied part (4) to its intermediate r̄₃ without checking that bound. The corrected proof independently chooses η=χ̄₃^i with σ̄₃=r̄₃⊗η of weight 2≤k≤4. Since η is unramified away from 3, the local shape at 2 and the good-dihedral protection survive up to unramified twist. The second system lifts σ̄₃. Once it is modular, Q3 untwists its residual witness to r̄₃ before the original C₃ is submitted to odd-prime modularity lifting. The packet, IC-1, Q3/G3 and reader now track the same representation at each step. A new acceptance check detects omission of this intermediate normalisation.
2. **Record the imported normalisation boundary.** IC-4 records that the newer R27.4 level-raising packet still cites `R20.3/ribet-twist-to-small-weight`, whose statement assumes prior modularity. This does not supply the arbitrary-residual operation needed here. Existing Q3/G3 now explicitly covers normalisations inside the imported Theorem 3.4 as well. Its source statement and conductor argument are correct; at assembly replace that supplier proof's already-modular normalisation dependency by the numerical R15.4 recipe plus the supplied Q3 witness equivalence. This review does not claim to have edited R27.4.
3. **Make finiteness explicit.** The even-conductor node now quantifies a finite coefficient field, consistently with its reader conventions, S-type supplier and the other two endpoints.
4. **Complete the independent source-issue review.** Added the required confirmed verdict to E3 and version metadata. The author-copy reference slips are verified; the Springer landing page offers subscription access and its PDF endpoint returns the landing page, so the journal proof was not compared. No claim about an error in the version of record is made.
5. Added the packet's independent review object and kept the reader's proof, requests, source-version boundary and verdict synchronized. No baseline citation or Lean statement required correction.

## Node-by-node checks

| Node | Verdict | Evidence and limits |
|---|---|---|
| `R27.5/characteristic-two-closure` | Corrected | KW I Theorem 9.1 and proof, §9 pp. 18–19; Theorem 3.4 p. 6; Theorem 5.1 pp. 9–10; Lemma 6.3 pp. 11–12. Independently checked the intermediate weight twist, the conductor-one local representation, the two-system route and the weight-two obstruction below. The unrestricted input of weight four reaches the conclusion through D₁ and Theorem 3.4 at r=1, not through the weight-two base case applied to that input. |
| `R27.5/even-conductor-closure` | Corrected | KW I §9 p. 19 and KW II §3.3.1 pp. 32–33, §10.3.1–§10.3.2 pp. 92–94. Scalar-unipotent inertia is removed first by a global character supported at 2; the remaining unipotent action is tame because the residual characteristic is odd. The other minimal-lift branch has finite inertia and zero monodromy, allowing H. It uses the already established characteristic-two endpoint. No strict conductor-decreasing induction is asserted. The finite coefficient-field correction is explicit. |
| `R27.5/hypothesis-H-and-theorem-9-1` | Verified | KW I H, its Remark and Theorem 9.1, §9 pp. 18–19; Kisin Theorem 0.1, author DVI p. 2. The p=2, odd-p/odd-N and odd-p/even-N cases exhaust the inputs. H has one owner, R22.6. The conclusion is qualitative and returns the existing newform/place/lattice/residual-isomorphism witness; exact Serre level and weight remain R27.6. |

The identifiers in the table have prefix `ClassicalSerreModularity:`. All node `sources` and `match` entries were checked against their locators. Sources were read directly, rather than taking the earlier review's judgments as evidence.

The source files fetched in this review have the five hashes recorded in the packet. Locators refer to the following freely accessible texts:

- Khare–Wintenberger [I, author PDF](https://www.math.ucla.edu/~shekhar/papers/results.pdf): Theorem 1.2 p. 2; Theorem 3.4 p. 6; Theorem 4.1 p. 7; §5 and Theorem 5.1 pp. 7–10; Lemmas 6.1–6.3 pp. 10–12; §8.4 pp. 17–18; §9 pp. 18–19.
- Khare–Wintenberger [II, author PDF](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf): §3.3.1 pp. 32–33; §3.3.3 pp. 35–36; §10.3.1–§10.3.2 pp. 92–94. The prescribed type includes a lattice recovering the actual nonsplit residual extension. Coefficient-prime compatibility is conditional on residual irreducibility.
- Serre [1987 published scan](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf): §2.4.7 p. 186, §2.4.9 p. 187, §2.6 p. 188, §2.7 pp. 188–189 and Proposition 4 in §2.8 pp. 189–190. These verify the dyadic dichotomy, Kummer valuation obstruction and independent weight-normalising twist. The Q₂ finite-flat criterion alone is not used as an odd-index base-change theorem.
- Fontaine [1985 published scan](https://www.imo.universite-paris-saclay.fr/~fontaine/varabZ.pdf): §1.2(i) p. 518 and Theorem 1 §2.1 pp. 525–526. Checked page images for both the numbering and bound, whose formula is lost in text extraction.
- Kisin [author DVI](https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi): introduction and Theorem 0.1 p. 2. The statement requires potential Barsotti–Tate, determinant cyclotomic times an even finite-order character, and modular nonsolvable residual image. R22.6 owns the conversion to H, not this packet.

### The finite-flat step

The special dyadic member is crystalline over the field cut out by its order-three type over the unramified quadratic extension. The ramification index is 3; total degree can be 6. Residual absolute irreducibility activates almost strict compatibility. Importing the integral R07.4 theorem for the chosen stable lattice, followed by R07.1 generic subgroup closure and quotient, gives finite flatness of its actual reduction modulo the coefficient uniformiser. Using only an unspecified rational isogeny class would not establish this.

For the contrary weight-four case, after a finite unramified extension the actual local representation has a quadratic Kummer quotient of odd valuation. Over an extension of odd absolute ramification e that valuation remains odd. Normalise it to one by a square. The Eisenstein quadratic has discriminant exponent 2e+1 and unique Serre upper break 2e. Fontaine's killed-2 bound uses his parameter u>2e; §1.2(i) gives u=v+1, so finite flat points are trivial for Serre upper v>2e−1. The quotient still acts at v=2e, a contradiction. At e=3 the discriminant, break and bound are 7, 6 and 5. Base change of the model and quotient compatibility suffice; ramified descent is not invoked. This validates the mathematical reduction behind Q1 while leaving its owning export open.

### Supplier composition and closure

Read the named supplier statements in the relevant packets, including the newer R26.1 and R27.4 refinements and the three reused R27.5 milestones in R27.3. The contracts used here are:

| Suppliers | Checked boundary |
|---|---|
| R27.1, R27.3, R27.4 | Good-dihedral preservation uses fixed support outside the moving coefficient prime and the small-prime bound B; D₀ is earlier; Theorem 3.4 has its characteristic-two weight restriction only at r=0. Its source proof does not require H. |
| R24.3, R24.5, R24.6 | Normalised lifting inputs, actual minimality and prescribed type; odd irreducible members; conditional coefficient-prime geometry/full WD; conductor bounds on reduction. No generic residual irreducibility or modern strictness upgrade is assumed. |
| R22.5, R22.6 | Odd-prime potentially semistable weight-two lifting needs absolutely irreducible cyclotomic restriction. Nonsolvable global image supplies it at 3. H needs modular nonsolvable residual image and potential crystallinity at 2. The narrower older dyadic Theorem 4.1 is insufficient for the new cubic-type case. |
| R06.3, R07.1, R07.4, R07.6 | WD crystallinity after killing inertia with monodromy zero; every stable lattice, including p=2; generic finite subgroup closure/quotient; exact Fontaine numbering and bound. |
| R01.3, R01.5 | Conductor uses actual inertia invariants and Swan term; characteristic-zero recognition uses a density-one set of good-prime characteristic polynomials after common scalar extension. Q2 packages the missing local/global conductor adapter. |
| R19.1, R15.4, R15.6 | The newform has Galois representations at every finite place; numerical weight normalisation does not assume modularity; qualitative residual witness includes coefficients, place and lattice. Q3 supplies the missing arithmetic compatibility of finite-character twists. |

The proof order is D₁ → all characteristic two → Dᵣ for r≥2 → arbitrary even conductor → Theorem 9.1. The older D₁ node's final observation about characteristic two does not become an input to D₁. No edge to a modern R33 endpoint or to R27.6 optimisation is used.

Q1 asks R07.6 for the odd-index obstruction above, avoiding a dependency back from R07.5 to R07.6. Q2 asks R01.3 for (a) the actual nonsplit local-2 shape at coefficient 3 and (b) the globally supported scalar-removing character, using ClassFieldTheory. Q3 asks R15.6 for witness-level twist equivalence, importing the existing form operations. These requests are precise; the stage prerequisites stand for missing exports and must become exact node references before closure. The three reused internal nodes remain single declarations; their strengthened consumer import checks do not introduce duplicate nodes.

## Baseline, audit and current upstream

Read the following exact declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, using the pinned git objects rather than current-main statements:

| Declaration | Source module and line | What is actually available |
|---|---|---|
| `ZMod` | `Mathlib/Data/ZMod/Defs.lean:142` | The residue-ring carrier; ZMod 0 is ℤ and ZMod (n+1) uses Fin (n+1). |
| `Matrix.mul_fin_two` | `Mathlib/LinearAlgebra/Matrix/Notation.lean:479` | Entrywise 2×2 multiplication, under additive commutative monoid and multiplication assumptions, satisfied by the two ZMod rings. |
| `Matrix.det_fin_two` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:806` | The ad−bc formula over a commutative ring. |
| `Matrix.mulVec` | `Mathlib/Data/Matrix/Mul.lean:698` | Row dot products over a finite column index and nonunital nonassociative semiring, covering the F₂ example. |
| `HeckeRing.GL2.Newform` | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:102` | N:ℕ with `[NeZero N]`, k:ℤ; extends `EigenformAwayFromLevel N k`, with character carried by its parent, newness and a₁=1. It does not construct the arithmetic modularity witness. |

AUDIT-31 marks the R27.5 targets not built and identifies the H duplicate at R22.6. Read the current upstream ModularForms conventions, Layers 4–5/9 and compact Suggested file; LocalFieldsRamification scope, Eisenstein/monogenicity, ramification, upper-quotient and different contracts and corresponding Suggested statements; and the scopes of LocalGaloisGroups, ProfiniteArithmetic and IntegralHeckeAndGaloisDeterminants. The first two upstream documents supply the relevant density and ownership comparison. Local generic arithmetic and classical form twists/primitive associates are consumed, not replanned. In particular Q3 adds arithmetic witness compatibility, not another construction of the Layer-9 twist.

The read-only upstream roadmap checkout was at `0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. A scoped current-library search did not find the Serre-modularity endpoint or its missing arithmetic carriers. These current checks do not replace the pinned-baseline checks above.

Confirmed red-team finding RT-AREA-langlands-2/20 and its independent verification identify conflicting H ownership in RS-06 and RS-08. The packet correctly imports `GL2ModularityLifting:R22.6/hypothesis-h` and proposes narrowing RS-06's R27.5 keeps while retaining RS-08's R22.6 owner. The legacy aggregate node keeps its identifier but now owns only the final residual theorem. The maintainer must apply the proposed ownership amendment; no restructuring or other job's files were edited.

## Validation and maintainer follow-up

- `python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalSerreModularity--R27.5.json`: **0 errors, 0 warnings**.
- Shared source-issue and source-version validators: **no errors**.
- `lean-check research/blueprint/suggested/ClassicalSerreModularity--R27.5.lean`: **exit 0**, only five expected `declaration uses sorry` warnings. The file is unchanged after that check.
- Independent finite arithmetic verifies all five example propositions, including enumeration of all four F₂ vectors for the fixed-vector test. These checks do not prove any arithmetic endpoint.

No further question blocks this review. Before claiming closure, supply Q1–Q3 at their named owners, replace stage leaves by their exact exports, reconcile the R27.4 normalisation input using IC-4, and apply the already proposed single-owner RS-06 amendment. All those limits remain visible in the accepted packet and reader.
