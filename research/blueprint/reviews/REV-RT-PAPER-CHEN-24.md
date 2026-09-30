# REV-RT-PAPER-CHEN-24 — independent verification

Completed 2026-09-30 by Codex — codex-a71f92. Refs #4045.

## Verdict and scope

All ten findings are **confirmed**, with corrected or qualified fixes in the machine-readable review. Findings 1–6 have medium severity; 7–10 have low severity in the input. Confirmation means the identified defect merits correction, not that every sentence of the proposed remedy is accepted.

I did not author the extraction (cc-7b31c4), its review (cc-39fac3), or the red team (cc-f805bf). Claim comment 5909786311 was confirmed by bot comment 5909788566. Repository evidence is pinned to `a82b26b733748a9ebb58d0fac653c02a7c198d66`; the live supplier issue bodies were also checked on 2026-09-30. Only this verification, its report and handoff are submitted. No extraction, source issue, supplier packet, queue or coordinator code is changed.

This is a complete verification of the ten red-team findings, **not** a new full-paper extraction or a complete collation of the extraction's 38 source issues.

## Source provenance: the published text is publicly available

The author's [publications page](https://www.williamyunchen.com/) links an actual [published Annals PDF](https://www.williamyunchen.com/s/Chen-Nonabelian-level-structures-Nielsen-equivalence-and-Markoff-triples.pdf), not merely the paywalled landing page. Its first page identifies Annals 199 (2024), 301–443 and DOI 10.4007/annals.2024.199.1.5. The [journal metadata](https://annals.math.princeton.edu/2024/199-1/p05) records a 2022 revision later than arXiv v2. The conventional publisher-hosted PDF URL returned 404, but the author-hosted version of record was readable.

Sources downloaded and independently hashed, all read on 2026-09-30:

