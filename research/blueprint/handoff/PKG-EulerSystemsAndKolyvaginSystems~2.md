# PKG-EulerSystemsAndKolyvaginSystems~2 — #11135

Worker: Claude (Opus), session claude-7P6um7. Date: 2026-10-19. Revision round 2 after REV-PKG-EulerSystemsAndKolyvaginSystems (needs_changes, defects D1–D5).

Changed: the package README.md and Suggested.lean, plus this note. metadata.toml (`math.NT`) and review.json are unchanged. No packet, reader or earlier suggested file was edited.

## What was done, defect by defect

The README now owns, as numbered targets with statements, hypotheses, free sources, proofs, API lists and Checks, the inputs the review found unsupplied. The process paragraphs ("Unsupplied prerequisite", "Part II contract", "**Gap:**", "unresolved compatibility") are gone. The README has 154 numbered sections: the 149 earlier ones plus five new ones. Layers 0, 4 and 8 were renumbered by script, and every "Layer N.M Title" reference was rechecked against the headings. No API or Check name was removed (729 before, 796 after).

**D2 (general self-injective R).** New **0.5 Selmer duality over a finite self-injective coefficient ring**; old 0.5–0.9 are now 0.6–0.10. It covers:
- (a) Matlis generators λ : R → ℚ_p/ℤ_p, with R self-injective ⇔ a generator exists ⇔ the socle is one-dimensional, and X^* ≅ X^∨ naturally;
- (b) R-linear local duality, with R-annihilators equal to Tate orthogonal complements for every λ, so F^* is the same either way;
- (c) BSS II Theorem 3.1, the five-term sequence with Hom_R(−,R), deduced from the Pontryagin form (Rubin I.7.3, MR04 2.3.4, ArithmeticGaloisDuality R02.4);
- (d) propagation and duality over R.

The SelmerIwasawaCohomology Layer 2 contract now states only what that layer supplies. The finite levels of Layer 8 use 0.5 with R = (O/π^m)[Γ/Γ^{p^n}].

**D1 (order theory for the pairing bound).** New **4.8 Maximal ℤ_p-orders in semisimple ℚ_p-algebras and their lattices**; old 4.8–4.20 are now 4.9–4.21. It covers:
- (a) the valuation ring O_Δ of a p-adic division algebra (Milne CFT IV §4);
- (b) modules over O_Δ;
- (c) matrix orders: projectivity, centralizer, simple residual module, full idempotents;
- (d) every maximal order of a simple algebra is End_{O_Δ}(L), and conversely every lattice stabilizer is maximal;
- (e) splitting along simple factors, with existence from ClassicalArithmeticCompletion §7.56.

**4.9** (the old 4.8) keeps full generality (semisimple B, arbitrary multiplicities). Nekovář's argument assumes a division algebra on each factor; multiplicities are now removed through a full idempotent e ∈ R_max and current Tau Ceti's `IsIdempotentElem.cornerEquivalence`, then the one-factor induction runs. 4.13 (old 4.12, the CM application) now cites 4.8–4.9 unconditionally. The CA Layer 7 contract is reduced to §§7.21 and 7.56.

**D3 (coefficient prime).** New sections; old 8.34–8.39 are now 8.37–8.42.
- **8.34 Local ordinary modules at the coefficient prime.** The self-dually twisted filtration; finiteness of local H⁰ and H²; Λ-ranks 1/1/2 without π-torsion, hence free at R = Λ_(π); L_o and L_q free of rank one; exact orthogonality of the ordinary conditions. Sources: Keller–Yin Lemma 1.0.2, Theorem 1.3.2, Proposition 1.3.4 and Lemma 1.3.5.
- **8.35 Correction terms at the coefficient prime.** At split primes away from p the dual of H¹(K_w, A) is finitely generated over O, so μ = 0; at p the unramified kernel is finite (KY Lemma 1.3.6).
- **8.36 Λ-adic change of local conditions.** The five-term sequence for the (a, b) ∈ {0, o, f}² structures, as an inverse limit of 0.5(c); the rank identity rank S − rank X = Σ local ranks − rank T; torsion-freeness.

8.38 (old 8.35) now proves μ(X_ord,tors) = 0 from 8.34–8.37 with no assumed local comparisons. Its hypotheses are rank one for S_ord and X_ord, H⁰(K, T/πT) = 0, and the full/unramified μ = 0 of 8.37 in both orientations.

**D4 (χ-ray congruence).** The χ-anticyclotomic rigidity predicate in 2.8 is now "infinite χ-direction" or "χ-ray unramified classes with injective γ − 1". Rubin IX.4.1(ii)(c) only asks for "the appropriate analogue" of IV.8.1 and states none. Two facts show why the untwisted shape does not transport:
- For q with χ(Fr_q) ≠ 1, |G_q| divides N(q) − χ(Fr_q) and not N(q) − 1. The Check `Anticyclotomic.ray_degree` works K′ = ℚ(i), p = 3, q = 11: |G_11| = 3, while N(11) − 1 = 10.
- Frobenius in the nonabelian Gal(F/K) needs a chosen prime above q. The relation (i) is now stated for a fixed choice of Fr_q.

