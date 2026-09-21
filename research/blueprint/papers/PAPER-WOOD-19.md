# PAPER-WOOD-19 — Nonabelian Cohen–Lenstra moments

This is a **partial checkpoint**, not a completed paper extraction or a formalisation. It contains 249 items: 5 library substrates, 11 already-planned inputs and 233 missing items. Of the missing items, 226 have one route each; seven remain explicitly unrouted. The whole primary preprint was read, but secondary-input precision, several statement qualifications and the numerical algorithm’s weighting still prevent completion.

Agent: Codex. Session: `codex-c83e7a`. Issue: #1330.

## Source and reading evidence

The main article is by Melanie Matchett Wood, with Appendix A jointly by Melanie Matchett Wood and Philip Matchett Wood, *Duke Mathematical Journal* **168**(3) (2019), 377–427, [DOI 10.1215/00127094-2018-0037](https://doi.org/10.1215/00127094-2018-0037). The [author’s publication page](https://people.math.harvard.edu/~mmwood/Publications/) links the published record and the older public preprint.

I read all 40 pages of [arXiv:1702.04644v2](https://arxiv.org/abs/1702.04644v2), dated 13 July 2018: §§1–8, the complete proofs, Appendix A and references. I also visually inspected both group tables on pp.33–34 and Figure 1 on p.37. The author TeX archive contains `Duke_Final_Revision.tex`; this was checked at the disputed passages. Title, authorship, journal reference and DOI match the published record. This does **not** establish that every sentence is identical to the final typeset article. The attempted Euclid PDF returned HTML, and the [NSF published-copy endpoint](https://par.nsf.gov/servlets/purl/10152050) timed out.

Retrieved 21 September 2026:

| Artifact | SHA-256 |
| --- | --- |
| [40-page arXiv PDF](https://arxiv.org/pdf/1702.04644v2) | `2eacf07f9c79a08a65bbfa332b964f0f9bd4ab5abb93e5db8be72e43669be1bd` |
| [arXiv TeX archive](https://arxiv.org/src/1702.04644v2) | `8a39124c6706dc3ba39c662a0ebaf66281f82fdc307c7a87f70d95d1b75e75a8` |
| [EVW12 v1 PDF](https://arxiv.org/pdf/1212.0923v1) | `3cd5624f85450b06f4be8b37d08fb480dde8dc7c68f9a5bd7ffc57c15c04a4e4` |

The Wood downloads used the unversioned arXiv PDF/source URLs; arXiv’s latest version was v2 and its metadata was checked. Page locators in the JSON refer to that 40-page version. Selected primary EVW12 inputs were read on pp.32–38, 40–41 and 49–55. In particular, this includes the universal marked extension, stable component theorem, component invariant and its generator-independence proof, centerless moduli construction and specialization/component statements. It is not a full reading of that 70-page paper.

The [EVW12 arXiv record](https://arxiv.org/abs/1212.0923) still carries a withdrawal notice. Wood’s Theorem 4.5 footnote says the affected results in §§6 and 12 are not used. The extraction preserves that qualification and does not import a higher homology stability theorem. Reading the selected statements is not an independent certification of the entire dependency chain.

## What the paper establishes

For a good admissible embedded subgroup `G′ ≤ G ≀ C2`, the number-field moments are conjectured, with the reduced Schur multiplier’s 2-torsion supplying the roots-of-unity correction. The real and imaginary unrigid moments have different denominators. The rigid real count includes a twist: it counts pairs `(ρ,y)`.

The proved good-type function-field theorem requires **centerless `G′`**, fixes sufficiently large discriminant degree `2n`, and then sends `q` to infinity through prime powers coprime to `|G′|`. Division by `|H₂(G′,c)[q−1]|` occurs inside the limit. It does not prove the fixed-`q`, growing-discriminant conjecture. The imaginary family has the specified ramified completion `Fq(√t)` at infinity; the real family splits there. These are not all possible quadratic infinity types.

The arithmetic invariant is a homomorphism from roots of unity in a specified cyclotomic extension to `H₂(G′,c)[|μ_Q|]`. Its construction retains a chosen reduced Schur cover. The paper proves the listed independence properties, not a general canonical identification of every chosen cover. Hurwitz component labels also include multidegree and boundary monodromy; they are not simply elements of an unqualified Schur multiplier.

For elementary 2-groups the number-field divergence is proved, with logarithmic exponent `2^k−1`. The Tauberian and local-character steps need a finer secondary-source decomposition before a complete blueprint. Appendix A gives finite computations and sampled estimates for an `A4` type of order 96; an estimate near 1.26 at `X=2^32` is evidence for a conjectural limit 2, not a proof of it.

## Ownership and library decisions

The atlas snapshot was checked at explorer commit `7d58267e68505ef8267eef14de118b5c68d2fba3`. The relevant roadmap documents and stage descriptions, reviewed `AUDIT-07`, `AUDIT-09` and `AUDIT-02` records, six additional roadmap definitions, packets, accepted decompositions and links were checked against the session’s previous inventory. The initial tree comparison found no changes in those ownership paths. Before publication, updated WORKERS/PROTOCOL instructions were read; their new area rule was applied using the current `data/galaxies.json` (`grouptheory`). Five later link-map updates were screened; they do not supply Wood’s reduced-Schur or Hurwitz constructions. Upstream ClassFieldTheory and InductionRestriction were read as the nearby roadmap anchors. Broader audits are leads, not declarations proving Wood’s results.

Both pinned source trees were searched: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Actual statements were opened before every `library` classification:

| Item | Existing declaration and scope |
| --- | --- |
| /1 | Mathlib `RegularWreathProduct`, `rightHom`, `inl`; specialize to `C2` and prove the coordinate adapter. |
| /20 | Mathlib `groupHomology.H2`, `H2π`, `H2Iso`; the integral degree-two homology carrier, not reduced Schur covers. |
| /36 | Tau Ceti `FactorSet.cohomologyClassEquiv` and `nonempty_splitting_iff_cohomologyClass_eq_zero`; abstract extension classification/splitting, with the continuous Galois bridge still needed. |
| /123 | Mathlib `Subgroup.exists_right_complement'_of_coprime`; complement existence, not a canonical complement. |
| /129 | Mathlib `NumberField.finite_of_discr_bdd`; Hermite finiteness for intermediate number fields in a fixed extension. |

A name collision matters: `TauCeti.schurMultiplier` is `H²(G,kˣ)`. Wood needs `H₂(G,ℤ)`, its reduced quotient and selected covers. Upstream InductionRestriction Layer 7 already plans ordinary Schur covers. Those are imported; the reduced theory extends them.

| Route | Items | Scope |
| --- | ---: | --- |
| ArithmeticStatistics ST.0 | 16 | Families, infinity conditions, embedded types, rigidification and averages. |
| ArithmeticStatistics ST.3 | 107 | Number-field moments, conjectures, elementary-two example, finite type/center data and appendix enumeration. |
| ArithmeticStatistics ST.5 | 11 | Function-field moment consequences and exact slice counts. |
| InverseGalois IG.1 | 4 | Prime-to-characteristic peripheral and Tate-torsor interfaces. |
| InverseGalois IG.3 | 6 | Branch cycles, stable braid components and invariant comparison. |
| InverseGalois IG.4 | 21 | Tame central lifts, the arithmetic invariant and marked-extension correspondence. |
| InverseGalois IG.5 | 10 | Marked Hurwitz schemes, rational points, stable components and uniform component estimates. |
| InductionRestriction, Part II | 51 | Reduced Schur covers, marked universal extensions, discrete actions, parity fibers and reduced-multiplier examples. |

The new Part II’s design brief is in the JSON. It starts after upstream Layer 7 and uses existing group homology and factor-set carriers. ArithmeticStatistics imports the geometric estimate from IG.5. IG.4 imports Poitou–Tate from ArithmeticGaloisDuality and reciprocity from upstream ClassFieldTheory. General étale duality and weight bounds retain their existing owners. In particular, a nonproper ordered-configuration comparison is not automatically supplied by WeilConjectures WC.4’s smooth proper comparison theorem.

The table extraction preserves all 41 rows in §8.1 and all 31 rows in §8.2, splitting multiplier and center assertions. A bracketed SmallGroups index is supplemented by its order where needed. These remain source-reported computations; no full GAP reproduction or Lean verification is claimed. The special appendix group is referenced at multiple source locations but has one intended construction owner, not multiple implementations.

## Qualifications and remaining gaps

The following source issues are recorded separately from the mathematical targets:

- Proposition 4.4 needs its surrounding admissibility/projection assumptions. For `G=C3` and the bare-swap subgroup `G′=C2`, its unqualified right side contains marked quadratic extensions, whereas its left side cannot contain a surjection onto `C3`. Items /73–/74 retain the valid application scope, and /142 gives the regression example.
- The peripheral free-group presentation concerns the maximal prime-to-`p` quotient. Do not identify the entire tame fundamental group with that quotient.
- In the real function-field case, infinity is split, so its discriminant-degree contribution is zero. The `+1` repeated in the real proof is not used. Likewise the intermediate `q^n` expressions must agree with the actual Hurwitz dimensions `2n−1` or `2n`.
- Conjecture 5.1 allows arbitrary `u`. At `u=1`, every invariant is 1, so a nonidentity `h` has zero refined count. A primitive-generator or Hom-valued formulation needs an explicit source/correction decision; it has not been silently inserted.
- The bad-type proof directly gives a **liminf** lower bound. The ordinary limit printed in the theorem needs further analysis of the remaining components and their `q` dependence. This is an unclosed proof interface, not a claim that the printed limit is false.
- Appendix A’s trivial-action group should be `C2²×C3`, of order 12; the printed `C3×C3×C2` has order 18. The exact passage was checked in the TeX source.
- The appendix’s conversion from class-group quotient enumeration to rigid `A4` surjections needs an explicit automorphism and multiplicity calculation before the algorithm can be called reproducible.

Seven missing items remain unrouted: **/84** (exact trace-formula owner), **/99** (correct refined conjecture), **/137** (all introductory known cases), **/138** (precise Tauberian input/owner), **/139** (prime-2 factor and imaginary selector), **/143** (bad-type ordinary limit), and **/146** (appendix rigid weighting). The handoff specifies how to resume. Some routed items also retain explicit source decomposition debts, notably /32, /37, /39, /85–/86 and /112–/115. No claim of exhaustive proof closure is made.

## Verification

The paper schema checker passes. A separate structural check verifies unique item IDs, existing planned/source stage IDs, exactly one route for each routed missing item, and the seven declared omissions. The permitted-file intake check passes for the result, report and handoff.

An independent finite permutation calculation constructs the appendix group inside `A4 ≀ C2` and verifies order 96, kernel order 48, 12 outside involutions forming one conjugacy class, generation by those involutions, surjective first kernel projection, and trivial center. All 24 diagonal conjugations from `S4` preserve the type. This does not compute the reduced multiplier or prove that these exhaust `Aut(A4)`.

No Lean file was required, written or compiled for this paper job. No formalisation is claimed.