| Text | SHA-256 | Reading scope |
| --- | --- | --- |
| [Chen arXiv v2, 96 pages](https://arxiv.org/pdf/2011.12940v2) | `f60283b0b406554c064e3135b18d4446617aed05eb74f7b8d7b66a2f453980cc` | The cited passages for all ten findings, including §§2.1,2.4,2.5,3.5,4.2,4.12,5.2,5.5,5.6 and bibliography |
| Published PDF, 143 pages | `9386db34c31671966440f18bccfefe11bd806aa221010e0e3336fecf8ff920ac` | Selected comparison: journal pp.305–306,310–314,335–336,338,359,390,395–397,416,419,423–424,426 |
| [Chen survey arXiv v1, 64 pages](https://arxiv.org/pdf/2510.12003v1) | `ae029e4e98f4b6660fe1a8b87dfd92cedb35cdbea3ba699a5cd8cdb107793c22` | Corollary 5.29 and proof, p.57 |

Also read [Noohi, Foundations of topological stacks I](https://webspace.maths.qmul.ac.uk/b.noohi/papers/FoundationsI.pdf), Theorem 20.4 and Corollary 20.5, pp.80–81. These compare representable finite étale covers with covering **stacks**, not covers of the coarse space. The fundamental-group consequence retains the topological local-connectivity hypotheses. The curve-only suppliers of Chen/112 do not supply this interface.

### Selected collation results

This table records textual comparisons, not a renewed verdict on every proof underlying the six old extraction issues.

| Finding/old issue | Version-of-record observation | Consequence for the fix |
| --- | --- | --- |
| F1 | Finiteness over K remains in Theorems 1.2.10 and 5.6.4, pp.310,419 | Correct to j-invariant/geometric-class finiteness; cite print |
| E3 | Corollary 1.1.2, pp.305–306, omits the old extra factor-two sentence | Preserve the old issue as preprint-scoped; do not quote it as printed there |
| E7 | Theorem 1.2.10, p.310, still says odd prime | The p>=5 qualification remains relevant |
| E27 | Proposition 5.2.5, p.397, deletes the adjective injective, but retains a hooked arrow | Record the changed wording precisely; the action still has inner automorphisms in its kernel |
| E31 | Theorem 5.5.7, p.416, retains the assertion for every p outside the exceptional set | Retain the small-prime qualification |
| E36 | Lemma 6.1.3, p.423, still lacks a stable-maximal-ideal hypothesis | The old counterexample is not removed by the wording change |
| E37 | Proposition 6.1.4, p.424, explicitly assumes faithful action on the strict local ring | Already corrected in print; update known/version fields |
| F9(a) | Old introduction sentence absent, pp.313–314; correct divisibility chain explicit at p.359 | A preprint misprint already corrected, not a new print error |
| F9(b) | Corollary 4.12.4, p.390, still refers to nonexistent part (c) | Correct to the second bullet of (b), with both locators |
| F7 context | pp.395–396 and Appendix 6.2 add the group-scheme-invariant proof | Use the published repair, not the v2 point-invariant argument |

The original `sourceVersions` omission and false-positive provenance classification are independently reproduced. The unchanged classifier returns `published` even for a note explicitly saying the Annals published version could not be read; a structured preprint entry changes the classification to `preprint`. The six quoted-statement rows trigger the official `versions_checked` error. The input worklist omits Chen.

The fixer should record historical preprint readings and this precise published reading scope. A blanket published classification must not make the remaining uncollated issues disappear. A full collation remains separate work; this verifier did not claim to do it. The negative-reading classifier defect is a coordinator-owned code request.

## F1: a proof, and a repair to the red team's proof

Let A,B be determinant-one matrices over a field of odd characteristic, and put C=AB-BA, M=C/2 and t=tr(ABA⁻¹B⁻¹). Cyclicity of trace gives tr(C)=tr(CA)=tr(CB)=0. Polarizing the two-by-two Cayley–Hamilton identity therefore gives

```text
MA + AM = tr(A) M,    MB + BM = tr(B) M.
```

Since A⁻¹=tr(A)I-A, this proves MA=A⁻¹M and MB=B⁻¹M. To compute the determinant, write x=tr A, y=tr B, z=tr AB. Cayley–Hamilton gives

```text
det C = tr(A²B²) - tr((AB)²)
      = xyz - x² - y² - z² + 4 = 2-t.
```

Thus at t=-2, det M=1 and simultaneous inversion is inner in SL₂. This is an algebraic argument for all odd characteristics, not an inference from testing.

Theorem 2.5.2(3),(5) now shows that [-1] fixes the exterior-epimorphism classes of trace -2. Quadratic twisting changes the outer Galois action by this involution, so a G-structure persists. Choose p>=13 outside the finite exceptional set, a geometric point of the nonempty relevant fibre, and an elliptic curve with j distinct from 0,1728. A finite extension defines the structure. The infinitely many square classes of that number field give nonisomorphic quadratic twists with the same j and a G-structure. Faltings controls the coarse points, not these forms.

For **covers with their specified constant G-action**, the red team's proposed noncentral deck-map modification is insufficient: it can destroy G-equivariance. The following repairs that step. Over one finite extension K define a geometrically connected cover X→E and a G-equivariant lift iota of [-1]; include mu4 in K. Such a lift exists geometrically from the same inner-conjugacy calculation. Its square is a vertical G-equivariant automorphism, hence lies in Z(G)={±I}. If iota has order two, twist by the quadratic character. If it has order four, for any d in K× the character of a fourth root of d takes values in mu4 and its square is the quadratic character of d. Twist by the corresponding powers of iota. Because iota is K-defined and commutes with G, the descended action is still the constant G-action; the descended base is E^d. Geometric connectedness and the inertia order 2p are unchanged.

This establishes a counterexample over a suitable fixed number field, enough to refute the universal claim. It does not assert that every quadratic twist of a cover over an arbitrary starting field has such a constant-G model. The valid replacement is finiteness of j-invariants/geometric isomorphism classes; no genus formula is withdrawn.

## Ownership and supplier corrections

The detailed per-finding reasons in the JSON are the actionable specification. Important boundaries:

- **F3:** reuse the proposed MappingClassGroupsAndCanonicalRepresentations owner for LL/11,96,113 and Chen's generic Out/Nielsen/mapping-class ingredients. Retain the elliptic monodromy application in NonabelianLevelStructures. FreeGroup and MulAut are library ingredients, not the missing outer quotient/action theorem.
- **F4:** extend the existing IG.5 Hurwitz direction to the common genus/marking generality; import it in both new designs. Keep vertical centre versus full inertia, smooth étaleness versus boundary ramification, and general admissibility versus Chen's specific one-parameter deformation calculation distinct.
- **F5:** live issues1025/1013/1020 omit the accepted Chen sources. CA.4's fourteen Markoff nodes use coefficient three. Add the coefficient-one carrier and scaling adapter to that owner; do not build a second Markoff theory. The surviving design is ArithmeticDynamicsPartII, not its superseded Markoff-specific ID.
- **F6:** give the missing stack comparison an explicit shared supplier contract. IG.3/BelyiAnalyticCovers supply curves; ComplexComparisonPartII C3–C4 supply proper coherent comparisons, not Noohi's stack theorem.
- **F7–F8:** add precise missing source/input records, preserving characteristic-zero restrictions, and repair the pinned names and file paths. No library object is to be rebuilt.
- **F10:** propagate item52's exact base, ramification and coarse-degree hypotheses into the design brief. For item2, Layer9E owns the affine j-line, R13.1 the generalized-elliptic carrier, and R09.4/R13.2 the stack/compactification directions. Current Katz–Mazur Layer10 explicitly restricts its curve assertions to prime-level diamond quotients. It cannot simply be cited as an already supplied level-one stack/coarse-compactification theorem: request the missing specialization/bridge.

## Checks and limits

Pinned library declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Relevant accepted library audits and the exact supplier stages were read.

Finite regression checks independently tested all 14,400 pairs in SL₂(F₅) and all 112,896 pairs in SL₂(F₇); the determinant and intertwining identities passed, including 4,920 and 9,744 trace-minus-two pairs respectively. A direct enumeration found only zero on the coefficient-one F₃ surface. Scaling and Vieta polynomial identities passed 9,261 bounded integer regressions. These tests supplement the proofs above; they are not formalisation.

The unchanged official `scripts/check_redteam.py` passed against the review with the exact input result beside it. Additional checks passed: ten distinct verdict IDs exactly matching the ten inputs, valid JSON, unchanged intake file rules with zero problems, no private/local paths, and exactly the three authorized deliverables. No Lean file is a deliverable of this verification; Lean compilation and `check_blueprint.py` are not applicable. Nothing is claimed formalised.