For d = 1 the third alternative is exactly Corollary IV.8.1 and is kept (3.19). 3.16 and 4.21(b) cite the two alternatives. **For the maintainer:** this drops an alternative that the source never defines; it does not narrow a defined theory. A future χ-ray congruence would need a precise semilocal statement and its "reverse the argument" proof of the χ-analogue of Rubin's Lemma IV.7.3.

**D5 (MR16 (H.2)).** 1.13 is rewritten.
- The repaired (H.2) requires L ⊆ H_M(T). The previous README's repair, "L ⊆ K̄ arbitrary", is itself wrong. Counterexample: K = ℚ, an even ρ, T = 𝔽_p(ρ), F_ur, and L containing the field cut out by a Selmer class c. Then (H.1)–(H.7) hold, but loc_q(c) = 0 for every q ∈ P, so MR16's Chebotarev selections fail.
- (a) The corrected Lemma 4.5 uses P(H_M(T), τ).
- (b) Shrinking P to P(H_M(T), τ) gives (H.7).
- (c) Quotients T/m^j with P_j satisfy (H.1) and (H.3)–(H.7) plus useful-prime selection with the field H_M(T). They satisfy (H.2) itself for j large.
- (d) The MR04 bridge is proved, with L = ℚ(T/m^tT, μ_{p^d}).
- An audit paragraph lists every MR16 use of (H.2): Lemma 6.9(ii), Prop 8.3, Prop 14.3 and Thm 14.4 (selection); Remark 4.3 in §7 and Thm 11.8 (quotients); the Thm 14.4 induction. Each holds under the stated form. Both MR16 examples (§5.2 with L = E; §5.3 with L = K and a regular unipotent τ) satisfy L ⊆ H_M(T).

1.21(c) is the MR16 form of useful-prime selection, with the ambient field H_M(T) for every quotient. It requires s + t < p, or p = 2 with the 𝔽₂[G_K]-condition when s = t = 1. **Edge case for the maintainer:** for p = 2, k ≠ 𝔽₂ and one class of each kind, MR16's (H.4) (T̄ ≇ T̄^* over k) is weaker than the 𝔽₂-disjointness the 2004 argument uses, so (c) states the stronger hypothesis there.

## Other corrections

- CGLS v2 §3.4 is pp. 26–27, not 24–25 (checked page by page in the PDF); fixed in 8.36 and 8.38.
- The 1.10 wording "general-R exact annihilator supplied by SelmerIwasawaCohomology L2" now points to the unramified exact-annihilator theorem, plus 0.5(b) for R-annihilators.
- The square-index sentence in the Scope no longer calls itself a "contract".

## Lean

Added `IsMatlisGenerator` (real body, into `UnitAddCircle`) with two proved examples: the zero map fails, and `ZMod.toAddCircle` works. Also added the milestone `injective_iff_exists_isMatlisGenerator` (Layer 0.5(a), sorry'd). New README-only names are added to the closing comment.

`lean-check` on the package Suggested.lean: exit 0, only `declaration uses sorry` warnings (12). The file has 395 lines.

## Checks run

- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.
- A script check that every "Layer N.M" reference resolves, that no *Needs:* points forward, and that there are no duplicate headings.
- The README is regenerated by a rerunnable script from HEAD plus scratch fragments, and the regenerated output matched the hand-edited file byte for byte.

## Sources read in this run

All free:
- MR16 arXiv v1: §§1–5 and 6–14, at the pages cited.
- BSS II v1: §3.1 pp. 12–13 and Lemma 3.9 p. 17.
- Rubin 1999 draft: I.7.3 pp. 17–18, IV §§7–8 pp. 75–78, IX §§1–4 pp. 133–139.
- Nekovář's CM manuscript: §6.4 pp. 37–40.
- MR04: §§2.3, 3.5–3.6 and 5.3.
- Milne CFT v4.03: IV §1 pp. 124–125 and §4 pp. 139–140.
- Stacks 08Z9.
- Keller–Yin v2: §1.0 p. 8, §1.3 pp. 19–23.
- CGLS v2: §1.1 p. 7, §1.3 p. 10, §§3.4 and 4.2.

A Haiku helper located Stacks tags; the tag cited was then read directly. No passage of any source is reproduced. Nothing suspicious appeared in any issue comment or fetched page.

## Remaining for the next reviewer

- Check that the new targets' generality matches the reviewer's expectations, in particular the D4 restriction explained above.
- The inherited application boundary (Kolyvagin's all-prime square-index theorem with a constant independent of K) remains a separate statement not proved here, as before.
