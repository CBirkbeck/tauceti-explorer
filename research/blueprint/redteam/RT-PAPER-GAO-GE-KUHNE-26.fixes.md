# FIX-RT-PAPER-GAO-GE-KUHNE-26

Issue #5532. Codex, session `codex-J6LwjP`, 1 October 2026.
All six findings are addressed according to
[the independent verifier](../reviews/REV-RT-PAPER-GAO-GE-KUHNE-26.md).
I did not write the extraction, its review, or this red team. This is an
implementation of the verified fixes, not an independent review of them.

## Fixes

1. **RT/1 — rank and endomorphisms.** Item /4 now chooses Γ₀ from a basis of
   Γ⊗ℚ. Clearing denominators and torsion puts Γ in its division hull without
   requiring Γ₀ to be End(A)-stable. Surjectivity of [n] on F-points and finiteness
   of A[n](F) give an exact sequence with quotient Γ₀; therefore [n]⁻¹Γ₀ is
   finitely generated of rank ρ. Item /85 passes the uniform counting bound
   through nested factorial preimages, by bounding each finite subset. The
   original exponent 1+ρ is retained. The swap on E×E explains why taking
   End(A)·Γ would be wrong. E14 records the false published proof assertion.
2. **RT/2 — projected lift group.** Items /88–/89 distinguish geometric
   complement representatives from membership in Γ. For the addition isogeny
   f:B×B^⊥→A, use Γ_B=pr₂(f⁻¹Γ). Its rank is at most ρ: the finite kernel of
   f disappears upon tensoring with ℚ, and projection cannot increase rank.
   A coset meeting Γ has a complement representative in Γ_B. Maximality of B
   supplies the off-Ueno condition in the existing geometric argument. Apply
   Theorem 1.1′ to the bounded-degree components with Γ_B, then absorb their
   bounded number and the number of maximal B into c(g,d). E15 records the
   false published membership assertion. The E×J example is retained as a
   regression: Γ∩B^⊥ can be zero while Γ_B contains the necessary representative.
3. **RT/3 — total-dimension Betti rank.** Items /47–/48 and the binding Betti
   Part II brief count total complex dimension, including the base. The
   relative diagonal of an elliptic scheme over a curve needs real rank four
   but has rank at most two, and is now a negative test. The positive test is
   a subvariety of a single polarized abelian variety over a point. A torsion
   section over a positive-dimensional base remains a negative test.
4. **RT/4 — retract E8.** Item /70 and the uniformity brief restore the
   published c₂=max{c′₂,c″₂}. For fixed A, write H=max{1,h_Fal(A)} and
   B=max{1,2c′₃/c′₁}. If H≤B, all small points lie in the (6.3) locus;
   if H>B, all lie in the (6.2) locus. Thus one exceptional subset suffices,
   including at H=B. The original E8 object and its earlier confirming review
   are retained under `resolvedSourceObservations`, marked retracted and tied
   to RT/4. It is removed from active `sourceIssues` so that the old review
   cannot continue to publish the false erratum. The reader distinguishes the
   original review from the later verified retraction.
5. **RT/5 — equidistribution signs.** E16 records the reversed hypotheses after
   (5.8)–(5.9), with distinct published and author-copy locators. Items /64 and
   /68 and the uniformity brief require small heights <δ in both tolerance
   estimates. The subsequent Claim retains its ≥ alternative; the two signs
   serve different purposes.
6. **RT/6 — degree-normalized comparison.** Item /68 and the uniformity brief
   set ν=(1/d_D)D*μ₂ on each component's constant-degree finite étale locus.
   The pullback here is ordinary pullback of top forms. Step 2 proves
   non-proportionality, so μ₁≠ν even with this normalization. Choose the
   separating test on that locus and average over the finite stabilizer;
   invariance preserves separation and gives f₁=f₂∘D. Change of variables
   now gives ∫f₁ν=∫f₂μ₂, which the unnormalized comparison lacked. The two
   original equilibrium measures enter the small-height estimates, whose
   orbit averages are equal. Their triangle inequality contradicts the
   separation. E17 records the proof gap; neither a trivial stabilizer nor
   degree one is assumed.

Items /4, /48, /68 and /89 contain planning APIs and concrete tests for the new
adapters. The two existing Part II ids, their parents, source owners and item
memberships are retained. No new roadmap is proposed. All 93 item identities,
kinds and library/planned/missing statuses, six routes and 17 prerequisites
are preserved. Twelve original source diagnostics remain unchanged; E8 is
historical and E14–E17 are new active diagnostics (16 active in total). Their
independent confirmation remains the verifier's job; this fix adds no review
objects of its own.

## Sources and scope

The published PDF was downloaded again and its SHA-256 reproduced:
`4ee5a38b327807289885a1d7292bddc3341b7fc3e0aa8a3682d995d13237834f`.
I read printed pp.202, 211–217, 219–220 and 223–226, and viewed the page images
of pp.214, 215, 219, 220, 224 and 225 to check the formulas. I also read
pp.31–32 and 43–44 of Gao's author copy, hash
`4927ac4beac9d250c0f5c09ad2a0ded5abe42567f9f222ed46d66e20978d9c4a`.
The checked proof assertions persist there; no whole-copy collation is claimed.
Kühne's arXiv:2101.10272v4, hash
`06781b5207e714338c29fce0af0117cdb989fe302a30f01d746a18871ecd7257`, was
checked at pp.2–4, the statement and selected proof of Lemma 23, Lemma 25 and
the equilibrium-normalization conclusion of §3. These are separate comparison
sources, recorded as such in `sourceVersions`.

On 1 October 2026 the publisher article page had no correction link and
Crossref DOI metadata had no correction relation or update field. arXiv
2105.15085 still listed v4 as latest; that preprint was not fully collated.
Gao's publication page links the author copy; its separately linked Betti-map
erratum is for a different 2020 paper. Title/author correction searches did
not locate a correction for this article. The search is bounded and its
scope is in E14–E17; absence of a located notice is not proof that none exists.

The reviewed library audit entries for RP.0, RP.5 and A5 were reread. Their
existing qualitative, height and complex-uniformization owners supply the
adapters; no library credit or status has been added. The original extraction's
pinned-library citations remain its evidence, not a new formalization claim.

## Validation

- `scripts/check_paper.py`: passes.
- `research/blueprint/intake.py check-files` on the three deliverables: passes.
- Source-diagnostic and source-version checks: pass.
- Preservation checks: all item ids/kinds/statuses, prerequisite records,
  route memberships/owners and twelve unaffected source diagnostics agree
  exactly with the input; original E8 is preserved intact in history.
- Exact rational and finite-model regressions exercise both Proposition 6.1
  cases and the boundary, the rank-two swap obstruction, projected rank-one
  representatives, finite-cover degree normalization and diagonal Betti rank.
  These check the adapters and their counterexamples; they do not formally
  prove the geometric or equidistribution input.

No Lean file is a deliverable and none was compiled. No pinned compiled build
was available, and no library build or cache download was attempted. The
formal implementation and independent fix review remain future work in the
existing programme.
