# Independent review of PAPER-TSUZUKI-23

**Job:** REV-PAPER-TSUZUKI-23, issue #1259. **Reviewer:** Codex, session `codex-hjdg0j`.
**Date:** 2026-09-23. **Review status: complete. Verdict: revise.**
The extraction is restored to **partial**. All three corrected ownership routes
are accepted, with the generic Chebotarev supplier shared explicitly.

## Evidence and scope

I independently read every page of [arXiv v3](https://arxiv.org/pdf/1910.03871v3)
and all 164 input items, their dependencies, all 55 API/use/test groups, all
24 inherited source findings and all three routes. The main PDF hash reproduces
as `611090d2e371483ff7996170368255462eeae03e5277c93a2ec406ac47c18457`.
Images of pp.15,16,19,20,30,33,34,38 were inspected.

I also read the [publisher's publicly displayed Appendices A–B](https://link.springer.com/article/10.1007/s00222-022-01146-5),
which confirm that E23–E24 persist in the journal. Main journal §§1–7 are still
unavailable. The preprint and journal are not claimed identical.

Supplier passages checked: [CT11](https://ems.press/content/serial-article-files/26106?nt=1)
pp.46,55–59; [Ohkubo v1](https://arxiv.org/pdf/1809.04065v1) pp.44–47;
[Abe–Esnault v1](https://arxiv.org/pdf/1607.07112v1) pp.6,11–12,15–16.
All three inherited hashes reproduce. Ohkubo's Proposition 12.12 proof and the
full recursive proofs of these suppliers were not read. The precise ledger is
in independentVerification, separate from the extraction authors' older ledger.

The original work was by `codex-a71f92` and `cc-442dc5`; this is an independent
review. The review used the existing session readings of the full upstream
GrothendieckEulerForms and CharacterTheory documents as density models; it does
not claim a new full reading of AdicSpaces or LocalFieldsRamification.

## Why revision is required

The completion claim equated numbered-statement coverage with closure while G3–G8
still described unread supplier proofs and undecomposed arguments. Those are
required obligations under PROTOCOL §§0–3 and 16. They cannot be closed by
renaming them design work. G2's finite-étale repair is a promising outline, but
the source only states the generic-to-local comparison. Its finite-étale version
needs compatible differential/Taylor maps, bounded-solution comparison and
annihilator descent, followed by slope invariance and the counit argument.
I leave G2 open without declaring the intended theorem false.

The signed-slope API in item 016 wrongly required both numerator and denominator
positive, excluding negative slopes. It now takes m∈Z and n>0 and tests the
negative-slope dual line. Item 039 now constructs the generic field in the source's
order: localize the lift at the vertical prime, complete the valuation ring,
then invert p. It has an explicit construction API and F_p(t) residue test.
Reduction to the Hahn residue in item 020 uses a uniformizer, which also handles
ramified coefficients. Locators for 034,046,047,071,097,101 and corresponding uses
were corrected. Saturation quotient uniqueness is explicitly compatible with the
quotient maps, rather than uniqueness among abstract isomorphisms.

The rank-one step of Lemma 3.33 has a missed hypothesis reduction. It invokes
Lemma 3.32, which assumes unit-root, for an arbitrary rank-one generic line.
Even the constant line F=q has nonzero slope. E25 and new item 165/G10 identify
the required slope normalization, allowed coefficient extension, untwist and
descent, retaining the embedding and every interior/boundary lattice. This is a
proof gap, not a counterexample to the gluing statement. Item 078 now depends on
that intermediate step instead of silently treating the unit-root theorem as
the general rank-one theorem.

## Library and ownership decisions

All seven library claims hold with their recorded restrictions. The reviewer
read WittVector.Isocrystal and its Hom/Equiv, the rank-one classification with
its finrank=1 and algebraic-closure hypotheses, HahnSeries and the four support
lemmas, including the additive declarations generated from multiplicative ones.
Eight library files byte-match remote pinned sources. Searches of both trees
also checked the Amice-transform and Hahn-inverse near matches.

Both owner READMEs were read in full; all their atlas stage descriptions are
literal subsections. The current reviewed coverage has no RD/VB/Crystalline
entries, so no audit verdict was invented.

1. **Route 1 accepted.** RD.0–RD.6 supply the existing analytic and coefficient
   direction. The new general rank-one gluing obligation is located at RD.3.
2. **Route 2 accepted.** VB0 owns general Dieudonné–Manin, including the ramified
   coefficient and q-Frobenius conventions absent from Mathlib's rank-one theorem.
3. **Route 3 accepted after correction.** The title exactly reproduces the
   parent's title. PBQ/saturation and local/global minimal-slope reconstruction
   are additional work; the specified-h distinction is correct in both dimensions.

The original brief proposed generic pure-Hom Chebotarev here as a supplier for
rigid companions. Fresh comparison with the accepted Abe route shows the
generic coefficient theorem already at PAPER-ABE-18/51 in the common
PadicDifferentialEquationsPartIIArithmeticDModules proposal. Item 134 now imports
that theorem and uses item 140 to supply mixedness/purity. Dense restriction
and full faithfulness are an explicit dependency. The pure-Hom argument can
serve as an alternative proof at the shared owner; the present continuation
owns the application. EG20/109 consumes the same supplier. No designed stage
exists yet, so the record distinguishes the accepted proposal from a built
declaration; G8 retains the final stage/closure reconciliation.

## Source findings

All 26 findings are confirmed in their specified versions. E23–E24 also have
journal-appendix confirmation; other claims remain v3-only. G9 is closed only
for the independent-verification requirement, while G1 retains journal collation.

E7/E8 affect stated results because zero objects meet the printed hypotheses.
E20 affects the stated unrestricted purity theorem under integer-only weights.
The intended real-weight theorem is preserved. E2's ring-list slip and E9's
graded-index slip remain classified as misprints: the intended bounded-ring
and graded statements are clear, although the literal broader formulas fail.
E22 says a projector comparison is missing; it does not say 1/m is false.

For E19, in characteristic zero the (n−1)st finite difference of x^n is
n!·(x+(n−1)/2). Thus nth powers span the field, including constants, and trace
nondegeneracy finishes the corrected lambda^n argument. The executable finite
examples check this identity but are not substituted for its binomial proof.

| Finding | Independent evidence |
|---|---|
| E1 | R/m and Frac(R) require the valuation ring. Confirmed in v3 p.1. |
| E2 | Confirmed finite-norm domain slip in v3 p.4. The series with coefficient p^(−floor(sqrt(n))) is analytic at every radius below one but has unbounded coefficients. Keep the bounded-ring correction; no intended bounded-ring theorem is refuted. |
| E3 | The local definition uses K,t; the alpha-indexed ring is not introduced there. Confirmed v3 p.5. |
| E4 | Q is ordered, not well-ordered; the well-order condition belongs on supports. Confirmed v3 p.6. |
| E5 | The cited part (4) belongs to Lemma 2.6, not the three-part Lemma 2.5. The later filtration has no defined length s. Confirmed pp.8–9. |
| E6 | Confirmed p.14. For the unipotent connection de2=e1 dt/t on a generic disc, log(X/t) is analytic but its coefficients at n=p^a are unbounded. The proof implication fails, not the intended closure theorem. |
| E7 | Confirmed p.15 and image. Zero is a finite free solvable module and has no nonzero quotient. The missing nonzero hypothesis changes the literal theorem domain; corrected item 053 handles zero separately. |
| E8 | Confirmed p.16 and image. Zero has a unit-root lattice but tensoring by zero cannot detect PBQ. Nonzero N is an actual hypothesis of the repaired equivalence. |
| E9 | Confirmed pp.16–17 and image. On E(1)⊕E(0), nested top quotients both have slope one; graded top quotients have slopes one and zero. This is a clear graded-index misprint under PROTOCOL §18; CT11 Corollary 5.5 and Ohkubo Definition 12.5 verify the intended successive-quotient convention. |
| E10 | Confirmed p.18: the rank equality needs dimension of the solution space, and the solution derivative uses x. |
| E11 | Confirmed p.19 and image: f_* starts on C′ and f* starts on C. |
| E12 | Confirmed p.19 and image. Part (1) concludes its hypothesis again, and (2) invokes the missing pullback result. The proposed generic finite-étale base-change repair is retained as a candidate; it does not by itself discharge the extra Taylor/comparison and adjunction obligations in G2. |
| E13 | Confirmed p.21: compact support is required on the source of the support-forgetting arrow. |
| E14 | Confirmed p.27 against Proposition 3.29 and the diagram: h has target the global convergent bounded quotient, not Mη/Mb nor an automatically overconvergent coefficient. |
| E15 | Confirmed p.29: the displayed factorization ends at the restriction of M†. |
| E16 | Confirmed p.30 and image: the composite lands in the L3 category, so the left side must be theta13. |
| E17 | Confirmed as an omitted coefficient-dual identification, not a counterexample to duality. The displayed pairing after extra K-scalar extension does not itself identify the dual of the original L-object. The finite trace pairing and multiplication component give the required original L-valued pairing; G6 tracks its typed realization. |
| E18 | Confirmed p.33 and image. A separable non-normal extension need not split over itself; after an algebraic closure it does. Use trace on restriction of scalars of the finite L-model. E26 separately records the displayed infinite coefficient-field notation. |
| E19 | Confirmed p.34 and image. A scalar coefficient twist multiplies the nth iterate by lambda^n. Finite differences show nth powers span in characteristic zero, completing the trace-pairing argument without the false linear scaling. |
| E20 | Confirmed pp.34,37 and image. The F3 point with Frobenius 2 is irreducible and has nonintegral real weight. Thus the unrestricted purity theorem is false with the integer-only definition. The real-weight repair preserves the intended application; AE v1 Theorem 2.6 explicitly twists to finite determinant. |
| E21 | Confirmed p.35 by typing the endomorphism-surjectivity map. tau_m is an endomorphism of N and the compatible map is g′ tau_m. |
| E22 | Confirmed as a missing comparison. Appendix B, also visible in the publisher HTML, proves the raw factor n[L:K]. The projected coefficient functor removes a component multiplicity; derive that comparison before using 1/m. No finding that 1/m itself is wrong. |
| E23 | Confirmed in v3 pp.38–39 and in the publisher HTML Appendix A: the valuation rings cannot coincide with different residue fields, and a tube is a specialization inverse image. |
| E24 | Confirmed in v3 p.38 and publisher HTML Lemma A.1(3). Identity on L and sigma on K need not agree on K^(sigma^n). Already on an unramified degree-two constant subfield with q=p, sigma acts nontrivially while sigma² is identity. Further coefficient enlargement needs a compatible action; the existence theorem itself is not refuted. |
| E25 | Read the full rank-one and exterior-power argument and inspected PDF p.20. Its first invocation has the stated hypothesis mismatch. Item 165/G10 isolates the normalization, untwist and descent obligations. |
| E26 | Confirmed against the preceding finite-L/finite-K dimension paragraph and PDF p.33. The correction is coefficient-model notation and does not change the intended trace identity; the non-normal splitting error remains E18. |

## Validation and remaining work

165 items (7 library, 27 planned, 131 missing); 346 acyclic dependency edges; 55 definitions/constructions with 166 API contracts and 166 planning tests; three routes; 26 independently confirmed source findings.

Every missing item is routed once; all dependency and gap references resolve;
every planned/source stage exists; no original item was removed. The arithmetic
diagnostics passed in seven groups, with their limits recorded in the JSON.
The paper checker passed. The five-file intake check reported zero problems.
No Lean deliverable was required or compiled; the tests in items are planning
obligations, not executed Lean tests.

G1 remains unavailable for the main journal text. G2–G8 and G10 remain open;
only G9 (independent source verdicts) is resolved. The handoff identifies the
next proof work. A complete independent review with verdict revise is not a
claim that the extraction itself is complete.

Submission audit: the paper checker passes and the five-file intake reports zero problems. The archive comparison contains exactly the five authorized paths, with no deletions or other additions. Eleven reviewed-input/rule files and twelve ownership/coverage records were refreshed at main commit 4058acaafd33d62d93fd82266ca696813e996b11. No Lean was compiled.
