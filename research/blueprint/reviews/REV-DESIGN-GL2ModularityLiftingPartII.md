# Independent review: GL₂ Modularity Lifting, Part II

Job: `REV-DESIGN-GL2ModularityLiftingPartII` · Issue #3534
Reviewer: Codex, session `codex-WBsHij` · 2026-10-19
Verdict: **accepted as a complete target-level planning pass**.

The packet has 56 targets: 11 definitions, seven constructions, 30 theorems, two comparisons and six applications. Its 18 definition/construction outlines now contain 72 API items and 54 discriminating tests. There are 42 planets, five pinned baseline declarations, ten exact imported nodes, 27 supplier requests and three explicit mathematical gaps. All eleven layers remain **planned**, none closed, and every implementation status remains **unchecked**. Acceptance does not establish the arithmetic theorems or resolve those gaps.

Every node has an individual entry in `packet.review.checked`: 33 verified and 23 corrected; none unverifiable. No nodes were added or removed. All 48 existing source findings have individual independent verdicts, confirmed with the qualifications below. No baseline citation was removed or replaced.

## Corrections made in place

1. **Quadratic doubling had assumed its coefficient descent.** In D1.2 first put B=A[T_p], where A is the represented p-anaemic weight-one algebra. The corrected matrix proves quadratic freeness over B. The ordinary high-weight representation then puts its Frobenius trace T_p in A, proving B=A before the later weight-one unramifiedness argument. The proof now cites R19.5 and R19.6 directly. A single distinct-root factor is still rank one. This follows the argument after CG18 Lemma 3.16, pp. 332–333. The suggested file now explicitly distinguishes the matrix calculation from this arithmetic descent.
2. **The ordinary image used two meanings of anaemic.** D1.2 now specifies the p-anaemic operator set, including the selected Q-level U operators and diamonds, separately from the smaller good-prime algebra. A_n is an actual selected high-weight image, A its finite weight-one quotient, and B initially adjoins T_p. Its test now uses the nonzero multiplication-by-π operator on O/π² rather than a misleading characteristic-zero trace criterion.
3. **The conductor object and fine proof model were conflated.** D1.0 now uses a Katz/descent object at conductor level, separately from its fine r-rigidification. Its API and empty-Q test preserve that distinction. D1.1 formerly excluded x=r by writing x∤Npr, while later using the comparison to remove r. It now uses a base level L and x∤Lp. Removal of r takes L=N, takes the full prime-to-p r-diamond invariants, and applies common-fine-refinement descent. The comparison omits U_r; a repeated-root oldspace has two copies, not scalar U_r or two idempotents. Defect additivity transports balancedness. These are the precise inputs needed by CG18 Remark 3.10, pp. 325–326.
4. **Coherent descent had conditional ownership.** The modular-curve coherent Cartan–Leray contract is now assigned directly to R15.1, including its coefficient, Hecke and Pontryagin-dual Tor compatibility. ALS.6 retains the distinct orbifold/group-homology cover theorem. Its optional coherent extension and the corresponding ambiguous upstream note were removed.
5. **Jacobian isotypy was implicit.** The multiplicity-two argument needs the Jacobian residual-isotypy theorem at the full ideal m, not only reconstruction of a rank-two representation over the Hecke ring. The R20.3 request and direct prerequisite now state that exact input. The Gross sequence remains only left exact on m-torsion: it gives dimension between three and four, and isotypy forces the even value four (CG18 Theorem 4.8, p. 366).
6. **API uniqueness and compatibility were incomplete.** Added one item to each definition/construction outline: represented-image kernel/universal properties, annihilator maximality, column or q-expansion extensionality, coefficient/lattice functoriality, twist composition, or patching/deck transition compatibility as appropriate. All 54 tests were checked; the two tests described above were corrected. The 42 planets remain central arithmetic targets, with at most five per layer.
7. **Source bookkeeping and evidence were sharpened.** Fixed the patching-system locator for Propositions 3.2–3.3 to pp. 311–312, and the reading range for §3.1. Removed one duplicated prerequisite. Updated all stage target statements, supplier consumers, reader contracts and source verdicts together.

## Source-finding audit

I read the node and finding locators in [CG18](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), using the journal page numbers, through the introductory, balanced-patching, weight-one, multiplicity/rigidity and Bianchi arguments on pp. 297–382. I also read the statement and proof of [CG20, Lemma 8.14, pp. 865–866](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), the entire [2022 Correction, pp. 855–856](https://doi.org/10.1007/s00222-021-01095-5), and targeted passages in the [author preprint](https://www.math.uchicago.edu/~fcale/papers/merge.pdf) at doubling, twisting and Bianchi homology. The packet records URLs, reading dates and SHA-256 digests of these versions. Searches of the author research listing, publisher correction and targeted primary-source results located no further correction settling the three retained gaps.

The findings are not a certification that the source's general statements are false. In particular, E31, E39 and E42 identify missing arguments or matching hypotheses; the corresponding generalizations remain gaps. E42 confirms that the raw manifold argument does not prove localized mod-3 group-homology vanishing, rather than claiming a counterexample to that localized theorem.

Three finding entries needed stronger or more accurate evidence:

- **E29, CG18 Lemma 4.2, p. 355:** upgraded the classification from gap to error and supplied a counterexample to the conclusion. B=O[[x]]/(πx) is a one-dimensional Cohen–Macaulay hypersurface and C=O/π² is a complete intersection. Their completed tensor D=O[[x]]/(πx,π²) has dimension one, but its nonzero element π is annihilated by the maximal ideal, so D has depth zero. The retained tensor-product contract requires O-Tor independence, for example O-flatness of one factor. The original B=C=O/π example only invalidated the printed proof.
- **E30, CG18 Lemma 4.4, pp. 357–358:** the source itself gives the nongraded counterexample immediately after the proof. Its `known` field now credits that paragraph rather than calling the correction new. The homogeneous qualification stays with the existing algebra/local-ring owners.
- **E47, CG18 §3.9.1, pp. 344–345:** supplied a normalized cusp model showing why flatness alone does not give the claimed full-bundle pullback. With t=q⁵=u⁷ and normalization q=w⁷,u=w⁵, an old character generator q pulls back to w⁷, while the normalized new-level character line is generated by w²; the former is u times the latter. Independently defined invariant pushforwards and upstairs trace avoid the unsupported identification.

E48 is the published double-bracket correction. It repairs completion/q-expansion notation; it supplies no resolution of M, O or P. All source descriptions and corrections are in our own words, with locators and no source excerpts.

## Baseline and ownership

The declarations below were read at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The four containing source files in the shared pinned build were also compared byte-for-byte with the corresponding Git objects at those commits.

| Declaration | Contract checked |
|---|---|
| `TauCeti.MonoidAlgebra.augmentation` | Coefficient-sum ring homomorphism for a ring and monoid; every deck basis element maps to 1. |
| `groupHomology.indIso` | Shapiro isomorphism for subgroup induction in a representation over a commutative ring; it supplies no geometric vanishing. |
| `Matrix.charpoly` | Characteristic polynomial det(XI−M) for finite square matrices over a commutative ring. |
| `Matrix.aeval_self_charpoly` | Cayley–Hamilton with the same finite-matrix and commutative-ring hypotheses. |
| `Matrix.det_fin_two` | The signed two-by-two determinant formula used by both matrix computations. |

The ten exact imported-node statements were read, including the balanced presentation and patching theorem, twisted coherent duality, minimal Katz ideal, CDT type, L7 ordinary/eigenvalue/type-three rings, L8 doubling ideal, Gross sequence and field-valued Katz unramifiedness. Their extra stage contracts remain explicit rather than being attributed to a narrower imported node. The reviewed library coverage at R15.3, ALS.5 and R03.3 does not supply the missing Hasse/theta, arithmetic duality or canonical-module interfaces at the pins.

The current roadmap checkout was audited at `0d144d044dacebca17b654695b6f1ad58f159b27`, and the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The Chebotarev and ProfiniteArithmetic readers were read in full before editing. Relevant LocalGaloisGroups, ModularForms, ModularCurves, ClassFieldTheory Layers 7/12 and IHG.2 contracts were checked. Suggested files in all nine post-snapshot roadmaps, including split OperatorTheory files, and the current library were searched for these arithmetic targets. Weight-one Hodge structures and differential-geometric Bianchi identities are unrelated hits. Existing generic bundles, modular geometry, Galois/reciprocity and Hecke-image carriers remain imports.

## Closure, limitations and validation

Every stage target is realized by a node, all local dependency edges are in construction order, and the packet stays at target granularity. The requests precisely distinguish unavailable supplier work from proved imports. The three remaining mathematical extensions are:

- **M:** the nonharmless local twisting collision in unrestricted scalar multiplicity. D1.7 states the restricted matched comparison and the conditional general target.
- **O:** localized 3-primary stabilizer homology and duality at all Bianchi auxiliary levels. The supplied route uses p≥5.
- **P:** an integral minimal principal-type coefficient model with covers, Hecke, duality and Conjecture A on those exact spaces. The supplied Bianchi route has no P primes.

Conjecture A at every required Q is a hypothesis, not a result supplied by this roadmap. No question blocks acceptance of the planning pass. The orchestrator should retain these three extensions and discharge the named supplier contracts before claiming closure; it should not promote the unrestricted statements merely because the plan is accepted.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/GL2ModularityLiftingPartII.json`: zero errors and zero warnings.
- Source-issue validation and source-version validation using `source_issues.check_issues` and `check_errata.versions_checked`: zero errors.
- Reader synchronization checked against every statement, hypothesis, proof step, direct prerequisite, API item, test, request/consumer and source verdict; stage target statements checked against the same packet.
- `lean-check research/blueprint/suggested/GL2ModularityLiftingPartII.lean`: exit 0 at the pinned build; only 18 declaration-uses-`sorry` warnings. The file has three real-bodied matrix definitions, eight theorem statements and ten examples. These are suggestions, not proved arithmetic implementation.
- `git diff --check`: clean. Only the issue's five deliverables and this job's handoff are changed.
